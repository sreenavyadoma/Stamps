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
      field = Textbox.new @browser.text_field :name => "Company"
      data_error_collection = @browser.divs :css => "div[data-anchortarget^=textfield-][data-anchortarget$=-inputEl]"
      data_error_field = data_error_collection[1]
      field.data_error_field data_error_field, "data-errorqtip"
      field
    end

    def address_1
      field = Textbox.new @browser.text_field :name => "Address1"
      data_error_collection = @browser.divs :css => "div[data-anchortarget^=textfield-][data-anchortarget$=-inputEl]"
      data_error_field = data_error_collection[2]
      field.data_error_field data_error_field, "data-errorqtip"
      field
    end

    def address_2
      Textbox.new @browser.text_field :name => "Address2"
    end

    def city
      field = Textbox.new @browser.text_field :name => "City"
      data_error_collection = @browser.divs :css => "div[data-anchortarget^=textfield-][data-anchortarget$=-inputEl]"
      data_error_field = data_error_collection[3]
      field.data_error_field data_error_field, "data-errorqtip"
      field
    end

    def province
      Textbox.new @browser.text_field :name => "Province"
    end

    def postal_code
      Textbox.new @browser.text_field :name => "PostalCode"
    end

    def phone
      field = Textbox.new (@browser.text_fields :name => "Phone").last
      data_error_collection = @browser.divs :css => "div[data-anchortarget^=textfield-][data-anchortarget$=-inputEl]"
      data_error_field = data_error_collection[5]
      field.data_error_field data_error_field, "data-errorqtip"
      field
    end

    def email
      field = Textbox.new (@browser.text_fields :name => "Email").last
      data_error_collection = @browser.divs :css => "div[data-anchortarget^=textfield-][data-anchortarget$=-inputEl]"
      data_error_field = data_error_collection[6]
      field.data_error_field data_error_field, "data-errorqtip"
      field
    end

    def country
      Textbox.new (@browser.text_fields :name => "CountryCode").last
    end

  end
end