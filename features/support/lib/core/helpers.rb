module Stamps

  module StampsTestHelper
    def first_half(str)
      index = (str.size.to_f / 2).ceil
      str[0, index]
    end

    def valid_ship_date(day)
      # get the date
      today = Date.today+day
      # add a day if today is Sunday, we don't ship on Sundays
      today += 1 if today.wday == 0
      # determine if today's date is a holiday and advance to next day if it is
      10.times do
        date = Date.civil(today.year,today.month,today.day)
        break if Holidays.on(date, :us).size == 0
        today += 1 if Holidays.on(date, :us).size > 0
      end
      # return proper date
      (today).strftime("%m/%d/%Y")
    end
  end

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


  module ElementHelper
    attr_accessor :element, :browser

    def url
      browser.url
    end

    def disabled?
      begin
        element.disabled?
      rescue
        true
      end
    end

    def exist?
      begin
        element.exist?
      rescue
        false
      end
    end

    def present?
      element.present?
    end

    def checked?
      begin
        element.checked?
      rescue
        return false
      end
    end

    def visible?
      begin
        element.visible?
      rescue
        return false
      end
    end

    def enabled?
      begin
        element.enabled?
      rescue
        return false
      end
    end

    def hover
      begin
        element.hover
      rescue
        #ignore
      end
    end

    def clear
      begin
        element.clear
      rescue
        #ignore
      end
    end

    def wait_while_present(*args)
      if args.length==1
        element.wait_while_present(args[0].to_i)
      else
        element.wait_while_present
      end
    end

    def wait_until_present(*args)
      begin
        if args.length==1
          element.wait_until_present(args[0].to_i)
        else
          element.wait_until_present
        end
      rescue Exception => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
      end
    end

    def scroll_into_view
      begin
        element.browser.execute_script('arguments[0].scrollIntoView();', element)
      rescue
        # ignore
      end
    end

    def text
      begin
        return element.text if element.text.size > 0
      rescue
        #ignore
      end

      begin
        return element.value if element.value.size > 0
      rescue
        #ignore
      end

      begin
        return element.attribute_value('value') if element.attribute_value('value').size > 0
      rescue
        #ignore
      end
      ''
    end

    def element_send_keys(element, key)
      begin
        element.send_keys(key)
      rescue
        #ignroe
      end
    end

    def send_keys(key)
      2.times do
        begin
          element.send_keys(key)
        rescue
          #ignore
        end
      end
    end

    def click
      begin
        element.click
      rescue
        #ignore
      end
    end

    def click_while_present
      20.times do
        click
        sleep(0.05)
        break unless element.present?
      end
    end
    def safe_double_click
      begin
        element.double_click
      rescue
        #ignore
      end
    end

  end





  class TestHelper
    include DataMagic

    class << self
      attr_accessor :browser, :logger, :scenario_name, :browser_name

      def init(*args)
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
              "Chrome Data Directory does not exist on this execution node:  #{chrome_data_dir}").to eql ""
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
          expect(err).to eql ""
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
        return false if ENV["DEBUG"].nil?
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
