module Pam
  class PamPageHeader < Stamps::Browser::BrowserObject
    def change_meter_limit
      link = Stamps::Browser::StampsLink.new @browser.a(:text => "Change Meter Limit")
      page = ChangeMeterLimit.new @browser
      5.times do
        link.safe_click
        sleep 1
        return page if page.present?
      end
    end

    def ach_credit
      link = Stamps::Browser::StampsLink.new @browser.a(:text => "ACH Credit")
      page = ACHCredit.new @browser
      5.times do
        link.safe_click
        sleep 1
        return page if page.present?
      end
    end

    def appcapp_overrides
      link = Stamps::Browser::StampsLink.new @browser.a(:text => "AppCap Overrides")
      page = AppCapOverrides.new @browser
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
      (browser_helper.present? @browser.td :text => "No records found.") || (browser_helper.present? (@browser.td css: "td[class=TD3][align=left]"))
    end

    def message
      first = browser_helper.text (@browser.td class: "TD3")
      second = browser_helper.text (@browser.td css: "td[class=TD3][align=left]")
      "#{first}#{second}"
    end
  end
end