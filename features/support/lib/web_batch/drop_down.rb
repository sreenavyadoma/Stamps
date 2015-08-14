module Batch
  class DropDown < BrowserObject
    def initialize browser, drop_down, selection_field_type, input
      super browser
      @drop_down = drop_down
      @selection_field_type = selection_field_type.downcase
      @input = input
    end

    def select selection
      case @selection_field_type
        when "li"
          @selection_item = @browser.li :text => selection
      end

      5.times{
        browser_helper.click @drop_down, "drop-down"
        log "Selection #{@selection_item} is present? #{browser_helper.present? @selection_item}"
        browser_helper.click @selection_item if browser_helper.present? @selection_item
        input_text = browser_helper.text @input
        break if input_text.contains selection
      }
      input_text.contains selection
    end

  end
end
