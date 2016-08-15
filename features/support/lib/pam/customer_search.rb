module Stamps
  module Pam

    class CustomerProfileNotFound < Browser::Modal
      def present?
        browser.text.include? 'No records found'
      end

      def text
        browser.text
      end
    end

    class MeterInfoNotAvailableForAccount < Browser::Modal
      def present?
        browser.text.include? 'Meter info not available'
      end

      def text
        browser.text
      end
    end

    class CustomerSearch < Browser::Modal
      def present?
        browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]").present?
      end

      def wait_until_present
        (ElementWrapper.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]")).wait_until_present 7
      end

      def username
        TextBoxElement.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=uname]")
      end

      def first_name
        TextBoxElement.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=fname]")
      end

      def last_name
        TextBoxElement.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=fname]")
      end

      def phone
        TextBoxElement.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=phone]")
      end

      def email
        TextBoxElement.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=email]")
      end

      def user_5_2_or_lower
        browser.radio(css: "input[name=v6usr][value='0']").set
        browser.radio(css: "input[name=v6usr][value='0']").set
        browser.radio(css: "input[name=v6usr][value='0']").set
      end

      def search
        button = Stamps::Browser::ElementWrapper.new browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]")
        customer_profile = CustomerProfile.new param
        customer_profile_not__found = CustomerProfileNotFound.new param
        meter_info_unavailable = MeterInfoNotAvailableForAccount.new param
        count = 15
        count.times do |counter|
          button.send_keys :enter
          button.safe_click
          sleep 1
          return customer_profile if customer_profile.present?
          if customer_profile_not__found.present?
            logger.info "PAM:  #{customer_profile_not__found.message}"
            browser.back if counter < count-1
          end
        end

        return customer_profile if customer_profile.present?
        return customer_profile_not__found if customer_profile_not__found.present?
        meter_info_unavailable if meter_info_unavailable.present?
      end
    end
  end
end