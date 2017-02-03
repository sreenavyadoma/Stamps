module Stamps
  module Pam
    class PamPageHeader < Browser::Modal
      def change_meter_limit
        link = Stamps::Browser::StampsElement.new browser.a(text: "Change Meter Limit")
        meter_limit_page = ChangeMeterLimit.new(param)
        change_meter_limit_header = Browser::StampsElement.new browser.td(text: "Change Meter Limit")
        5.times do
          link.safe_click
          change_meter_limit_header.safely_wait_until_present 4
          return meter_limit_page if meter_limit_page.present?
        end
      end

      def ach_credit
        ach_credit_link = Stamps::Browser::StampsElement.new browser.a(text: "ACH Credit")
        ach_credit_page = ACHCredit.new(param)
        5.times do
          ach_credit_link.safely_wait_until_present 4
          ach_credit_link.safe_click
          return ach_credit_page if ach_credit_page.present?
        end
      end

      def appcapp_overrides
        link = Stamps::Browser::StampsElement.new browser.a(text: "AppCap Overrides")
        page = AppCapOverrides.new(param)
        5.times do
          link.safe_click
          sleep(1)
          return page if page.present?
        end
      end
    end

    class CustomerProfile < Browser::Modal
      def present?
        browser.b(text: "Available Postage").present?
      end

      def wait_until_present
        browser.b(text: "Available Postage").wait_until_present 5
      end

      def header
        PamPageHeader.new(param)
      end

      def available_postage
        StampsElement.new browser.td(css: "form[name=FrmOne]>table:nth-child(7)>tbody>tr>td>table>tbody>tr:nth-child(2)>td:nth-child(6)")
      end

      def status_reason
        (StampsElement.new(browser.td text: "Account Status").parent.parent.trs[3].tds[1]).text
      end

      def license_status
        (StampsElement.new(browser.td text: "Account Status").parent.parent.trs[4].tds[1]).text
      end
    end
  end
end