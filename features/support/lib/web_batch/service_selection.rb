module Batch
  class ServiceSelection < BrowserObject
    def initialize browser, selection
      #select the service and get service cost
      super browser
      @selection = selection
      self
    end

    public

    def select
      browser_helper.click(drop_down, "ServiceDropDown")
      5.times {
        begin
          browser_helper.click(drop_down, "ServiceDropDown") unless browser_helper.present?  service
          @cost = test_helper.remove_dollar_sign(cost_label.text)
          drop_down.click unless browser_helper.present?  service
          log_browser_set service, @selection, "Service[#{@cost}]"
          service.click

          # Click this field 3 times to make tool tip disapper, tool tip appears after setting service.
          3.times
          begin
            browser_helper.click single_order_form_item_label if browser_helper.present?  single_order_form_item_label
          rescue
            #ignroe
          end
          service_input_text = browser_helper.text service_textbox
          break if service_input_text.include? @selection
        rescue => exception
          #log exception.backtrace
          field = @browser.div :css => 'div[id^=servicedroplist-][id$=-trigger-picker]'
          Watir::Wait.until {field.present?}
        end
      }
      @cost
    end

    private

    def cost_label
      @browser.td :css => "tr[data-qtip*='#{@selection}']>td:nth-child(3)"
    end

    def single_order_form_item_label
      @browser.label :text => 'Item:'
    end

    def service_textbox
      @browser.text_field :css => 'input[name^=servicedroplist-]'
    end

    def drop_down
      @browser.div :css => 'div[id^=servicedroplist-][id$=-trigger-picker]'
    end

    def service
      @browser.td :css => "tr[data-qtip*='#{@selection}']>td:nth-child(2)"
    end
  end

end