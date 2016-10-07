module Stamps
  module WebReg
    class WebRegistration < Browser::Modal
      attr_reader :profile
      def initialize param
        super param
        @profile ||= Profile.new param
      end

      def visit
        ENV['URL'] = 'stg' if ENV['URL'].downcase == 'staging'

        case ENV['URL'].downcase
          when /cc/
            url = "https://qa-registration.stamps.com/registration"
          when /sc/
            url = "https://registrationext.qasc.stamps.com/registration"
          when /stg/
            url = "https://registration.staging.stamps.com/registration"
          else
            "#{ENV['URL']} is not a valid Registration URL prefix selection.  Check your test!".should eql ""
        end

        logger.info "Visit:  #{url}"
        5.times do
          browser.goto url
          break if browser.url.include? 'stamps.com'
        end
        return "Registration page did not load" unless browser.url.include? "registration"
        sign_up_for_new_account = ElementWrapper.new browser.h1(text: "Sign up for a new account")
        sign_up_for_new_account.safely_wait_until_present 8
        logger.info "Page loaded.  #{browser.url}"
        "Success"
      end
    end
  end
end