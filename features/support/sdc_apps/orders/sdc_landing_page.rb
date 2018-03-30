module Stamps
  module Orders
    class OrdersWelcomeModal < SdcPageObject
      element(:title) {SdcElement.new(browser.div(text: 'Welcome!'))}
      element(:msg_container) {SdcElement.new(browser.div(id: 'sdc-window-tutorial-innerCt'))}
      element(:next_button) {SdcElement.new(browser.span(text: 'Next'))}
      element(:close_button) {SdcElement.new(browser.img(css: 'img[class$=x-tool-close]'))}
      element(:add_manual_order) {SdcElement.new(browser.xxxxxxx)}

      def close
        close_button.click_while_present
      end

      def message
        msg_container.text_value
      end

      def next
        10.times do
          next_button.safe_click
          break
        end
      end
    end

    class LandingPage < SdcPageObject
      element(:username, required: true) { SdcElement.new(browser.text_field(css: '[placeholder=USERNAME]')) }
      element(:password, required: true) { SdcElement.new(browser.text_field(css: '[placeholder=PASSWORD]')) }
      element(:sign_in, required: true) { SdcElement.new(browser.span(text: 'Sign In')) }
      element(:remember_me) { SdcChooser.new(SdcElement.new(browser.span(:id, '[class*=remember-username-checkbox]')),
                                             SdcElement.new(browser.div(css: '[class*=remember-username-checkbox] [id$=-displayEl]')),
                                             'class', 'checked') }

      page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

      def present?
        username.present? && password.present? && sign_in.present? && remember_me.present?
      end

      def sign_in_with(usr, pwd)
        username.set usr
        password.set pwd
        sign_in.safe_click(ctr: 2).send_keys_while_present(:enter, ctr: 2)
        username.safe_wait_while_present(timeout: 10)
        Object.const_get(if SdcEnv.browser
                           "Orders::SdcOrders"
                         elsif SdcEnv.i_device_name
                           "Mobile::SdcOrders"
                         else
                           raise "Can not determine if mobile or browser test."
                         end
        ).new
      end
    end

    class ILandingPage < SdcPageObject
      element(:username, required: true) { SdcElement.new(browser.find_element(xpath: "//input[@placeholder='USERNAME']")) }
      element(:password, required: true) { SdcElement.new(browser.find_element(xpath: "//input[@placeholder='PASSWORD']")) }
      element(:sign_in, required: true) { SdcElement.new(browser.find_element(xpath: "//span[contains(text(), 'Sign In')]")) }

      page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

      def present?
        username.present? && password.present? && sign_in.present? && remember_me.present?
      end

      def sign_in_with(usr, pwd)
        username.send_keys usr
        password.send_keys pwd
        sign_in.send_keys :enter
        sign_in.safe_send_keys :enter
      end
    end
  end
end