module Stamps
  module Orders
    module Stores

      class Error400 < Browser::StampsModal

        def close
          button=StampsField.new(browser.imgs(css: "img[class*=x-tool-close]").last)
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
          button=StampsField.new(browser.span(text: "OK"))
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

      class EmailVerificationSent < Browser::StampsModal

        def window_title
          StampsField.new browser.div(text: "Paypal Email Verification Sent")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window=window_title
          3.times do
            break if window.present?
            sleep(0.35)
          end
        end

        def close
          button=StampsField.new(browser.imgs(css: "img[class*='x-tool-close']").last)
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

      class EmailVerificationRequired < Browser::StampsModal

        def window_title
          StampsField.new browser.div(text: "Paypal Email Verification Required")
        end

        def present?
          window_title.present?
        end

        def wait_until_present
          window=window_title
          5.times do
            break if window.present?
            sleep(0.35)
          end
        end

        def close
          button=StampsField.new(browser.imgs(css: "img[class*=x-tool-close]").last)
          5.times do
            button.click
            sleep(0.35)
            break unless button.present?
          end
        end

        def send_email_verification
          button=StampsField.new(browser.spans(text: "Send Email Verification").last)
          verification_sent=EmailVerificationSent.new(param)
          error=Error400.new(param)
          10.times do
            button.click
            verification_sent.wait_until_present
            return verification_sent if verification_sent.present?
            if error.present?
              text=error.text
              logger.info text
              error.ok
              raise text
            end
          end
        end
      end

      module PayPalCache
        def cache
          @cache ||= {}
        end
      end

      module PayPalWindowTitle
        include PayPalCache
        def window_title
          (cache[:window_title].nil?||!cache[:window_title].present?)?cache[:window_title]=StampsField.new(browser.divs(css: "[id^=storeiframewindow-][id$=_header-targetEl] [class*=x-title-item]").first):cache[:window_title]
        end

        def x_btn
          (cache[:x_btn].nil?||!cache[:x_btn].present?)?cache[:x_btn]=StampsField.new(browser.imgs(css: "[id^=storeiframewindow-][id$=_header-targetEl] img").first):cache[:x_btn]
        end
      end

      class PayPal < Browser::StampsModal
        include PayPalCache
        include PayPalWindowTitle

        def iframe
          browser.iframe(css: "iframe[id=storeiframe]")
        end

        def present?
          window_title.present?
        end

        def store_modal
          StampsField.new(browser.div(css: "div[id^='storeiframewindow'][id$='header']"))
        end

        def store_icon
          StampsField.new(iframe.img(css: "img[src*=paypalbanner]"))
        end

        def email_address
          (cache[:email_address].nil?||!cache[:email_address].present?)?cache[:email_address]=StampsTextbox.new(iframe.text_field(css: "[class*=paypalEmailField]")):cache[:email_address]
        end

        def verify_email_field
          (cache[:verify_email_field].nil?||!cache[:verify_email_field].present?)?cache[:verify_email_field]=StampsField.new(iframe.button(css: "[ng-click='paypal.testConnection()']")):cache[:verify_email_field]
        end

        def verify_email
          button=StampsField.new(iframe.span(text: "Verify Email"))
          connect_to_store=ConnectYourPaypalStore.new(param)
          button.click
          sleep 5
          connect_to_store if connect_to_store.present?
        end
      end

      class ConnectYourPaypalStore < Browser::StampsModal

        def iframe
          browser.iframe(css: "iframe[id=storeiframe]")
        end

        def store_icon
          StampsField.new iframe.img(css: "img[src*=paypalbanner]")
        end

        def present?
          restrict_to_email_address.present? && store_icon.present?
        end

        def connect
          button=StampsField.new(browser.span(text: "Connect"))
          store_settings=StoreSettings.new(param)
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
          StampsTextbox.new iframe.text_field(css: "input[id=toemail]")
        end

        def type_cart
          input=iframe.input(css: 'input[id=cart]')
          verify=iframe.input(css: 'input[id=cart]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_web_accept
          input=iframe.input(css: 'input[id=webaccept]')
          verify=iframe.input(css: 'input[id=webaccept]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_express_checkout
          input=iframe.input(css: 'input[id=expresscheckout]')
          verify=iframe.input(css: 'input[id=expresscheckout]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_send_money
          input=iframe.input(css: 'input[id=sendmoney]')
          verify=iframe.input(css: 'input[id=sendmoney]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_virtual_terminal
          input=iframe.input(css: 'input[id=virtualterminal]')
          verify=iframe.input(css: 'input[id=virtualterminal]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_subscription_payment
          input=iframe.input(css: 'input[id=subscrpayment]')
          verify=iframe.input(css: 'input[id=subscrpayment]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_merchant_payment
          input=iframe.input(css: 'input[id=merchpmt]')
          verify=iframe.input(css: 'input[id=merchpmt]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_mass_payment
          input=iframe.input(css: 'input[id=masspay]')
          verify=iframe.input(css: 'input[id=masspay]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_integral_evolution
          input=iframe.input(css: 'input[id=integralevoluton]')
          verify=iframe.input(css: 'input[id=integralevoluton]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_website_payments_pro_hosted
          input=iframe.input(css: 'input[id=prohosted]')
          verify=iframe.input(css: 'input[id=prohosted]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

        def type_website_payments_pro_api
          input=iframe.input(css: 'input[id=proapi]')
          verify=iframe.input(css: 'input[id=proapi]')
          Stamps::Browser::StampsCheckbox.new(input, verify, "class", "ng_not_empty")
        end

      end
    end
  end
end