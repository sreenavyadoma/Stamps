module Batch
  class NawsPluginError < Stamps::BrowserObject
    private
    def error_code_p
      @browser.p :css => "div[class=x-autocontainer-innerCt][id^=dialoguemodal]"
    end

    def ok_button
      @browser.span :text => 'OK'
    end

    public
    def present?
      err = ""
      begin
        err = browser_helper.text error_code_p
      rescue
        #ignore
      end

      present = err.include? "Error code: [1009]"
      if present
        log "NAWS Plugin Error detected.  Error code: [1009]"
        log error_code_p
      end
      present
  end

    def print_error_message
      ptags = @browser.ps :css => "div[class=x-autocontainer-innerCt][id^=dialoguemodal]>p"
      log "-- Print Plugin Error [Error code: [1009]]--"
      ptags.each {|p_tag|
        if browser_helper.present? p_tag
          log "\n#{browser_helper.text p_tag}"
        end
      }
      log "-- Print Plugin Error [Error code: [1009]]--"
      self
    end

    def ok
      print_error_message
      browser_helper.click ok_button, "OK"
      self
    end
  end
end