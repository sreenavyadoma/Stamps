module Stamps
  module Pam
    class USPSCheckbox < Browser::StampsHtmlField
      def check
        browser.checkbox(name: 'USPSApproved').set
        browser.checkbox(name: 'USPSApproved').set

      end

      def uncheck
        browser.checkbox(name: 'USPSApproved').clear
        browser.checkbox(name: 'USPSApproved').clear
      end
    end

    class ChangeMeterLimit < Browser::StampsHtmlField
      attr_reader :usps_approval, :new_meter_limit, :current_meter, :maximum_meter

      def initialize(param)
        super(param)
        @usps_approval = USPSCheckbox.new(param)
        @new_meter_limit = StampsTextbox.new browser.text_field(name: "resetAmt")
        @current_meter = StampsElement.new browser.td(css: "table[style*=table-row]>tbody>tr>td>table>tbody>tr:nth-child(3)>td:nth-child(2)")
        @maximum_meter = StampsElement.new browser.td(css: "table[style*=table-row]>tbody>tr>td>table>tbody>tr:nth-child(4)>td:nth-child(2)")
      end

      def present?
        browser.td(text: "Change Meter Limit").present?
      end

      def current_meter_limit
        current_meter.text.gsub(/\n/, "").to_f
      end

      def maximum_meter_limit
        maximum_meter.text.gsub(/\n/, "").to_f
      end

      def submit
        button = Stamps::Browser::StampsElement.new browser.input(name: "submit")
        change_success = ChangeMeterLimitSuccess.new(param)
        5.times do
          button.send_keys(:enter)
          button.safe_click
          change_success.wait_until_present 3
          if change_success.present?
            logger.info change_success.text
            return change_success
          end
        end
      end
    end

    class ChangeMeterLimitSuccess < Browser::StampsHtmlField
      def present?
        browser.td(text: "Change Meter Limit Success").present?
      end

      def wait_until_present *args
        (StampsElement.new browser.td(text: "Change Meter Limit Success")).safely_wait_until_present *args
      end

      def text
        (StampsElement.new browser.td(text: "Change Meter Limit Success")).text
      end

      def ok
        profile = CustomerProfile.new(param)
        button = StampsElement.new browser.a(css: "a[href^=Profile]")
        5.times do
          button.safely_wait_until_present 2
          button.safe_click
          return profile if profile.present?
        end
      end

    end
  end
end