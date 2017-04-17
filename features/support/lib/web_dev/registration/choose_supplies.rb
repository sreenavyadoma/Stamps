module Stamps
  module Registration
    class ChooseSupplies < Browser::StampsModal
      attr_reader :web_apps, :web_mail

      def initialize(param)
        super(param)
        @web_apps = StampsCom.new(param)
        @web_mail = @web_apps.mail
      end

      def present?
        browser.h1(text: "Customize your Welcome Kit").present?
      end

      def wait_until_present
        browser.button(text: "Place Order").wait_until_present 6
      end

      def place_order
        place_order_button = StampsElement.new browser.button text: "Place Order"
        page_header = browser.h1 text: 'Customize your Welcome Kit'
        welcome_kit = StampsElement.new page_header
        welcome_kit_message = StampsElemt.neenw page_header.parent.p

        download_page = DownloadPage.new(param)
        #@web_apps.mail.landing_page.whats_new_modal
        place_order_button.wait_until_present 10

        logger.info "Registration Page has loaded: #{browser.url}"
        logger.info welcome_kit.text
        logger.info welcome_kit_message.text

        8.times do
          place_order_button.click
          download_page.wait_until_present 2
          web_mail.landing_page.whats_new_modal.wait_until_present 10
          return download_page if download_page.present?
          return web_mail if web_mail.landing_page.whats_new_modal.present?
        end
        nil
      end
    end
  end
end


