module Batch
  class ErrorInstallPlugin < BatchPage
    private

    def error_message_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    public

    def present?
      present = (browser_helper.text error_message_label).include? "Install Plugin"
      if present
        log "Plug-in is not installed.  Install  Plugin Window is Present"
        log error_message
        raise "Install  Plugin!"
      end
      present
    end

    def error_message
      browser_helper.text error_message_label
    end
  end
end