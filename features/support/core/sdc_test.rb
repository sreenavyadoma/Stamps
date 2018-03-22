module Stamps

  module SdcEnv
    TEST_ENVIRONMENTS = %i(stg qacc cc qasc sc rating).freeze
    BROWSERS = %i(firefox ff chrome gc safari edge).freeze
    SDC_APP = %i(orders mail webdev registration).freeze
    IDEVICES = %i(iphone6 iphone7 iphone8 iphonex android).freeze
    class << self #todo-Rob refactor PrintMedia
      attr_accessor :web_app, :env, :health_check, :usr, :pw, :url, :verbose,  :printer, :browser, :hostname,
                    :print_media, :i_device_name, :firefox_profile
    end
  end

  class SdcDeviceDriver
    class << self
      attr_reader :driver #:core_driver,
      def configure(device_name)
        caps = Appium.load_appium_txt file: File.expand_path("../../idevices/caps/#{device_name}.txt", __FILE__), verbose: true
        #Appium::Driver.new(caps, true)
        #Appium.promote_appium_methods Stamps
        #@core_driver = $driver
        @driver = Appium::Driver.new(caps)
        #@driver.start_driver
        self
      end

      def start
        @driver.start_driver
        self
      end

      def driver
        @driver.driver
      end
    end
  end

  class SdcTest
    class << self
      include Stamps::Core
      attr_reader :driver, :test_scenario, :scenario, :log

      def configure
        if SdcEnv.browser
          begin
            Watir.always_locate = true
            Selenium::WebDriver.logger.level = :warn
            case(SdcEnv.browser)
              when :edge # Launch Microsoft Edge
                begin
                  stdout, stdeerr, status = Open3.capture3("taskkill /im MicrosoftEdge.exe /f")
                rescue
                  # ignore
                end
                @driver = SdcDriver.new(Watir::Browser.new(:edge, accept_insecure_certs: true))
                @driver.window.maximize

              when :firefox # Launch Firefox
                begin
                  stdout, stdeerr, status = Open3.capture3("taskkill /im firefox.exe /f")
                rescue
                  # ignore
                end
                if SdcEnv.firefox_profile.nil?
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
                begin
                  stdout, stdeerr, status = Open3.capture3("taskkill /im chrome.exe /f")
                rescue
                  # ignore
                end
                @driver = SdcDriver.new(Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))
                @driver.window.maximize
              #switches: ['--ignore-certificate-errors --disable-popup-blocking --disable-translate']

              when :ie
                begin
                  stdout, stdeerr, status = Open3.capture3("taskkill /im iexplore.exe /f")
                rescue
                  # ignore
                end
                @driver = SdcDriver.new(Watir::Browser.new(:ie))
                @driver.window.maximize

              when :safari
                begin
                  stdout, status = Open3.capture3("killall 'Safari Technology Preview'")
                rescue
                  # ignore
                end
                @driver = SdcDriver.new(Watir::Browser.new(:safari, technology_preview: true))
              else
                raise ArgumentError, "#{test_driver} is not a valid browser."
            end
          rescue Exception => e
            log.error e.message
            log.error e.backtrace.join("\n")
            raise "Driver setup failed: #{e.message}", e
          end
        elsif SdcEnv.i_device_name
          @driver = SdcDeviceDriver.configure(SdcEnv.i_device_name.to_s).start.driver
        else
          raise ArgumentError, "Neither BROWSER nor IDEVICENAME is defined for test #{test_scenario}. Expected values are: #{SdcEnv::BROWSERS.inspect} and #{SdcEnv::IDEVICES.inspect}"
        end
      end

      def start(scenario)
        @scenario = scenario
        SdcEnv.browser = browser_selection(ENV['BROWSER'])
        SdcEnv.i_device_name = i_device_selection(ENV['IDEVICENAME'])
        SdcEnv.verbose = ENV['VERBOSE'].nil? ? false : ENV['VERBOSE'].downcase == 'true'
        SdcEnv.hostname = Socket.gethostname
        SdcEnv.web_app = sdc_app(ENV['SDC_APP'])
        SdcEnv.health_check = ENV['HEALTHCHECK'].nil? ? false : ENV['HEALTHCHECK'].casecmp('true') == 0
        SdcEnv.usr = ENV['USR']
        SdcEnv.pw = ENV['PW']
        SdcEnv.env = test_env(ENV['URL'])
        SdcEnv.firefox_profile = ENV['FIREFOX_PROFILE']
        logger = Log4r::Logger.new(":")
        logger.outputters = Outputter.stdout
        @log = SdcLogger.new(logger, SdcEnv.verbose)

        #These should be in an orders/mail or web_apps environment variable container
        SdcEnv.printer = ENV['PRINTER']

        @web_apps_param = Stamps::WebApps::Param.new
        @web_apps_param.log = @log
        @web_apps_param.test_scenario
        @web_apps_param.test_scenario
        @web_apps_param.env = SdcEnv.env
        @web_apps_param.usr = SdcEnv.usr
        @web_apps_param.pw = SdcEnv.pw
        @web_apps_param.printer = SdcEnv.printer
        @web_apps_param.web_app = SdcEnv.web_app
        print_test_steps
      end

      def web_apps_param
        @web_apps_param
        @web_apps_param.driver = @driver
        @web_apps_param
      end

      def print_test_steps
        raise ArgumentError, 'Set scenario object before printing test steps' if @scenario.nil?
        log.info "- Feature: #{scenario.feature}"
        log.info "- Scenario: #{scenario.name}"
        log.info "- Tags:"
        scenario.tags.each_with_index { |tag, index| log.info "--Tag #{index + 1}: #{tag.name}" }
        log.info "- Steps:"
        scenario.test_steps.each_with_index { |steps, index| log.info "-- #{steps.source.last.keyword}#{steps.text}" }
        log.info "-"
        log.info "-"
      end

      def teardown
        begin
          driver.quit
        rescue
          # ignore
        end
        log.info "#{@browser} closed."
      end

      def clear_cookies
        log.info "Clearing cookies"
        begin
          driver.cookies.clear
        rescue
          # ignore
        end
      end

      private

      def i_device_selection(str)
        if str.nil?
          return str
        elsif SdcEnv::IDEVICES.include?((device = str.downcase.delete(' ').to_sym))
          return device
        else
          # ignore
        end

        raise ArgumentError, "Invalid IDEVICENAME: #{str}. Valid options are #{SdcEnv::IDEVICES.inspect}"
      end

      def browser_selection(str)
        return str if str.nil?
        case str.downcase
          when /ff|firefox|mozilla/
            return :firefox
          when /chrome|gc|google/
            return :chrome
          when /ms|me|microsoft|edge/
            return :edge
          when /apple|osx|safari|mac/
            return :safari
          when 'iphone6'
            return :iphone6
          else
            # ignore
        end

        raise ArgumentError, "BROWSER=#{str}. Expected values are #{SdcEnv::BROWSERS}" unless !str.nil? && SdcEnv::BROWSERS.include?(str.downcase)
      end

      def sdc_app(str)
        return str.downcase.to_sym if !str.nil? && SdcEnv::SDC_APP.include?(str.downcase.to_sym)
        raise ArgumentError, "SDC_APP is not defined or invalid. Expected values are #{SdcEnv::SDC_APP} - Got: #{str}"
      end

      def test_env(str)
        if str.nil? || !SdcEnv::TEST_ENVIRONMENTS.include?(str.downcase.to_sym)
          raise ArgumentError, "URL=#{str} is invalid. Expected values are #{SdcEnv::TEST_ENVIRONMENTS}"
        end
        case(str.downcase)
          when /staging/
            return :stg
          when /stg/
            return :stg
          when /cc/
            return :qacc
          when /sc/
            return :qasc
          when /rat/
            return :rating
          else
            # ignore
        end
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

=begin


          log.info "Browser Selection: #{driver}"

              #driver = Watir::Browser.new :safari                                         #todo Alex uncomment once framework upgraded to Watir 6.10.2
              #versions(driver.execute_script("return navigator.userAgent;"))
              #driver.window.maximize #todo-Rob move elsewhere


          #log.info "-"
          #log.info "BROWSER: #{self.browser_version.to_s.gsub("/", " ")}"
          #log.info "OS: #{self.os_version.to_s.gsub("/", " ")}" if self.os_version
          #log.info "-"


              #@driver.window.maximize
              #self.browser_version = /Edge\/.+/.match(driver.execute_script("return navigator.userAgent;"))


#stdout, status = Open3.capture3("killall Safari")

              #versions(driver.execute_script("return navigator.userAgent;"))
              #versions(@driver.execute_script("return navigator.userAgent;"))





=end
