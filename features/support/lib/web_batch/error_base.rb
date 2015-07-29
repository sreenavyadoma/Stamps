module Batch
  class OrderErrorsBase < BrowserObject

    protected

    def window_title
      @browser.div :text => 'Order Errors'
    end

    def ok_button
      @browser.span :text => 'OK'
    end

    def error_message_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    public

    def ok
      5.times {
        browser_helper.click ok_button, 'OK'
        break unless browser_helper.field_present? ok_button
      }
    end

    def error_message
      error_message = browser_helper.text error_message_label
      log "----  Order Errors  ----"
      log error_message
      log "----  Order Errors  ----"
      error_message
    end

    def wait_until_present
      begin
        window_title.wait_until_present
      rescue
        #ignroe
      end
      self
    end

  end
end