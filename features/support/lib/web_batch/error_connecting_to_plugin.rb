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
      err = ""
      begin
        err = browser_helper.text error_code
      rescue
        #ignore
      end

      present = err.include? "Error code: [1010]"
      if present
        log "Stamps.com is currently connecting to the plug-in. Error code: [1010]\n#############################################"
        log error_code
        log "Stamps.com is currently connecting to the plug-in. Error code: [1010]\n#############################################"
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