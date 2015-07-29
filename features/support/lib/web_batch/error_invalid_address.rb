module Batch
  class InvalidAddressError < OrderErrorsBase
    private

    def error_message_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    def ok_button
      @browser.span :text => 'OK'
    end


    public
    def error_message
      browser_helper.text error_message_label
    end

    def wait_until_present
      begin
        error_message_label.wait_until_present
      rescue
        #ignroe
      end
      self
    end

    def present?
      browser_helper.field_present? error_message_label
    end

    def OK
      log "----  Invalid Address Error  ----"
      log browser_helper.text error_message_label
      log "----  Invalid Address Error  ----"
      5.times {
        browser_helper.click ok_button, 'OK'
        break unless present?
      }
    end

  end
end