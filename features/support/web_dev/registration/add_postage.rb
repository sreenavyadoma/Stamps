module Stamps
  module Registration
    class AddPostage < WebApps::Base
      attr_reader :web_apps, :web_mail

      def initialize(param)
        super
        @web_apps = StampsDotCom.new(param)
        @web_mail = @web_apps.mail
      end

      def present?
        driver.h1(text: "Add USPS postage to your account").present?
      end

      def wait_until_present
        driver.button(text: "Confirm").wait_until_present 6
      end

      def buy_postage_10
        checkbox_field = driver.input(css: "input[value='1:10.0']")
        verify_field = checkbox_field.parent.parent.parent.parent
        attribute = 'class'
        verify_field_attrib = 'checked'
        StampsRadio.new(checkbox_field, verify_field, attribute, verify_field_attrib)
      end

      def buy_postage_20
        checkbox_field = driver.input(css: "input[value='2:20.0']")
        verify_field = checkbox_field.parent.parent.parent.parent
        attribute = 'class'
        verify_field_attrib = 'checked'
        StampsRadio.new(checkbox_field, verify_field, attribute, verify_field_attrib)
      end

      def no_thanks
        checkbox_field = driver.input(css: "input[value='5:0.0']")
        verify_field = checkbox_field.parent.parent.parent.parent
        attribute = 'class'
        verify_field_attrib = 'checked'
        StampsRadio.new(checkbox_field, verify_field, attribute, verify_field_attrib)
      end


      def confirm
        confirm_button = StampsField.new (driver.button text: "Confirm")
        log.info "Add Postage Page has loaded: #{driver.url}"

        10.times do
          confirm_button.click
        end
      end
    end
  end
end


