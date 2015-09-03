module Batch
  class OrderGridPagingToolbar < BrowserObject
    def present?

    end

    def page_count
      field=@browser.text_field :css => "input[name^=combobox]"
      text_box = Textbox.new field
      log text_box.present?
      text_box
    end

    def page_number
      field = @browser.text_field :css => "div[id^=pagingtoolbar][data-ref=innerCt]>div>div[id^=numberfield]>div[data-ref=bodyEl]>div>div:nth-child(1)>input"
      text_box = Textbox.new field
      log text_box.present?
      text_box
    end

    def first_page
      field = @browser.span :css => "span[class*=x-tbar-page-first]"
      label = Label.new field
      log label.present?
      label
    end

    def first_page_disabled
      field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      label = Label.new field
      log label.disabled?
      label.disabled?
    end

    def previous_page
      field = @browser.span :css => "span[class*=x-tbar-page-prev]"
      label = Label.new field
      log label.present?
      label
    end

    def previous_page_disabled
      field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      label = Label.new field
      log label.disabled?
      label.disabled?
    end

    def next_page
      field = @browser.span :css => "span[class*=x-tbar-page-next]"
      label = Label.new field
      log label.present?
      label
    end

    def last_page
      field = @browser.span :css => "span[class*=x-tbar-page-last]"
      label = Label.new field
      log label.present?
      label
    end

    def last_page_disabled
      field = @browser.a  :css => "div[id^=pagingtoolbar][data-ref=targetEl]>[class*=x-btn-disabled]"
      label = Label.new field
      log label.present?
      label
    end

    def total_number_of_pages
      fields = @browser.divs :css => "div[id^=tbtext-]"
      field=fields.last
      label = Label.new field
      log label.present?
      label
      #of 6
      number_str=label.text
      number = number_str.scan /\d+/
      number.last.to_i
    end

    def per_page_dd
      #browser, drop_down_button, selection_field_type, drop_down_input
      buttons = @browser.divs :css => "div[id^=combobox-][id$=trigger-picker]"
      drop_down_button = buttons.first
      selection_field_type = "li"
      drop_down_input = @browser.text_field :css => "input[name^=combobox]"
      dd=Dropdown.new @browser, drop_down_button, selection_field_type, drop_down_input
      dd
    end

  end
end