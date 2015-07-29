module Batch
  class RatingError < BrowserObject
    private
    def rating_error_p
      @browser.p :css => 'div[class=x-autocontainer-innerCt]>p:nth-child(1)'
    end

    def ok_button
      @browser.span :text => 'OK'
    end

    public
    def wait_until_present
      begin
        ok_button.wait_until_present
      rescue
        #ignore
      end
      self
    end

    def present?
      browser_helper.field_present? ok_button
    end

    def OK
      log "----  Rating Error  ----"
      log browser_helper.text rating_error_p
      log "----  Rating Error  ----"
      5.times {
        browser_helper.click ok_button, 'OK'
        break unless present?
      }
    end

    def error_message
      browser_helper.text rating_error_p
    end

  end
end