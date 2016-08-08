module Stamps
  module Pam
    class PamPageHeader < Browser::Modal
      def change_meter_limit
        link = Stamps::Browser::ElementWrapper.new browser.a(text: "Change Meter Limit")
        page = ChangeMeterLimit.new param
        change_meter_limit_header = Browser::ElementWrapper.new browser.td(text: "Change Meter Limit")
        5.times do
          link.safe_click
          change_meter_limit_header.safely_wait_until_present 4
          return page if page.present?
        end
      end

      def ach_credit
        ach_credit_link = Stamps::Browser::ElementWrapper.new browser.a(text: "ACH Credit")
        ach_credit_page = ACHCredit.new param
        5.times do
          ach_credit_link.safely_wait_until_present 4
          ach_credit_link.safe_click
          return ach_credit_page if ach_credit_page.present?
        end
      end

      def appcapp_overrides
        link = Stamps::Browser::ElementWrapper.new browser.a(text: "AppCap Overrides")
        page = AppCapOverrides.new param
        5.times do
          link.safe_click
          sleep 1
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
        PamPageHeader.new param
      end

      def available_postage
        ElementWrapper.new browser.td(css: "form[name=FrmOne]>table:nth-child(7)>tbody>tr>td>table>tbody>tr:nth-child(2)>td:nth-child(6)")
      end
    end

    class CustomerProfileNotFound < Browser::Modal
      def present?
        return true if (browser.td text: "No records found.").present?
        return true if (browser.td css: "td[class=TD3][align=left]").present?
        false
      end

      def message
        first = element_helper.text (browser.td class: "TD3")
        second = element_helper.text (browser.td css: "td[class=TD3][align=left]")
        "#{first}#{second}"
      end
    end
  end
end