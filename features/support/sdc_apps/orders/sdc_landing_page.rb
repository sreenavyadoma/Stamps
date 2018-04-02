module Stamps
  module Orders
    class LandingPage < SdcPageObject
      element(:username, {xpath: "//input[@placeholder='USERNAME']"}, tag_name: :text_field)
      element(:password, {xpath: "//input[@placeholder='PASSWORD']"}, tag_name: :text_field)

      by_xpath(:sign_in, "//span[contains(text(), 'Sign In')]", required: true)
      by_xpath(:i_username, "//input[@placeholder='USERNAME']")
      checkbox(:remember_me,
              {xpath: "//*[contains(@class, 'remember-username-checkbox')]//span[contains(@id, 'displayEl')]"},
              {xpath: "//*[contains(@class, 'remember-username-checkbox')]"},
              "class", "checked")

      page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

      def present?
        username.present? && password.present? && sign_in.present? && remember_me.present?
      end

      def sign_in_with(usr, pwd)
        username.set(usr)
        password.set(pwd)
        SdcLog.info remember_me.checked?
        remember_me.check
        SdcLog.info remember_me.checked?
        remember_me.uncheck

        sign_in.safe_click(ctr: 2).send_keys_while_present(:enter, ctr: 2)
        username.safe_wait_while_present(timeout: 10)
=begin
        Object.const_get(if SdcEnv.browser
                           "Orders::SdcOrders"
                         elsif SdcEnv.mobile
                           "Mobile::SdcOrders"
                         else
                           raise "Can not determine if mobile or browser test."
                         end
        ).new
=end
      end
    end
  end
end