module Stamps
  class StampsTestSetup
    attr_accessor :browser, :firefox_profile, :browser_version, :scenario_name

    def logger
      @logger = StampsLogger.new(scenario_name) if @logger.nil? || @logger.scenario_name != scenario_name # create new instance of logger if scenario name changes
      @logger
    end

    def setup(browser_str)
      begin
        Watir::always_locate = true
        logger.info "Browser Selection: #{browser_str}"
        browser_version = 'Unknown'
        case(browser_str)
          when :edge # Launch Microsoft Edge
            begin
              stdout, stdeerr, status = Open3.capture3("taskkill /im MicrosoftEdge.exe /f")
              logger.error status
              logger.error stdout
            rescue
              #ignore
            end
            capabilities = Selenium::WebDriver::Remote::Capabilities.edge(accept_insecure_certs: true)
            driver = Watir::Browser.new(:edge, :desired_capabilities => capabilities)
            driver.window.maximize
            self.browser_version = /Edge\/.+/.match(driver.execute_script("return navigator.userAgent;"))
          when :firefox # Launch Firefox
            begin
              stdout, stdeerr, status = Open3.capture3("taskkill /im firefox.exe /f")
              logger.error status
              logger.error stdout
            rescue
              #ignore
            end
            if firefox_profile.nil?
              capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(accept_insecure_certs: true)
              driver = Watir::Browser.new(:firefox, :desired_capabilities => capabilities)
            else
              profile = Selenium::WebDriver::Firefox::Profile.from_name(firefox_profile)
              profile.assume_untrusted_certificate_issuer = true
              profile['network.http.phishy-userpass-length'] = 255
              driver = Watir::Browser.new(:firefox, :profile => profile)
            end
            self.browser_version = /Firefox\/.+/.match(driver.execute_script("return navigator.userAgent;"))
            driver.window.resize_to 1560, 1020
            driver.window.move_to 0, 0
          when :chrome
            begin
              stdout, stdeerr, status = Open3.capture3("taskkill /im chrome.exe /f")
              logger.error status
              logger.error stdout
            rescue
              #ignore
            end
            driver = Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate))
            self.browser_version = /Chrome\/.+/.match(driver.execute_script("return navigator.userAgent;"))
            driver.window.maximize
            #switches: ['--ignore-certificate-errors --disable-popup-blocking --disable-translate']
          when :ie # Launch Internet Explorer
            begin
              stdout, stdeerr, status = Open3.capture3("taskkill /im iexplore.exe /f")
              logger.message status
              logger.message stdout
            rescue
              #ignore
            end
            driver = Watir::Browser.new :ie
            driver.window.maximize
          when :safari
            driver = Watir::Browser.new :safari
          else
            raise "#{browser_str} is not a valid browser"
        end

        self.browser = driver
        logger.message "-"
        logger.message "BROWSER: #{self.browser_version}"
        logger.message "-"
        #driver.cookies.clear
      rescue Exception => e
        err = e.backtrace.join("\n")
        logger.error e.message
        logger.error e.backtrace.join("\n")
        logger.error e.message
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
      logger.info "Teardown test"
      begin
        browser.quit
          #browser.cookies.clear

      rescue
        #ignore
      end
      logger.info "#{@browser_str} closed."
      logger.info "Test Done!"

    end

    def clear_cookies
      logger.info "Clearing cookies"
      begin
        browser.cookies.clear
      rescue
        #ignore
      end
    end

  end
end

