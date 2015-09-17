module Batch

  class TestHelper
    include Singleton
    include DataMagic

=begin

    def to_sym(str, delim)
      #str.gsub(/[^0-9A-Za-z -]/, '').gsub(/\s+/,'_').gsub(/-+/, '_').downcase.to_sym
      (strip str.gsub(/\W/, delim), delim).downcase.to_sym
    end

    def strip(string, chars)
      chars = Regexp.escape(chars)
      string.gsub(/\A[#{chars}]+|[#{chars}]+\z/, "")
    end
=end

    def service_to_sym(str)
      str.downcase.tr('()', '').tr('/-', '_').strip.tr(' ', '_').to_sym
    end

    def service_to_words(str)
      str.tr('()', '').tr(' /-', ' ')
    end

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
      shipping["name"] = TestHelper.instance.random_name
      shipping["company"] = TestHelper.instance.random_company_name
      shipping["phone"] = TestHelper.instance.random_phone
      shipping["email"] = TestHelper.instance.random_email
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