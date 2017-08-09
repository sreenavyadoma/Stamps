module Stamps
  module Registration

    class WebRegistration < Browser::StampsModal
      attr_reader :bread_crumbs, :navigation, :profile, :membership, :footer, :choose_supplies, :add_postage, :ship_volume_survey, :security_questions
      def initialize(param)
        super
        @navigation = Navigation::RegistrationNavigationBar.new(param)
        @bread_crumbs = RegistrationBreadCrumbs.new(param)
        @profile = Profile::ProfilePage.new(param)
        @membership ||= Membership::MembershipPage.new(param)
        @choose_supplies = ChooseSupplies.new(param)
        @add_postage = AddPostage.new(param)
        @ship_volume_survey = ShipVolumeSurvey.new(param)
        @footer = Footer::ProfileFooter.new(param)
        @security_questions = SecurityQuestionsRegistration.new(param)

      end

      def present?
        profile.present?
      end

      def wait_until_present(*args)
        profile.wait_until_present(*args)
      end

      def load_theme(theme)
        case theme
          when /1632/
            theme = 'theme_1632'
          else
            # do nothing
        end

        case modal_param.test_env.downcase
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
        wait_until_present(10)
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