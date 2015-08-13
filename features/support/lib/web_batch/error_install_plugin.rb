module Batch
  class ErrorInstallPlugin < BatchPage
    private

    def error_message_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    def window_x_button
      @browser.img :css => "img[class$=x-tool-close]"
    end

    public
    def close
      log "Closing Plugin not Installed Window"
      browser_helper.click window_x_button
      log "Plugin not Installed Window Closed"
    end

    def present?
      err = ""
      begin
        err = browser_helper.text error_message_label
      rescue
        #ignore
      end
      present = (err).include? "Install Plugin"
      if present
        log "Plug-in is not installed.  Install  Plugin Window is Present"
        log error_message
      end
      present
    end

    def error_message
      browser_helper.text error_message_label
    end
  end
end