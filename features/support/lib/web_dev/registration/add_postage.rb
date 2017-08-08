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

      def buy_postage_10
        checkbox_element = browser.input(css: "input[value='1:10.0']")
        verify_element = checkbox_element.parent.parent.parent.parent
        attribute = "class"
        verify_element_attrib = "checked"
        StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
      end

      def buy_postage_20
        checkbox_element = browser.input(css: "input[value='2:20.0']")
        verify_element = checkbox_element.parent.parent.parent.parent
        attribute = "class"
        verify_element_attrib = "checked"
        StampsRadio.new checkbox_element, verify_element, attribute, verify_element_attrib
      end

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


