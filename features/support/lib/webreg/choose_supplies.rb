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
        place_order_button = ElementWrapper.new browser.button(text: "Place Order")
        page_header = browser.h1 text: 'Customize your Welcome Kit'
        welcome_kit = ElementWrapper.new page_header
        welcome_kit_message = ElementWrapper page_header.p
        welcome_page = NewAccountWelcomePage.new param
        place_order_button.safely_wait_until_present 6

        logger.info "Registration Page #{browser.url} has loaded"
        logger.info welcome_kit.text
        logger.info welcome_kit_message.text

        10.times do
          place_order_button.safe_click
          place_order_button.safe_click
          sleep 2
          return welcome_page if welcome_page.present?
        end
      end
    end
  end
end