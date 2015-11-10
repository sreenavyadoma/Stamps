module Stamps
  include DataMagic

  class Test
    def self.browser
      Stamps::Browser::Browser.instance
    end

    def self.verbose
      @verbose ||= ENV["VERBOSE"].downcase == "true"
    end

    def self.os
      @os ||= (
      host_os = RbConfig::CONFIG['host_os']
      case host_os
        when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
          :windows
        when /darwin|mac os/
          :macosx
        when /linux/
          :linux
        when /solaris|bsd/
          :unix
        else
          raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
      end
      )
    end

    def self.setup *args
      begin
        if args.length == 1
          ENV['BROWSER'] = args[0]
        end
        log "Browser Selection: #{ENV['BROWSER']}" if Stamps::Test.verbose

        if Test.browser.explorer?
          system "taskkill /im IEDriverServer.exe /f"
          system "taskkill /im iexplore.exe /f"

          driver = Watir::Browser.new :ie
          @browser_name = 'Internet Explorer'

        elsif Test.browser.firefox?
          system "taskkill /im firefox.exe /f"
          sleep 2
          #driver = Watir::Browser.new :firefox
          firefox_profile_dir = File.join("C:", "watir-webdriver", "firefox", "test-profile")
          Dir.mkdir firefox_profile_dir unless Dir.exist? firefox_profile_dir
          Selenium::WebDriver::Firefox::Profile.webdriver_profile_directory = firefox_profile_dir
          profile = Selenium::WebDriver::Firefox::Profile.new firefox_profile_dir
          profile.layout_on_disk
          profile.native_events = false

          driver = Watir::Browser.new :firefox, :profile => 'selenium'

          @browser_name = 'Mozilla Firefox'

        elsif Test.browser.chrome?
          system "taskkill /im chrome.exe /f"

          chrome_data_dir = File.join("C:", "Users", ENV['USERNAME'], "AppData", "Local", "Google", "Chrome", "User Data", "Default")
          chrome_driver_path = File.join("C:", "watir-webdriver", "drivers", "chromedriver.exe")

          log_param "chrome_driver:  exist?  #{File.exist? chrome_driver_path}  ##", chrome_driver_path
          log_param "chrome_data_dir:  exist?  #{File.exist? chrome_data_dir}  ##", chrome_data_dir

          begin
            raise log "Chrome Data Directory does not exist on this execution node:  #{chrome_data_dir}"
          end unless File.exist? chrome_data_dir

          driver = Watir::Browser.new :chrome, :switches => ["--user-data-dir=#{chrome_data_dir}", "--ignore-certificate-errors", "--disable-popup-blocking", "--disable-translate"]
          @browser_name = 'Google Chrome'

        elsif Test.browser.safari?
          driver = Watir::Browser.new :safari
          @browser_name = 'Mac OS X - Safari'
        else
          driver = Watir::Browser.new :ie
          @browser_name = 'Internet Explorer'
        end

        log "#{@browser_name} is ready."
        #driver.window.move_to 0, 0
        #driver.window.resize_to 1250, 850
        driver.window.maximize
        @browser = driver
      rescue Exception => e
        log e if Stamps::Test.verbose
        raise e
      end
    end

    def self.teardown
      log "Step:  Teardown test"
      @browser.quit unless @browser == nil
      @browser = nil
      log "#{@browser_name} closed. Test Done!"
    end

  end

  def str_to_sym str
    str.downcase.tr('()', '').tr('/-', '_').strip.tr(' ', '_').to_sym
  end

  def service_to_words str
    str.tr('()', '').tr(' /-', ' ')
  end

  def to_sym str, delim
    #str.gsub(/[^0-9A-Za-z -]/, '').gsub(/\s+/,'_').gsub(/-+/, '_').downcase.to_sym
    (strip str.gsub(/\W/, delim), delim).downcase.to_sym
  end

  def strip string, chars
    chars = Regexp.escape(chars)
    string.gsub(/\A[#{chars}]+|[#{chars}]+\z/, "")
  end

  def self.url_prefix *args
    @url_hash = data_for(:url_prefix, {})
    case args.length
      when 1
        return @url_hash[args[0]]
      else
        return @url_hash[ENV['URL']]
    end
  end

  def browser_helper
    BrowserHelper.instance
  end

  def test_helper
    TestHelper.instance
  end

  class TestHelper
    include Singleton
    include DataMagic

    def remove_dollar_sign str
      strip str, '$', ''
    end

    def strip str, char_to_remove, substitute_char
      str.gsub(char_to_remove, substitute_char)
    end

    def date_picker_calendar_date day
      now = Date.today
      "#{now.strftime("%B")} #{now.day + day.to_i}"
    end

    def print_date *args
      case args.length
        when 0
          now = Date.today
          log "Today:  #{now}" if Stamps::Test.verbose
          month = (now.month.to_s.length==1)?"0#{now.month}":now.month
          day = (now.day.length==1)?"0#{now.day}":now.day
          "#{month}/#{day}/#{now.year}"
        when 1
          now = Date.today
          log "Today:  #{now}" if Stamps::Test.verbose
          days_to_add = args[0].to_i
          new_date = now + days_to_add
          log "New Date:  #{new_date}" if Stamps::Test.verbose
          month = (new_date.month.to_s.length==1)?"0#{new_date.month}":new_date.month
          day = (new_date.day.to_s.length==1)?"0#{new_date.day}":new_date.day
          now = "#{month}/#{day}/#{new_date.year}"
          now
        else
          raise "Illegal number of arguments for TestHelper.date_from_today"
      end
    end

    def random_name
      "#{random_string} #{random_string}".split.map(&:capitalize).join(' ')
    end

    def random_company_name
      "#{random_string}#{random_string}".split.map(&:capitalize).join(' ')
    end

    def random_alpha_numeric *args
      case args.length
        when 0
          @length = 10
        when 1
          @length = args[0]
        else
          raise "Illegal number of arguments for random_alpha_numeric"

      end
      rstr = rand(36 ** @length - 1).to_s(36).rjust(@length, "0")
    end

    def random_string *args
      case args.length
        when 0
          (0...rand(2..9)).map { (65 + rand(26)).chr }.join
        when 2
          (0...rand(args{0}.to_i..args{1}.to_i)).map { (65 + rand(26)).chr }.join
        else

      end
    end

    def random_phone
      "(#{Random.rand(100..999)}) #{Random.rand(100..999)}-#{Random.rand(1000..9999)}"
    end

    def random_email
      "#{random_string}@#{random_string}.com".downcase
    end

    def random_ship_to
      shipping = select_random_zone_random_address
      shipping["name"] = test_helper.random_name
      shipping["company"] = test_helper.random_company_name
      shipping["phone"] = test_helper.random_phone
      shipping["email"] = test_helper.random_email
      shipping
    end

    def random_suite
      "Suite #{Random.rand(1..999)}"
    end

    def random_ship_from
      us_states = data_for(:us_states, {}) if us_states.nil?
      shipping = select_random_zone_random_address
      shipping["ship_from_zip"] = shipping["zip"]
      shipping["name"] = random_name
      shipping["company"] = random_company_name
      shipping["phone"] = random_phone
      shipping["email"] = random_email
      shipping["state_abbrev"] = shipping["state"]
      shipping["state"] = us_states[shipping["state_abbrev"]]
      shipping["street_address2"] = random_suite
      shipping
    end

    def select_random_zone_random_address
      shipping_addresses_zones = data_for(:shipping_addresses, {})
      zones = shipping_addresses_zones.values
      #pick a random zone
      zone_addresses = zones[rand(zones.size)]
      zone_addresses_values = zone_addresses.values
      #pick a random address from the zone selected above.
      zone_addresses_values[rand(zone_addresses_values.size)]
    end

  end

end