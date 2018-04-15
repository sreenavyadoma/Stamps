module Stamps
  module Orders


    class LandingPage < SdcPage

      page_obj(:username, tag: :text_field, required: true) { {xpath: "//input[@placeholder='USERNAME']"} }
      page_obj(:password, tag: :text_field, required: true) { {xpath: "//input[@placeholder='PASSWORD']"} }
      page_obj(:sign_in) { {xpath: "//span[contains(text(), 'Sign In')]"} }
      page_obj(:signed_in_user, tag: :a) { {id: "username"} }

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
            sign_in.click
            sign_in.click
            sign_in.safe_click
            sign_in.send_keys(:enter)
            sign_in.send_keys(:enter)
            #sign_in.send_keys_while_present(:enter, ctr: 2)
            #sign_in.safe_wait_while_present
            break if signed_in_user.present?
          rescue
            # ignore
          end
        end
        sleep(10)
      end
    end

    class IosLandingPage < LandingPage

      def sign_in_with(usr, pwd)
        username.set(usr)
        password.set(pwd)
        begin
          sign_in.click
          sign_in.send_keys(:enter)
          sign_in.safe_send_keys(:enter)
        rescue
          # ignore
        end
      end
      sleep(10)
    end

    class AndroidLandingPage < LandingPage

      def sign_in_with(usr, pwd)
        username.set(usr)
        password.set(pwd)
        browser.hide_keyboard
        begin
          browser.action.move_to(sign_in).click.perform
          browser.action.move_to(sign_in).send_keys(:enter).perform
        rescue
          # ignore
        end
        sleep(10)
      end
    end
  end
end