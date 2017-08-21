module Stamps
  module Pam
    module PamPageHeader
      def change_meter_limit
        link = StampsElement.new browser.a(text: "Change Meter Limit")
        meter_limit_page = ChangeMeterLimit.new(param)
        change_meter_limit_header = Browser::StampsElement.new browser.td(text: "Change Meter Limit")
        5.times do
          link.click
          change_meter_limit_header.wait_until_present 4
          return meter_limit_page if meter_limit_page.present?
        end
      end

      def ach_credit
        ach_credit_link = StampsElement.new browser.a(text: "ACH Credit")
        ach_credit_page = ACHCredit.new(param)
        5.times do
          ach_credit_link.wait_until_present 4
          ach_credit_link.click
          return ach_credit_page if ach_credit_page.present?
        end
      end

      def appcapp_overrides
        link = StampsElement.new browser.a(text: "AppCap Overrides")
        page = AppCapOverridesPage.new(param)
        5.times do
          link.click
          sleep(0.35)
          return page if page.present?
        end
        expect(page.present?).to be(true), "Unable to open AppCap Overrides Page, it is not present."
      end
    end
  end
end