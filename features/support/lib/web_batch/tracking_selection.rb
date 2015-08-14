module Batch
  class TrackingSelection < BrowserObject
    def initialize(browser, selection)
      super browser
      @selection = selection
      self
    end

    def tracking_textbox
      @browser.text_field :name => 'Tracking'
    end

    def drop_down
      @browser.div :css => "div[id^=trackingdroplist-][id$=-trigger-picker]"
    end

    def tracking
      @browser.td :text => @selection
    end

    def select
      browser_helper.click(drop_down, "TrackingDropDown")
      5.times {
        begin
          browser_helper.click(drop_down, "TrackingDropDown") unless browser_helper.present?  tracking
          browser_helper.click tracking, "[#{@selection}]"

          # Click this field 3 times to make tool tip disapper, tool tip appears after setting service.
          3.times
          begin
            browser_helper.click single_order_form_item_label if browser_helper.present?  single_order_form_item_label
          rescue
            #ignroe
          end

          break if browser_helper.text(tracking_textbox).include? @selection
        rescue
          #ignore
        end
      }
      @cost
    end
  end
end
