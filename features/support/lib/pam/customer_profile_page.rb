module Stamps
  module Pam
    module CustomerProfileAccountInfo
      def last_name
        @last_name ||= StampsElement.new(browser.td(css: "body>table[align=center]>tbody>tr:nth-child(2)>td>table>tbody>tr>td>table>tbody>tr:nth-child(1)>td:nth-child(2)"))
      end

      def first_name
        @first_name ||= StampsElement.new(browser.td(css: "body>table[align=center]>tbody>tr:nth-child(2)>td>table>tbody>tr>td>table>tbody>tr:nth-child(1)>td:nth-child(3)"))
      end

      def middle_name
        @middle_name ||= StampsElement.new(browser.td(css: "body>table[align=center]>tbody>tr:nth-child(2)>td>table>tbody>tr>td>table>tbody>tr:nth-child(1)>td:nth-child(5)"))
      end

      def user_name
        @user_name ||= StampsElement.new(browser.td(css: "body>table[align=center]>tbody>tr:nth-child(2)>td>table>tbody>tr>td>table>tbody>tr:nth-child(2)>td:nth-child(2)"))
      end

      def account_no
        @account_no ||= StampsElement.new(browser.td(css: "body>table[align=center]>tbody>tr:nth-child(2)>td>table>tbody>tr>td>table>tbody>tr:nth-child(2)>td:nth-child(4)"))
      end

      def meter_no
        @meter_no ||= StampsElement.new(browser.td(css: "body>table[align=center]>tbody>tr:nth-child(2)>td>table>tbody>tr>td>table>tbody>tr:nth-child(2)>td:nth-child(6)"))
      end
    end

    module CustomerProfileAccountStatus
      def status_reason
        @status_reason ||= StampsElement.new(browser.td(css: "form[name=FrmOne]>table:nth-child(1)>tbody>tr>td>table>tbody>tr:nth-child(4)>td:nth-child(2)"))
      end

      def license_status
        @license_status ||= StampsElement.new(browser.td(css: "form[name=FrmOne]>table:nth-child(1)>tbody>tr>td>table>tbody>tr:nth-child(5)>td:nth-child(2)"))
      end

      def present?
        status_reason.present?
      end

      def wait_until_present(*args)
        status_reason.wait_until_present(*args)
      end
    end

    module CustomerProfilePostageSummary
      def available_postage
        @available_postage ||= StampsElement.new browser.td(css: "form[name=FrmOne]>table:nth-child(7)>tbody>tr>td>table>tbody>tr:nth-child(2)>td:nth-child(6)")
      end
    end

    class CustomerProfilePage < Browser::StampsModal
      include PamPageHeader
      include CustomerProfileAccountInfo
      include CustomerProfileAccountStatus
      include CustomerProfilePostageSummary
    end
  end
end