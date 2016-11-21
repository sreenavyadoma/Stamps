module Stamps
  module Orders
    module Stores
      class Error400 < Browser::Modal

        def close
          button = ElementWrapper.new (browser.imgs(css: "img[class*=x-tool-close]").last)
          5.times do
            button.safe_click
            sleep 1
            break unless button.present?
          end
        end

        def window_title
          ElementWrapper.new browser.div(text: "Error 400")
        end

        def present?
          window_title.present?
        end

        def ok
          button = ElementWrapper.new (browser.span(text: "OK"))
          5.times do
            button.safe_click
            sleep 1
            break unless button.present?
          end
        end

        def text
          element_helper.text (browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class*=x-autocontainer-innerCt]"))
        end
      end

      class EmailVerificationSent < Browser::Modal

        def window_title
          ElementWrapper.new browser.div(text: "Email Verification Sent")
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
          button = ElementWrapper.new (browser.imgs(css: "img[class*='x-tool-close']").last)
          5.times do
            button.safe_click
            sleep 1
            break unless button.present?
          end
        end

        def text
          element_helper.text browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class='x-autocontainer-innerCt']")
        end

        def email
          text.scan( /We sent a verification email to (.*)./).last.first
        end
      end

      class EmailVerificationRequired < Browser::Modal

        def window_title
          ElementWrapper.new browser.div(text: "Email Verification Required")
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
          button = ElementWrapper.new (browser.imgs(css: "img[class*=x-tool-close]").last)
          5.times do
            button.safe_click
            sleep 1
            break unless button.present?
          end
        end

        def send_email_verification
          button = ElementWrapper.new (browser.spans(text: "Send Email Verification").last)
          verification_sent = EmailVerificationSent.new param
          error = Error400.new param
          10.times do
            button.safe_click
            verification_sent.wait_until_present
            return verification_sent if verification_sent.present?
            if error.present?
              text = error.text
              logger.info text
              error.ok
              raise text
            end
          end
        end
      end

      class PayPal < Browser::Modal

        def window_title
          ElementWrapper.new browser.div(text: "Connect your PayPal Store")
        end

        def present?
          window_title.present?
        end

        def email_address
          TextboxElement.new (browser.inputs(css: "input[name^=textfield-][name$=-inputEl]").last)
        end

        def test_connection
          button = ElementWrapper.new browser.span(text: "Test Connection")
          verification_required = EmailVerificationRequired.new param
          10.times do
            button.safe_click
            verification_required.wait_until_present
            return verification_required if verification_required.present?
          end
        end

        def close
          button = ElementWrapper.new (browser.imgs(css: "img[class*=x-tool-close]").last)
          5.times do
            button.safe_click
            sleep 1
            break unless button.present?
          end
        end
      end
    end
  end
end