module Stamps
  module Pam
    class USPSCheckBox < WebApps::Base
      def check
        driver.checkbox(name: 'USPSApproved').set
        driver.checkbox(name: 'USPSApproved').set

      end

      def uncheck
        driver.checkbox(name: 'USPSApproved').clear
        driver.checkbox(name: 'USPSApproved').clear
      end
    end

    class ChangeMeterLimit < WebApps::Base
      attr_reader :usps_approval, :new_meter_limit, :current_meter, :maximum_meter

      def initialize(param)
        super
        @usps_approval = USPSCheckBox.new(param)
        @new_meter_limit = StampsTextbox.new driver.text_field(name: "resetAmt")
        @current_meter = StampsField.new driver.td(css: "table[style*=table-row]>tbody>tr>td>table>tbody>tr:nth-child(3)>td:nth-child(2)")
        @maximum_meter = StampsField.new driver.td(css: "table[style*=table-row]>tbody>tr>td>table>tbody>tr:nth-child(4)>td:nth-child(2)")
      end

      def present?
        driver.td(text: "Change Meter Limit").present?
      end

      def current_meter_limit
        current_meter.text.gsub(/\n/, "").to_f
      end

      def maximum_meter_limit
        maximum_meter.text.gsub(/\n/, "").to_f
      end

      def submit
        button = Stamps::WebApps::StampsField.new driver.input(name: "submit")
        change_success = ChangeMeterLimitSuccess.new(param)
        5.times do
          button.click
          button.click
          change_success.wait_until_present 3
          if change_success.present?
            log.info change_success.text
            return change_success
          end
        end
      end
    end

    class ChangeMeterLimitSuccess < WebApps::Base
      def present?
        driver.td(text: "Change Meter Limit Success").present?
      end

      def wait_until_present(*args)
        (StampsField.new driver.td(text: "Change Meter Limit Success")).wait_until_present(*args)
      end

      def text
        (StampsField.new driver.td(text: "Change Meter Limit Success")).text
      end

      def ok
        profile = CustomerProfilePage.new(param)
        button = StampsField.new driver.a(css: "a[href^=Profile]")
        5.times do
          button.wait_until_present 2
          button.click
          return profile if profile.present?
        end
      end

    end
  end
end