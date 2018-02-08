module Stamps
  module Orders
    module Stores

      class Error400 < Browser::Base

        def close
          button = StampsField.new(browser.imgs(css: "img[class*=x-tool-close]").last)
          5.times do
            button.click
            sleep(0.35)
            break unless button.present?
          end
        end

        def window_title
          StampsField.new browser.div(text: "Error 400")
        end

        def present?
          window_title.present?
        end

        def ok
          button = StampsField.new(browser.span(text: "OK"))
          5.times do
            button.click
            sleep(0.35)
            break unless button.present?
          end
        end

        def text
          StampsField.new(browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class*=x-autocontainer-innerCt]")).text
        end
      end

      class EmailVerificationSent < Browser::Base

        def window_title
          StampsField.new browser.div(text: "Paypal Email Verification Sent")
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
          button = StampsField.new(browser.imgs(css: "img[class*='x-tool-close']").last)
          5.times do
            button.click
            sleep(0.35)
            break unless button.present?
          end
        end

        def text
          StampsField.new(browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class='x-autocontainer-innerCt']")).text
        end

        def email
          text.scan( /We sent a verification email to (.*)./).last.first
        end
      end

      class EmailVerificationRequired < Browser::Base

        def window_title
          StampsField.new browser.div(text: "Paypal Email Verification Required")
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
          button = StampsField.new(browser.imgs(css: "img[class*=x-tool-close]").last)
          5.times do
            button.click
            sleep(0.35)
            break unless button.present?
          end
        end

        def send_email_verification
          button = StampsField.new(browser.spans(text: "Send Email Verification").last)
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

      class PayPalEmailVerSent < Browser::Base
        def confirm_token

        end
      end

      class PayPalEmailVer < Browser::Base
        def send_email_verification

        end
      end

      module PayPalWindowTitle
        def window_title
          StampsField.new(browser.divs(css: "[id^=storeiframewindow-][id$=_header-targetEl] [class*=x-title-item]").first)
        end

        def x_btn
          cache[:x_btn].nil? || !cache[:x_btn].present? ? cache[:x_btn] = StampsField.new(browser.imgs(css: "[id^=storeiframewindow-][id$=_header-targetEl] img").first) : cache[:x_btn]
        end
      end

      module PayPalModals
        def email_verification_modal
          raise 'Not Implemented.'
        end
      end

      class PayPal < Browser::Base
        include PayPalModals
        include PayPalWindowTitle

        def iframe
          browser.iframe(css: "[id=storeiframe]")
        end

        def present?
          window_title.present?
        end

        def store_modal
          cache[:store_modal].nil? || !cache[:store_modal].present? ? cache[:store_modal] = StampsField.new(browser.div(css: "div[id^='storeiframewindow'][id$='header']")) : cache[:store_modal]
        end

        def store_icon
          cache[:store_icon].nil? || !cache[:store_icon].present? ? cache[:store_icon] = StampsField.new(iframe.img(css: "img[src*=paypalbanner]")) : cache[:store_icon]
        end

        def email_address
          cache[:email_address].nil? || !cache[:email_address].present? ? cache[:email_address] = StampsTextbox.new(iframe.text_field(css: "[class*=paypalEmailField]")) : cache[:email_address]
        end

        def verify_email_field
          cache[:verify_email_field].nil? || !cache[:verify_email_field].present? ? cache[:verify_email_field] = StampsField.new(iframe.button(css: "[ng-click='paypal.testConnection()']")) : cache[:verify_email_field]
        end

        def verify_email
          button = StampsField.new(iframe.span(text: "Verify Email"))
          connect_to_store = ConnectYourPaypalStore.new(param)
          button.click
          sleep 5
          connect_to_store if connect_to_store.present?
        end
      end

      class ConnectYourPaypalStore < Browser::Base

        def iframe
          browser.iframe(css: "[id=storeiframe]")
        end
        def store_icon
          StampsField.new(iframe.img(css: "img[src*=paypalbanner]"))
        end

        def present?
          restrict_to_email_address.present? && store_icon.present?
        end

        def connect
          button = StampsField.new(browser.span(text: "Connect"))
          store_settings = StoreSettings.new(param)
          10.times do
            button.click
            store_settings.wait_until_present
            return store_settings if store_settings.present?
          end

        end

        def radio_transaction_id
          iframe.radio(css: 'input[id=transactionID]').set
        end

        def radio_invoice_number
          iframe.radio(css: 'input[id=invoiceNo]').set
        end

        def radio_import_all_transactions
          iframe.radio(css: 'input[id=importAlltransations]').set
        end

        def radio_import_selected_types
          iframe.radio(css: 'input[id=selectImport]').set
        end

        def restrict_to_email_address
          if cache[:restrict_to_email].nil? || !cache[:restrict_to_email].present?
            cache[:restrict_to_email] = StampsTextbox.new(iframe.text_field(css: "input[id=toemail]"))
          end
          cache[:restrict_to_email]
        end

        def type_cart
          cache[:type_cart].nil? || !cache[:type_cart].present? ? cache[:type_cart] = Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=cart]'), iframe.input(css: 'input[id=cart]'), "class", "ng_not_empty") : cache[:type_cart]
        end

        def type_web_accept
          cache[:type_web_accept].nil? || !cache[:type_web_accept].present? ? cache[:type_web_accept] = Stamps::Browser::StampsCheckbox.new(
              iframe.input(css: 'input[id=webaccept]'), iframe.input(css: 'input[id=webaccept]'), "class", "ng_not_empty") : cache[:type_web_accept]
        end

        def type_express_checkout
          cache[:type_express_checkout].nil? || !cache[:type_express_checkout].present? ? cache[:type_express_checkout] = Stamps::Browser::StampsCheckbox.new(
              iframe.input(css: 'input[id=expresscheckout]'), iframe.input(css: 'input[id=expresscheckout]'), "class", "ng_not_empty") : cache[:type_express_checkout]
        end

        def type_send_money
          #(cache[:xxxx].nil?||!cache[:xxxx].present?)?cache[:xxxx]=Bbbbbbbbb.bbbbbb:cache[:xxxx]
          Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=sendmoney]'), iframe.input(css: 'input[id=sendmoney]'), "class", "ng_not_empty")
        end

        def type_virtual_terminal
          #(cache[:xxxx].nil?||!cache[:xxxx].present?)?cache[:xxxx]=Bbbbbbbbb.bbbbbb:cache[:xxxx]
          Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=virtualterminal]'), iframe.input(css: 'input[id=virtualterminal]'), "class", "ng_not_empty")
        end

        def type_subscription_payment
          #(cache[:xxxx].nil?||!cache[:xxxx].present?)?cache[:xxxx]=Bbbbbbbbb.bbbbbb:cache[:xxxx]
          Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=subscrpayment]'), iframe.input(css: 'input[id=subscrpayment]'), "class", "ng_not_empty")
        end

        def type_merchant_payment
          #(cache[:xxxx].nil?||!cache[:xxxx].present?)?cache[:xxxx]=Bbbbbbbbb.bbbbbb:cache[:xxxx]
          Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=merchpmt]'), iframe.input(css: 'input[id=merchpmt]'), "class", "ng_not_empty")
        end

        def type_mass_payment
          #(cache[:xxxx].nil?||!cache[:xxxx].present?)?cache[:xxxx]=Bbbbbbbbb.bbbbbb:cache[:xxxx]
          Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=masspay]'), iframe.input(css: 'input[id=masspay]'), "class", "ng_not_empty")
        end

        def type_integral_evolution
          #(cache[:xxxx].nil?||!cache[:xxxx].present?)?cache[:xxxx]=Bbbbbbbbb.bbbbbb:cache[:xxxx]
          Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=integralevoluton]'), iframe.input(css: 'input[id=integralevoluton]'), "class", "ng_not_empty")
        end

        def type_website_payments_pro_hosted
          #(cache[:xxxx].nil?||!cache[:xxxx].present?)?cache[:xxxx]=Bbbbbbbbb.bbbbbb:cache[:xxxx]
          Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=prohosted]'), iframe.input(css: 'input[id=prohosted]'), "class", "ng_not_empty")
        end

        def type_website_payments_pro_api
          #(cache[:xxxx].nil?||!cache[:xxxx].present?)?cache[:xxxx]=Bbbbbbbbb.bbbbbb:cache[:xxxx]
          Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=proapi]'), iframe.input(css: 'input[id=proapi]'), "class", "ng_not_empty")
        end

      end

    end
  end
end