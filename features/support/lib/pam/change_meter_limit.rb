module Stamps
  module Pam
    class ChangeMeterLimit < Browser::Modal
      class USPSCheckbox < Browser::Modal
        def check
          browser.checkbox(name: 'USPSApproved').set
          browser.checkbox(name: 'USPSApproved').set

        end

        def uncheck
          browser.checkbox(name: 'USPSApproved').clear
          browser.checkbox(name: 'USPSApproved').clear
        end
      end
      def present?
        browser.td(text: "Change Meter Limit").present?
      end

      def current_meter_limit

      end

      def maximum_meter_limit

      end

      def new_meter_limit
        TextBoxElement.new browser.text_field(name: "resetAmt")
      end

      def usps_approval
        USPSCheckbox.new param
      end

      def submit
        button = Stamps::Browser::ElementWrapper.new browser.input(name: "submit")
        change_success = ChangeMeterLimitSuccess.new param
        5.times do
          button.send_keys :enter
          button.safe_click
          change_success.wait_until_present 3
          if change_success.present?
            logger.info change_success.text
            return change_success
          end
        end
      end
    end

    class ChangeMeterLimitSuccess < Browser::Modal
      def present?
        browser.td(text: "Change Meter Limit Success").present?
      end

      def wait_until_present *args
        (ElementWrapper.new browser.td(text: "Change Meter Limit Success")).safely_wait_until_present *args
      end

      def text
        (ElementWrapper.new browser.td(text: "Change Meter Limit Success")).text
      end

      def ok
        profile = CustomerProfile.new param
        button = ElementWrapper.new browser.a(css: "a[href^=Profile]")
        5.times do
          button.safely_wait_until_present 2
          button.safe_click
          return profile if profile.present?
        end
      end

    end
  end
end