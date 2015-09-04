module Stamps

  class BrowserObject
    def initialize(browser)
      @browser = browser
    end

    def browser_helper
      BrowserHelper.instance
    end

    def test_helper
      TestHelper.instance
    end
  end

  class ClickableField
    def initialize field
      @field = field
    end

    def field
      @field
    end

    def browser_helper
      BrowserHelper.instance
    end

    def present?
      browser_helper.present? @field
    end

    def click
      browser_helper.click @field
    end

    def safe_click
      browser_helper.safe_click @field
    end

  end

  class Checkbox < ClickableField
    def initialize checkbox_field, verify_field, attribute, attrib_value_check
      super checkbox_field
      @verify_field = verify_field
      @attribute = attribute
      @attrib_value_check = attrib_value_check
    end

    def check
      5.times{
        click
        break if checked?
      }
    end

    def uncheck
      5.times{
        click
        break unless checked?
      }
    end

    def checked?
      attrib_val = browser_helper.attribute_value @verify_field, @attribute
      checked = attrib_val.include? @attrib_value_check
      log "Checkbox checked? #{checked}"
      checked
    end
  end

  class Label < ClickableField
    def text
      browser_helper.text @field
    end

    def enabled?
      browser_helper.enabled? @field
    end

    def disabled?
      browser_helper.disabled? @field
    end

  end

  class Textbox < Label
    def set text
      browser_helper.set_text @field, text
      self
    end

    def send_keys special_char
      browser_helper.send_keys @field, special_char
      self
    end
  end

  class Dropdown < BrowserObject
    def initialize browser, drop_down_button, selection_field_type, drop_down_input
      super browser
      @drop_down = drop_down_button
      @selection_field_type = selection_field_type.downcase
      @input = drop_down_input
    end

    def select selection
      case @selection_field_type
        when "li"
          @selection_item = @browser.li :text => selection
        else
          raise "Unsupported HTML drop-down selection tag #{@selection_field_type}"
      end

      5.times{
        browser_helper.click @drop_down, "drop-down"
        log "Selection is present? #{browser_helper.present? @selection_item}"
        browser_helper.click @selection_item if browser_helper.present? @selection_item
        input_text = browser_helper.text @input
        break if input_text.include? selection
      }
    end
  end

end