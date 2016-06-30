module Stamps
  module WebReg
    class Registration < Browser::Modal
      def visit
        case ENV['URL'].downcase
          when /cc/
            url = "https://qa-registration.stamps.com/registration"
          when /sc/
            url = "https://registrationext.qasc.stamps.com/registration"
          when /staging/
            url = "https://registration.staging.stamps.com/registration/"
          else
            stop_test "#{ENV['URL']} is not a valid Registration URL prefix selection.  Check your test!"
        end

        logger.info "Visit:  #{url}"
        browser.goto url
        sign_up_for_new_account = BrowserElement.new browser.h1(:text => "Sign up for a new account")
        sign_up_for_new_account.wait_until_present
        logger.info "Page loaded.  #{browser.url}"
        self
      end

      def profile
        Profile.new param
      end
    end
  end
end