module Stamps
  module Orders
    module Stores
      class Error400 < Browser::StampsModal

        def close
          button = StampsElement.new(browser.imgs(css: "img[class*=x-tool-close]").last)
          5.times do
            button.click
            sleep(0.35)
            break unless button.present?
          end
        end

        def window_title
          StampsElement.new browser.div(text: "Error 400")
        end

        def present?
          window_title.present?
        end

        def ok
          button = StampsElement.new(browser.span(text: "OK"))
          5.times do
            button.click
            sleep(0.35)
            break unless button.present?
          end
        end

        def text
          StampsElement.new(browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class*=x-autocontainer-innerCt]")).text
        end
      end

      class EmailVerificationSent < Browser::StampsModal

        def window_title
          StampsElement.new browser.div(text: "Email Verification Sent")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window = window_title
          3.times do
            break if window.present?
            sleep(0.35)
          end
        end

        def close
          button = StampsElement.new(browser.imgs(css: "img[class*='x-tool-close']").last)
          5.times do
            button.click
            sleep(0.35)
            break unless button.present?
          end
        end

        def text
          StampsElement.new(browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class='x-autocontainer-innerCt']")).text
        end

        def email
          text.scan( /We sent a verification email to (.*)./).last.first
        end
      end

      class EmailVerificationRequired < Browser::StampsModal

        def window_title
          StampsElement.new browser.div(text: "Email Verification Required")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window = window_title
          5.times do
            break if window.present?
            sleep(0.35)
          end
        end

        def close
          button = StampsElement.new(browser.imgs(css: "img[class*=x-tool-close]").last)
          5.times do
            button.click
            sleep(0.35)
            break unless button.present?
          end
        end

        def send_email_verification
          button = StampsElement.new(browser.spans(text: "Send Email Verification").last)
          verification_sent = EmailVerificationSent.new(modal_param)
          error = Error400.new(modal_param)
          10.times do
            button.click
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

      class PayPal < Browser::StampsModal

        def window_title
          StampsElement.new browser.div(text: "Connect your PayPal Store")
        end

        def present?
          window_title.present?
        end

        def email_address
          StampsTextBox.new(browser.inputs(css: "input[name^=textfield-][name$=-inputEl]").last)
        end

        def test_connection
          button = StampsElement.new browser.span(text: "Test Connection")
          verification_required = EmailVerificationRequired.new(modal_param)
          10.times do
            button.click
            verification_required.wait_until_present
            return verification_required if verification_required.present?
          end
        end

        def close
          button = StampsElement.new(browser.imgs(css: "img[class*=x-tool-close]").last)
          5.times do
            button.click
            sleep(0.35)
            break unless button.present?
          end
        end
      end
    end
  end
end