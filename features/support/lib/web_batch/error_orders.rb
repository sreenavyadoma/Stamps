module Batch

  class OrderErrors < BrowserObject
    private

    def error_message_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    def window_title
      #div[class*=x-window-header-title]>div[id^=title-][class*=x-title-item]
      order_errors = @browser.div :text => 'Order Errors'
      order_error = @browser.div :text => 'Order Error'
      error_window_title = (browser_helper.present?order_errors)?order_errors:(browser_helper.present?order_error)?order_error:nil
      log "#{browser_helper.text error_window_title}"
      error_window_title
    end

    def continue_button
      @browser.span :text => "Continue"
    end

    def cancel_button
      @browser.span :text => "Cancel"
    end

    def ok_button
      @browser.span :text => "OK"
    end

    public

    def ok
      5.times{
        begin
          browser_helper.click ok_button, "ok"
        rescue
          #ignore
        end
        break if browser_helper.present? ok_button
      }
    end

    def error_message
      browser_helper.text error_message_label
    end

    def present?
      browser_helper.present? window_title
    end

    def continue
      5.times{
        begin
          browser_helper.click continue_button, "Continue"
          break unless browser_helper.present? continue_button
        rescue
          #ignore
        end
      }
      PrintWindow.new(@browser)
    end

    def cancel
      5.times{
        begin
          browser_helper.click cancel_button, "ok"
          break unless browser_helper.present? cancel_button
        rescue
          #ignore
        end
      }
    end

    def close_window
      5.times{
        browser_helper.click window_title
        brea
      }
    end

  end

end
