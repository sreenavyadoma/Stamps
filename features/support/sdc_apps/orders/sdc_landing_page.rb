module Stamps
  module Orders

    class LandingPage < SdcPageObject
      # text_field(:username, {xpath: "//input[@placeholder='USERNAME']"})
      # text_field(:password,  {xpath: "//input[@placeholder='PASSWORD']"})
      element(:username, {xpath: "//input[@placeholder='USERNAME']"})
      element(:password,  {xpath: "//input[@placeholder='PASSWORD']"})
      element(:sign_in, {xpath: "//span[contains(text(), 'Sign In')]"}, required: true)
      checkbox(:remember_me,
               {xpath: "//*[contains(@class, 'remember-username-checkbox')]//span[contains(@id, 'displayEl')]"},
               {xpath: "//*[contains(@class, 'remember-username-checkbox')]"},
               "class", "checked")
      element(:iusername, {xpath: "//input[@placeholder='USERNAME']"})
      element(:ipassword,  {xpath: "//input[@placeholder='PASSWORD']"})

      page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

      def self.visit
        super(case SdcEnv.env
                when :qacc
                  'ext.qacc'
                when :qasc
                  'ext.qasc'
                when :stg
                  '.testing'
                when :prod
                  ''
                else
                  # ignore
              end)
      end

      def present?
        username.present? && password.present? && sign_in.present? && remember_me.present?
      end

      def sign_in_with(usr, pwd)
        username.set(usr)
        password.set(pwd)
        sign_in.safe_click(ctr: 2).send_keys_while_present(:enter, ctr: 2)
        sign_in.safe_wait_while_present
      end
    end

    class ILandingPage < LandingPage
      element(:username, {xpath: "//input[@placeholder='USERNAME']"})
      element(:password,  {xpath: "//input[@placeholder='PASSWORD']"})

      page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

      def present?
        username.present? && password.present? && sign_in.present? && remember_me.present?
      end

      def sign_in_with(usr, pwd)
        super(usr,pwd)
      end
    end

  end
end