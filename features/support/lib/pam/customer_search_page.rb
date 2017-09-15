module Stamps
  module Pam
    class CustomerSearchPage < Browser::StampsModal
      def visit
        case param.test_env.downcase
          when /cc/
            url = "http://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@qa-clientsite:82/pam/AccountSearch.asp"
          when /sc/
            url = "http://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@site.qasc.stamps.com:82/pam/AccountSearch.asp"
          when /stg/
            url = "https://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@site.staging.stamps.com:82/pam/AccountSearch.asp"
          else
            url = nil
        end
        expect(url).not_to be_nil, "URL is nil. Check your ENV['URL'] parameter."
        logger.info "Visit: #{url}"
        sleep(1)
        browser.goto(url)
        sleep(1.5)
        self
      end

      def present?
        username.present?
      end

      def wait_until_present(*args)
        username.wait_until_present(*args)
      end

      def username
        StampsTextBox.new(browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=uname]"))
      end

      def first_name
        @first_name ||= StampsTextBox.new(browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=fname]"))
      end

      def last_name
        @last_name ||= StampsTextBox.new(browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=fname]"))
      end

      def phone
        @phone ||= StampsTextBox.new(browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=phone]"))
      end

      def email
        @email ||= StampsTextBox.new(browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=email]"))
      end

      def search_btn
        StampsElement.new(browser.text_field(css: "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]"))
      end

      def user_5_2_radio
        @user_5_2_radio ||= browser.radio(css: "input[name=v6usr][value='0']")
      end

      def user_5_2_or_lower

      end
    end
  end
end