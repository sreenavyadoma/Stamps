module Batch

  class BatchObject < Stamps::Browser::BrowserObject
    def batch_helper
      BatchHelper.instance
    end
  end

  class BatchHelper
    include Singleton
    include DataMagic

    def test_helper
      TestHelper.instance
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
          else #(param_hash["name"].downcase.include? "random") ? test_helper.random_name : param_hash["name"]
            formatted_address = formatted_address + ((element.to_s.strip.downcase.include? "random") ? test_helper.random_name : element.to_s.strip) + "\n"
          end
        }
      else
        raise "Unsupported address format."
      end
      log "Formatted Shipping Address:  \n#{formatted_address}" if Stamps::Test.verbose
      formatted_address
    end

    def address_hash_to_str address
      name = (address["name"].downcase.include? "random") ? test_helper.random_name : address["name"]
      company = (address["company"].downcase.include? "random") ? test_helper.random_company_name : address["company"]
      street_address = address["street_address"]
      city = address["city"]
      state = address["state"]
      zip = address["zip"]
      phone_num = address["phone"]
      phone = (phone_num.downcase.include? "random") ? test_helper.random_phone : address["phone"]
      email_addy = address["email"]
      email = (email_addy.downcase.include? "random") ? test_helper.random_email : address["email"]

      if Stamps::Test.verbose
        log "Ship-To Name: #{name}"
        log "Ship-To Company: #{company}"
        log "Ship-To Address: #{street_address}"
        log "Ship-To City: #{city}"
        log "Ship-To State: #{state}"
        log "Ship-To Zip: #{zip}"
        log "Ship-To Phone: #{phone}"
        log "Ship-To Email: #{email}"
      end

      formatted_address = "#{name},#{company},#{street_address},#{city} #{state} #{zip}"

      log "Formatted Address: #{formatted_address}" if Stamps::Test.verbose
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
        log "Address #{address} was not formatted." if Stamps::Test.verbose
        address
      else
        raise "Unsupported address format."
      end
    end
  end

end