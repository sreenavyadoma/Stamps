module Pam
  class ChangeMeterLimit < Stamps::Browser::BrowserObject
    class USPSCheckbox < Stamps::Browser::BrowserObject
      def check
        @browser.checkbox(:name => 'USPSApproved').set
        @browser.checkbox(:name => 'USPSApproved').set

      end

      def uncheck
        @browser.checkbox(:name => 'USPSApproved').clear
        @browser.checkbox(:name => 'USPSApproved').clear
      end
    end
    def present?
      browser_helper.present? @browser.td(:text => "Change Meter Limit")
    end

    def current_meter_limit

    end

    def maximum_meter_limit

    end

    def new_meter_limit
      StampsTextbox.new @browser.text_field(:name => "resetAmt")
    end

    def usps_approval
      USPSCheckbox.new @browser
    end

    def submit
      button = Stamps::Browser::StampsInput.new @browser.input(:name => "submit")
      change_success = ChangeMeterLimitSuccess.new @browser
      5.times do
        button.send_keys :enter
        button.safe_click
        sleep 1
        return change_success if change_success.present?
      end
    end
  end

  class ChangeMeterLimitSuccess < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? @browser.td(:text => "Change Meter Limit Success")
    end

    def ok
      profile = CustomerProfile.new @browser
      button = StampsButton.new @browser.a(:css => "a[href^=Profile]")
      5.times do
        button.safe_click
        sleep 1
        return profile if profile.present?
      end
    end

  end
end