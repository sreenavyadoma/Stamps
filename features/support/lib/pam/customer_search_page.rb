module Stamps
  module Pam
    class CustomerSearchPage < WebApps::Base
      def visit
        url = case param.env
                when /cc/
                  "http://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@qa-clientsite:82/pam/AccountSearch.asp"
                when /sc/
                  "http://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@site.qasc.stamps.com:82/pam/AccountSearch.asp"
                when /stg/
                  "https://#{data_for(:pam, {})['admin_username']}:#{data_for(:pam, {})['admin_password']}@site.staging.stamps.com:82/pam/AccountSearch.asp"
                else
                  raise ArgumentError, "#{param.env} environment is not implemented."
              end
        log.info "Visit: #{url}"
        sleep(1)
        driver.goto(url)
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
        StampsTextbox.new(driver.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=uname]"))
      end

      def first_name
        @first_name ||= StampsTextbox.new(driver.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=fname]"))
      end

      def last_name
        @last_name ||= StampsTextbox.new(driver.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=fname]"))
      end

      def phone
        @phone ||= StampsTextbox.new(driver.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=phone]"))
      end

      def email
        @email ||= StampsTextbox.new(driver.text_field(css: "form[name=searchForm]>table>tbody>tr>td>input[name=email]"))
      end

      def search_btn
        StampsField.new(driver.text_field(css: "form[name=searchForm]>table>tbody>tr>td>p>input[name=Input]"))
      end

      def user_5_2_radio
        @user_5_2_radio ||= driver.radio(css: "input[name=v6usr][value='0']")
      end

      def user_5_2_or_lower

      end
    end
  end
end