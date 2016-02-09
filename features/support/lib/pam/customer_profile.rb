module Pam
  class PamPageHeader < Stamps::Browser::BrowserObject
    def change_meter_limit
      link = Stamps::Browser::Link.new @browser.a(:text => "Change Meter Limit")
      page = ChangeMeterLimit.new @browser
      5.times do
        link.safe_click
        sleep 1
        return page if page.present?
      end
    end

    def ach_credit
      link = Stamps::Browser::Link.new @browser.a(:text => "ACH Credit")
      page = ACHCredit.new @browser
      5.times do
        link.safe_click
        sleep 1
        return page if page.present?
      end
    end
  end

  class CustomerProfile < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? @browser.b(:text => "Available Postage")
    end

    def wait_until_present
      browser_helper.wait_until_present @browser.b(:text => "Available Postage")
    end

    def header
      PamPageHeader.new @browser
    end
  end

  class CustomerProfileNotFound < Stamps::Browser::BrowserObject
    def present?
      browser_helper.present? @browser.td :text => "No records found."
    end
  end
end