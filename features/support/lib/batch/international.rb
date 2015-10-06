module Batch
  class InternationalShipping < BatchObject

    def present?
      Textbox.new(@browser.text_field :name => "FullName").present?
    end

    def name
      field = Textbox.new @browser.text_field :name => "FullName"
      data_error_field = @browser.div :css => "div[data-anchortarget^=autosuggest]"
      field.data_error_field data_error_field, "data-errorqtip"
      field
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
      Textbox.new (@browser.text_fields :name => "Phone").last
    end

    def email
      Textbox.new (@browser.text_fields :name => "Email").last
    end

    def country
      Textbox.new (@browser.text_fields :name => "CountryCode").last
    end

  end
end