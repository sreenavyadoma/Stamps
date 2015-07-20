module Batch
  class PrintWindowOrderErrors < Stamps::BrowserObject
    include Batch::PrintWindowCommon

    private

    def ok_button
      span = @browser.span :text => 'OK'
      present = span.present?
      span
    end

    def continue_button
      span = @browser.span :text => 'Continue'
      present = span.present?
      span
    end

    def cancel_button
      span = @browser.span :text => 'Cancel'
      present = span.present?
      span
    end

    def error_message_label1
      div = @browser.div :css => 'div[id^=dialoguemodal][class=x-autocontainer-innerCt]'
      present = div.present?
      div
    end

    def error_message_label2
      div = @browser.br :css => 'div[id^=dialoguemodal][class=x-autocontainer-innerCt]>br'
      present = div.present?
      div
    end

    def label_indicium_error_div
      div = @browser.div :css => 'div[id^=dialoguemodal][class=x-autocontainer-innerCt]>br:nth-child(2)'
      present = div.present?
      div
    end

    def window_title_div
      div = @browser.div :text => 'Order Errors'
      present = browser_helper.field_present?  div
      div
    end

    public

    def present?
      browser_helper.field_present? error_message_label1
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
      if browser_helper.field_present? error_message_label2
        err =  "#{browser_helper.text error_message_label1}\n#{browser_helper.text error_message_label2}"
        err
      elsif browser_helper.field_present? label_indicium_error_div
        err =  "#{browser_helper.text error_message_label1}\n#{browser_helper.text label_indicium_error_div}"
        err
      else
        err = browser_helper.text error_message_label1
        err
      end
    end

    def label_indicium_error?
      browser_helper.field_present? label_indicium_error_div
    end
  end
end