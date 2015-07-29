module Batch
  class NawsPluginError < Stamps::BrowserObject
    private
    def error_code_p
      @browser.p :css => "div[class=x-autocontainer-innerCt][id^=dialoguemodal]>p:nth-child(2)"
    end

    def ok_button
      @browser.span :text => 'OK'
    end

    public
    def present?
      browser_helper.field_present? error_code_p
  end

    def print_error_message
      ptags = @browser.ps :css => "div[class=x-autocontainer-innerCt][id^=dialoguemodal]>p"
      log "-- Print Plugin Error [Error code: [1009]]--"
      ptags.each {|p_tag|
        if browser_helper.field_present? p_tag
          log "\n#{browser_helper.text p_tag}"
        end
      }
      log "-- Print Plugin Error [Error code: [1009]]--"
      self
    end

    def okay
      browser_helper.click ok_button, "OK"
      self
    end
  end
end