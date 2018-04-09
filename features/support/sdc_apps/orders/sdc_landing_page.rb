module Stamps
  module Orders

    class LandingPage < SdcPageObject

      text_field(:username, tag_name: :text_field, required: true) { {xpath: "//input[@placeholder='USERNAME']"} }
      text_field(:password, tag_name: :text_field, required: true) { {xpath: "//input[@placeholder='PASSWORD']"} }
      button(:sign_in, required: true) { {xpath: "//span[contains(text(), 'Sign In')]"} }

      element(:rm_checkbox) { {xpath: "//*[contains(@class, 'remember-username-checkbox')]//span[contains(@id, 'displayEl')]"} }
      element(:rm_verify) { {xpath: "//*[contains(@class, 'remember-username-checkbox')]"} }
      checkbox(:remember_me, :rm_checkbox, :rm_verify, "class", "checked")

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

      def sign_in_with(usr, pwd, iter: 3)
        username.set(usr)
        password.set(pwd)
        iter.to_i.times do
          begin
            sign_in.safe_click(ctr: 2).send_keys_while_present(:enter, ctr: 2)
            sign_in.safe_wait_while_present
            break unless sign_in.present?
          rescue
            # ignore
          end
        end
        sleep(10) if SdcEnv.ios
      end
    end

    class AndroidLandingPage < LandingPage
      def sign_in_with(usr, pwd)
        username.set(usr)
        password.set(pwd)
        browser.hide_keyboard
        browser.action.move_to(sign_in).send_keys(:enter).perform
        browser.action.move_to(sign_in).click.perform
      end
    end
  end
end