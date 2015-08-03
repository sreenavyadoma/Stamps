module Stamps
  class TestHelper
    include Singleton
    include DataMagic

    def remove_dollar_sign str
      strip str, '$', ''
    end

    def strip str, char_to_remove, substitute_char
      str.gsub(char_to_remove, substitute_char)
    end

    def date_from_today *args
      today = Date.today
      log "Today:  #{today}"
      case args.length
        when 0
          month = (today.month.length==1)?"0#{today.month}":today.month
          "#{month}/#{today.day}/#{today.year}"
        when 1
          new_date = today + args[0].to_i
          "#{new_date.month}/#{new_date.day}/#{new_date.year}"
        else
          raise "Illegal number of arguments for TestHelper.date_from_today"
      end
    end

    def random_name
      "#{rand_str} #{rand_str}".split.map(&:capitalize).join(' ')
    end

    def random_company_name
      "#{rand_str}#{rand_str}".split.map(&:capitalize).join(' ')
    end

    def rand_str
      (0...rand(3..8)).map { (65 + rand(26)).chr }.join
    end

    def random_address_all_zone
      @shipping_addresses_zones ||=  data_for(:shipping_addresses, {})
      zones = @shipping_addresses_zones.values
      zone_addresses = zones[rand(zones.size)]
      zone_addresses_values = zone_addresses.values
      zone_addresses_values[rand(zone_addresses_values.size)]
    end

  end
end