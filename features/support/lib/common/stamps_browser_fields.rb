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

  class Label < ClickableField
    def text
      browser_helper.text @field
    end
  end

  class TextBox < Label
    def set text
      browser_helper.set_text @field, text
      self
    end
  end

  class DropDown < BrowserObject
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