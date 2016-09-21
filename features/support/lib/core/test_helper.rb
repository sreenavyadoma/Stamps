module Stamps
  class BrowserSelection
    def firefox?
      "ff|firefox|mozilla".include? ENV['BROWSER'].downcase
    end

    def chrome?
      "chrome|gc|google".include? ENV['BROWSER'].downcase
    end

    def ie?
      "ie|explorer|internet explorer".include? ENV['BROWSER'].downcase
    end

    def safari?
      "apple|osx|safari|mac".include? ENV['BROWSER'].downcase
    end
  end

  class TestHelper
    include DataMagic

    class << self
      attr_accessor :browser, :logger, :scenario_name, :browser_name

      def init *args
        scenario_name = 'Stamps Test'
        scenario_name = args[0] if args.length==1
        @logger = StampsLogger.new scenario_name
        @scenario_name = scenario_name
      end

      def setup
        begin
          Watir::always_locate = true

          logger.info "Browser Selection: #{ENV['BROWSER']}"

          if browser_selection.firefox?
            begin
              system "taskkill /im firefox.exe /f"
            rescue
              #ignore
            end

            # Launch Firefox
            driver = Watir::Browser.new :firefox, profile: data_for(:profile, {})['firefox']

            @browser_name = 'Mozilla Firefox'

          elsif browser_selection.ie?
            begin
              system "taskkill /im iexplore.exe /f"
            rescue
              #ignore
            end

            driver = Watir::Browser.new :ie
            @browser_name = 'Internet Explorer'

          elsif browser_selection.chrome?
            begin
              system "taskkill /im chrome.exe /f"
            rescue
              #ignore
            end

            temp_data_dir1 = File.join("C:", "Users", ENV['USERNAME'], "AppData", "Local", "Google", "Chrome", "User Data", "Default")
            temp_data_dir2 = File.join("C:", "Users", "#{ENV['USERNAME']}.CORP", "AppData", "Local", "Google", "Chrome", "User Data", "Default")

            chrome_data_dir = (File.exist? temp_data_dir1)?temp_data_dir1:temp_data_dir2
            chrome_driver_path = File.join("C:", "watir-webdriver", "drivers", "chromedriver.exe")

            logger.info "chrome_driver path:  #{chrome_driver_path} - #{(File.exist? chrome_driver_path)?'Exist':'DOES NOT EXIST IN THIS MACHINE!'} "
            logger.info "chrome_data_dir path:  #{chrome_data_dir}  #{(File.exist? chrome_data_dir)?'Exist':'DOES NOT EXIST IN THIS MACHINE!'}"

            begin
              logger.info "Teardown: Begin tearing down test"
              TestHelper.teardown
              logger.info "Teardown: Done!"
              stop_test logger.info "Chrome Data Directory does not exist on this execution node:  #{chrome_data_dir}"
            end unless File.exist? chrome_data_dir

            driver = Watir::Browser.new :chrome, :switches => ["--disable-mail-preview", "--user-data-dir=#{chrome_data_dir}", "--ignore-certificate-errors", "--disable-popup-blocking", "--disable-translate"]
            @browser_name = 'Google Chrome'

          elsif browser_selection.safari?
            driver = Watir::Browser.new :safari
            @browser_name = 'Mac OS X - Safari'
          else
            driver = Watir::Browser.new :ie
            @browser_name = 'Internet Explorer'
          end

          logger.info "#{@browser_name} is ready."

          #driver.window.move_to 0, 0
          #driver.window.resize_to 1250, 850

          driver.window.maximize
          @browser = driver
        rescue Exception => e
          logger.error e
          logger.info "Teardown: Begin tearing down test"
          TestHelper.teardown
          logger.info "Teardown: Done!"
          raise e
        end
      end

      def scenario_name=name
        @test_name = name
        logger.scenario_name = @test_name
      end

      def url_prefix *args
        @url_hash = data_for(:url_prefix, {})
        case args.length
          when 1
            return @url_hash[args[0]]
          else
            return @url_hash[ENV['URL']]
        end
      end

      def browser_selection
        @browser_selection ||= BrowserSelection.new
      end

      def browser
        @browser
      end

      def verbose
        @verbose ||= ENV["VERBOSE"].downcase == "true"
      end

      def os
        @os ||= begin
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
              logger.info "Teardown: Begin tearing down test"
              TestHelper.teardown
              logger.info "Teardown: Done!"
              stop_test Error::WebDriverError, "unknown os: #{host_os.inspect}"
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

      # Added by Galina
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
end
