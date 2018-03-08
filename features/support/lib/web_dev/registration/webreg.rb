module Stamps
  module Registration

    class WebRegistration < WebApps::Base

      def navigation
        cache[:navigation] = Navigation::RegistrationNavigationBar.new(param) if cache[:navigation].nil?
        cache[:navigation]
      end

      def bread_crumbs
        cache[:bread_crumbs] = RegistrationBreadCrumbs.new(param) if cache[:bread_crumbs].nil?
        cache[:bread_crumbs]
      end

      def profile
        cache[:profile] = Profile::Page.new(param) if cache[:profile].nil?
        cache[:profile]
      end

      def membership
        cache[:membership] = Membership::MembershipPage.new(param) if cache[:membership].nil?
        cache[:membership]
      end

      def choose_supplies
        cache[:choose_supplies] = ChooseSupplies.new(param) if cache[:choose_supplies].nil?
        cache[:choose_supplies]
      end

      def add_postage
        cache[:add_postage] = AddPostage.new(param) if cache[:add_postage].nil?
        cache[:add_postage]
      end

      def ship_volume_survey
        cache[:ship_volume_survey] = ShipVolumeSurvey.new(param) if cache[:ship_volume_survey].nil?
        cache[:ship_volume_survey]
      end

      def footer
        cache[:footer] = Footer::ProfileFooter.new(param) if cache[:footer].nil?
        cache[:footer]
      end

      def security_questions
        cache[:security_questions] = SecurityQuestionsRegistration.new(param) if cache[:security_questions].nil?
        cache[:security_questions]
      end


      def present?
        profile.present?
      end

      def wait_until_present(*args)
        profile.wait_until_present(*args)
      end

      def load_theme(theme)
        theme = case theme
                  when /1632/
                    'theme_1632'
                  else
                    nil
                end
        url = case modal_param.test_env.downcase
                when /cc/
                  "https://qa-registration.stamps.com/registration/#{(theme.nil?) ? "" : "?theme=#{theme}"}"
                when /sc/
                  "https://registrationext.qasc.stamps.com/registration/#{(theme.nil?) ? "" : "?theme=#{theme}"}"
                when /stg/
                  "https://registration.staging.stamps.com/registration/#{(theme.nil?) ? "" : "?theme=#{theme}"}"
                else
                  raise ArgumentError, "#{param.test_env} environment is not implemented."
              end
        log.info "Visit:  #{url}"
        browser.goto(url)
        wait_until_present(10)
      end

    end

    class AnErrorOccured < WebApps::Base

      def header_elem
        cache[:header_elem] = StampsField.new browser.h3(text: "An Error Occurred") if cache[:header_elem].nil?
        cache[:header_elem]
      end

      def top_message_elem
        cache[:top_message_elem] = StampsField.new browser.p(id: "topMessage") if cache[:top_message_elem].nil?
        cache[:top_message_elem]
      end

      def error_code_elem
        cache[:error_code_elem] = StampsField.new browser.p(id: "errorCode") if cache[:error_code_elem].nil?
        cache[:error_code_elem]
      end

      def error_description_elem
        cache[:error_description_elem] = StampsField.new browser.p(id: "errorDescription") if cache[:error_description_elem].nil?
        cache[:error_description_elem]
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