module Stamps
  module Registration
    class ShipVolumeSurvey < Browser::StampsModal
      attr_reader :web_apps, :web_mail

      def initialize(param)
        super
        @web_apps = StampsDotCom.new(param)
        @web_mail = @web_apps.mail
      end

      def header_message
        browser.h2(text: "Help us customize your Stamps.com experience.").wait_until_present 10
      end

      def wait_until_present
        #browser.button(text: "Submit").wait_until_present 6
      end

      def element_drop_down
        StampsElement.new(browser.span(css: "form[name=shipSurveyForm]>[class=shippingdropdown]"))
      end

      def select(str)
        element_drop_down.click
        selection = StampsElement.new(browser.span(text: "1-10 packages per day (1-200 monthly)"))
        15.times do
          selection.click
        end
        expect(element.text).to include(str)
      end

      def consent_checkbox
        @consent_checkbox = StampsWatirCheckBox.new(browser.checkbox(name: 'consentCheckbox'))
      end

      def submit
        submit = StampsElement.new browser.button text: "Submit"
        logger.info "Ship Volume Survey Page has loaded: #{browser.url}"

        10.times do
          submit.click
        end
      end
    end
  end
end


