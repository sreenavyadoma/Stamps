module Stamps
  module Registration
    class AddPostage < Browser::StampsModal
      attr_reader :web_apps, :web_mail

      def initialize(param)
        super
        @web_apps = StampsDotCom.new(param)
        @web_mail = @web_apps.mail
      end

      def present?
        browser.h1(text: "Add USPS postage to your account").present?
      end

      def wait_until_present
        browser.button(text: "Confirm").wait_until_present 6
      end

     # def amount_radio_button
     #       @ten_dollars =
      #      @twenty_dollars =    sta
     # end

      def confirm
        confirm_button = StampsElement.new browser.button text: "Confirm"
        logger.info "Add Postage Page has loaded: #{browser.url}"

        10.times do
          confirm_button.click
        end
      end
    end
  end
end


