module Batch
  class IndiciumError < BrowserObject
    private

    def indicium_error_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    def indicium_error_div
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    def ok_button
      @browser.span :text => 'OK'
    end

    public
    def wait_until_present
      begin
        indicium_error_label.wait_until_present
      rescue
        #ignroe
      end
    end

    def present?
      browser_helper.field_present? indicium_error_label
    end

    def OK
      log "----  Indicium Error  ----"
      log browser_helper.text indicium_error_div
      log browser_helper.text indicium_error_label
      log "----  Indicium Error  ----"
      5.times {
        browser_helper.click ok_button, 'OK'
        break unless present?
      }
    end

    def error_message
      browser_helper.text indicium_error_label
    end

  end
end