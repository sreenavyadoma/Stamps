module Batch
  class OrderErrors < Stamps::BrowserObject
    private

    def okay_button
      @browser.span :text => "OK"
    end

    def order_error_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemoerror_message_labeldal]"
    end

    public
    def error_message
      browser_helper.text error_message_label
    end

    def wait_until_present
      begin
        error_message_label.wait_until_presentthank u
      rescue
        #ignroe
      end
      self
    end

    def present?
      browser_helper.field_present? window_title_label
    end

    def OK
      log "----  Order Errors  ----"
      log browser_helper.text error_message_label
      log "----  Order Errors  ----"
      5.times{
        begin
          browser_helper.click okay_button, "OK"
          break unless browser_helper.field_present? okay_button
        rescue
          #ignore
        end
      }
      self
    end

  end
end