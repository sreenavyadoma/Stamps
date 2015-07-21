module Batch
  class OrderErrors < Stamps::BrowserObject
    private
    def continue_button
      @browser.span :text => "Continue"
    end

    def cancel_button
      @browser.span :text => "Cancel"
    end

    def order_error_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    public
    def error_message
      browser_helper.text order_error_label
    end

    def wait_until_present
      begin
        continue_button.wait_until_present
      rescue
        #ignroe
      end
      self
    end

    def present?
      browser_helper.field_present? continue_button
    end

    def continue
      log "----  Order Errors  ----"
      log browser_helper.text order_error_label
      log "----  Order Errors  ----"
      5.times{
        begin
          browser_helper.click continue_button, "OK"
          break unless browser_helper.field_present? continue_button
        rescue
          #ignore
        end
      }
      PrintWindow.new(@browser)
    end

  end
end