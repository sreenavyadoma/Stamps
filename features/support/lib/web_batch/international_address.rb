module Batch
  class InternationalAddress < BrowserObject

    def name_textbox

    end

    def company_textbox

    end

    def address1_textbox

    end

    def address2_textbox

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

    def company

    end

    def address1

    end

    def address2

    end

    def city

    end

    def province

    end

    def postal_code

    end

    def phone

    end

    def email

    end

  end
end