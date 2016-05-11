module Orders
  module Stores

    class Error400 < OrdersObject

      def close
        button = StampsButton.new (@browser.imgs(css: "img[class*=x-tool-close]").last)
        5.times do
          button.safe_click
          sleep 1
          break unless button.present?
        end
      end

      def window_title
        StampsLabel.new @browser.div(text: "Error 400")
      end

      def present?
        window_title.present?
      end

      def ok
        button = StampsButton.new (@browser.span(text: "OK"))
        5.times do
          button.safe_click
          sleep 1
          break unless button.present?
        end
      end

      def text
        browser_helper.text (@browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class*=x-autocontainer-innerCt]"))
      end

    end
    class EmailVerificationSent < OrdersObject

      def window_title
        StampsLabel.new @browser.div(text: "Email Verification Sent")
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window = window_title
        3.times do
          break if window.present?
          sleep 1
        end
      end

      def close
        button = StampsButton.new (@browser.imgs(css: "img[class*='x-tool-close']").last)
        5.times do
          button.safe_click
          sleep 1
          break unless button.present?
        end
      end

      def text
        browser_helper.text @browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class='x-autocontainer-innerCt']")
      end

      def email
        text.scan( /We sent a verification email to (.*)./).last.first
      end
    end

    class EmailVerificationRequired < OrdersObject

      def window_title
        StampsLabel.new @browser.div(text: "Email Verification Required")
      end

      def present?
        window_title.present?
      end

      def wait_until_present
        window = window_title
        5.times do
          break if window.present?
          sleep 1
        end
      end

      def close
        button = StampsButton.new (@browser.imgs(css: "img[class*=x-tool-close]").last)
        5.times do
          button.safe_click
          sleep 1
          break unless button.present?
        end
      end

      def send_email_verification
        button = StampsButton.new (@browser.spans(text: "Send Email Verification").last)
        verification_sent = EmailVerificationSent.new @browser
        error = Error400.new @browser
        10.times do
          button.safe_click
          verification_sent.wait_until_present
          return verification_sent if verification_sent.present?
          if error.present?
            text = error.text
            log.info text
            error.ok
            raise text
          end
        end
      end
    end

    class PayPal < OrdersObject

      def window_title
        StampsLabel.new @browser.div(text: "Connect your PayPal Store")
      end

      def present?
        window_title.present?
      end

      def email_address
        StampsTextbox.new (@browser.inputs(css: "input[name^=textfield-][name$=-inputEl]").last)
      end

      def test_connection
        button = StampsButton.new @browser.span(text: "Test Connection")
        verification_required = EmailVerificationRequired.new @browser
        10.times do
          button.safe_click
          verification_required.wait_until_present
          return verification_required if verification_required.present?
        end
      end

      def close
        button = StampsButton.new (@browser.imgs(css: "img[class*=x-tool-close]").last)
        5.times do
          button.safe_click
          sleep 1
          break unless button.present?
        end
      end
    end
  end
end
