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
          StampsElement.new browser.div(text: "Paypal Email Verification Sent")
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
          StampsElement.new browser.div(text: "Paypal Email Verification Required")
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
          verification_sent = EmailVerificationSent.new(param)
          error = Error400.new(param)
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

        def frame
          browser.iframe(css: "iframe[id=storeiframe]")
        end

        def store_modal
          StampsElement.new browser.div(css: "div[id^='storeiframewindow'][id$='header']")
        end

        def store_icon
          StampsElement.new frame.img(css: "img[src*=paypalbanner]")
        end

        def present?
          store_modal.present? && store_icon.present?
        end

        def email_address
          StampsTextbox.new frame.text_field(css: "input[id=paypalEmailField]")
        end

        def verify_email
          button = StampsElement.new frame.span(text: "Verify Email")
          connect_to_store = ConnectYourPaypalStore.new(param)
          button.click
          sleep 5
          connect_to_store if connect_to_store.present?
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

      class ConnectYourPaypalStore < Browser::StampsModal

        def frame
          browser.iframe(css: "iframe[id=storeiframe]")
        end

        def store_icon
          StampsElement.new frame.img(css: "img[src*=paypalbanner]")
        end

        def present?
          restrict_to_email_address.present? && store_icon.present?
        end

        def connect
          button = StampsElement.new(browser.span(text: "Connect"))
          store_settings = StoreSettings.new(param)
          10.times do
            button.click
            store_settings.wait_until_present
            return store_settings if store_settings.present?
          end

        end

        def radio_transaction_id
          frame.radio(css: 'input[id=transactionID]').set
        end

        def radio_invoice_number
          frame.radio(css: 'input[id=invoiceNo]').set
        end

        def radio_import_all_transactions
          frame.radio(css: 'input[id=importAlltransations]').set
        end

        def radio_import_selected_types
          frame.radio(css: 'input[id=selectImport]').set
        end

        def restrict_to_email_address
          StampsTextbox.new frame.text_field(css: "input[id=toemail]")
        end

        def type_cart
          input = frame.input(css: 'input[id=cart]')
          verify = frame.input(css: 'input[id=cart]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_web_accept
          input = frame.input(css: 'input[id=webaccept]')
          verify = frame.input(css: 'input[id=webaccept]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_express_checkout
          input = frame.input(css: 'input[id=expresscheckout]')
          verify = frame.input(css: 'input[id=expresscheckout]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_send_money
          input = frame.input(css: 'input[id=sendmoney]')
          verify = frame.input(css: 'input[id=sendmoney]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_virtual_terminal
          input = frame.input(css: 'input[id=virtualterminal]')
          verify = frame.input(css: 'input[id=virtualterminal]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_subscription_payment
          input = frame.input(css: 'input[id=subscrpayment]')
          verify = frame.input(css: 'input[id=subscrpayment]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_merchant_payment
          input = frame.input(css: 'input[id=merchpmt]')
          verify = frame.input(css: 'input[id=merchpmt]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_mass_payment
          input = frame.input(css: 'input[id=masspay]')
          verify = frame.input(css: 'input[id=masspay]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_integral_evolution
          input = frame.input(css: 'input[id=integralevoluton]')
          verify = frame.input(css: 'input[id=integralevoluton]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_website_payments_pro_hosted
          input = frame.input(css: 'input[id=prohosted]')
          verify = frame.input(css: 'input[id=prohosted]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_website_payments_pro_api
          input = frame.input(css: 'input[id=proapi]')
          verify = frame.input(css: 'input[id=proapi]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

      end
    end
  end
end