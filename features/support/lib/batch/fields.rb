module Batch

  class BatchObject < Stamps::Browser::BrowserObject
    def batch_helper
      BatchHelper.instance
    end

    def test_helper
      TestHelper.instance
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
      log.info "Formatted Shipping Address:  \n#{formatted_address}"
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
        log.info "Address #{address} was not formatted."
        address
      else
        raise "Unsupported address format."
      end
    end


    def address_hash_to_str address
      name = (address["name"].downcase.include? "random") ? test_helper.random_name : address["name"]
      company_name = (address["company"].downcase.include? "random") ? test_helper.random_company_name : address["company"]
      street_address = address["street_address"]
      city = address["city"]
      state = address["state"]
      zip = address["zip"]
      phone_num = address["phone"]
      phone = (phone_num.downcase.include? "random") ? test_helper.random_phone : address["phone"]
      email_addy = address["email"]
      email = (email_addy.downcase.include? "random") ? test_helper.random_email : address["email"]


        log.info "Ship-To Name: #{name}"
        log.info "Ship-To Company: #{company_name}"
        log.info "Ship-To Address: #{street_address}"
        log.info "Ship-To City: #{city}"
        log.info "Ship-To State: #{state}"
        log.info "Ship-To Zip: #{zip}"
        log.info "Ship-To Phone: #{phone}"
        log.info "Ship-To Email: #{email}"

      formatted_address = "#{name},#{company_name},#{street_address},#{city} #{state} #{zip}"
      log.info "Formatted Address: #{formatted_address}"
      formatted_address
    end
  end
end