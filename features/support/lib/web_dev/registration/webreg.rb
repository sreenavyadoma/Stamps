module Stamps
  module Registration

    class WebRegistration < Browser::StampsModal
      attr_reader :navigation, :profile, :error_occured, :footer
      def initialize(param)
        super
        @navigation = Navigation::RegistrationNavigationBar.new(param)
        #@bread_crumbs = RegistrationBreadCrumbs.new(param)
        @profile = Profile::ProfilePage.new(param)
        #@footer = RegistrationFooter.new(param)
        @footer = Footer::ProfileFooter.new(param)
        @error_occured = AnErrorOccured.new(param)
      end

      def present?
        footer.present?
      end

      def wait_until_present(*args)
        footer.wait_until_present(*args)
      end

      def load_theme(theme)
        case theme
          when /1632/
            theme = 'theme_1632'
          else
            # do nothing
        end

        #expect(['theme_1632', 'default']).to include(theme), "Registration Theme #{theme} is not supported. We curently only support Theme 1632"

        case param.test_env.downcase
          when /cc/
            url = "https://qa-registration.stamps.com/registration/#{(theme.nil?)?"":"?theme=#{theme}"}"
          when /sc/
            url = "https://registrationext.qasc.stamps.com/registration/#{(theme.nil?)?"":"?theme=#{theme}"}"
          when /stg/
            url = "https://registration.staging.stamps.com/registration/#{(theme.nil?)?"":"?theme=#{theme}"}"
          else
            #do nothing
        end
        logger.info "Visit:  #{url}"
        browser.goto(url)

        error_occured.wait_until_present 1
        if error_occured.present?
          logger.error error_occured.header
          logger.error error_occured.top_message
          logger.error error_occured.error_code
          logger.error error_occured.error_description
          expect("#{error_occured.header} #{error_occured.top_message} #{error_occured.error_code} #{error_occured.error_description} ").to eql error_occured.header
        end
        50.times do
          break if browser.url.include? 'profile'
        end
        expect(browser.url).to include "registration"
        sign_up_for_new_account = StampsElement.new browser.h1(text: "Sign up for a new account")
        sign_up_for_new_account.wait_until_present 8
        logger.info "Page loaded.  #{browser.url}"
        "Success"
      end

    end

    class AnErrorOccured < Browser::StampsModal
      attr :header_elem, :top_message_elem, :error_code_elem, :error_description_elem

      def initialize(param)
        super
        @header_elem = StampsElement.new browser.h3(text: "An Error Occurred")
        @top_message_elem = StampsElement.new browser.p(id: "topMessage")
        @error_code_elem = StampsElement.new browser.p(id: "errorCode")
        @error_description_elem = StampsElement.new browser.p(id: "errorDescription")
      end

      def present?
        header_elem.present?
      end

      def wait_until_present(*args)
        header_elem.wait_until_present(*args)
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

  end
end