module Stamps
  module Pam
    class ACHCreditConfirmation < Browser::Modal
      def present?
        browser.td(text: "ACH Credit Confirmation").present?
      end

      def text
        (ElementWrapper.new browser.td text: "ACH Credit Confirmation").text
      end

      def ok
        profile = CustomerProfile.new param
        link = Stamps::Browser::ElementWrapper.new browser.a(css: "a[href^=Profile]")
        5.times do
          link.safe_click
          return profile if profile.present?
        end
      end

    end

    class ACHPurchaseVerification < Browser::Modal
      def present?
        (browser.td text: "ACH Purchase Verification").present?
      end

      def text
        (ElementWrapper.new browser.td text: "ACH Purchase Verification").text
      end

      def yes
        confirmation = ACHCreditConfirmation.new param
        button = Stamps::Browser::ElementWrapper.new browser.input(name: "YES")
        5.times do
          button.send_keys :enter
          button.safe_click
          if confirmation.present?
            logger.info confirmation.text
            return confirmation
          end
        end
      end

      def no
        button = ElementWrapper.new browser.text_field(name: "NO")
        button.click_while_present
      end
    end

    class ACHCredit < Browser::Modal
      def present?
        browser.text_field(name: "AmountFraction").present?
      end

      def dollar_amount
        TextBoxElement.new browser.text_field(name: "Amount")
      end

      def cents_amount
        TextBoxElement.new browser.text_field(name: "AmountFraction")
      end

      def comments
        TextBoxElement.new browser.text_field(name: "comments")
      end

      def submit
        purchase_verification = ACHPurchaseVerification.new param
        submit_button = ElementWrapper.new browser.input(:value => "Submit")
        15.times do
          submit_button.send_keys :enter
          submit_button.safe_click
          if purchase_verification.present?
            logger.info purchase_verification.text
            return purchase_verification
          end
        end
        raise "ACH Credit Confirmation page is not present!" unless purchase_verification.present?
      end

    end
  end
end