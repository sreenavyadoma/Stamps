module Stamps
  module Mail
    class ForgotUsernameModal < WebApps::Base
      def window_x_button
        StampsField.new(driver.imgs(css: "img[class*='x-tool-close']")[0])
      end

      def close_window
        window_x_button.click
      end

      def x_button_present?
        (driver.imgs(css: "img[class*='x-tool-close']")[0]).present?
      end

      def wait_until_present(*args)
        window_x_button.wait_until_present(*args)
      end

      def window_title

      end

      def present?
        driver.span text: "Forgot Username".present?
      end

      def email
        # StampsTextbox.new(driver.inputs(css: "input[class*='x-form-field x-form-text']")).last
        StampsTextbox.new(driver.text_fields(css: "input[class*='x-form-field x-form-text']").last)
      end

      def continue
        #button=StampsField.new(driver.as css: "a[class*=app-modal-button-primary]").last
        #button.click
        StampsField.new(driver.span(text: "Continue")).click
        sleep(2)
      end

      def ok
        confirmation = StampsField.new(driver.label(text: "We have sent your username to the email address associated with your account. If you cannot find this email, please check your spam folder."))
        5.times do
          sleep(0.35)
          break if confirmation.present?
        end
        expect("Unable to confirm password reset, check your code.").to eql "" unless confirmation.present?
        StampsField.new(driver.span( text: "Ok")).click
        sleep(2)
      end
    end
  end
end