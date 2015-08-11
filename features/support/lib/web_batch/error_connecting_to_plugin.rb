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
      present = (browser_helper.text error_code).include? "Error code: [1010]"
      if present
        log "Stamps.com is currently connecting to the plug-in. Error code: [1010]"
        log error_code
      end
      present
    end

    def ok
      10.times {
        browser_helper.click ok_button, 'OK'
        break unless present?
      }
    end

  end
end