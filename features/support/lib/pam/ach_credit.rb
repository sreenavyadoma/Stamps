module Stamps
  module Pam
    class ACHCreditError < Browser::Modal
      attr_reader :title, :ok_button

      def initialize(param)
        super(param)
        @ok_button = StampsElement.new browser.a(css: "a[href*=AccountACHCredit]")
        @title = StampsElement.new browser.td(text: "ACH Credit Error")
      end

      def present?
        title.present?
      end

      def text
        title.text
      end

      def ok
        ok_button.click_while_present
      end
    end

    class ACHCreditConfirmation < Browser::Modal
      attr_reader :title, :ok_button

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.td(text: "ACH Credit Confirmation")
        @ok_button = StampsElement.new browser.a(css: "a[href^=Profile]")
      end

      def present?
        title.present?
      end

      def text
        title.text
      end

      def ok
        ok_button.click_while_present
      end
    end

    class ACHPurchaseVerification < Browser::Modal
      attr_reader :title, :confirmation, :ach_error, :yes_button, :no_button

      def initialize(param)
        super(param)
        @title = StampsElement.new browser.td(text: "ACH Purchase Verification")
        @confirmation = ACHCreditConfirmation.new(param)
        @ach_error = ACHCreditError.new(param)
        @yes_button = StampsElement.new browser.input(name: "YES")
        @no_button = StampsElement.new browser.text_field(name: "NO")
      end

      def present?
        title.present?
      end

      def text
        title.text
      end

      def yes
        5.times do
          yes_button.send_keys(:enter)
          yes_button.safe_click
          sleep(1)
          if confirmation.present?
            logger.message confirmation.text
            logger.message confirmation.text
            logger.message confirmation.text
            logger.message confirmation.text
            return confirmation
          end
          if ach_error.present?
            logger.message ach_error.text
            logger.message ach_error.text
            logger.message ach_error.text
            logger.message ach_error.text
            return ach_error
          end
        end
        nil
      end

      def no
        no_button.click_while_present
      end
    end

    class ACHCredit < Browser::Modal
      attr_reader :dollar_amount, :cents_amount, :comments, :purchase_verification, :submit_button

      def initialize(param)
        super(param)
        @dollar_amount = StampsTextbox.new browser.text_field(name: "Amount")
        @cents_amount = StampsTextbox.new browser.text_field(name: "AmountFraction")
        @comments = StampsTextbox.new browser.text_field(name: "comments")
        @purchase_verification = ACHPurchaseVerification.new(param)
        @submit_button = StampsElement.new browser.input(:value => "Submit")
      end

      def present?
        cents_amount.present?
      end

      def submit
        10.times do
          submit_button.send_keys(:enter)
          submit_button.safe_click
          if purchase_verification.present?
            logger.info purchase_verification.text
            return purchase_verification
          end
        end
      end
    end
  end
end