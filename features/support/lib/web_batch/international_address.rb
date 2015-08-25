module Batch
  class InternationalAddress < BrowserObject

    def name_textbox

    end

    def company_textbox

    end

    def address_1_textbox

    end

    def address_2_textbox

    end

    def city_textbox

    end

    def province_textbox

    end

    def postal_code_textbox

    end

    def phone_textbox

    end

    def email_textbox

    end



    def present?
      browser_helper.present? postal_code_textbox
    end

    def name

    end

    def name=value

    end

    def company

    end

    def company=value

    end

    def address_1

    end

    def address_1=value

    end

    def address_2

    end

    def address_2=value

    end

    def city

    end

    def city=value

    end

    def province

    end

    def province=value

    end

    def postal_code

    end

    def postal_code=value

    end

    def phone

    end

    def phone=value

    end

    def email

    end

    def email=value

    end

  end
end