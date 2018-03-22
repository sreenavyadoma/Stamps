module Stamps
  module Orders
    module Stores
      module StoresIframe
        def iframe
          (cache[:iframe].nil?) ? cache[:iframe] = driver.iframe(css: "[id=storeiframe]") : cache[:iframe]
        end
      end

      module PayPal

        module WindowTitle
          def window_title
            StampsField.new(driver.divs(css: "[id^=storeiframewindow-][id$=_header-targetEl] [class*=x-title-item]").first)
          end

          def x_btn
            cache[:x_btn].nil? || !cache[:x_btn].present? ? cache[:x_btn] = StampsField.new(driver.imgs(css: "[id^=storeiframewindow-][id$=_header-targetEl] img").first) : cache[:x_btn]
          end
        end

        class ConnectYourStore < WebApps::Base
          include StoresIframe
          def paypal_store_icon
            if cache[:paypal_store_icon].nil? || !cache[:paypal_store_icon].present?
              cache[:paypal_store_icon] = StampsField.new(iframe.img(css: "img[src*=paypalbanner.png]"))
            end
            cache[:paypal_store_icon]
          end

          def present?
            restrict_to_email_address.present?
          end

          def connect_button
            if cache[:connect_button].nil? || !cache[:connect_button].present?
              cache[:connect_button] = StampsField.new(iframe.span(text: "Connect"))
            end
            cache[:connect_button]
          end

          def connect              #Click connect button to connect to PayPal Store and bring up Store Settings modal
            store_settings = StoreSettings.new(param)
            10.times do
              connect_button.click
              store_settings.wait_until_present
              return store_settings if store_settings.present?
            end
          end

          def radio_transaction_id
            if cache[:radio_transaction_id].nil? || !cache[:radio_transaction_id].present?
              cache[:radio_transaction_id] = StampsRadio.new(iframe.radio(css: 'input[id=transactionID]'), iframe.radio(css: 'input[id=transactionID]'), "class", "ng-valid-parse")
            end
            cache[:radio_transaction_id]
          end

          def radio_invoice_number
            if cache[:radio_invoice_number].nil? || !cache[:radio_invoice_number].present?
              cache[:radio_invoice_number] = StampsRadio.new(iframe.radio(css: 'input[id=invoiceNo]'), iframe.radio(css: 'input[id=invoiceNo]'), "class", "ng-valid-parse")
            end
            cache[:radio_invoice_number]
          end

          def radio_import_all_transactions
            if cache[:radio_import_all_transactions].nil? || !cache[:radio_import_all_transactions].present?
              cache[:radio_import_all_transactions] = StampsRadio.new(iframe.radio(css: 'input[id=importAllTransations]'), iframe.radio(css: 'input[id=importAllTransations]'), "class", "ng-valid-parse")
            end
            cache[:radio_import_all_transactions]
          end

          def radio_import_selected_types
            if cache[:radio_import_selected_types].nil? || !cache[:radio_import_selected_types].present?
              cache[:radio_import_selected_types] = StampsRadio.new(iframe.radio(css: 'input[id=selectImport]'), iframe.radio(css: 'input[id=selectImport]'), "class", "ng-valid-parse")
            end
            cache[:radio_import_selected_types]
          end

          def restrict_to_email_address
            if cache[:restrict_to_email].nil? || !cache[:restrict_to_email].present?
              cache[:restrict_to_email] = StampsTextbox.new(iframe.text_field(css: "input[id=toEmail]"))
            end
            cache[:restrict_to_email]
          end

          def type_cart
            if cache[:type_cart].nil? || !cache[:type_cart].present?
              cache[:type_cart] = Stamps::WebApps::StampsCheckbox.new(
                  iframe.input(css: 'input[id=cart]'), iframe.input(css: 'input[id=cart]'), "class", "ng-not-empty")
            end
            cache[:type_cart]
          end

          def type_web_accept
            if cache[:type_web_accept].nil? || !cache[:type_web_accept].present?
              cache[:type_web_accept] = Stamps::WebApps::StampsCheckbox.new(
                  iframe.input(css: 'input[id=webaccept]'), iframe.input(css: 'input[id=webaccept]'), "class", "ng-not-empty")
            end
            cache[:type_web_accept]
          end

          def type_express_checkout
            if cache[:type_express_checkout].nil? || !cache[:type_express_checkout].present?
              cache[:type_express_checkout] = Stamps::WebApps::StampsCheckbox.new(
                  iframe.input(css: 'input[id=expresscheckout]'), iframe.input(css: 'input[id=expresscheckout]'), "class", "ng-not-empty")
            end
            cache[:type_express_checkout]
          end

          def type_send_money
            if cache[:type_send_money].nil? || !cache[:type_send_money].present?
              cache[:type_send_money] = Stamps::WebApps::StampsCheckbox.new(
                  iframe.input(css: 'input[id=sendmoney]'), iframe.input(css: 'input[id=sendmoney]'), "class", "ng-not-empty")
            end
            cache[:type_send_money]
          end

          def type_virtual_terminal
            if cache[:type_virtual_terminal].nil? || !cache[:type_virtual_terminal].present?
              cache[:type_virtual_terminal] = Stamps::WebApps::StampsCheckbox.new(
                  iframe.input(css: 'input[id=virtualterminal]'), iframe.input(css: 'input[id=virtualterminal]'), "class", "ng-not-empty")
            end
            cache[:type_virtual_terminal]
          end

          def type_subscription_payment
            if cache[:type_subscription_payment].nil? || !cache[:type_subscription_payment].present?
              cache[:type_subscription_payment] = Stamps::WebApps::StampsCheckbox.new(
                  iframe.input(css: 'input[id=subscrpayment]'), iframe.input(css: 'input[id=subscrpayment]'), "class", "ng-not-empty")
            end
            cache[:type_subscription_payment]
          end

          def type_merchant_payment
            if cache[:type_merchant_payment].nil? || !cache[:type_merchant_payment].present?
              cache[:type_merchant_payment] = Stamps::WebApps::StampsCheckbox.new(
                  iframe.input(css: 'input[id=merchpmt]'), iframe.input(css: 'input[id=merchpmt]'), "class", "ng-not-empty")
            end
            cache[:type_merchant_payment]
          end

          def type_mass_payment
            if cache[:type_mass_payment].nil? || !cache[:type_mass_payment].present?
              cache[:type_mass_payment] = Stamps::WebApps::StampsCheckbox.new(
                  iframe.input(css: 'input[id=masspay]'), iframe.input(css: 'input[id=masspay]'), "class", "ng-not-empty")
            end
            cache[:type_mass_payment]
          end

          def type_integral_evolution
            if cache[:type_integral_evolution].nil? || !cache[:type_integral_evolution].present?
              cache[:type_integral_evolution] = Stamps::WebApps::StampsCheckbox.new(
                  iframe.input(css: 'input[id=integralevolution]'), iframe.input(css: 'input[id=integralevolution]'), "class", "ng-not-empty")
            end
            cache[:type_integral_evolution]
          end

          def type_website_payments_pro_hosted
            if cache[:type_website_payments_pro_hosted].nil? || !cache[:type_website_payments_pro_hosted].present?
              cache[:type_website_payments_pro_hosted] = Stamps::WebApps::StampsCheckbox.new(
                  iframe.input(css: 'input[id=prohosted]'), iframe.input(css: 'input[id=prohosted]'), "class", "ng-not-empty")
            end
            cache[:type_website_payments_pro_hosted]
          end

          def type_website_payments_pro_api
            if cache[:type_website_payments_pro_api].nil? || !cache[:type_website_payments_pro_api].present?
              cache[:type_website_payments_pro_api] = Stamps::WebApps::StampsCheckbox.new(
                  iframe.input(css: 'input[id=proapi]'), iframe.input(css: 'input[id=proapi]'), "class", "ng-not-empty")
            end
            cache[:type_website_payments_pro_api]
          end

        end


        class Store < WebApps::Base
          include WindowTitle
          include StoresIframe

          def present?
            window_title.present?
          end

          def email_verification_modal        #This modal requires the user to verify receipt of email, which is outside of scope for automation
            raise 'Not Implemented.'
          end

          def store_modal
            if cache[:store_modal].nil? || !cache[:store_modal].present?
              cache[:store_modal] = StampsField.new(driver.div(css: "div[id^='storeiframewindow'][id$='header']"))
            end
            cache[:store_modal]
          end

          def paypal_store_icon
            if cache[:paypal_store_icon].nil? || !cache[:paypal_store_icon].present?
              cache[:paypal_store_icon] = StampsField.new(iframe.img(css: "img[src*=paypalbanner]"))
            end
            cache[:paypal_store_icon]
          end

          def paypal_email_address
            if cache[:paypal_email_address].nil? || !cache[:paypal_email_address].present?
              cache[:paypal_email_address] = StampsTextbox.new(iframe.text_field(css: "[class*=paypalEmailField]"))
            end
            cache[:paypal_email_address]
          end

          def verify_email_field
            if cache[:verify_email_field].nil? || !cache[:verify_email_field].present?
              cache[:verify_email_field] = StampsField.new(iframe.button(css: "[ng-click='paypal.testConnection()']"))
            end
            cache[:verify_email_field]
          end

          def verify_email_button
            if cache[:verify_email_button].nil? || !cache[:verify_email_button].present?
              cache[:verify_email_button] = StampsField.new(iframe.span(text: "Verify Email"))
            end
            cache[:verify_email_button]
          end

          def verify_email
            connect_to_store = ConnectYourStore.new(param)
            20.times do
              return connect_to_store if connect_to_store.present?
              verify_email_button.click
              sleep(2)
            end
          end
        end
      end
    end
  end
end