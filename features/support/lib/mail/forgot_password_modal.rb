module Stamps
  module Mail
    class ForgotPasswordModal < Browser::StampsBase
      def window_x_button
        StampsField.new(browser.imgs(css: "img[class*='x-tool-close']")[0])
      end

      def close_window
        window_x_button.click
      end

      def x_button_present?
        window_x_button.present?
      end

      def wait_until_present
        begin
          window_x_button.wait_until_present
        rescue
          #ignore
        end
      end

      def window_title
        #browser.span text: "Forgot Password"
        browser.div text: "Forgot Password"
      end

      def present?
        window_title.present?
      end

      def username
        (cache[:username].nil? || cache[:username].present?)?cache[:username]=StampsTextbox.new(
            (browser.text_field(css: "div[id^=forgotpasswordmodal]>div>div>div>div>div>div>div>div>div>div>div>div>input"))):cache[:username]
      end

      def secret_answer_1
        (cache[:secret_answer_1].nil? || cache[:secret_answer_1].present?)?cache[:secret_answer_1]=StampsTextbox.new(
            browser.text_fields(css: "div[id^=forgotpasswordmodal]>div>div>div>div>div>div>div>div>div>div>div>div>input")[1]):cache[:secret_answer_1]
      end

      def secret_answer_2
        (cache[:secret_answer_2].nil? || cache[:secret_answer_2].present?)?cache[:secret_answer_2]=StampsTextbox.new(
            browser.text_fields(css: "div[id^=forgotpasswordmodal]>div>div>div>div>div>div>div>div>div>div>div>div>input")[2]):cache[:secret_answer_2]
      end

      def continue
        browser.spans(text: "Continue").each do |btn|
          button = StampsField.new(btn)
          return button.click if button.present?
        end
        sleep(2)
      end

      def confirm_reset
        confirmation=StampsField.new(browser.label(text: "We have sent a temporary password to the email address associated with your account."))
        5.times do
          sleep(0.35)
          return confirmation if confirmation.present?
        end
        expect("Unable to confirm password reset, check your code.").to eql "" unless confirmation.present?
      end
    end
  end
end