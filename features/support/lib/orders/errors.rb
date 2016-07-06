module Stamps
  module Orders

    class ServerError < Browser::Modal
      def present?
        (browser.divs(text: "Server Error").last).present?
      end

      def message
        logger.info "Server Error"
        browser_helper.text browser.divs(css: "div[id^=dialoguemodal-][id$=-body][class*=sdc-warning]>div>div").last
      end

      def ok
        20.times do
          button = browser.spans(text: "OK").last
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

    class OrderError < Browser::Modal

      protected

      def window_title
        browser.div :text => 'Order Error'
      end

      def ok_button_span
        browser.span :text => 'OK'
      end

      def error_message_label
        browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
      end

      public

      def present?
        window_title.present?
      end

      def ok
        5.times {
          begin
            browser_helper.click ok_button_span, 'OK'
            break unless ok_button_span.present?
          rescue
            #ignore
          end
        }
      end

      def error_message
        error_message = browser_helper.text error_message_label

        logger.info "----  Order Errors  ----"
        logger.info error_message
        logger.info "----  Order Errors  ----"

        error_message
      end

    end

    class IncompleteOrderError < Browser::Modal
      private

      def error_message_label
        browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
      end

      def window_title
        order_errors = browser.div text: 'Order Errors'
        order_error = browser.div text: 'Order Error'
        if order_errors.present?
          order_errors
        elsif order_error.present?
          order_error
        else
          nil
        end
      end

      def cancel_button
        browser.span text: "Cancel"
      end

      def ok
        ok_btn = BrowserElement.new browser.span(text: "OK")
        10.times{
          ok_btn.safe_click
          break unless ok_btn.present?
        }
      end

      def error_message
        browser_helper.text browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]")
      end

      def present?
        browser.div(text: "Incomplete Order").present?
      end

      def continue
        5.times{
          begin
            browser_helper.click continue_button, "Continue"
            break unless continue_button.present?
          rescue
            #ignore
          end
        }
        PrintModal.new param
      end

      def cancel
        5.times{
          begin
            browser_helper.click cancel_button, "ok"
            break unless cancel_button.present?
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

    class RatingError < Browser::Modal
      private
      def rating_error_p
        browser.p :css => 'div[class=x-autocontainer-innerCt]>p:nth-child(1)'
      end

      def ok_button
        browser.span :text => 'OK'
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
        ok_button.present?
      end

      def OK
        logger.info "----  Rating Error  ----"
        logger.info browser_helper.text rating_error_p
        logger.info "----  Rating Error  ----"
        5.times {
          browser_helper.click ok_button, 'OK'
          break unless present?
        }
      end

      def error_message
        browser_helper.text rating_error_p
      end

    end

    class ErrorStampsPluginIssue < Browser::Modal
      private
      def close_window_button
        img = browser.img css: "img[class='x-tool-img x-tool-close']"
        logger.info "#{(img.present?)?'Stamps.com Plugin Issue':''}"
        img
      end

      def window_title
        browser.div :text => "Stamps.com Plugin Issue"
      end

      public
      def present?
        (BrowserElement.new window_title).present?
      end

      def close
        browser_helper.click close_window_button, 'close'
      end
    end

    class NawsPluginError < Browser::Modal
      private
      def error_code_p
        browser.p :css => "div[class=x-autocontainer-innerCt][id^=dialoguemodal]"
      end

      def ok_button
        browser.span :text => 'OK'
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
          logger.info "NAWS Plugin Error detected.  Error code: [1009]"
          logger.info error_code_p
        end
        present
      end
    end

    class ErrorInstallPlugin < Browser::Modal
      private

      def error_message_label
        browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
      end

      def window_x_button
        browser.img :css => "img[class$=x-tool-close]"
      end

      public
      def close
        logger.info "Closing Plugin not Installed Window"
        browser_helper.click window_x_button
        logger.info "Plugin not Installed Window Closed"
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
          logger.info "Plug-in is not installed.  Install  Plugin Window is Present"
          logger.info error_message
        end
        present
      end

      def error_message
        browser_helper.text error_message_label
      end
    end

    class ErrorConnectingToPlugin < Browser::Modal
      private

      def error_message_label
        browser.div :css => "div[class='x-autocontainer-innerCt'][id^=dialoguemodal]"
      end

      def error_code
        browser.p :text => "Error code: [1010]"
      end

      def ok_button
        browser.span :text => 'OK'
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
          logger.info "Stamps.com is currently connecting to the plug-in. Error code: [1010]\n#############################################"
          logger.info error_code
          logger.info "Stamps.com is currently connecting to the plug-in. Error code: [1010]\n#############################################"
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

=begin
  def print_error_message
    ptags = browser.ps :css => "div[class=x-autocontainer-innerCt][id^=dialoguemodal]>p"
    logger.info "-- Print Plugin Error [Error code: [1009]]--"
    ptags.each {|p_tag|
      if helper.present? p_tag
        logger.info "\n#{helper.text p_tag}"
      end
    }
    logger.info "-- Print Plugin Error [Error code: [1009]]--"
    self
  end

  def ok
    print_error_message
    helper.click ok_button, "OK"
    self
  end
=end

  end
end