module Batch
  class ErrorInstallPlugin < BatchPage
    private
    def window_title
      div = @browser.div :text => "Install  Plugin"
      present = browser_helper.present? div
      if present
        log "Plug-in is not installed.  Install  Plugin Window is Present"
        log error_message
        raise "Install  Plugin!"
      end
      div
    end

    def error_message_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    public

    def present?
      browser_helper.present? window_title
    end

    def error_message
      browser_helper.text error_message_label
    end
  end
end