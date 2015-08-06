module Stamps
  class TestHelper
    include Singleton
    include DataMagic

    def state_name abbrev
      states ||= us_states
      states[abbrev]
    end

    def us_states
      states = Hash.new
      states["AL"] = "Alabama"
      states["AK"] = "Alaska"
      states["AZ"] = "Arizona"
      states["AR"] = "Arkansas"
      states["CA"] = "California"
      states["CO"] = "Colorado"
      states["CT"] = "Connecticut"
      states["DE"] = "Delaware"
      states["FL"] = "Florida"
      states["GA"] = "Georgia"
      states["HI"] = "Hawaii"
      states["ID"] = "Idaho"
      states["IL"] = "Illinois"
      states["IN"] = "Indiana"
      states["IA"] = "Iowa"
      states["KS"] = "Kansas"
      states["KY"] = "Kentucky"
      states["LA"] = "Louisiana"
      states["ME"] = "Maine"
      states["MD"] = "Maryland"
      states["MA"] = "Massachusetts"
      states["MI"] = "Michigan"
      states["MN"] = "Minnesota"
      states["MS"] = "Mississippi"
      states["MO"] = "Missouri"
      states["MT"] = "Montana"
      states["NE"] = "Nebraska"
      states["NV"] = "Nevada"
      states["NH"] = "New Hampshire"
      states["NJ"] = "New Jersey"
      states["NM"] = "New Mexico"
      states["NY"] = "New York"
      states["NC"] = "North Carolina"
      states["ND"] = "North Dakota"
      states["OH"] = "Ohio"
      states["OK"] = "Oklahoma"
      states["OR"] = "Oregon"
      states["PA"] = "Pennsylvania"
      states["RI"] = "Rhode Island"
      states["SC"] = "South Carolina"
      states["SD"] = "South Dakota"
      states["TN"] = "Tennessee"
      states["TX"] = "Texas"
      states["UT"] = "Utah"
      states["VT"] = "Vermont"
      states["VA"] = "Virginia"
      states["WA"] = "Washington"
      states["WV"] = "West Virginia"
      states["WI"] = "Wisconsin"
      states["WY"] = "Wyoming"
      states["AS"] = "American Samoa"
      states["DC"] = "District of Columbia"
      states["FM"] = "Federated States of Micronesia"
      states["GU"] = "Guam"
      states["MH"] = "Marshall Islands"
      states["MP"] = "Northern Mariana Islands"
      states["PW"] = "Palau"
      states["PR"] = "Puerto Rico"
      states["VI"] = "Virgin Islands"
      states["AE"] = "Armed Forces Africa"
      states["AA"] = "Armed Forces Americas"
      states["AE"] = "Armed Forces Canada"
      states["AE"] = "Armed Forces Europe"
      states["AE"] = "Armed Forces Middle East"
      states["AP"] = "Armed Forces Pacific"
      states
    end

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

    def rand_str *args
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
      "#{rand_str}@#{rand_str}.com".downcase
    end

    def random_ship_to
      shipping = random_address_all_zone
      shipping["name"] = test_helper.random_name
      shipping["company"] = test_helper.random_company_name
      shipping["phone"] = test_helper.random_phone
      shipping["email"] = test_helper.random_email
    end

    def random_suite
      "Suite #{Random.rand(1..999)}"
    end

    def random_ship_from
      shipping = random_address_all_zone
      shipping["ship_from_zip"] = shipping["zip"]
      shipping["name"] = random_name
      shipping["company"] = random_company_name
      shipping["phone"] = random_phone
      shipping["email"] = random_email
      shipping["state_abbrev"] = shipping["state"]
      shipping["state"] = state_name(shipping["state_abbrev"])
      shipping["street_address2"] = random_suite
      shipping
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