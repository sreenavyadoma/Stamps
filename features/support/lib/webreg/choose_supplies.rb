module Stamps
  module WebReg
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
        welcome_kit_message = ElementWrapper.new page_header.parent.p

        download_page = DownloadPage.new param
        webapps_landing_page = MailLandingPage.new param

        place_order_button.safely_wait_until_present 6

        logger.info "Registration Page #{browser.url} has loaded"
        logger.info welcome_kit.text
        logger.info welcome_kit_message.text

        15.times do
          place_order_button.safe_click
          download_page.wait_until_present 2
          webapps_landing_page.wait_until_present 2
          return download_page if download_page.present?
          return webapps_landing_page if webapps_landing_page.is_url_correct?
        end
        nil
      end
    end
  end
end