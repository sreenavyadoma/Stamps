module Stamps
  module Mail
    class ForgotUsernameModal < Browser::StampsModal
      def window_x_button
        StampsElement.new(browser.imgs(css: "img[class*='x-tool-close']")[0])
      end

      def close_window
        window_x_button.click
      end

      def x_button_present?
        (browser.imgs(css: "img[class*='x-tool-close']")[0]).present?
      end

      def wait_until_present(*args)
        window_x_button.wait_until_present(*args)
      end

      def window_title

      end

      def present?
        browser.span text: "Forgot Username".present?
      end

      def email
        StampsTextBox.new(browser.inputs css: "input[class*='x-form-field x-form-text']").last
      end

      def continue
        button = StampsElement.new(browser.as css: "a[class*=app-modal-button-primary]").last
        button.click
        sleep(2)
      end

      def ok
        button = StampsElement.new browser.span css: "span[id*=sdc-undefinedwindow-okbtn-btnIconEl]"
        button.click
        sleep(2)

      end
    end
  end
end