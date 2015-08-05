module Batch
  class AddShippingAdress < BrowserObject
    public
    def shipping_address=(table)
      self.origin_zip = table["ship_from_zip"]
      self.name = table["name"]
      self.company = table["company"]
      self.street_address1 = table["street_address"]
      self.street_address2 = table["street_address2"]
      self.city = table["city"]
      self.state = table["state"]
      self.zip = table["zip"]
      self.phone = table["phone"]
      self.save
    end

    def origin_zip=(zip)
      browser_helper.set_text origin_zip_field, zip, "origin_zip"
    end

    def origin_zip
      browser_helper.text origin_zip_field
    end

    def name=(name)
      browser_helper.set_text name_field, name, "name_field"
    end

    def company=(company)
      browser_helper.set_text company_field, company, "company_field"
    end

    def street_address1=(street)
      browser_helper.set_text street_address1_field, street, "street_address1_field"
    end

    def street_address2=(street)
      browser_helper.set_text street_address2_field, street, "street_address2_field"
    end

    def city=(city)
      browser_helper.set_text city_field, city, "city_field"
    end

    def state=(state)
      browser_helper.set_text state_field, state, "state_field"
    end

    def zip=(code)
      browser_helper.set_text zip_field, code, "zip_field"
    end

    def phone=(number)
      browser_helper.set_text phone_field, number, "phone_field"
    end

    def save
      5.times{
        begin
          browser_helper.click save_button, "save_button"
          save_button.wait_while_present
          break unless browser_helper.present? save_button
        rescue
          #ignore
        end
      }
    end

    def present?
      save_button.present?
    end

    private
    def origin_zip_field
      @browser.text_field :name => 'OriginZip'
    end

    def name_field
      @browser.text_field :name => 'FullName'
    end

    def company_field
      @browser.text_field :name => 'Company'
    end

    def street_address1_field
      @browser.text_field :name => 'Street1'
    end

    def street_address2_field
      @browser.text_field :name => 'Street2'
    end

    def city_field
      @browser.text_field :name => 'City'
    end

    def state_field
      @browser.text_field :name => 'State'
    end

    def zip_field
      @browser.text_field :name => 'Zip'
    end

    def phone_field
      @browser.text_field :css => "input[name=Phone][maxlength='14']"
    end

    def save_button
      @browser.span :text => 'Save'
    end

  end
end