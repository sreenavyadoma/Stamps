module Batch
  class InternationalAddress < BrowserObject

    def present?
      browser_helper.present? postal_code_textbox
    end

    def name
      field = TextBox.new(@browser.text_field :name => "FullName")
      log "FullName present? #{browser_helper.present? field}"
      field
    end

    def company
      field = TextBox.new(@browser.text_field :name => "Company")
      log "Company present? #{browser_helper.present? field}"
      field
    end

    def address_1
      field = TextBox.new(@browser.text_field :name => "Address1")
      log "Address1 present? #{browser_helper.present? field}"
      field
    end

    def address_2
      field = TextBox.new(@browser.text_field :name => "Address2")
      log "Address2 present? #{browser_helper.present? field}"
      field
    end

    def city
      field = TextBox.new(@browser.text_field :name => "City")
      log "City present? #{browser_helper.present? field}"
      field
    end

    def province
      field = TextBox.new(@browser.text_field :name => "Province")
      log "Province present? #{browser_helper.present? field}"
      field
    end

    def postal_code
      field = TextBox.new(@browser.text_field :name => "PostalCode")
      log "PostalCode present? #{browser_helper.present? field}"
      field
    end

    def phone
      text_fields = @browser.text_fields :name => "Phone"
      field = TextBox.new(text_fields.last)
      log "City present? #{browser_helper.present? field}"
      field
    end

    def email
      text_fields = @browser.text_fields :name => "Email"
      field = TextBox.new(text_fields.first)
      log "Email present? #{browser_helper.present? field}"
      field
    end

  end
end