module Batch

  class OrderErrors < BrowserObject
    private

    def error_message_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    def window_title
      #div[class*=x-window-header-title]>div[id^=title-][class*=x-title-item]
      title = @browser.div :text => 'Order Errors'
      present = title.present?
      title
    end

    def continue_button
      @browser.span :text => "Continue"
    end

    def cancel_button
      @browser.span :text => "Cancel"
    end

    public

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

  end

end
