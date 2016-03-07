module Orders

  class ServerError < OrdersObject
    def present?
      window_title = @browser.divs(text: "Server Error").last
      #log.info "Server Error" if browser_helper.present? window_title
      browser_helper.present? window_title
    end

    def message
      log.info "Server Error"
      browser_helper.text @browser.divs(css: "div[id^=dialoguemodal-][id$=-body][class*=sdc-warning]>div>div").last
    end

    def ok
      20.times do
        button = @browser.spans(text: "OK").last
        browser_helper.safe_click button
        browser_helper.safe_click button
        sleep 1
        break unless present?
      end
    end

  end

  class PrintingError < StandardError
    attr_reader :object

    def initialize(object)
      @object = object
    end
  end

  class OrderError < OrdersObject

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

      log.info "----  Order Errors  ----"
      log.info error_message
      log.info "----  Order Errors  ----"

      error_message
    end

  end

  class IncompleteOrderError < OrdersObject
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

    def cancel_button
      @browser.span :text => "Cancel"
    end

    def ok
      ok_btn = StampsButton.new @browser.span(text: "OK")
      10.times{
        ok_btn.safe_click
        break unless ok_btn.present?
      }
    end

    def error_message
      browser_helper.text @browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
    end

    def present?
      browser_helper.present? @browser.div(text: "Incomplete Order")
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
      PrintModal.new(@browser)
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

  class RatingError < OrdersObject
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
      log.info "----  Rating Error  ----"
      log.info browser_helper.text rating_error_p
      log.info "----  Rating Error  ----"
      5.times {
        browser_helper.click ok_button, 'OK'
        break unless present?
      }
    end

    def error_message
      browser_helper.text rating_error_p
    end

  end

  class ErrorStampsPluginIssue < OrdersObject
    private
    def close_window_button
      img = @browser.img :css => "img[class='x-tool-img x-tool-close']"
      log.info "#{(browser_helper.present? img)?'Stamps.com Plugin Issue':''}"
      img
    end

    def window_title
      div = @browser.div :text => "Stamps.com Plugin Issue"
      log.info "#{(browser_helper.present? div)?'Stamps.com Plugin Issue':''}"
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

  class NawsPluginError < OrdersObject
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
        log.info "NAWS Plugin Error detected.  Error code: [1009]"
        log.info error_code_p
      end
      present
    end
  end

  def print_error_message
    ptags = @browser.ps :css => "div[class=x-autocontainer-innerCt][id^=dialoguemodal]>p"
    log.info "-- Print Plugin Error [Error code: [1009]]--"
    ptags.each {|p_tag|
      if browser_helper.present? p_tag
        log.info "\n#{browser_helper.text p_tag}"
      end
    }
    log.info "-- Print Plugin Error [Error code: [1009]]--"
    self
  end

  def ok
    print_error_message
    browser_helper.click ok_button, "OK"
    self
  end
end

class ErrorInstallPlugin < OrdersObject
  private

  def error_message_label
    @browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
  end

  def window_x_button
    @browser.img :css => "img[class$=x-tool-close]"
  end

  public
  def close
    log.info "Closing Plugin not Installed Window"
    browser_helper.click window_x_button
    log.info "Plugin not Installed Window Closed"
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
      log.info "Plug-in is not installed.  Install  Plugin Window is Present"
      log.info error_message
    end
    present
  end

  def error_message
    browser_helper.text error_message_label
  end
end

class ErrorConnectingToPlugin < OrdersObject
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
      log.info "Stamps.com is currently connecting to the plug-in. Error code: [1010]\n#############################################"
      log.info error_code
      log.info "Stamps.com is currently connecting to the plug-in. Error code: [1010]\n#############################################"
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

