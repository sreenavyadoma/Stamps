module Stamps
  module Registration
    class ChooseSupplies < Browser::StampsModal
      attr_reader :web_apps, :web_mail

      def initialize(param)
        super
        @web_apps = StampsDotCom.new(param)
        @web_mail = @web_apps.mail
      end

      def wait_until_present
        browser.button(text: "Place Order")
      end

      def welcome_kit_message
        browser.h1(text: "Customize your Welcome Kit").wait_until_present 30
      end

      def welcome_kit_first_paragraph
        browser.ps(css: "div[class = 'container welcomeTextBucket']>section>p").first
      end

      def welcome_kit_second_paragraph
        browser.ps(css: "div[class = 'container welcomeTextBucket']>section>p").last
      end

      def welcome_kit_logo
        @welcome_kit_logo = StampsElement.new(browser.img(css: "img[src*=/web/images/catalog/webreg/welcome-kit.png]"))
      end

      def place_order_btn
        StampsElement.new browser.button text: "Place Order"
      end

      def place_order
        8.times do
          place_order_btn.click
          #download_page.wait_until_present 2
          #web_mail.landing_page.whats_new_modal.wait_until_present 10
          #return download_page if download_page.present?
          #return web_mail if web_mail.landing_page.whats_new_modal.present?
        end
        nil
      end
    end
  end
end


