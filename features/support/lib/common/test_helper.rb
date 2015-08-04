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

    def date_now *args
      case args.length
        when 0
          now = Date.today
          log "Today:  #{now}"
          month = (now.month.to_s.length==1)?"0#{now.month}":now.month
          day = (now.day.length==1)?"0#{now.day}":now.day
          "#{month}/#{day}/#{now.year}"
        when 1
          now = Date.today
          log "Today:  #{now}"
          days_to_add = args[0].to_i
          new_date = now + days_to_add
          log "New Date:  #{new_date}"
          month = (new_date.month.to_s.length==1)?"0#{new_date.month}":new_date.month
          day = (new_date.day.to_s.length==1)?"0#{new_date.day}":new_date.day
          now = "#{month}/#{day}/#{new_date.year}"
          now
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
      shipping_addresses_zones = data_for(:shipping_addresses, {})
      zones = shipping_addresses_zones.values
      zone_addresses = zones[rand(zones.size)]
      zone_addresses_values = zone_addresses.values
      address_hash = zone_addresses_values[rand(zone_addresses_values.size)]
      address_hash
    end

  end
end