module Batch
  class OrderError < BrowserObject

    protected

    def window_title
      #div[class*=x-window-header-title]>div[id^=title-][class*=x-title-item]
      title = @browser.div :text => 'Order Error'
      present = title.present?
      title
    end

    def ok_button_span
      @browser.span :text => 'OK'
    end

    def error_message_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    public

    def present?
      browser_helper.present? window_title
    end

    def ok
      5.times {
        begin
          browser_helper.click ok_button_span, 'OK'
          break unless browser_helper.present? ok_button_span
        rescue
          #ignore
        end
      }
    end

    def error_message
      error_message = browser_helper.text error_message_label
      log "----  Order Errors  ----"
      log error_message
      log "----  Order Errors  ----"
      error_message
    end

  end
end