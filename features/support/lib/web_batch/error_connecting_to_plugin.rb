module Batch
  class ErrorConnectingToPlugin < BrowserObject
    private

    def error_message_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    def error_code
	  @browser.p :text => "Error code: [1010]"
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
      browser_helper.present? error_code
    end

    def ok
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