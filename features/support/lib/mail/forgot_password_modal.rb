module Stamps
  module Mail
    class ForgotPasswordModal < Browser::StampsModal
      def window_x_button
        StampsElement.new(browser.imgs(css: "img[class*='x-tool-close']")[0])
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
        browser.span text: "Forgot Password"
      end

      def present?
        window_title.present?
      end

      def username
        frame1 = browser.iframe(css: "iframe[src*='/Store/login/lost_password/webpostage/']")
        frame1.text_field(:id, 'login')
      end

      def secret_answer_1
        frame1 = browser.iframe(css: "iframe[src*='/Store/login/lost_password/webpostage/']")
        frame1.text_field(name: "/stamps/userprofiling/SDCProfileFormHandler.value.codeword1")
      end

      def secret_answer_2
        frame1 = browser.iframe(css: "iframe[src*='/Store/login/lost_password/webpostage/']")
        frame1.text_field(name: "/stamps/userprofiling/SDCProfileFormHandler.value.codeword2")
      end

      def continue
        frame1 = browser.iframe(css: "iframe[src*='/Store/login/lost_password/webpostage/']")
        button = frame1.div(id: "fb_btnContinue")
        button.click
        sleep(2)
      end

      def confirm_reset
        frame1 = browser.iframe(css: "iframe[src*='/Store/login/lost_password/webpostage/']")
        confirmation = frame1.p(text: "Thank you. We have sent a temporary password in an email to you.")
        5.times do
          sleep(0.35)
          return confirmation if confirmation.present?
        end
        expect("Unable to confirm password reset, check your code.").to eql "" unless confirmation.present?
      end
    end
  end
end