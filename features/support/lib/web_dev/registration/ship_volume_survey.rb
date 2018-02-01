module Stamps
  module Registration
    class ShipVolumeSurvey < Browser::BaseCache
      attr_reader :web_apps, :web_mail

      def initialize(param)
        super
        @web_apps=StampsDotCom.new(param)
        @web_mail=@web_apps.mail
      end

      def header_message
        browser.h2(text: "Help us customize your Stamps.com experience.").wait_until_present 10
      end

      def wait_until_present
        #browser.button(text: "Submit").wait_until_present 6
      end

      def drop_down
        cache[:field] = StampsField.new(browser.span(css: "form[name=shipSurveyForm]>[class=shippingdropdown]")) if cache[:field].nil? || !cache[:field].present?
      end

      def select(str)
        drop_down.click
        selection=StampsField.new(browser.span(text: "1-10 packages per day (1-200 monthly)"))
        15.times do
          selection.click
        end
        # todo-MH
        #expect(field.text).to include(str)
        raise ArgumentError, "#{field.text} does not include #{str}"
      end

      def consent_checkbox
        @consent_checkbox=StampsWatirCheckbox.new(browser.checkbox(name: 'consentCheckbox'))
      end

      def submit
        submit=StampsField.new browser.button text: "Submit"
        logger.info "Ship Volume Survey Page has loaded: #{browser.url}"

        10.times do
          submit.click
        end
      end
    end
  end
end


