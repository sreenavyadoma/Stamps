module Stamps

  module SdcEnv
    TEST_ENVIRONMENTS = %i(stg qacc cc qasc sc rating).freeze
    BROWSERS = %i(firefox ff chrome gc safari edge).freeze
    SDC_APP = %i(orders mail webdev ios android).freeze
    class << self
      attr_accessor :web_app, :env, :health_check, :usr, :pw, :url, :verbose,  :printer, :browser, :hostname, :print_media
    end
  end

  class SdcTest
    class << self
      include Stamps::Core
      attr_reader :driver, :scenario_name, :scenario, :log

      def configure_driver(browser, firefox_profile = nil)
        begin
          Watir.always_locate = true
          Selenium::WebDriver.logger.level = :warn
          case(browser.nil? ? SdcEnv.browser : browser_sym(browser))
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
              if firefox_profile.nil?
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

            when :chromeb
              begin
                #    stdout, stdeerr, status = Open3.capture3("taskkill /im chrome.exe /f")
              rescue
                # ignore
              end
              Selenium::WebDriver::Chrome.path = data_for(:setup, {})['windows']['chromedriverbeta']
              @driver = SdcDelegatedDriver.new(Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate)))
              @driver.window.maximize

            when :ie # Launch Internet Explorer
              begin
                stdout, stdeerr, status = Open3.capture3("taskkill /im iexplore.exe /f")
              rescue
                # ignore
              end
              @driver = SdcDriver.new(Watir::Browser.new(:ie))
              @driver.window.maximize

            when :safari
              begin
                stdout, status = Open3.capture3("killall 'Safari Technology Preview'")    #todo Alex uncomment once framework upgraded to Watir 6.10.2
              rescue
                # ignore
              end
              @driver = SdcDriver.new(Watir::Browser.new(:safari, technology_preview: true))
            else
              raise ArgumentError, "#{driver} is not a valid driver selection"
          end
          @driver
        rescue Exception => e
          log.error e.message
          log.error e.backtrace.join("\n")
          raise "Driver setup failed: #{e.message}", e
        end
      end

      def configure(scenario)
        @scenario = scenario
        SdcEnv.browser ||= browser_sym(ENV['BROWSER'])
        SdcEnv.verbose ||= ENV['VERBOSE'].nil? ? false : ENV['VERBOSE'].downcase == 'true'
        SdcEnv.hostname ||= Socket.gethostname
        SdcEnv.web_app ||= sdc_app(ENV['SDC_APP'])
        SdcEnv.health_check ||= ENV['HEALTHCHECK'].nil? ? false : ENV['HEALTHCHECK'].casecmp('true') == 0
        SdcEnv.usr ||= ENV['USR']
        SdcEnv.pw ||= ENV['PW']
        SdcEnv.env ||= test_env(ENV['URL'])
        logger = Log4r::Logger.new(":")
        logger.outputters = Outputter.stdout
        @log = SdcLogger.new(logger, SdcEnv.verbose)

        #These should be in an orders/mail or web_apps environment variable container
        SdcEnv.printer = ENV['PRINTER']

        # todo-Rob workaround, fix it.
        @web_apps_param = ::WebApps::Param.new
        @web_apps_param.log = @log
        @web_apps_param.scenario_name
        @web_apps_param.scenario_name
        @web_apps_param.env = SdcEnv.env
        @web_apps_param.usr = SdcEnv.usr
        @web_apps_param.pw = SdcEnv.pw
        @web_apps_param.printer = SdcEnv.printer
        @web_apps_param.web_app = SdcEnv.web_app
      end

      def web_apps_param
        @web_apps_param
        @web_apps_param.driver = @driver
        @web_apps_param
      end

      def configure_orders

      end

      def configure_mail

      end

      def configure_webdev

      end

      def print_test_steps
        raise ArgumentError, 'Set scenario object before printing test steps' if @scenario.nil?
        @scenario_name = scenario.name
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

      def browser_sym(str)
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
            # ignore
        end

        raise ArgumentError, "BROWSER=#{str}. Expected values are #{SdcEnv::BROWSERS}" unless !str.nil? && SdcEnv::BROWSERS.include?(str.downcase)
      end

      def sdc_app(str)
        return str.downcase.to_sym if !str.nil? && SdcEnv::SDC_APP.include?(str.downcase.to_sym)
        raise ArgumentError, "SDC_APP is not defined or invalid. Expected values are #{SdcEnv::SDC_APP} - Got: #{str}"
      end

      def test_env(str)
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

        raise ArgumentError, "URL is not defined or invalid. Expected values are #{SdcEnv::TEST_ENVIRONMENTS}" unless !str.nil? && SdcEnv::TEST_ENVIRONMENTS.include?(str.downcase.to_sym)
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
        webapps = WebApps::Param.new
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
