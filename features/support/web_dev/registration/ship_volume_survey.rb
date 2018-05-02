module Stamps
  module Registration
    class ShipVolumeSurvey < WebApps::Base
      # attr_reader :sdc_apps, :web_mail
      #
      # def initialize(param)
      #   super
      #   #@sdc_apps=StampsDotCom.new(param)
      #   @web_mail=@sdc_apps.mail
      # end

      def web_apps
        cache[:sdc_apps] = StampsDotCom.new(param) if cache[:sdc_apps].nil?
        cache[:sdc_apps]
      end

      def web_mail
        cache[:web_mail] = web_apps.mail if cache[:web_mail].nil?
        cache[:web_mail]
      end


      def header_message
        driver.h2(text: "Help us customize your Stamps.com experience.").wait_until_present 10
      end

      def wait_until_present
        #driver.button(text: "Submit").wait_until_present 6
      end

      def drop_down
        cache[:field] = StampsField.new(driver.span(css: "form[name=shipSurveyForm]>[class=shippingdropdown]")) if cache[:field].nil? || !cache[:field].present?
      end

      def select(str)
        drop_down.click
        selection = StampsField.new(driver.span(text: "1-10 packages per day (1-200 monthly)"))
        15.times do
          selection.click
        end
        # todo-MH
        #expect(field.text).to include(str)
        raise ArgumentError, "#{field.text} does not include #{str}"
      end

      def consent_checkbox
        @consent_checkbox = StampsWatirCheckbox.new(driver.checkbox(name: 'consentCheckbox'))
      end

      def submit
        submit = StampsField.new driver.button text: "Submit"
        log.info "Ship Volume Survey Page has loaded: #{driver.url}"

        10.times do
          submit.click
        end
      end
    end
  end
end


