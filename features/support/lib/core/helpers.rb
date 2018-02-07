module Stamps
  class StampsTest
    class << self
      attr_accessor :test_env
      def rand_alpha_str(min = 2, max = 10)
        Array.new(rand(min..max)) { [*'a'..'z'].sample }.join
      end

      def rand_full_name(*args)
        "#{rand_alpha_str(*args).capitalize} #{rand_alpha_str(*args).capitalize}"
      end

      def rand_comp_name(*args)
        rand_alpha_numeric(*args).to_s.split.map(&:capitalize).join(' ')
      end

      def rand_usr
        down = ('a'..'z').to_a
        up = ('A'..'Z').to_a
        digits = ('0'..'9').to_a
        special = ['-', '_', '.', '-', '_', '.', '-', '_', '.']
        (test_env.nil? ? 'xx' : test_env) + (digits + down + up + special).shuffle[1..1].join + [rand_samp_str(down), rand_samp_str(up), rand_samp_str(digits)].concat((down + up + digits).sample(Random.rand(0..5))).shuffle.join
      end

      def rand_email
        "#{rand_usr}@mailinator.com".downcase
      end

      def rand_alpha_numeric(min = 2, max = 10)
        [rand_samp_str(('a'..'z').to_a), rand_samp_str(('A'..'Z').to_a), rand_samp_str(('0'..'9').to_a)].concat((('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a).sample(Random.rand(min..max))).shuffle.join
      end

      def rand_samp_str(arr)
        arr.delete_at(arr.size.times.to_a.sample)
      end

      def rand_phone
        "#{Random.rand(100..999)}#{Random.rand(100..999)}#{Random.rand(1000..9999)}"
      end

      def rand_phone_format
        "(#{Random.rand(100..999)}) #{Random.rand(100..999)}-#{Random.rand(1000..9999)}"
      end

      def rand_suite
        "Suite #{Random.rand(1..999)}"
      end
    end
  end
  module RandomGenerators
  end

  module ParameterHelper #todo-Rob move ParameterHelper to String open class
    def state_fullname(state) #todo-Rob. This is wrong, fix it.
      if @states.nil?
        @states = {}
        @states['CA'] = 'California'
      end
      @states
    end

    def first_half(str)
      index = (str.size.to_f / 2).ceil
      str[0, index]
    end

    def valid_ship_date(day)
      ship_date = Date.today
      day.to_i.times do
        ship_date += 1
        date = Date.civil(ship_date.year,ship_date.month,ship_date.day)
        #break if Holidays.on(date, :us).size==0 && ship_date.wday!=0 # break if today is not a holiday and not a Sunday.
        ship_date += 1 if Holidays.on(date, :us).size > 0 # add 1 if today is a holiday
        ship_date += 1 if ship_date.wday == 0 # add 1 if today is Sunday
      end
      ship_date.strftime('%m/%d/%Y')
    end

    def is_whole_number?(number)
      number % 1 == 0
    end

    def is_numeric?(str)
      begin
        return !!Float(str.to_f)
      rescue
        #ignore
      end
      false
    end

    def dollar_amount_f(str)
      /[^$]+/.match(str).to_f
    end

    # str=$34.68 returns 34
    def dollars(str)
      dolars_and_cents(str)[:dollars]
    end

    # str=$34.68 returns 68
    def cents(str)
      dolars_and_cents(str)[:cents]
    end

    def dolars_and_cents(str)
      /\$(?<dollars>\d*).(?<cents>.*)/.match(str.gsub(',', ''))
    end

    def format_address_arr(address_array)
      formatted_address = ''
      if address_array.is_a?(Array)
        address_array.each_with_index do |field, index|
          if index == address_array.size - 1 #if this is the last item in the string, don't append a new line
            formatted_address = formatted_address + field.to_s.strip
          else #(param_hash['full_name'].downcase.include? 'random') ? test_helper.random_name : param_hash['full_name']
            formatted_address = formatted_address + ((field.to_s.strip.downcase.include? 'random') ? StampsTest.rand_full_name : field.to_s.strip) + "\n"
          end
        end
      end
      logger.info "Formatted Shipping Address:  \n#{formatted_address}"
      formatted_address
    end

    def format_address(address)
      if address.is_a?(Hash)
        format_address_arr(address_hash_to_str(address).split(/,/))
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

    def address_hash_to_str(hash)
      "#{hash['full_name'].downcase.include?('random') ? StampsTest.rand_full_name : hash['full_name']}
#{hash['company'].downcase.include?('random') ? StampsTest.rand_comp_name : hash['company']}
#{hash['street_address']} #{hash['street_address_2'].nil? ? '' : hash['street_address_2']}
#{hash['city']} #{hash['state']} #{hash['zip']}"
    end

    # Convert date string from format 12/3/2015 to Dec 3
    def mmddyy_to_mondd(date_str)
      collection = date_str.split '/'
      date = Date.new collection[2].to_i, collection[0].to_i, collection[1].to_i
      date.strftime '%b %-d'
    end

    # returns mm/dd/yyyy "10/26/2017"
    def today_plus(day)
      (Date.today + day.to_i).strftime '%m/%d/%Y'
    end

    def now_month_dd
      this_month_plus(0)
    end

    def this_month_plus(day)
      (Date.today + day.to_i).strftime '%B %d'
    end

    def now_plus_mon_dd(day)
      (Date.today + day.to_i).strftime '%b %-d'
    end

    # add +1 to day if day is a Sunday. We don't ship on Sundays.
    def shipdate_today_plus(day)
      ((Date.today + day.to_i).wday == 0) ? (Date.today + day.to_i + 1).strftime('%b %-d') : (Date.today + day.to_i).strftime('%b %-d')
    end

    # takes a date string format "11/21/2017" and converts it to "Nov 21"
    def grid_date_format(str)
      return Date::strptime(str, '%m/%d/%Y').strftime('%b %-d') unless str.match(/\d{,2}\/\d{,2}\/\d{4}/).nil?
      str
    end

    def date_printed(*args) #todo-Rob rework
      case args.length
        when 0
          month = (Date.today.month.to_s.length == 1) ? "0#{Date.today.month}" : Date.today.month
          day = (Date.today.day.length == 1) ? "0#{Date.today.day}" : Date.today.day
          "#{month}/#{day}/#{Date.today.year}"
        when 1
          days_to_add = args[0].to_i
          new_date = Date.today + days_to_add
          month = (new_date.month.to_s.length == 1) ? "0#{new_date.month}" : new_date.month
          day = (new_date.day.to_s.length == 1) ? "0#{new_date.day}" : new_date.day
          "#{month}/#{day}/#{new_date.year}"
        else
          raise 'Illegal number of arguments for TestHelper.date_from_today'
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
      weight_array = str.split(' ')
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
          string.gsub(/\A[#{chars}]+|[#{chars}]+\z/, '')
        when 3
          str = args[0]
          char_to_remove = args[1]
          substitute_char = args[2]
          str.gsub(char_to_remove, substitute_char)
        else
          rasie 'Illegal number of arguments for strip method.'
      end
    end

    def to_bool(str)
      str.nil? ? false : str.downcase == 'true'
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
          rand_zone_3
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
      shipping['ship_from_zip'] = shipping['zip']
      shipping['state_abbrev'] = shipping['state']
      shipping['state'] = us_states[shipping['state_abbrev']]
      shipping['street_address2'] = StampsTest.rand_suite
      shipping
    end

    def rand_ship_from_zone_5_8
      us_states = data_for(:us_states, {}) if us_states.nil?
      shipping = rand_shipping_data(data_rand_zone_5_8)
      shipping['ship_from_zip'] = shipping['zip']
      shipping['state_abbrev'] = shipping['state']
      shipping['state'] = us_states[shipping['state_abbrev']]
      shipping['street_address2'] = StampsTest.rand_suite
      shipping
    end

    def rand_shipping_data(hash_data)
      hash_data['first_name'] = StampsTest.rand_alpha_str.capitalize
      hash_data['last_name'] = StampsTest.rand_alpha_str.capitalize
      hash_data['full_name'] = "#{hash_data['first_name']} #{hash_data['last_name']}"
      hash_data['company'] = StampsTest.rand_comp_name
      hash_data['phone'] = StampsTest.rand_phone
      hash_data['phone_number_format'] = StampsTest.rand_phone_format
      hash_data['email'] = StampsTest.rand_email
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

  module BrowserType
    def browser_type(browser)
      case browser.downcase
        when /ff|firefox|mozilla/
          return :firefox
        when /chrome|gc|google/
          return :chrome
        when /ms|me|microsoft|edge/
          return :edge
        # when /ie|explorer|internet explorer/
        #   return :ie
        when /apple|osx|safari|mac/
            return :safari
        else
          # do nothing
      end

      raise ArgumentError, "#{browser} is not a valid selection. Valid browsers are ff|firefox|mozilla|chrome|gc|google|ms|me|microsoft|edge"
    end
  end

  class StampsTestHelper #todo-Rob OpenClass
    include ParameterHelper
    include DefaultYmlData
    attr_reader :logger
    def initialize(logger)
      @logger = logger
    end
  end
end
