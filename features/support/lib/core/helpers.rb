module Stamps
  module RandomGenerators
    def random_full_name(*args)
      "#{random_alpha_capitalize(*args)} #{random_alpha_capitalize(*args)}"
    end

    def random_company_name(*args)
      "#{random_alpha_numeric(*args)}".split.map(&:capitalize).join(' ')
    end

    def random_alpha_capitalize(*args)
      random_alpha(*args).capitalize
    end

    def random_alpha(*args)
      case args.length
        when 1
          min = 2
          max = args[0]
        when 2
          min = args[0]
          max = args[1]
        else
          min = 2
          max = 10
      end
      Array.new(rand(min..max)){[*"a".."z"].sample}.join
    end

    def random_password
      rand_alpha_num_special(5, 10)
    end

    def random_username
      down = ('a'..'z').to_a
      up = ('A'..'Z').to_a
      digits = ('0'..'9').to_a
      special = ['-', '_', '.', '-', '_', '.', '-', '_', '.']
      modal_param.test_env+(digits + down + up).shuffle[1..1].join + [rand_samp_str(down), rand_samp_str(up), rand_samp_str(digits), rand_samp_str(special)].concat(((down+up+digits+special).sample(Random.rand(0..5)))).shuffle.join + (digits + down + up).shuffle[1..1].join
    end

    def random_email
      "#{random_username}@mailinator.com".downcase
    end

    def rand_alpha_num_special(*args)
      case args.length
        when 1
          min = (args[0].to_i>2)?2:args[0]
          max = args[0]
        when 2
          min = args[0]
          max = args[1]
        else
          min = 2
          max = 10
      end
      down = ('a'..'z').to_a
      up = ('A'..'Z').to_a
      digits = ('0'..'9').to_a
      special = ('!'..'?').to_a
      [rand_samp_str(down), rand_samp_str(up), rand_samp_str(digits), rand_samp_str(special)].concat(((down+up+digits+special).sample(Random.rand(min..max)))).shuffle.join
    end

    def rand_samp_str(arr)
      i = arr.size.times.to_a.sample
      c = arr[i]
      arr.delete_at(i)
      c
    end

    def random_alpha_numeric(*args)
      case args.length
        when 1
          min = 2
          max = args[0]
        when 2
          min = args[0]
          max = args[1]
        else
          min = 2
          max = 10
      end
      down = ('a'..'z').to_a
      up = ('A'..'Z').to_a
      digits = ('0'..'9').to_a
      [rand_samp_str(down), rand_samp_str(up), rand_samp_str(digits)].concat(((down+up+digits).sample(Random.rand(min..max)))).shuffle.join
    end

    def random_phone_number
      "#{Random.rand(100..999)}#{Random.rand(100..999)}#{Random.rand(1000..9999)}"
    end

    def random_phone_number_format
      "(#{Random.rand(100..999)}) #{Random.rand(100..999)}-#{Random.rand(1000..9999)}"
    end

    def random_phone_extension
      "#{Random.rand(10..999)}"
    end

    def random_suite
      "Suite #{Random.rand(1..999)}"
    end
  end

  module ParameterHelper

    def state_fullname(state)
      if @states.nil?
        @states = Hash.new
        @states["CA"] = "California"
      end
      @states
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

    def format_address_arr(address_array)
      formatted_address = ""
      if address_array.is_a?(Array)
        address_array.each_with_index do |element, index|
          if index==address_array.size-1 #if this is the last item in the string, don't append a new line
            formatted_address = formatted_address + element.to_s.strip
          else #(param_hash['full_name'].downcase.include? 'random') ? test_helper.random_name : param_hash['full_name']
            formatted_address = formatted_address + ((element.to_s.strip.downcase.include? 'random') ? test_helper.random_full_name : element.to_s.strip) + "\n"
          end
        end
      end
      logger.info "Formatted Shipping Address:  \n#{formatted_address}"
      formatted_address
    end

    def format_address(address)
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

    def address_helper(zone)
      return format_address(address_helper_zone(zone)) if zone.downcase.include?('zone')
      format_address(zone)
    end

    def address_hash_to_str(address)
      name = (address['full_name'].downcase.include? 'random') ? test_helper.random_full_name : address['full_name']
      company_name = (address['company'].downcase.include? 'random') ? test_helper.random_company_name : address['company']
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
        phone = (phone_num.downcase.include? 'random') ? test_helper.random_phone_number : address['phone']
      end unless address['phone'].nil?
      begin
        email_addy = address['email']
        email = (email_addy.downcase.include? 'random') ? test_helper.random_email : address['email']
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
    def mmddyy_to_mondd(date_str)
      collection = date_str.split "/"
      date = Date.new collection[2].to_i, collection[0].to_i, collection[1].to_i
      date.strftime "%b %-d"
    end

    def now_plus_mm_dd
      now_plus_mm_dd_yy(0)
    end

    def now_plus_mm_dd_yy(day)
      (Date.today + day.to_i).strftime "%m/%d/%Y"
    end

    def now_month_dd
      now_plus_month_dd(0)
    end

    def now_plus_month_dd(day)
      (Date.today + day.to_i).strftime "%B %d"
    end

    def now_plus_mon_dd(day)
      (Date.today + day.to_i).strftime "%b %-d"
    end

    def now_plus_mon_dd_excl_sunday(day)
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

    def data_rand_zone_1_4
      data = data_for(:zone_1_through_4, {}).values
      zones = data[rand(data.size)]
      addresses = zones.values
      addresses[rand(addresses.size)]
    end

    def data_rand_zone_5_8
      data = data_for(:zone_5_through_8, {}).values
      zones = data[rand(data.size)]
      addresses = zones.values
      addresses[rand(addresses.size)]
    end

    def format_weight(str)
      #"1 lbs. 4 oz." -> "20"
      weight_array = str.split(" ")
      ((weight_array[0].to_i * 16) + weight_array[2].to_i).to_s
    end

    def str_to_sym(str)
      str.downcase.tr('()', '').tr('/-', '_').strip.tr(' ', '_').to_sym
    end

    def service_to_words(str)
      str.tr('()', '').tr(' /-', ' ')
    end

    def to_sym(str, delim)
      #str.gsub(/[^0-9A-Za-z -]/, '').gsub(/\s+/,'_').gsub(/-+/, '_').downcase.to_sym
      (strip str.gsub(/\W/, delim), delim).downcase.to_sym
    end

    def strip(* args)
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
      (str.nil?)?false:str.downcase=='true'
    end
  end

  module DefaultYmlData
    def address_helper_zone(zone)
      case zone.downcase
        when /zone 1 (?:through|and) 4/
          rand_zone_1_4
        when /zone 5 (?:through|and) 8/
          rand_zone_5_8
        when /zone 1/
          rand_zone_1
        when /zone 2/
          rand_zone_2
        when /zone 3/
          test_helper.rand_zone_3
        when /zone 4/
          rand_zone_4
        when /zone 5/
          rand_zone_5
        when /zone 6/
          rand_zone_6
        when /zone 7/
          rand_zone_7
        when /zone 8/
          rand_zone_8
        when /zone 9/
          rand_zone_9
        else
          return zone
      end
    end

    def rand_zone_1
      rand_zone_processing(data_for(:zone_1_through_4, {})['zone1'].values)
    end

    def rand_zone_2
      rand_zone_processing(data_for(:zone_1_through_4, {})['zone2'].values)
    end

    def rand_zone_3
      rand_zone_processing(data_for(:zone_1_through_4, {})['zone3'].values)
    end

    def rand_zone_4
      rand_zone_processing(data_for(:zone_1_through_4, {})['zone4'].values)
    end

    def rand_zone_5
      rand_zone_processing(data_for(:zone_5_through_8, {})['zone5'].values)
    end

    def rand_zone_6
      rand_zone_processing(data_for(:zone_5_through_8, {})['zone6'].values)
    end

    def rand_zone_7
      rand_zone_processing(data_for(:zone_5_through_8, {})['zone7'].values)
    end

    def rand_zone_8
      rand_zone_processing(data_for(:zone_5_through_8, {})['zone8'].values)
    end

    def rand_zone_9
      rand_zone_processing(data_for(:non_domestic, {})['zone9'].values)
    end

    def rand_zone_processing address
      rand_shipping_data(address[rand(address.size)])
    end

    def rand_zone_1_4
      rand_shipping_data(data_rand_zone_1_4)
    end

    def rand_zone_5_8
      rand_shipping_data(data_rand_zone_5_8)
    end

    def rand_ship_from_zone_1_4
      us_states = data_for(:us_states, {}) if us_states.nil?
      shipping = rand_shipping_data(data_rand_zone_1_4)
      shipping["ship_from_zip"] = shipping["zip"]
      shipping["state_abbrev"] = shipping["state"]
      shipping["state"] = us_states[shipping["state_abbrev"]]
      shipping["street_address2"] = random_suite
      shipping
    end

    def rand_ship_from_zone_5_8
      us_states = data_for(:us_states, {}) if us_states.nil?
      shipping = rand_shipping_data(data_rand_zone_5_8)
      shipping["ship_from_zip"] = shipping["zip"]
      shipping["state_abbrev"] = shipping["state"]
      shipping["state"] = us_states[shipping["state_abbrev"]]
      shipping["street_address2"] = random_suite
      shipping
    end

    def rand_shipping_data(hash_data)
      hash_data['first_name'] = random_alpha
      hash_data['last_name'] = random_alpha
      hash_data['full_name'] = "#{hash_data['first_name']} #{hash_data['last_name']}"
      hash_data['company'] = random_company_name
      hash_data['phone'] = random_phone_number
      hash_data['phone_number_format'] = random_phone_number_format
      hash_data['email'] = random_email
      hash_data
    end

    def rand_login_credentials
      login_credentials = data_for(:login_credentials, {})[ENV['URL']]
      credentials = login_credentials.values
      credentials[rand(credentials.size)]
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
  end

  class StampsTestHelper
    include RandomGenerators
    include ParameterHelper
    include DefaultYmlData
    attr_reader :logger
    def initialize(logger)
      @logger = logger
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
end
