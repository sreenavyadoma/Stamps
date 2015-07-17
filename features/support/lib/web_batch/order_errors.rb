module Batch
  class OrderErrors < Stamps::BrowserObject
    private
    def window_title_label
      div = @browser.div :text => "Order Errors"
      present = div.present?
      text = div.text
      div
    end

    def okay_button
      span = @browser.span :text => "OK"
      present = span.present?
      text = span.text
      span
    end

    def error_message_label
      div = @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
      present = div.present?
      text = div.text
      div
    end

    public

    def present?
      browser_helper.field_present? window_title_label
    end

    def ok
      log "----  Order Errors  ----"
      log browser_helper.text error_message_label
      log "----  Order Errors  ----"
      browser_helper.click okay_button, "OK"
      self
    end

  end
end