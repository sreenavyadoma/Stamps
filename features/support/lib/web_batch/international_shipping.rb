module Batch
  class InternationalShipping < BatchObject

    def present?
      Textbox.new(@browser.text_field :name => "FullName").present?
    end

    def name
      Textbox.new @browser.text_field :name => "FullName"
    end

    def company
      Textbox.new @browser.text_field :name => "Company"
    end

    def address_1
      Textbox.new @browser.text_field :name => "Address1"
    end

    def address_2
      Textbox.new @browser.text_field :name => "Address2"
    end

    def city
      Textbox.new @browser.text_field :name => "City"
    end

    def province
      Textbox.new @browser.text_field :name => "Province"
    end

    def postal_code
      Textbox.new @browser.text_field :name => "PostalCode"
    end

    def phone
      @browser.text_fields :name => "Phone"
    end

    def email
      @browser.text_fields :name => "Email"
    end

  end
end