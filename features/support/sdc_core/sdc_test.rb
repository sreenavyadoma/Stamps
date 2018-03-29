module Stamps

  module SdcEnv
    TEST_ENVIRONMENTS = %i(stg qacc cc qasc sc rating).freeze
    BROWSERS = %i(firefox chrome safari edge chromeb).freeze
    SDC_APP = %i(orders mail webdev registration).freeze
    IDEVICES = %i(iphone6 iphone7 iphone8 iphonex android).freeze

    class << self #todo-Rob refactor PrintMedia
      attr_accessor :sdc_app, :env, :health_check, :usr, :pw, :url, :verbose, :printer, :browser, :hostname,
                    :print_media, :i_device_name, :firefox_profile, :framework
    end
  end

  class SdcDriver < BasicObject
    def initialize(driver)
      @driver = driver
    end

    def method_missing(method, *args, &block)
      super unless driver.respond_to?(method)
      @driver.send(method, *args, &block)
    end

    private
    attr_reader :driver
  end

  class SdcIDriver
    class << self
      attr_reader :core_driver
      def configure(device_name)
        begin
          file_path = File.expand_path("../../sdc_idevices/caps/#{device_name}.txt", __FILE__)

          exception = Selenium::WebDriver::Error::WebDriverError
          message = "Capabilities file does not exist for device #{device_name}. #{file_path}"
          raise exception, message unless File.exist?(file_path)

          caps = Appium.load_appium_txt file: file_path, verbose: true
          @core_driver = Appium::Driver.new(caps, false)
        rescue Exception => e
          SdcLog.error e.message
          SdcLog.error e.backtrace.join("\n")
          raise e, e.message
        end
        self
      end

      def start
        begin
          @core_driver.start_driver
        rescue => e
          SdcLog.error e.message
          SdcLog.error e.backtrace.join("\n")
        end
        self
      end

      def web_driver
        @core_driver.driver
      end
      alias_method :browser, :web_driver
      alias_method :driver, :web_driver
    end
  end

  class SdcTest
    class << self
      include Stamps::Core
      attr_reader :driver, :test_scenario, :scenario

      def configure
        if SdcEnv.browser
          begin
            Watir.always_locate = true
            Selenium::WebDriver.logger.level = :warn
            case(SdcEnv.browser)
              when :edge
                kill("taskkill /im MicrosoftEdge.exe /f")
                @driver = SdcDriver.new(Watir::Browser.new(:edge, accept_insecure_certs: true))
                @driver.window.maximize
              when :firefox
                kill("taskkill /im firefox.exe /f")
                unless SdcEnv.firefox_profile
                  @driver = SdcDriver.new(Watir::Browser.new(:firefox, accept_insecure_certs: true))
                else
                  profile = Selenium::WebDriver::Firefox::ProfilePage.from_name(firefox_profile)
                  profile.assume_untrusted_certificate_issuer = true
                  profile['network.http.phishy-userpass-length'] = 255
                  @driver = SdcDriver.new(Watir::Browser.new(:firefox, :profile => profile))
                end
                @driver.window.resize_to 1560, 1020
                @driver.window.move_to 0, 0
              when :chrome
                kill("taskkill /im chrome.exe /f")
                @driver = SdcDriver.new(Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))
                @driver.window.maximize
              when :chromeb
                kill("taskkill /im chrome.exe /f")
                Selenium::WebDriver::Chrome.path = data_for(:setup, {})['windows']['chromedriverbeta']
                @driver = SdcDelegatedDriver.new(Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))
                @driver.window.maximize
              when :ie
                kill("taskkill /im iexplore.exe /f")
                @driver = SdcDriver.new(Watir::Browser.new(:ie))
                @driver.window.maximize
              when :safari
                kill("killall 'Safari Technology Preview'")
                @driver = SdcDriver.new(Watir::Browser.new(:safari, technology_preview: true))
              else
                raise ArgumentError, "Invalid browser selection. #{test_driver}"
            end
            @driver.driver.manage.timeouts.page_load = 12
          rescue Exception => e
            SdcLog.error e.message
            SdcLog.error e.backtrace.join("\n")
            raise e, "Driver setup failed."
          end
        elsif SdcEnv.i_device_name
          @driver = SdcIDriver.configure(SdcEnv.i_device_name.to_s).start.web_driver
        else
          raise ArgumentError, "Neither BROWSER nor IDEVICENAME is defined for test #{test_scenario}. Expected values are: #{SdcEnv::BROWSERS.inspect} and #{SdcEnv::IDEVICES.inspect}"
        end

        SdcPageObject.browser = @driver
      end

      def kill(str)
        begin
          stdout, stdeerr, status = Open3.capture3(str)
        rescue
          # ignore
        end
      end

      def start(scenario)
        @scenario = scenario
        SdcEnv.browser ||= browser_selection(ENV['BROWSER'])
        SdcEnv.i_device_name ||= i_device_selection(ENV['IDEVICENAME'])
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

      def require_gems
        unless ENV['FRAMEWORK']
          require 'watir'
        end
        if ENV['IDEVICENAME']
          require 'appium_lib'
          require 'appium_lib_core'
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
        @web_apps_param.driver = @driver
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
          driver.quit
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

      def i_device_selection(str)
        return str.downcase.delete(' ').to_sym if str
        str
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

  module SdcParamHelper
    class << self

      attr_accessor :env

      def webapps
        webapps = Stamps::WebApps::Param.new
        webapps
      end

      def webdev
        raise "Not Implemented."
      end

      def ios
        raise "Not Implemented."
      end

      def android
        raise "Not Implemented."
      end

      def browser_type(driver)

        raise ArgumentError, "#{driver} is not a valid selection. Valid browsers are ff|firefox|mozilla|chrome|gc|google|ms|me|microsoft|edge"
      end
    end

  end
end
#switches: ['--ignore-certificate-errors --disable-popup-blocking --disable-translate']
#
#Appium::Driver.new(caps, true)
#Appium.promote_appium_methods Stamps
#@core_driver = $driver
#@driver.start_driver