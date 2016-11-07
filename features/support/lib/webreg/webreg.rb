module Stamps
  module WebReg
    class AnErrorOccured < Browser::Modal
      attr :header_elem, :top_message_elem, :error_code_elem, :error_description_elem

      def initialize param
        super param
        @header_elem = ElementWrapper.new browser.h3(text: "An Error Occurred")
        @top_message_elem = ElementWrapper.new browser.p(id: "topMessage")
        @error_code_elem = ElementWrapper.new browser.p(id: "errorCode")
        @error_description_elem = ElementWrapper.new browser.p(id: "errorDescription")
      end

      def present?
        header_elem.present?
      end

      def wait_until_present *args
        header_elem.safely_wait_until_present *args
      end

      def header
        header_elem.text
      end

      def top_message
        top_message_elem.text
      end

      def error_code
        error_code_elem.text
      end

      def error_description
        error_description_elem.text
      end
    end

    class WebRegistration < Browser::Modal
      attr_reader :profile, :error_occured
      def initialize param
        super param
        @profile ||= Profile.new param
        @error_occured ||= AnErrorOccured.new param
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
          break if browser.url.include? 'registration'
        end

        error_occured.wait_until_present 1
        if error_occured.present?
          logger.error error_occured.header
          logger.error error_occured.top_message
          logger.error error_occured.error_code
          logger.error error_occured.error_description
          "#{error_occured.header} #{error_occured.top_message} #{error_occured.error_code} #{error_occured.error_description} ".should eql error_occured.header
        end
        browser.url.should include "profile"
        sign_up_for_new_account = ElementWrapper.new browser.h1(text: "Sign up for a new account")
        sign_up_for_new_account.safely_wait_until_present 8
        logger.info "Page loaded.  #{browser.url}"
        "Success"
      end
    end
  end
end