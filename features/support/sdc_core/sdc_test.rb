class SdcTest
  class << self
    attr_reader :test_scenario, :scenario

    def configure

      if SdcEnv.browser
        begin
          #Watir.always_locate = true
          Selenium::WebDriver.logger.level = :warn
          case(SdcEnv.browser)

            when :edge
              kill("taskkill /im MicrosoftEdge.exe /f")
              SdcDriver.driver = SdcDriverDecorator.new(Watir::Browser.new(:edge, accept_insecure_certs: true))
              SdcDriver.driver.window.maximize

            when :firefox
              kill("taskkill /im firefox.exe /f")
              unless SdcEnv.firefox_profile
                SdcDriver.driver = SdcDriverDecorator.new(Watir::Browser.new(:firefox, accept_insecure_certs: true))
              else
                profile = Selenium::WebDriver::Firefox::ProfilePage.from_name(firefox_profile)
                profile.assume_untrusted_certificate_issuer = true
                profile['network.http.phishy-userpass-length'] = 255
                SdcDriver.driver = SdcDriverDecorator.new(Watir::Browser.new(:firefox, :profile => profile))
              end
              SdcDriver.driver.window.resize_to 1560, 1020
              SdcDriver.driver.window.move_to 0, 0

            when :chrome
              kill("taskkill /im chrome.exe /f")
              SdcDriver.driver = SdcDriverDecorator.new(Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))
              SdcDriver.driver.window.maximize

            when :chromeb
              kill("taskkill /im chrome.exe /f")
              Selenium::WebDriver::Chrome.path = data_for(:setup, {})['windows']['chromedriverbeta']
              SdcDriver.driver = SdcDriverDecorator.new(Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))
              SdcDriver.driver.window.maximize

            when :ie
              kill("taskkill /im iexplore.exe /f")
              SdcDriver.driver = SdcDriverDecorator.new(Watir::Browser.new(:ie))
              SdcDriver.driver.window.maximize

            when :safari
              kill("killall 'Safari Technology Preview'")
              SdcDriver.driver = SdcDriverDecorator.new(Watir::Browser.new(:safari, technology_preview: true))

            else
              raise ArgumentError, "Invalid browser selection. #{test_driver}"
          end

          SdcDriver.driver.driver.manage.timeouts.page_load = 12

        rescue Exception => e
          SdcLog.error e.message
          SdcLog.error e.backtrace.join("\n")
          raise e, "Browser driver failed to start"
        end

      elsif SdcEnv.mobile
        begin
          SdcDriver.driver = SdcDriverDecorator.new(SdcAppiumDriver.core_driver(SdcEnv.mobile.to_s).start_driver)
          SdcDriver.driver.manage.timeouts.implicit_wait = 10

        rescue Exception => e
          SdcLog.error e.message
          SdcLog.error e.backtrace.join("\n")
          raise e, "Appium driver failed to start"
        end

      else
        raise ArgumentError, "BROWSER or MOBILE not specified for #{test_scenario}"
      end
    end

    def start(scenario)
      @scenario = scenario
      SdcEnv.browser ||= browser_selection(ENV['BROWSER'])
      SdcEnv.mobile ||= device_name(ENV['MOBILE'])
      SdcEnv.verbose ||= ENV['VERBOSE'].nil? ? false : ENV['VERBOSE'].casecmp('true') == 0
      SdcEnv.hostname ||= Socket.gethostname
      SdcEnv.sdc_app ||= ENV['WEB_APP'].nil? ? ENV['WEB_APP'] : ENV['WEB_APP'].downcase.to_sym
      SdcEnv.health_check ||= ENV['HEALTHCHECK'].nil? ? false : ENV['HEALTHCHECK'].casecmp('true') == 0
      SdcEnv.usr ||= ENV['USR']
      SdcEnv.pw ||= ENV['PW']
      SdcEnv.env ||= test_env(ENV['URL'])
      SdcEnv.firefox_profile ||= ENV['FIREFOX_PROFILE']
      SdcEnv.framework ||= ENV['FRAMEWORK']
      require_gems
      SdcLog.initialize(verbose: SdcEnv.verbose)

      #todo-Rob These should be in an orders/mail or sdc_apps environment variable container. This is a temp fix.
      SdcEnv.printer = ENV['PRINTER']

      # Support for old framework and will be phased out
      @web_apps_param = Stamps::WebApps::Param.new
      @web_apps_param.log = SdcLog
      @web_apps_param.test_scenario
      @web_apps_param.test_scenario
      @web_apps_param.env = SdcEnv.env
      @web_apps_param.usr = SdcEnv.usr
      @web_apps_param.pw = SdcEnv.pw
      @web_apps_param.printer = SdcEnv.printer
      @web_apps_param.sdc_app = SdcEnv.sdc_app
    end

    def require_default_gems
      require 'data_magic'
      require 'rake'
      require 'log4r'
      require 'rspec'
      require 'date'
      require 'fileutils'
      require 'rbconfig'
      require 'rubygems'
      require 'open3'
      require 'measured'
      require 'holidays'
    end

    def require_gems
      if ENV['MOBILE']
        require 'appium_lib'
        require 'appium_lib_core'
        require 'selenium-webdriver'
      else
        require 'watir'
      end

      if /rates/.match(scenario.name)
        require 'spreadsheet'
        require "csv"
        include Spreadsheet
      end
      if SdcEnv.usr.nil? || SdcEnv.usr.casecmp('default') == 0
        require 'mysql2'
      end
    end

    def web_apps_param
      @web_apps_param
      @web_apps_param.driver = SdcDriver.driver
      @web_apps_param
    end

    def print_test_steps
      raise ArgumentError, 'Set scenario object before printing test steps' if @scenario.nil?
      SdcLog.info "- Feature: #{scenario.feature}"
      SdcLog.info "- Scenario: #{scenario.name}"
      SdcLog.info "- Tags:"
      scenario.tags.each_with_index { |tag, index| SdcLog.info "--Tag #{index + 1}: #{tag.name}" }
      SdcLog.info "- Steps:"
      scenario.test_steps.each_with_index { |steps, index| SdcLog.info "-- #{steps.source.last.keyword}#{steps.text}" }
      SdcLog.info "-"
      SdcLog.info "-"
    end

    def teardown
      begin
        SdcDriver.driver.quit
      rescue
        # ignore
      end
      SdcLog.info "#{@browser} closed."
    end

    def clear_cookies
      SdcLog.info "Clearing cookies"
      begin
        driver.cookies.clear
      rescue
        # ignore
      end
    end

    private

    def kill(str)
      begin
        stdout, stdeerr, status = Open3.capture3(str)
      rescue
        # ignore
      end
    end

    def device_name(str)
      return str if str.nil?
      str.downcase.delete(' ').to_sym
    end

    def browser_selection(str)
      if str
        case str.downcase
          when /ff|firefox|mozilla/
            return :firefox
          when /chromeb|gcb|googleb/
            return :chromeb
          when /chrome|gc|google/
            return :chrome
          when /ms|me|microsoft|edge/
            return :edge
          when /apple|osx|safari|mac/
            return :safari
          else
            return str.downcase.to_sym
        end
      end
      str
    end

    def test_env(str)
      if str
        case(str.downcase)
          when /stg/
            return :stg
          when /cc/
            return :qacc
          when /sc/
            return :qasc
          when /rat/
            return :rating
          when /prod/
            return :prod
          else
            return str.downcase.to_sym
        end
      end
      str
    end

    def browser_version(str)
      /[\d.]+ Safari|Edge\/.+|Firefox\/.+|Chrome\/[\d\.]+/.match(str)
    end

    def os_version(str)
      /(Mac OS.+?[\d_]+|Windows.+?[\d\.]+)/.match(str)
    end
  end
end

module SdcDriver
  class << self
    def browser=(browser)
      @@browser = browser
    end
    alias_method :driver=, :browser=


    def browser
      @@browser
    end
    alias_method :driver, :browser
  end
end

#switches: ['--ignore-certificate-errors --disable-popup-blocking --disable-translate']
#
#
# caps = Selenium::WebDriver::Remote::Capabilities.firefox
# caps['acceptInsecureCerts'] = true
# SdcDriver.driver = Selenium::WebDriver.for(:firefox, desired_capabilities: caps)
