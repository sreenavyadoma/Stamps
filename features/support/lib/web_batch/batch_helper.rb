module Batch
  class BatchHelper
    include Singleton
    include DataMagic

    def rand_login_credentials
      login_credentials = data_for(:login_credentials, {})[ENV['URL']]
      credentials = login_credentials.values
      credentials[rand(credentials.size)]
    end

    def format_address_arr(address_array)
      address = ""
      if address_array.is_a?(Array)
        address_array.each_with_index { |element, index|
          if index==address_array.size-1
            address = address + element.to_s.strip
          else
            address = address + element.to_s.strip + "\n"
          end
        }
      else
        raise "Unsupported address format."
      end
      log address
      address
    end

    def format_address(address)
      if address.is_a?(Hash)
        name = address['name'].strip
        log "name: #{name}"
        company = address['company'].strip
        log "company: #{company}"
        street_address = address['street_address'].strip
        log "street_address: #{street_address}"
        city = address['city'].strip
        log "city: #{city}"
        state = address['state'].strip
        log "state: #{state}"
        zip = address['zip'].strip
        log "zip: #{zip}"
        formatted = "#{name}\n#{company}\n#{street_address}\n #{city}, #{state}. #{zip}"
        log "Formatted Address:  #{formatted}"
        formatted
      elsif address.is_a?(Array)
        format_address_arr(address)
      elsif address.include?(',')
        format_address_arr address.split(/,/)
      elsif address.is_a?(String)
        address
      else
        raise "Unsupported address format."
      end
    end
  end
end