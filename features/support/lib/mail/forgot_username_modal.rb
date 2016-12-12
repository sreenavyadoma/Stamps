module Stamps
  module Mail
    class ForgotUsernameModal < Browser::Modal
      def window_x_button
        BrowserElement.new (browser.imgs css: "img[class*='x-tool-close']")[0]
      end

      def close_window
        element_helper.safe_click window_x_button
      end

      def x_button_present?
        ((browser.imgs css: "img[class*='x-tool-close']")[0]).present?
      end

      def wait_until_present
        begin
          window_x_button.wait_until_present
        rescue
          #ignore
        end
      end

      def window_title

      end

      def present?
        browser.span text: "Forgot Username".present?
      end

      def email
        TextboxElement.new (browser.inputs css: "input[class*='x-form-field x-form-text']").last
      end

      def continue
        button = BrowserElement.new (browser.as css: "a[class*=app-modal-button-primary]").last
        button.click
        sleep(2)
      end

      def ok
        button = BrowserElement.new browser.span css: "span[id*=sdc-undefinedwindow-okbtn-btnIconEl]"
        button.click
        sleep(2)

      end
    end
  end
end