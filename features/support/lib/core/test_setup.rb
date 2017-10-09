module Stamps
  class StampsTestSetup
    attr_accessor :browser, :logger, :firefox_profile, :browser_name, :scenario_name

    def initialize_logger(scenario_name)
      @scenario_name = scenario_name
      expect(scenario_name).to_not be(nil), "Scenario name cannot be nil, assign value to scenario_name prior to initialing logger."
      @logger = StampsLogger.new(scenario_name)
    end

    def setup
      begin
        Watir::always_locate = true
        logger.info "Browser Selection: #{browser_sym}"
        case(browser_sym)
          # Launch Microsoft Edge
          when :edge
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
          # Launch Firefox
          when :firefox
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
            driver.window.resize_to 1560, 1020
            driver.window.move_to 0, 0
            @browser_name = 'Mozilla Firefox'
          when :chrome
            begin
              stdout, stdeerr, status = Open3.capture3("taskkill /im chrome.exe /f")
              logger.error status
              logger.error stdout
            rescue
              #ignore
            end
            driver = Watir::Browser.new(:chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate))
            driver.window.maximize
            #switches: ['--ignore-certificate-errors --disable-popup-blocking --disable-translate']
            @browser_name = 'Google Chrome'
          # Launch Internet Explorer
          when :ie
            begin
              stdout, stdeerr, status = Open3.capture3("taskkill /im iexplore.exe /f")
              logger.message status
              logger.message stdout
            rescue
              #ignore
            end
            driver = Watir::Browser.new :ie
            driver.window.maximize
            @browser_name = 'Internet Explorer'
          when :safari
            driver = Watir::Browser.new :safari
            @browser_name = 'Mac OS X - Safari'
          else
            # do nothing.
        end
        logger.message "-"
        logger.message "BROWSER: #{@browser_name}"
        logger.message "-"
        #driver.cookies.clear
        @browser = driver
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
      logger.info "#{@browser_name} closed."
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

