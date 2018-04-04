module Stamps
  module Orders
    module LandPageInstHelper
      def visit_env
        case SdcEnv.env
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
        end
      end
    end

    class LandingPage < SdcPageObject
      include LandPageInstHelper

      text_field(:username, tag_name: :text_field) { {xpath: "//input[@placeholder='USERNAME']"} }
      text_field(:password, tag_name: :text_field) { {xpath: "//input[@placeholder='PASSWORD']"} }
      button(:sign_in, required: true) { {xpath: "//span[contains(text(), 'Sign In')]"} }

      element(:rm_checkbox) { {xpath: "//*[contains(@class, 'remember-username-checkbox')]//span[contains(@id, 'displayEl')]"} }
      element(:rm_verify) { {xpath: "//*[contains(@class, 'remember-username-checkbox')]"} }
      checkbox(:remember_me, :rm_checkbox, :rm_verify, "class", "checked")

      page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

      def self.visit
        super(visit_env)
      end

      def sign_in_with(usr, pwd)
        username.set(usr)
        password.set(pwd)
        sign_in.safe_click(ctr: 2).send_keys_while_present(:enter, ctr: 2)
        sign_in.safe_wait_while_present
      end
    end

  end
end