module Stamps
  class StampsTestSetup
    attr_accessor :browser, :logger, :browser_sym, :firefox_profile, :windows_user, :scenario_name, :browser_name

    def init(scenario_name, browser_sym, firefox_profile, windows_user)
      @scenario_name = scenario_name
      @browser_sym = BrowserType.new(browser_sym).browser_sym
      @firefox_profile = firefox_profile
      @windows_user = windows_user
      @logger = StampsLogger.new(@scenario_name)
    end

    def setup
      begin
        Watir::always_locate = true

        logger.info "Browser Selection: #{browser_sym}"
        case(browser_sym)

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
              driver = Watir::Browser.new(:firefox, :profile => profile)
            end
            @browser_name = 'Mozilla Firefox'

          when :chrome
            begin
              stdout, stdeerr, status = Open3.capture3("taskkill /im chrome.exe /f")
              logger.error status
              logger.error stdout
            rescue
              #ignore
            end
            driver = Watir::Browser.new :chrome, switches: %w(--ignore-certificate-errors --disable-popup-blocking --disable-translate) #switches: ['--ignore-certificate-errors --disable-popup-blocking --disable-translate']
          when :ie
            begin
              stdout, stdeerr, status = Open3.capture3("taskkill /im iexplore.exe /f")
              logger.message status
              logger.message stdout
            rescue
              #ignore
            end

            driver = Watir::Browser.new :ie
            @browser_name = 'Internet Explorer'
          when :safari
            driver = Watir::Browser.new :safari
            @browser_name = 'Mac OS X - Safari'
          else
            # do nothing.
        end

        #driver.window.move_to 0, 0
        #driver.window.resize_to 1000, 800
        #driver.window.maximize if (ENV['MAX_WINDOW'].nil? || test_helper.to_bool(ENV['MAX_WINDOW']))
        driver.window.maximize
        logger.message "-"
        logger.message "BROWSER: #{@browser_name}"
        logger.message "-"
        @browser = driver
      rescue Exception => e
        err = e.backtrace.join("\n")
        logger.error e.message
        logger.error e.backtrace.join("\n")
        logger.error e.message
        raise e
      end
    end

    def scenario_name=name
      @test_name = name
      logger.scenario_name = @test_name
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

