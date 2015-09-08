module Batch
  class InternationalShipping < BrowserObject

    def present?
      Textbox.new(@browser.text_field :name => "FullName").present?
    end

    def name *args
      browser_field = Textbox.new(@browser.text_field :name => "FullName")
      log "FullName present? #{browser_field.present?}"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def company *args
      browser_field = Textbox.new(@browser.text_field :name => "Company")
      log "Company present? #{browser_field.present?}"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def address_1 *args
      browser_field = Textbox.new(@browser.text_field :name => "Address1")
      log "Address1 present? #{browser_field.present?}"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def address_2 *args
      browser_field = Textbox.new(@browser.text_field :name => "Address2")
      log "Address2 present? #{browser_field.present?}"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def city *args
      browser_field = Textbox.new(@browser.text_field :name => "City")
      log "City present? #{browser_field.present?}"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def province *args
      browser_field = Textbox.new(@browser.text_field :name => "Province")
      log "Province present? #{browser_field.present?}"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def postal_code *args
      browser_field = Textbox.new(@browser.text_field :name => "PostalCode")
      log "PostalCode present? #{browser_field.present?}"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def phone *args
      text_fields = @browser.text_fields :name => "Phone"
      browser_field = Textbox.new(text_fields.last)
      log "City present? #{browser_field.present?}"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

    def email *args
      text_fields = @browser.text_fields :name => "Email"
      browser_field = Textbox.new(text_fields.last)
      log "Email present? #{browser_field.present?}"
      case args.length
        when 0
          return browser_field
        when 1
          browser_field.set args[0]
        else
          raise "Illegal number of arguments"
      end
    end

  end
end