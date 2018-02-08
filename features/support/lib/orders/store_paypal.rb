module Stamps
  module Orders
    module Stores
      module StoresIframe
        def iframe
          (cache[:iframe].nil?)?cache[:iframe]=browser.iframe(css: "[id=storeiframe]"):cache[:iframe]
        end
      end

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
        def confirm_token                  #This modal requires the user to verify receipt of email, which is outside of scope for automation
          raise 'Not Implemented.'
        end
      end

      class PayPalEmailVer < Browser::Base
        def send_email_verification        #This modal requires the user to verify receipt of email, which is outside of scope for automation
          raise 'Not Implemented.'
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
        def email_verification_modal        #This modal requires the user to verify receipt of email, which is outside of scope for automation
          raise 'Not Implemented.'
        end
      end


      class PayPal < Browser::Base
        include PayPalModals
        include PayPalWindowTitle
        include StoresIframe

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

        def verify_email_button
          (cache[:verify_email_button].nil?||!cache[:verify_email_button].present?)?cache[:verify_email_button]=StampsField.new(iframe.span(text: "Verify Email")):cache[:verify_email_button]
        end

        def verify_email
          connect_to_store=ConnectYourPaypalStore.new(param)
          20.times do
            return connect_to_store if connect_to_store.present?
            verify_email_button.click
            sleep(2)
          end
        end
      end

      class ConnectYourPaypalStore < Browser::Base
        include StoresIframe
        def store_icon
          (cache[:verify_email_button].nil?||!cache[:verify_email_button].present?)?cache[:verify_email_button]=StampsField.new(iframe.img(css: "img[src*=paypalbanner.png]")):cache[:verify_email_button]
        end

        def present?
          restrict_to_email_address.present?
        end

        def connect_button
          (cache[:connect_button].nil?||!cache[:connect_button].present?)?cache[:connect_button]=StampsField.new(iframe.span(text: "Connect")):cache[:connect_button]
        end

        def connect              #Click connect button to connect to Paypal Store and bring up Store Settings modal
          store_settings=StoreSettings.new(param)
          10.times do
            connect_button.click
            store_settings.wait_until_present
            return store_settings if store_settings.present?
          end
        end

        def radio_transaction_id
          (cache[:radio_transaction_id].nil?||!cache[:radio_transaction_id].present?)?cache[:radio_transaction_id]=StampsRadio.new(iframe.radio(css: 'input[id=transactionID]'), iframe.radio(css: 'input[id=transactionID]'), "class", "ng-valid-parse"):cache[:radio_transaction_id]
        end

        def radio_invoice_number
          (cache[:radio_invoice_number].nil?||!cache[:radio_invoice_number].present?)?cache[:radio_invoice_number]=StampsRadio.new(iframe.radio(css: 'input[id=invoiceNo]'), iframe.radio(css: 'input[id=invoiceNo]'), "class", "ng-valid-parse"):cache[:radio_invoice_number]
        end

        def radio_import_all_transactions
          (cache[:radio_import_all_transactions].nil?||!cache[:radio_import_all_transactions].present?)?cache[:radio_import_all_transactions]=StampsRadio.new(iframe.radio(css: 'input[id=importAllTransations]'), iframe.radio(css: 'input[id=importAllTransations]'), "class", "ng-valid-parse"):cache[:radio_import_all_transactions]
        end

        def radio_import_selected_types
          (cache[:radio_import_selected_types].nil?||!cache[:radio_import_selected_types].present?)?cache[:radio_import_selected_types]=StampsRadio.new(iframe.radio(css: 'input[id=selectImport]'), iframe.radio(css: 'input[id=selectImport]'), "class", "ng-valid-parse"):cache[:radio_import_selected_types]
        end

        def restrict_to_email_address
          (cache[:restrict_to_email].nil?||!cache[:restrict_to_email].present?)?cache[:restrict_to_email]=StampsTextbox.new(iframe.text_field(css: "input[id=toEmail]")):cache[:restrict_to_email]
        end

        def type_cart
          (cache[:type_cart].nil?||!cache[:type_cart].present?)?cache[:type_cart]=Stamps::Browser::StampsCheckbox.new(
              iframe.input(css: 'input[id=cart]'), iframe.input(css: 'input[id=cart]'), "class", "ng-not-empty"):cache[:type_cart]
        end

        def type_web_accept
          (cache[:type_web_accept].nil?||!cache[:type_web_accept].present?)?cache[:type_web_accept]=Stamps::Browser::StampsCheckbox.new(
              iframe.input(css: 'input[id=webaccept]'), iframe.input(css: 'input[id=webaccept]'), "class", "ng-not-empty"):cache[:type_web_accept]
        end

        def type_express_checkout
          (cache[:type_express_checkout].nil?||!cache[:type_express_checkout].present?)?cache[:type_express_checkout]=
              Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=expresscheckout]'), iframe.input(css: 'input[id=expresscheckout]'), "class", "ng-not-empty"):cache[:type_express_checkout]
        end

        def type_send_money
          (cache[:type_send_money].nil?||!cache[:type_send_money].present?)?cache[:type_send_money]=
              Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=sendmoney]'), iframe.input(css: 'input[id=sendmoney]'), "class", "ng-not-empty"):cache[:type_send_money]
        end

        def type_virtual_terminal
          (cache[:type_virtual_terminal].nil?||!cache[:type_virtual_terminal].present?)?cache[:type_virtual_terminal]=
              Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=virtualterminal]'), iframe.input(css: 'input[id=virtualterminal]'), "class", "ng-not-empty"):cache[:type_virtual_terminal]
        end

        def type_subscription_payment
          (cache[:type_subscription_payment].nil?||!cache[:type_subscription_payment].present?)?cache[:type_subscription_payment]=
              Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=subscrpayment]'), iframe.input(css: 'input[id=subscrpayment]'), "class", "ng-not-empty"):cache[:type_subscription_payment]
        end

        def type_merchant_payment
          (cache[:type_merchant_payment].nil?||!cache[:type_merchant_payment].present?)?cache[:type_merchant_payment]=
              Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=merchpmt]'), iframe.input(css: 'input[id=merchpmt]'), "class", "ng-not-empty"):cache[:type_merchant_payment]
        end

        def type_mass_payment
          (cache[:type_mass_payment].nil?||!cache[:type_mass_payment].present?)?cache[:type_mass_payment]=
              Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=masspay]'), iframe.input(css: 'input[id=masspay]'), "class", "ng-not-empty"):cache[:type_mass_payment]
        end

        def type_integral_evolution
          (cache[:type_mass_payment].nil?||!cache[:type_integral_evolution].present?)?cache[:type_integral_evolution]=
              Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=integralevolution]'), iframe.input(css: 'input[id=integralevolution]'), "class", "ng-not-empty"):cache[:type_integral_evolution]
        end

        def type_website_payments_pro_hosted
          (cache[:type_website_payments_pro_hosted].nil?||!cache[:type_website_payments_pro_hosted].present?)?cache[:type_website_payments_pro_hosted]=
              Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=prohosted]'), iframe.input(css: 'input[id=prohosted]'), "class", "ng-not-empty"):cache[:type_website_payments_pro_hosted]
        end

        def type_website_payments_pro_api
          (cache[:type_website_payments_pro_api].nil?||!cache[:type_website_payments_pro_api].present?)?cache[:type_website_payments_pro_api]=
              Stamps::Browser::StampsCheckbox.new(iframe.input(css: 'input[id=proapi]'), iframe.input(css: 'input[id=proapi]'), "class", "ng-not-empty"):cache[:type_website_payments_pro_api]
        end

      end

    end
  end
end