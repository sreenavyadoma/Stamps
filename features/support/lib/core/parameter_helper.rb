module Stamps
  class ParameterHelper
    include DataMagic
    class << self

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
          address_array.each_with_index { |element, index|
            if index==address_array.size-1 #if this is the last item in the string, don't append a new line
              formatted_address = formatted_address + element.to_s.strip
            else #(param_hash['name'].downcase.include? "random") ? ParameterHelper.random_name : param_hash['name']
              formatted_address = formatted_address + ((element.to_s.strip.downcase.include? "random") ? ParameterHelper.random_name : element.to_s.strip) + "\n"
            end
          }
        else
          logger.info "Teardown: Begin tearing down test"
          TestHelper.teardown
          logger.info "Teardown: Done!"
          "Unsupported address format.".should eql ""
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
          logger.info "Teardown: Begin tearing down test"
          TestHelper.teardown
          logger.info "Teardown: Done!"
          "Unsupported address format.".should eql ""
        end
      end

      def address_hash_to_str address
        name = (address['name'].downcase.include? "random") ? ParameterHelper.random_name : address['name']
        company_name = (address['company'].downcase.include? "random") ? ParameterHelper.random_company_name : address['company']
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
          phone = (phone_num.downcase.include? "random") ? ParameterHelper.random_phone : address['phone']
        end unless address['phone'].nil?
        begin
          email_addy = address['email']
          email = (email_addy.downcase.include? "random") ? ParameterHelper.random_email : address['email']
        end unless address['email'].nil?

        logger.info "Ship-To Name: #{name}"
        logger.info "Ship-To Company: #{company_name}"
        logger.info "Ship-To Address: #{street_address}"
        logger.info "Ship-To Address 2: #{street_address_2}"
        logger.info "Ship-To City: #{city}"
        logger.info "Ship-To State: #{state}"
        logger.info "Ship-To Zip: #{zip}"
        logger.info "Ship-To Phone: #{phone}" unless address['phone'].nil?
        logger.info "Ship-To Email: #{email}" unless address['email'].nil?

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

      def now_plus_mm_dd_yy day
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

      def date_printed *args
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
            "Illegal number of arguments for TestHelper.date_from_today".should eql ""
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
            "Illegal number of arguments for random_alpha_numeric".should eql ""
        end
        rand(36 ** @length - 1).to_s(36).rjust(@length, "0")
      end

      def random_string *args
        case args.length
          when 0
            (0...rand(2..5)).map { (65 + rand(26)).chr }.join
          when 2
            (0...rand(args[0].to_i..args[1].to_i)).map { (65 + rand(26)).chr }.join
          else

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

      def rand_zone_processing address
        shipping =  address[rand(address.size)]
        shipping['name'] = ParameterHelper.random_name
        shipping['company'] = ParameterHelper.random_company_name
        #shipping['phone'] = ParameterHelper.random_phone
        #shipping['email'] = ParameterHelper.random_email
        shipping
      end

      def rand_zone_1_4
        shipping = data_rand_zone_1_4
        shipping['name'] = ParameterHelper.random_name
        shipping['company'] = ParameterHelper.random_company_name
        #shipping['phone'] = ParameterHelper.random_phone
        #shipping['email'] = ParameterHelper.random_email
        shipping
      end

      def rand_zone_5_8
        shipping = data_rand_zone_5_8
        shipping['name'] = ParameterHelper.random_name
        shipping['company'] = ParameterHelper.random_company_name
        #shipping['phone'] = ParameterHelper.random_phone
        #shipping['email'] = ParameterHelper.random_email
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
  end
end