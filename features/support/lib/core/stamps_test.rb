module Stamps
  module StampsTest
    class << self
      attr_accessor :driver, :log, :scenario, :scenario_name, :firefox_profile, :browser_version, :os_version

      def init(scenario)
        @scenario = scenario
        @scenario_name = scenario.name
        logger = Log4r::Logger.new(":")
        logger.outputters = Outputter.stdout
        @log = Stamps::Core::StampsLogDecorator.new(logger)
        @log.verbose = true #ENV['VERBOSE']
      end

      def print_test_steps
        raise ArgumentError, 'Set scenario object before printing test steps' if scenario.nil?
        self.scenario_name = scenario.name
        log.info "- Feature: #{scenario.feature}"
        log.info "- Scenario: #{scenario.name}"
        log.info "- Tags:"
        scenario.tags.each_with_index { |tag, index| log.info "--Tag #{index + 1}: #{tag.name}" }
        log.info "- Steps:"
        scenario.test_steps.each_with_index { |steps, index| log.info "-- #{steps.source.last.keyword}#{steps.text}" }
        log.info "-"
        log.info "-"
      end

      def setup(browser)
        begin
          Watir.always_locate = true
          Selenium::WebDriver.logger.level = :warn
          case(browser)

            when :edge # Launch Microsoft Edge
              begin
                stdout, stdeerr, status = Open3.capture3("taskkill /im MicrosoftEdge.exe /f")
              rescue
                # ignore
              end
              self.driver = Watir::Browser.new(:edge, accept_insecure_certs: true)
              self.driver.window.maximize

            when :firefox # Launch Firefox
              begin
                stdout, stdeerr, status = Open3.capture3("taskkill /im firefox.exe /f")
              rescue
                # ignore
              end
              if firefox_profile.nil?
                self.driver = Watir::Browser.new(:firefox, accept_insecure_certs: true)
              else
                profile = Selenium::WebDriver::Firefox::ProfilePage.from_name(firefox_profile)
                profile.assume_untrusted_certificate_issuer = true
                profile['network.http.phishy-userpass-length'] = 255
                self.driver = Watir::Browser.new(:firefox, :profile => profile)
              end
              self.driver.window.resize_to 1560, 1020
              self.driver.window.move_to 0, 0

            when :chrome
              begin
                stdout, stdeerr, status = Open3.capture3("taskkill /im chrome.exe /f")
              rescue
                # ignore
              end
              self.driver = Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate))
              self.driver.window.maximize
            #switches: ['--ignore-certificate-errors --disable-popup-blocking --disable-translate']

            when :ie # Launch Internet Explorer
              begin
                stdout, stdeerr, status = Open3.capture3("taskkill /im iexplore.exe /f")
              rescue
                # ignore
              end
              self.driver = Watir::Browser.new :ie
              driver.window.maximize

            when :safari
              begin
                stdout, status = Open3.capture3("killall 'Safari Technology Preview'")    #todo Alex uncomment once framework upgraded to Watir 6.10.2
              rescue
                # ignore
              end
              self.driver = Watir::Browser.new :safari, technology_preview: true
            else
              raise ArgumentError, "#{browser} is not a valid browser selection"
          end
          self.driver
        rescue StandardError => e
          err = e.backtrace.join("\n")
          log.error e.message
          log.error e.backtrace.join("\n")
          log.error e.message
          raise e
        end
      end

      def os
        @os = begin
          host_os = RbConfig::CONFIG['host_os']
          case host_os
            when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
              return :windows
            when /darwin|mac os/
              return :macosx
            when /linux/
              return :linux
            when /solaris|bsd/
              return :unix
            else
              expect("OS #{host_os.inspect} is not defined").to eql ""
          end
        end
      end

      def teardown
        begin
          browser.quit
        rescue
          # ignore
        end
        log.info "#{@browser_str} closed."
      end

      def clear_cookies
        log.info "Clearing cookies"
        begin
          browser.cookies.clear
        rescue
          # ignore
        end
      end

      private
      def versions(info)
        self.browser_version = /[\d.]+ Safari|Edge\/.+|Firefox\/.+|Chrome\/[\d\.]+/.match(info)
        self.os_version = /(Mac OS.+?[\d_]+|Windows.+?[\d\.]+)/.match(info)
      end
    end
  end
end

=begin


          log.info "Browser Selection: #{browser}"

              #driver = Watir::Browser.new :safari                                         #todo Alex uncomment once framework upgraded to Watir 6.10.2
              #versions(driver.execute_script("return navigator.userAgent;"))
              #driver.window.maximize #todo-Rob move elsewhere


          #log.info "-"
          #log.info "BROWSER: #{self.browser_version.to_s.gsub("/", " ")}"
          #log.info "OS: #{self.os_version.to_s.gsub("/", " ")}" if self.os_version
          #log.info "-"


              #self.driver.window.maximize
              #self.browser_version = /Edge\/.+/.match(driver.execute_script("return navigator.userAgent;"))


#stdout, status = Open3.capture3("killall Safari")

              #versions(driver.execute_script("return navigator.userAgent;"))
              #versions(self.driver.execute_script("return navigator.userAgent;"))





=end
