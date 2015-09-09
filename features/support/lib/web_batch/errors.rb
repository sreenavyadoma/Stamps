module Batch
  class PrintingError < StandardError
    attr_reader :object

    def initialize(object)
      @object = object
    end
  end

  class OrderError < BatchObject

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

  class OrderErrors < BatchObject
    private

    def error_message_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    def window_title
      order_errors = @browser.div :text => 'Order Errors'
      order_error = @browser.div :text => 'Order Error'
      if browser_helper.present? order_errors
        order_errors
      elsif browser_helper.present? order_error
        order_error
      else
        nil
      end
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

  class RatingError < BatchObject
    private
    def rating_error_p
      @browser.p :css => 'div[class=x-autocontainer-innerCt]>p:nth-child(1)'
    end

    def ok_button
      @browser.span :text => 'OK'
    end

    public
    def wait_until_present
      begin
        ok_button.wait_until_present
      rescue
        #ignore
      end
      self
    end

    def present?
      browser_helper.present? ok_button
    end

    def OK
      log "----  Rating Error  ----"
      log browser_helper.text rating_error_p
      log "----  Rating Error  ----"
      5.times {
        browser_helper.click ok_button, 'OK'
        break unless present?
      }
    end

    def error_message
      browser_helper.text rating_error_p
    end

  end

  class ErrorStampsPluginIssue < BatchObject
    private
    def close_window_button
      img = @browser.img :css => "img[class='x-tool-img x-tool-close']"
      log "#{(browser_helper.present? img)?'Stamps.com Plugin Issue':''}"
      img
    end

    def window_title
      div = @browser.div :text => "Stamps.com Plugin Issue"
      log "#{(browser_helper.present? div)?'Stamps.com Plugin Issue':''}"
      div
    end

    public
    def present?
      browser_helper.present? window_title
    end

    def close
      browser_helper.click close_window_button, 'close'
    end
  end

  class NawsPluginError < Stamps::BrowserObject
    private
    def error_code_p
      @browser.p :css => "div[class=x-autocontainer-innerCt][id^=dialoguemodal]"
    end

    def ok_button
      @browser.span :text => 'OK'
    end

    public
    def present?
      err = ""
      begin
        err = browser_helper.text error_code_p
      rescue
        #ignore
      end

      present = err.include? "Error code: [1009]"
      if present
        log "NAWS Plugin Error detected.  Error code: [1009]"
        log error_code_p
      end
      present
    end

    def print_error_message
      ptags = @browser.ps :css => "div[class=x-autocontainer-innerCt][id^=dialoguemodal]>p"
      log "-- Print Plugin Error [Error code: [1009]]--"
      ptags.each {|p_tag|
        if browser_helper.present? p_tag
          log "\n#{browser_helper.text p_tag}"
        end
      }
      log "-- Print Plugin Error [Error code: [1009]]--"
      self
    end

    def ok
      print_error_message
      browser_helper.click ok_button, "OK"
      self
    end
  end

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

  class ErrorConnectingToPlugin < BatchObject
    private

    def error_message_label
      @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
    end

    def error_code
	  @browser.p :text => "Error code: [1010]"
    end

    def ok_button
      @browser.span :text => 'OK'
    end

    public
    def error_message
      browser_helper.text error_message_label
    end

    def wait_until_present
      begin
        error_message_label.wait_until_present
      rescue
        #ignroe
      end
      self
    end

    def present?
      err = ""
      begin
        err = browser_helper.text error_code
      rescue
        #ignore
      end

      present = err.include? "Error code: [1010]"
      if present
        log "Stamps.com is currently connecting to the plug-in. Error code: [1010]\n#############################################"
        log error_code
        log "Stamps.com is currently connecting to the plug-in. Error code: [1010]\n#############################################"
      end
      present
    end

    def ok
      10.times {
        browser_helper.click ok_button, 'OK'
        break unless present?
      }
    end

  end
end
