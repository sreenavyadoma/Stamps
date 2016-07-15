module Stamps
  module WebReg
    class NewAccountWelcomePage < Browser::Modal
      def present?
        browser.h1(text: "Congratulations on your new account!").present?
      end

      def wait_until_present
        browser.h1(text: "Congratulations on your new account!").wait_until_present 6
      end
    end

    class ChooseSupplies < Browser::Modal
      def present?
        browser.h1(text: "Customize your Welcome Kit").present?
      end

      def wait_until_present
        browser.button(text: "Place Order").wait_until_present 6
      end

      def place_order
        button = ElementWrapper.new browser.button(text: "Place Order")
        welcome_page = NewAccountWelcomePage.new param
        10.times do
          button.safe_click
          button.safe_click
          sleep 2
          return welcome_page if welcome_page.present?
        end
      end
    end
  end
end