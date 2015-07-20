module Batch
  class PrintWindowOrderErrors < Stamps::BrowserObject
    include Batch::PrintWindowCommon

    private

    def ok_button
      @browser.span :text => 'OK'
    end

    def continue_button
      @browser.span :text => 'Continue'
    end

    def cancel_button
      @browser.span :text => 'Cancel'
    end

    def error_message_label
      @browser.div :css => 'div[id^=dialoguemodal][class=x-autocontainer-innerCt]'
    end

    def window_title_div
      @browser.div :text => 'Order Errors'
    end

    public

    def present?
      browser_helper.field_present? error_message_label
    end

    def ok
      browser_helper.click ok_button, 'OK'
    end

    def continue
      browser_helper.click continue_button, 'continue'
    end

    def cancel
      browser_helper.click cancel_button, 'cancel'
    end

    def error_message
      begin
        error_message_label.wait_until_present
      rescue
        #ignore
      end
      browser_helper.text error_message_label
    end
  end
end