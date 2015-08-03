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

    def formatAddress(address)
      if address.is_a?(Hash)
        formatted_address = "#{address['name'].strip}\n#{address['company'].strip}\n#{address['street_address'].strip}\n #{address['city'].strip}, #{address['state'].strip}. #{address['zip'].strip}"
        log "Formatted Address:  #{formatted_address}"
        return formatted_address
      elsif address.is_a?(Array)
        return format_address_arr(address)
      elsif address.include?(',')
        return format_address_arr address.split(/,/)
      elsif address.is_a?(String)
        return address
      else
        raise "Unsupported address format."
      end
    end
  end
end