module Stamps

  class StampsTestHelper
    attr_reader :logger
    def initialize(logger)
      @logger = logger
    end

    def first_half(str)
      index = (str.size.to_f / 2).ceil
      str[0, index]
    end

    def valid_ship_date(day)
      day = day.to_i
      ship_date = Date.today

      day.times do
        ship_date += 1
        date = Date.civil(ship_date.year,ship_date.month,ship_date.day)
        #break if Holidays.on(date, :us).size == 0 && ship_date.wday != 0 # break if today is not a holiday and not a Sunday.
        ship_date += 1 if Holidays.on(date, :us).size > 0 # add 1 if today is a holiday
        ship_date += 1 if ship_date.wday == 0 # add 1 if today is Sunday
      end
      ship_date.strftime("%m/%d/%Y")
    end
    def is_whole_number?(variable)
      variable % 1 == 0
    end

    def remove_dollar_sign str
      strip str, '$', ''
    end

    def rand_login_credentials
      login_credentials = data_for(:login_credentials, {})[ENV['URL']]
      credentials = login_credentials.values
      credentials[rand(credentials.size)]
    end

    def format_address_arr address_array
      formatted_address = ""

      if address_array.is_a?(Array)
        address_array.each_with_index do |element, index|
          if index==address_array.size-1 #if this is the last item in the string, don't append a new line
            formatted_address = formatted_address + element.to_s.strip
          else #(param_hash['name'].downcase.include? 'random') ? helper.random_name : param_hash['name']
            formatted_address = formatted_address + ((element.to_s.strip.downcase.include? 'random') ? helper.random_name : element.to_s.strip) + "\n"
          end
        end
      end
      logger.info "Formatted Shipping Address:  \n#{formatted_address}"
      formatted_address
    end

    def format_address address
      if address.is_a?(Hash)
        format_address_arr address_hash_to_str(address).split(/,/)
      elsif address.is_a?(Array)
        format_address_arr(address)
      elsif address.include?(',')
        format_address_arr address.split(/,/)
      elsif address.is_a?(String)
        address
      else
        address
      end
    end

    def address_hash_to_str address
      name = (address['name'].downcase.include? 'random') ? helper.random_name : address['name']
      company_name = (address['company'].downcase.include? 'random') ? helper.random_company_name : address['company']
      street_address = address["street_address"]

      if address['street_address_2'].nil?
        street_address_2 = ""
      else
        street_address_2 = address["street_address_2"]
      end

      city = address['city']
      state = address["state"]
      zip = address["zip"]
      begin
        phone_num = address['phone']
        phone = (phone_num.downcase.include? 'random') ? helper.random_phone : address['phone']
      end unless address['phone'].nil?
      begin
        email_addy = address['email']
        email = (email_addy.downcase.include? 'random') ? helper.random_email : address['email']
      end unless address['email'].nil?

      #logger.info "Ship-To Name: #{name}"
      #logger.info "Ship-To Company: #{company_name}"
      #logger.info "Ship-To Address: #{street_address}"
      #logger.info "Ship-To Address 2: #{street_address_2}"
      #logger.info "Ship-To City: #{city}"
      #logger.info "Ship-To State: #{state}"
      #logger.info "Ship-To Zip: #{zip}"
      #logger.info "Ship-To Phone: #{phone}" unless address['phone'].nil?
      #logger.info "Ship-To Email: #{email}" unless address['email'].nil?

      formatted_address = "#{name}\n#{company_name}\n#{street_address} #{street_address_2}\n#{city} #{state} #{zip}"
      logger.info "Formatted Address: #{formatted_address}"
      formatted_address
    end

    # Convert date string from format 12/3/2015 to Dec 3
    def mmddyy_to_mondd date_str
      collection = date_str.split "/"
      date = Date.new collection[2].to_i, collection[0].to_i, collection[1].to_i
      date.strftime "%b %-d"
    end

    def now_plus_mm_dd
      now_plus_mm_dd_yy 0
    end

    def now_plus_mm_dd_yy(day)
      (Date.today + day.to_i).strftime "%m/%d/%Y"
    end

    def now_month_dd
      now_plus_month_dd 0
    end

    def now_plus_month_dd day
      (Date.today + day.to_i).strftime "%B %d"
    end

    def now_plus_mon_dd day
      (Date.today + day.to_i).strftime "%b %-d"
    end

    def now_plus_mon_dd_excl_sunday day
      if Date.today.wday + day.to_i == 7
        return (Date.today + day.to_i + 1).strftime "%b %-d"
      end
      (Date.today + day.to_i).strftime "%b %-d"
    end

    def date_printed(*args)
      case args.length
        when 0
          now = Date.today
          logger.info "Today:  #{now}"
          month = (now.month.to_s.length==1)?"0#{now.month}":now.month
          day = (now.day.length==1)?"0#{now.day}":now.day
          "#{month}/#{day}/#{now.year}"
        when 1
          now = Date.today
          logger.info "Today:  #{now}"
          days_to_add = args[0].to_i
          new_date = now + days_to_add
          logger.info "New Date:  #{new_date}"
          month = (new_date.month.to_s.length==1)?"0#{new_date.month}":new_date.month
          day = (new_date.day.to_s.length==1)?"0#{new_date.day}":new_date.day
          now = "#{month}/#{day}/#{new_date.year}"
          now
        else
          expect("Illegal number of arguments for TestHelper.date_from_today").to eql ""
      end
    end

    def random_name
      "#{random_string} #{random_string}".split.map(&:capitalize).join(' ')
    end

    def random_company_name
      "#{random_string}#{random_string}".split.map(&:capitalize).join(' ')
    end

    def random_alpha_numeric(*args)
      case args.length
        when 0
          length = 10
        when 1
          length = args[0]
        else
          expect("Illegal number of arguments for random_alpha_numeric").to eql ""
      end
      rand(36 ** length - 1).to_s(36).rjust(length, "0")
    end

    def random_string(*args)
      case args.length
        when 0
          (0...rand(2..5)).map { (65 + rand(26)).chr }.join
        when 2
          (0...rand(args[0].to_i..args[1].to_i)).map { (65 + rand(26)).chr }.join
        else
          # do nothing
      end
    end

    def rand_username
      user_name = "#{ENV['URL']}#{('a'..'z').to_a.sample}#{Array.new(rand(6..11)){[*'0'..'9', *'a'..'z'].sample}.join}"
      #user_name = "#{('a'..'z').to_a.sample}#{Array.new(rand(6..14)){[*'0'..'9', *'a'..'z'].sample}.join}"
      if user_name.length > 14
        user_name[0..13]
      else
        user_name
      end
    end

    def random_phone
      "#{Random.rand(100..999)}#{Random.rand(100..999)}#{Random.rand(1000..9999)}"
    end

    def random_phone_extension
      "#{Random.rand(10..999)}"
    end

    def random_email
      "#{random_string}@#{random_string}.com".downcase
    end

    def rand_zone_1
      rand_zone_processing data_for(:zone_1_through_4, {})['zone1'].values
    end

    def rand_zone_2
      rand_zone_processing data_for(:zone_1_through_4, {})['zone2'].values
    end

    def rand_zone_3
      rand_zone_processing data_for(:zone_1_through_4, {})['zone3'].values
    end

    def rand_zone_4
      rand_zone_processing data_for(:zone_1_through_4, {})['zone4'].values
    end

    def rand_zone_5
      rand_zone_processing data_for(:zone_5_through_8, {})['zone5'].values
    end

    def rand_zone_6
      rand_zone_processing data_for(:zone_5_through_8, {})['zone6'].values
    end

    def rand_zone_7
      rand_zone_processing data_for(:zone_5_through_8, {})['zone7'].values
    end

    def rand_zone_8
      rand_zone_processing data_for(:zone_5_through_8, {})['zone8'].values
    end

    def rand_zone_9
      rand_zone_processing data_for(:non_domestic, {})['zone9'].values
    end

    def rand_zone_processing address
      shipping =  address[rand(address.size)]
      shipping['name'] = helper.random_name
      shipping['company'] = helper.random_company_name
      #shipping['phone'] = helper.random_phone
      #shipping['email'] = helper.random_email
      shipping
    end

    def rand_zone_1_4
      shipping = data_rand_zone_1_4
      shipping['name'] = helper.random_name
      shipping['company'] = helper.random_company_name
      #shipping['phone'] = helper.random_phone
      #shipping['email'] = helper.random_email
      shipping
    end

    def rand_zone_5_8
      shipping = data_rand_zone_5_8
      shipping['name'] = helper.random_name
      shipping['company'] = helper.random_company_name
      #shipping['phone'] = helper.random_phone
      #shipping['email'] = helper.random_email
      shipping
    end

    def random_suite
      "Suite #{Random.rand(1..999)}"
    end

    def rand_ship_from_zone_1_4
      us_states = data_for(:us_states, {}) if us_states.nil?
      shipping = data_rand_zone_1_4
      shipping["ship_from_zip"] = shipping["zip"]
      shipping['name'] = random_name
      shipping['company'] = random_company_name
      #shipping['phone'] = random_phone
      #shipping['email'] = random_email
      shipping["state_abbrev"] = shipping["state"]
      shipping["state"] = us_states[shipping["state_abbrev"]]
      shipping["street_address2"] = random_suite
      shipping
    end

    def rand_ship_from_zone_5_8
      us_states = data_for(:us_states, {}) if us_states.nil?
      shipping = data_rand_zone_5_8
      shipping["ship_from_zip"] = shipping["zip"]
      shipping['name'] = random_name
      shipping['company'] = random_company_name
      #shipping['phone'] = random_phone
      #shipping['email'] = random_email
      shipping["state_abbrev"] = shipping["state"]
      shipping["state"] = us_states[shipping["state_abbrev"]]
      shipping["street_address2"] = random_suite
      shipping
    end

    def data_rand_zone_1_4
      shipping_addresses_zones = data_for(:zone_1_through_4, {})
      zones = shipping_addresses_zones.values
      zone_addresses = zones[rand(zones.size)]
      zone_addresses_values = zone_addresses.values
      zone_addresses_values[rand(zone_addresses_values.size)]
    end

    def data_rand_zone_5_8
      shipping_addresses_zones = data_for(:zone_5_through_8, {})
      zones = shipping_addresses_zones.values
      zone_addresses = zones[rand(zones.size)]
      zone_addresses_values = zone_addresses.values
      zone_addresses_values[rand(zone_addresses_values.size)]
    end

    def format_weight str
      #"1 lbs. 4 oz." -> "20"
      weight_array = str.split(" ")
      ((weight_array[0].to_i * 16) + weight_array[2].to_i).to_s
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

    def strip * args
      case args.length
        when 2
          string = args[0]
          chars = args[1]
          chars = Regexp.escape(chars)
          string.gsub(/\A[#{chars}]+|[#{chars}]+\z/, "")
        when 3
          str = args[0]
          char_to_remove = args[1]
          substitute_char = args[2]
          str.gsub(char_to_remove, substitute_char)
        else
          rasie "Illegal number of arguments for strip method."
      end
    end

    def to_bool(str)
      str.downcase == 'true'
    end
  end

  class BrowserType
    attr_reader :browser_sym
    
    def initialize(browser_sym)
      expect("ff|firefox|mozilla|chrome|gc|google|ie|explorer|internet explorer|apple|osx|safari|mac|edge").to include(browser_sym), 
                                                                                                               "Invalid browser selection: #{browser_sym}. Valid values for browser are ff|firefox|mozilla|chrome|gc|google|ie|explorer|internet explorer|apple|osx|safari|mac|edge"
      @browser_sym = :firefox if "ff|firefox|mozilla".include? browser_sym.downcase
      @browser_sym = :chrome if "chrome|gc|google".include? browser_sym.downcase
      @browser_sym = :ie if "ie|explorer|internet explorer".include? browser_sym.downcase
      @browser_sym = :safari if "apple|osx|safari|mac".include? browser_sym.downcase
      @browser_sym = :edge if "edge".include? browser_sym.downcase      
    end
  end

  class StampsTestConfig
    attr_accessor :scenario_name, :browser_name
    attr_reader :browser, :logger, :browser_sym, :firefox_profile, :windows_user

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
          when :firefox
            begin
              stdout, stdeerr, status = Open3.capture3("taskkill /im firefox.exe /f")
              logger.message status
              #logger.info stdeerr
              logger.message stdout
            rescue
              #ignore
            end

            # Launch Firefox
            if firefox_profile.nil? || firefox_profile.downcase == 'selenium'
              driver = Watir::Browser.new(:firefox, :profile => 'selenium')
            elsif firefox_profile.downcase == 'new'
              driver = Watir::Browser.new :firefox
            else
              driver = Watir::Browser.new :firefox, profile: firefox_profile
            end
            @browser_name = 'Mozilla Firefox'
          when :chrome
            begin
              stdout, stdeerr, status = Open3.capture3("taskkill /im chrome.exe /f")
              logger.message status
              #logger.info stdeerr
              logger.message stdout
            rescue
              #ignore
            end
            temp_data_dir1 = File.join("C:", "Users", windows_user, "AppData", "Local", "Google", "Chrome", "User Data", "Default")
            temp_data_dir2 = File.join("C:", "Users", "#{windows_user}.CORP", "AppData", "Local", "Google", "Chrome", "User Data", "Default")

            chrome_data_dir = (File.exist? temp_data_dir1)?temp_data_dir1:temp_data_dir2
            chrome_driver_path = File.join("C:", "watir-webdriver", "drivers", "chromedriver.exe")

            logger.info "chrome_driver path:  #{chrome_driver_path} - #{(File.exist? chrome_driver_path)?'Exist':'DOES NOT EXIST IN THIS MACHINE!'} "
            logger.info "chrome_data_dir path:  #{chrome_data_dir}  #{(File.exist? chrome_data_dir)?'Exist':'DOES NOT EXIST IN THIS MACHINE!'}"

            Selenium::WebDriver::Chrome.path = chrome_driver_path
            driver = Selenium::WebDriver.for :chrome
            browser = Watir::Browser.new (driver)
          when :ie
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
          when :safari
            driver = Watir::Browser.new :safari
            @browser_name = 'Mac OS X - Safari'
          else
            # do nothing.
        end

        #driver.window.move_to 0, 0
        #driver.window.resize_to 1000, 800
        #driver.window.maximize if (ENV['MAX_WINDOW'].nil? || helper.to_bool(ENV['MAX_WINDOW']))
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

    def url_prefix(*args)
      @url_hash = data_for(:url_prefix, {})
      case args.length
        when 1
          return @url_hash[args[0]]
        else
          return @url_hash[ENV['URL']]
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
