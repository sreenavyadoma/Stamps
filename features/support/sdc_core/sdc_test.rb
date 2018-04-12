
class SdcAppiumDriver

  attr_reader :device

  def initialize(device)
    @device = device
  end

  def core_driver
    @core_driver ||= initialize_driver
  end

  def method_missing(name, *args, &block)
    super unless @core_driver.respond_to?(name)
    @core_driver.send(name, *args, &block)
  end

  private

  def initialize_driver
    file = ::File.expand_path("../../sdc_device_caps/#{device.to_s}.txt", __FILE__)
    exception = ::Selenium::WebDriver::Error::WebDriverError
    message = "Missing Appium capabilities file. #{device}: #{file}"
    raise(exception, message) unless ::File.exist? file

    caps = ::Appium.load_appium_txt(file: file, verbose: true)
    ::Appium::Driver.new(caps, false)
  end
end

class SdcTest
  class << self
    attr_reader :test_scenario, :scenario

    def sauce_endpoint
      #"https://#{data_for(:sauce_endpoint, {})['username']}:#{data_for(:sauce_endpoint, {})['access_key']}@ondemand.saucelabs.com:443/wd/hub"
      "https://robcruz:0e60dbc9-5bbf-425a-988b-f81c42d6b7ef@ondemand.saucelabs.com:443/wd/hub"
    end

    def sauce_edge
      caps = Selenium::WebDriver::Remote::Capabilities.edge()
      caps['platform'] = 'Windows 10'
      caps['version'] = '16.16299'
      client = Selenium::WebDriver::Remote::Http::Default.new
      client.timeout = 180

      Watir::Browser.new :remote, { desired_capabilities: caps, http_client: client, url: sauce_endpoint }
    end

    def capabilities(device)
      case
        when device == :macos_safari
          capabilities_config = {
              :version => "11.0",
              :platform => "macOS 10.13",
              :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
          }
          browser = :safari

        when device == :macos_chrome
          capabilities_config = {
              :version => "54.0",
              :platform => "macOS 10.13",
              :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
          }
          browser = :chrome

        when device == :temp_device
          capabilities_config = {
              :version => "16.16299",
              :platform => "Windows 10",
              :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
          }
          browser = :edge
        else
          message = "Unsupported device. DEVICE=#{device}"
          error = ArgumentError
          raise error, message
      end

      build_name = ENV['JENKINS_BUILD_NUMBER'] || ENV['SAUCE_BAMBOO_BUILDNUMBER'] || ENV['SAUCE_TC_BUILDNUMBER'] || ENV['SAUCE_BUILD_NAME']
      capabilities_config[:build] = build_name unless build_name.nil?
      Selenium::WebDriver::Remote::Capabilities.send(browser, capabilities_config)
    end

    def test_with_labels
      begin
        capabilities_config = {
            :version => "16.16299",
            :platform => "Windows 10",
            :name => "#{SdcEnv.scenario.feature.name} - #{SdcEnv.scenario.name}"
        }

        build_name = ENV['JENKINS_BUILD_NUMBER'] || ENV['SAUCE_BAMBOO_BUILDNUMBER'] || ENV['SAUCE_TC_BUILDNUMBER'] || ENV['SAUCE_BUILD_NAME']
        capabilities_config[:build] = build_name unless build_name.nil?
        caps = Selenium::WebDriver::Remote::Capabilities.send(:edge, capabilities_config)

        client = Selenium::WebDriver::Remote::Http::Default.new
        client.timeout = 120

        browser = Watir::Browser.new(:remote, {desired_capabilities: caps, http_client: client, url: sauce_endpoint})
        return browser
      rescue Exception => e
        SdcLog.error e.backtrace.join("\n")
        raise e
      end
    end

    def configure

      #Selenium::WebDriver.logger.level = :debug

      if SdcEnv.sauce_device
        case

          when SdcEnv.browser
            SdcPage.browser = test_with_labels
            SdcLog.info SdcPage.browser.class
            SdcLog.info SdcPage.browser

          when SdcEnv.mobile
            SdcPage.browser = SdcDriverDecorator.new(SdcAppiumDriver.new(SdcEnv.sauce_device).core_driver.start_driver)
            SdcPage.browser.manage.timeouts.implicit_wait = 180
          else
            # ignore
        end
      else

        if SdcEnv.browser
          begin
            #Watir.always_locate = true
            case(SdcEnv.browser)

              when :edge
                kill("taskkill /im MicrosoftEdge.exe /f")
                SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:edge, accept_insecure_certs: true))

              when :firefox
                kill("taskkill /im firefox.exe /f")
                unless SdcEnv.firefox_profile
                  SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:firefox, accept_insecure_certs: true))
                else
                  profile = Selenium::WebDriver::Firefox::ProfilePage.from_name(firefox_profile)
                  profile.assume_untrusted_certificate_issuer = true
                  profile['network.http.phishy-userpass-length'] = 255
                  SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:firefox, :profile => profile))
                end

              when :chrome
                kill("taskkill /im chrome.exe /f")
                SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))

              when :chromeb
                kill("taskkill /im chrome.exe /f")
                Selenium::WebDriver::Chrome.path = data_for(:setup, {})['windows']['chromedriverbeta']
                SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))

              when :ie
                kill("taskkill /im iexplore.exe /f")
                SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:ie))

              when :safari
                kill("killall 'Safari Technology Preview'")
                SdcPage.browser = SdcDriverDecorator.new(Watir::Browser.new(:safari, technology_preview: true))

              else
                raise ArgumentError, "Invalid browser selection. #{test_driver}"
            end

            SdcPage.browser.driver.manage.timeouts.page_load = 12

            if SdcEnv.debug
              SdcPage.browser.window.resize_to 1300, 1020
              SdcPage.browser.window.move_to 0, 0
            else
              SdcPage.browser.window.maximize
            end

          rescue Exception => e
            SdcLog.error e.message
            SdcLog.error e.backtrace.join("\n")
            raise e, "Browser driver failed to start"
          end

        elsif SdcEnv.mobile

          begin
            SdcPage.browser = SdcDriverDecorator.new(SdcAppiumDriver.new(SdcEnv.mobile).core_driver.start_driver)
            SdcPage.browser.manage.timeouts.implicit_wait = 180

          rescue Exception => e
            SdcLog.error e.message
            SdcLog.error e.backtrace.join("\n")
            raise e, "Appium driver failed to start"
          end

        else
          raise ArgumentError, "BROWSER or MOBILE not specified for #{test_scenario}"
        end
      end
    end

    def start(scenario)
      @scenario = scenario
      SdcEnv.scenario = scenario
      SdcEnv.sauce_device ||= ENV['SAUCE_DEVICE'] unless ENV['SAUCE_DEVICE'].nil?
      if SdcEnv.sauce_device
        SdcEnv::BROWSERS.each { |browser| SdcEnv.browser = browser if SdcEnv.sauce_device.include? browser.to_s }
        SdcEnv::IOS.each { |device| SdcEnv.ios = device if SdcEnv.sauce_device.include? device.to_s }
        SdcEnv::ANDROID.each { |device| SdcEnv.android = device if SdcEnv.sauce_device.include? device.to_s }
      else
        SdcEnv.browser ||= browser_selection(ENV['BROWSER'])
        SdcEnv.ios ||= ENV['IOS'] unless ENV['IOS'].nil?
        SdcEnv.android ||= ENV['ANDROID'] unless ENV['ANDROID'].nil?
      end
      SdcEnv.mobile = SdcEnv.ios || SdcEnv.android
      SdcEnv.verbose ||= ENV['VERBOSE']
      SdcEnv.sdc_app ||= ENV['WEB_APP'].downcase.to_sym unless ENV['WEB_APP'].nil?
      SdcEnv.health_check ||= ENV['HEALTHCHECK']
      SdcEnv.usr ||= ENV['USR']
      SdcEnv.pw ||= ENV['PW']
      SdcEnv.firefox_profile ||= ENV['FIREFOX_PROFILE']
      SdcEnv.framework ||= ENV['FRAMEWORK']
      SdcEnv.debug ||= ENV['DEBUG']
      SdcEnv.env ||= test_env(ENV['URL'])

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
    end

    def require_gems

      require 'appium_lib'
      require 'appium_lib_core'

      if /rates/.match(scenario.tags[0].name)
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
      @web_apps_param.driver = SdcPage.browser
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
        SdcPage.browser.quit
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

    def mobile(str)
      str.nil? ? str : str.downcase.delete(' ').to_sym
    end

    def is_ios?(str)
      str.nil? ? str : SdcEnv::IOS.include?(str.to_sym)
    end

    def is_android?(str)
      str.nil? ? str : SdcEnv::ANDROID.include?(str.to_sym)
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
# sdc_device_caps = Selenium::WebDriver::Remote::Capabilities.firefox
# sdc_device_caps['acceptInsecureCerts'] = true
# SdcPage.browser = Selenium::WebDriver.for(:firefox, desired_capabilities: sdc_device_caps)
