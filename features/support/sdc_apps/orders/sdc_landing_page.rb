module Stamps
  module Orders

    class LandingPage < WatirDrops::PageObject

      element(:username) { SdcElement.new(browser.text_field(xpath: "//input[@placeholder='USERNAME']")) }
      element(:password) { SdcElement.new(browser.text_field(xpath: "//input[@placeholder='PASSWORD']")) }
      element(:sign_in) { SdcElement.new(browser.span(xpath: "//span[contains(text(), 'Sign In')]")) }
      element(:signed_in_user) { SdcElement.new(browser.a(id: "username")) }

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
            sign_in.send_keys(:enter)
            sign_in.send_keys(:enter)
            sign_in.safe_click
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
      element(:username) { SdcElement.new(browser.find_element(xpath: "//input[@placeholder='USERNAME']")) }
      element(:password) { SdcElement.new(browser.find_element(xpath: "//input[@placeholder='PASSWORD']")) }
      element(:sign_in) { SdcElement.new(browser.find_element(xpath: "//span[contains(text(), 'Sign In')]")) }

      def sign_in_with(usr, pwd)
        username.set(usr)
        password.set(pwd)
        sign_in.click
        sign_in.send_keys(:enter)
        sign_in.safe_send_keys(:enter)
      end
      sleep(10)
    end

    class AndroidLandingPage < IosLandingPage

      def sign_in_with(usr, pwd)
        username.set(usr)
        password.set(pwd)
        browser.hide_keyboard
        browser.action.move_to(sign_in).click.perform
        browser.action.move_to(sign_in).send_keys(:enter).perform
        sleep(10)
      end
    end
  end
end