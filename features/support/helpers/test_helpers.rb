module Stamps
  module TestHelper
    class << self
      def user_credentials
        @user_credentials ||= SdcMySqlCrentials.new
        @user_credentials.test_scenario = SdcTest.test_scenario
        @user_credentials
      end


      def rand_alpha_str(min = 2, max = 10)
        Array.new(rand(min..max)) { [*'a'..'z'].sample }.join
      end

      def rand_full_name(*args)
        "#{rand_alpha_str(*args).capitalize} #{rand_alpha_str(*args).capitalize}"
      end

      def rand_comp_name(*args)
        rand_alpha_numeric(*args).to_s.split.map(&:capitalize).join(' ')
      end

      def rand_usr(env)
        down = ('a'..'z').to_a
        up = ('A'..'Z').to_a
        digits = ('0'..'9').to_a
        special = %w(- _ .)
        (env.nil? ? 'xx' : env.to_s) + (digits + down + up + special).shuffle[1..1].join +
            [rand_samp_str(down), rand_samp_str(up), rand_samp_str(
                digits)].concat((down + up + digits).sample(Random.rand(0..5))).shuffle.join
      end

      def rand_email(env)
        "#{rand_usr(env.to_s)}@mailinator.com".downcase
      end

      def rand_alpha_numeric(min = 2, max = 10)
        [rand_samp_str(('a'..'z').to_a), rand_samp_str(('A'..'Z').to_a),
         rand_samp_str(('0'..'9').to_a)].concat((('a'..'z').to_a +
            ('A'..'Z').to_a + ('0'..'9').to_a).sample(Random.rand(min..max))).shuffle.join
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
          ship_date += 1 if ship_date.wday.zero? # add 1 if today is Sunday
        end
        ship_date.strftime('%m/%d/%Y')
      end

      def is_whole_number?(number)
        number % 1.zero?
      end

      def is_numeric?(str)
        begin
          return !!Float(str.to_f)
        rescue
          # ignore
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
            else #(param_hash['full_name'].downcase.include? 'random') ? TestHelper.random_name : param_hash['full_name']
              formatted_address = formatted_address + ((field.to_s.strip.downcase.include? 'random') ? rand_full_name : field.to_s.strip) + "\n"
            end
          end
        end
        formatted_address
      end

      def address_helper_zone(zone, env)
        case zone.downcase
          when /zone 1 (?:through|and) 4/
            rand_zone_1_4(env)
          when /zone 5 (?:through|and) 8/
            rand_zone_5_8(env)
          when /zone 1/
            rand_zone_1(env)
          when /zone 2/
            rand_zone_2(env)
          when /zone 3/
            rand_zone_3(env)
          when /zone 4/
            rand_zone_4(env)
          when /zone 5/
            rand_zone_5(env)
          when /zone 6/
            rand_zone_6(env)
          when /zone 7/
            rand_zone_7(env)
          when /zone 8/
            rand_zone_8(env)
          when /zone 9/
            rand_zone_9(env)
          else
            return zone
        end
      end

      def rand_zone_1(env)
        rand_zone_processing(data_for(:zone_1_through_4, {})['zone1'].values, env)
      end

      def rand_zone_2(env)
        rand_zone_processing(data_for(:zone_1_through_4, {})['zone2'].values, env)
      end

      def rand_zone_3(env)
        rand_zone_processing(data_for(:zone_1_through_4, {})['zone3'].values, env)
      end

      def rand_zone_4(env)
        rand_zone_processing(data_for(:zone_1_through_4, {})['zone4'].values, env)
      end

      def rand_zone_5(env)
        rand_zone_processing(data_for(:zone_5_through_8, {})['zone5'].values, env)
      end

      def rand_zone_6(env)
        rand_zone_processing(data_for(:zone_5_through_8, {})['zone6'].values, env)
      end

      def rand_zone_7(env)
        rand_zone_processing(data_for(:zone_5_through_8, {})['zone7'].values, env)
      end

      def rand_zone_8(env)
        rand_zone_processing(data_for(:zone_5_through_8, {})['zone8'].values, env)
      end

      def rand_zone_9(env)
        rand_zone_processing(data_for(:non_domestic, {})['zone9'].values, env)
      end

      def rand_zone_processing(address, env)
        rand_shipping_data(address[rand(address.size)], env)
      end

      def rand_zone_1_4(env)
        rand_shipping_data(data_rand_zone_1_4, env)
      end

      def rand_zone_5_8(env)
        rand_shipping_data(data_rand_zone_5_8, env)
      end

      def rand_ship_from_zone_1_4(env)
        us_states = data_for(:us_states, {}) if us_states.nil?
        shipping = rand_shipping_data(data_rand_zone_1_4, env)
        shipping['ship_from_zip'] = shipping['zip']
        shipping['state_abbrev'] = shipping['state']
        shipping['state'] = us_states[shipping['state_abbrev']]
        shipping['street_address2'] = rand_suite
        shipping
      end

      def rand_ship_from_zone_5_8(env)
        us_states = data_for(:us_states, {}) if us_states.nil?
        shipping = rand_shipping_data(data_rand_zone_5_8, env)
        shipping['ship_from_zip'] = shipping['zip']
        shipping['state_abbrev'] = shipping['state']
        shipping['state'] = us_states[shipping['state_abbrev']]
        shipping['street_address2'] = rand_suite
        shipping
      end

      def rand_shipping_data(hash_data, env)
        hash_data['first_name'] = rand_alpha_str.capitalize
        hash_data['last_name'] = rand_alpha_str.capitalize
        hash_data['full_name'] = "#{hash_data['first_name']} #{hash_data['last_name']}"
        hash_data['company'] = rand_comp_name
        hash_data['phone'] = rand_phone
        hash_data['phone_number_format'] = rand_phone_format
        hash_data['email'] = rand_email(env)
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

      def address_helper(zone, env)
        return format_address(address_helper_zone(zone, env)) if zone.downcase.include?('zone')
        format_address(zone, env)
      end

      def address_hash_to_str(hash)
        "#{hash['full_name'].downcase.include?('random') ? rand_full_name : hash['full_name']}
        #{hash['company'].downcase.include?('random') ? rand_comp_name : hash['company']}
        #{hash['street_address']} #{hash['street_address_2'].nil? ? '' : hash['street_address_2']}
        #{hash['city']} #{hash['state']} #{hash['zip']}"
      end

      # Convert date string from format 12/3/2015 to Dec 3
      def mmddyy_to_mondd(date_str)
        collection = date_str.split '/'
        date = Date.new collection[2].to_i, collection[0].to_i, collection[1].to_i
        date.strftime '%b %-d'
      end

      def parse_date(str)
        if str.match(/\d{2}\/\d{2}\/\d{4}/)   # 04/28/2018
          collection = str.split '/'
          collection[0] = Date::MONTHNAMES[collection[0].to_i]
        else                                  # April 28, 2018
          collection = str.split(/[\s\/,]/).delete_if{|s| s.empty?}
        end
        {day: collection[1].sub(/^0/, ''), year: collection[2], month: collection[0]}
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

      # return "hh:mm a.m." format for settings drop_down
      def now_plus_hh(hours)
        hours = Time.now.hour + hours
        return "12:00 a.m." if hours.zero?
        return "12:00 p.m." if hours == 12
        return "#{hours-12}:00 p.m." if hours > 12
        "#{hours}:00 a.m."
      end

      # add +1 to day if day is a Sunday. We don't ship on Sundays.
      def shipdate_today_plus(day)
        ((Date.today + day.to_i).wday.zero?) ? (Date.today + day.to_i + 1).strftime('%b %-d') : (Date.today + day.to_i).strftime('%b %-d')
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
            raise ArgumentError, 'Illegal number of arguments for date_from_today'
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
            raise 'Illegal number of arguments for strip method.'
        end
      end

      def to_bool(str)
        str.nil? ? false : str.downcase == 'true'
      end

    end
  end
end

