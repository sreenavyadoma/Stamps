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
        browser.button(text: "Place Order").wait_until_present 30
      end

      def welcome_kit_message
        StampsElement.new(browser.h1(text: "Customize your Welcome Kit")).wait_until_present 30
      end

      def welcome_kit_first_paragraph
        StampsElement.new(browser.ps(css: "div[class = 'container welcomeTextBucket']>section>p").first).wait_until_present 30
      end

      def welcome_kit_second_paragraph
        StampsElement.new(browser.ps(css: "div[class = 'container welcomeTextBucket']>section>p").last).wait_until_present 30
      end

      def welcome_kit_logo
        StampsElement.new(browser.img(css: "img[alt*='Stamps.com Welcome Kit']"))
      end

      def place_order_btn
        StampsElement.new browser.button text: "Place Order"
      end

      def place_order
        15.times do
          place_order_btn.click
        end
      end
    end
  end
end


