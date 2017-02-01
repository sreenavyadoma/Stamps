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
              stdout, stdeerr, status = Open3.capture3("taskkill /im firefox.exe /f")
              logger.message status
              #logger.info stdeerr
              logger.message stdout
            rescue
              #ignore
            end

            # Launch Firefox
            if ENV['FIREFOX_PROFILE'].nil? || ENV['FIREFOX_PROFILE'].downcase == 'selenium'
              #driver = Watir::Browser.new :firefox, profile: data_for(:profile, {})['firefox']
              driver = Watir::Browser.new :firefox, :profile => 'selenium'
            elsif ENV['FIREFOX_PROFILE'].downcase == 'new'
              driver = Watir::Browser.new :firefox
            else
              driver = Watir::Browser.new :firefox, profile: ENV['FIREFOX_PROFILE']
            end

            @browser_name = 'Mozilla Firefox'

          elsif browser_selection.ie?
            begin
              stdout, stdeerr, status = Open3.capture3("taskkill /im iexplore.exe /f")
              logger.message status
              #logger.info stdeerr
              logger.message stdout
            rescue
              #ignore
            end

            driver = Watir::Browser.new :ie
            @browser_name = 'Internet Explorer'

          elsif browser_selection.chrome?
            begin
              stdout, stdeerr, status = Open3.capture3("taskkill /im chrome.exe /f")
              logger.message status
              #logger.info stdeerr
              logger.message stdout
            rescue
              #ignore
            end

            temp_data_dir1 = File.join("C:", "Users", ENV['USERNAME'], "AppData", "Local", "Google", "Chrome", "User Data", "Default")
            temp_data_dir2 = File.join("C:", "Users", "#{ENV['USERNAME']}.CORP", "AppData", "Local", "Google", "Chrome", "User Data", "Default")

            chrome_data_dir = (File.exist? temp_data_dir1)?temp_data_dir1:temp_data_dir2
            chrome_driver_path = File.join("C:", "watir-webdriver", "drivers", "chromedriver.exe")

            logger.info "chrome_driver path:  #{chrome_driver_path} - #{(File.exist? chrome_driver_path)?'Exist':'DOES NOT EXIST IN THIS MACHINE!'} "
            logger.info "chrome_data_dir path:  #{chrome_data_dir}  #{(File.exist? chrome_data_dir)?'Exist':'DOES NOT EXIST IN THIS MACHINE!'}"
=begin
            begin
              "Chrome Data Directory does not exist on this execution node:  #{chrome_data_dir}".should eql ""
            end unless File.exist? chrome_data_dir

            driver = Watir::Browser.new :chrome, :switches => ["--disable-mail-preview", "--user-data-dir=#{chrome_data_dir}", "--ignore-certificate-errors", "--disable-popup-blocking", "--disable-translate"]
            @browser_name = 'Google Chrome'
=end
            Selenium::WebDriver::Chrome.path = chrome_driver_path
            driver = Selenium::WebDriver.for :chrome
            browser = Watir::Browser.new dr

          elsif browser_selection.safari?
            driver = Watir::Browser.new :safari
            @browser_name = 'Mac OS X - Safari'
          else
            driver = Watir::Browser.new :ie
            @browser_name = 'Internet Explorer'
          end
          #driver.window.move_to 0, 0
          #driver.window.resize_to 1000, 800
          #driver.window.maximize if (ENV['MAX_WINDOW'].nil? || ParameterHelper.to_bool(ENV['MAX_WINDOW']))
          driver.window.maximize
          logger.message "-"
          logger.message "BROWSER: #{@browser_name}"
          logger.message "-"
          @browser = driver
        rescue Exception => e
          err = e.backtrace.join("\n")
          logger.error e.backtrace.join("\n")
          err.should eql ""
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
        @browser_selection = BrowserSelection.new
      end

      def browser
        @browser
      end

      def debug
        return true if ENV["DEBUG"].nil?
        ENV["DEBUG"].downcase == "true"
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
              "OS #{host_os.inspect} is not defined".should eql ""
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
