module Batch
  class ServiceSelection < BrowserObject
    def initialize(browser, selection)
      #select the service and get service cost
      super(browser)
      @selection = selection
      self
    end

    def inline_service_price_field
      @browser.td :css => "tr[data-qtip*='#{@selection}']>td:nth-child(3)"
    end

    def single_order_form_item_label
      @browser.label :text => 'Item:'
    end

    def service_field
      @browser.text_field :css => 'input[name^=servicedroplist-]'
    end

    def select
      3.times {
        begin
          service_dlist_field = @browser.div :css => 'div[id^=servicedroplist-][id$=-trigger-picker]'
          inline_service_selection_field = @browser.td :css => "tr[data-qtip*='#{@selection}']>td:nth-child(2)"
          service_dlist_field.click unless browser_helper.field_present?  inline_service_selection_field
          @inline_service_cost = test_helper.remove_dollar_sign(inline_service_price_field.text)
          #log "Service selection:  #{service_selection_field.text} Price: #{@inline_service_price}"
          inline_service_text = inline_service_selection_field.text
          service_dlist_field.click unless browser_helper.field_present?  inline_service_selection_field
          log_browser_set inline_service_selection_field, @selection, "Service"
          inline_service_selection_field.click
          inline_service_selection_field.wait_while_present(3)

          # Click this field 3 times to make tool tip disapper, tool tip appears after setting service.
          3.times
          begin
            browser_helper.click single_order_form_item_label, "single_order_form_item_label" if browser_helper.field_present?  single_order_form_item_label
          rescue
            #ignroe
          end

          service_input_text = service_field.attribute_value("value")

          log "Service Selected?  #{(service_input_text.include?inline_service_text)?"Yes":"No"}. #{inline_service_text}  #{service_input_text}"
          #log "Service selected: #{service_selected} : Selected: #{selected}, Selection: #{selection}"

          break if service_input_text.include? inline_service_text
        rescue => exception
          #log exception.backtrace
          field = @browser.div :css => 'div[id^=servicedroplist-][id$=-trigger-picker]'
          Watir::Wait.until {field.present?}
        end
      }
      @inline_service_cost
    end

  end
end