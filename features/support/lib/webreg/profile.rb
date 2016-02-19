module WebReg
  class Profile < Stamps::Browser::BrowserObject
    class ReferrerName < Stamps::Browser::BrowserObject

      def present?
        browser_helper.present? @browser.label :css => "label[for=referrerName]"
      end

      def referrer name
        begin
          @browser.select_list(:id, "referrerName").option(:text => name).when_present.select
          @browser.select_list(:id, "referrerName").option(:text => name).when_present.select
          @browser.select_list(:id, "referrerName").option(:text => name).when_present.select
        rescue
          #ignore
        end
      end

      def web_banner
        referrer "Web Banner"
      end

      def streaming_audio
        referrer "Radio/Podcast/Streaming Audio"
      end

      def television_commercial
        referrer "Television Commercial"
      end

      def telephone_call
        referrer "Telephone Call"
      end

      def other
        referrer "Other"
      end

      def recommended_by_friend
        referrer "Recommended by Friend"
      end

      def recommended_by_usps
        referrer "Recommended by USPS"
      end

      def newspapaer_ad
        referrer "Newspaper Ad"
      end

      def magazine_ad
        referrer "Magazine Ad"
      end

      def received_mailer
        referrer "Received Mailer"
      end

      def already_used_in_office
        referrer "Already used in office"
      end

      def trade_show
        referrer "Trade show/convention"
      end

      def web_search
        referrer "Web Search"
      end

      def email_from_stamps
        referrer "Email from Stamps.com"
      end
    end

    class UsageType < Stamps::Browser::BrowserObject

      def mostly_mailing
        begin
          @browser.select_list(:id, "usageType").option(:text => /Mostly mailing/).when_present.select
          @browser.select_list(:id, "usageType").option(:text => /Mostly mailing/).when_present.select
        rescue
          #ignore
        end
      end

      def mostly_shipping
        begin
          @browser.select_list(:id, "usageType").option(:text => /Mostly shipping packages/).when_present.select
          @browser.select_list(:id, "usageType").option(:text => /Mostly shipping packages/).when_present.select
        rescue
          #ignore
        end
      end

      def mailing_and_shipping
        begin
          @browser.select_list(:id, "usageType").option(:text => /Both mailing and shipping/).when_present.select
          @browser.select_list(:id, "usageType").option(:text => /Both mailing and shipping/).when_present.select
        rescue
          #ignore
        end
      end

      def individual
        begin
          @browser.select_list(:id, "usageType").option(:text => /Home Office/).when_present.select
          @browser.select_list(:id, "usageType").option(:text => /Home Office/).when_present.select
        rescue
          #ignore
        end
      end
    end

    class FirstQuestion < Stamps::Browser::BrowserObject
      def question secret
        begin
          @browser.select_list(:name, "secretQuestion1").option(:text => secret).when_present.select
          @browser.select_list(:name, "secretQuestion1").option(:text => secret).when_present.select
          @browser.select_list(:name, "secretQuestion1").option(:text => secret).when_present.select
        rescue
          #ignore
        end
      end

      def mothers_maiden_name
        question "What is your mother's maiden name?"
      end

      def pets_name
        question "What is your pet's name?"
      end

      def birth_city
        question "What is your city of birth?"
      end

      def fathers_birth_place
        question "What is your father's birthplace?"
      end

      def street_name
        question "What street did you grow up on?"
      end

      def first_schools_name
        question "What is the name of your first school?"
      end

      def first_cars_make_model
        question "What is the make and model of your first car?"
      end
    end

    class SecondQuestion < Stamps::Browser::BrowserObject
      def question secret
        begin
          @browser.select_list(:name, "secretQuestion2").option(:text => secret).when_present.select
          @browser.select_list(:name, "secretQuestion2").option(:text => secret).when_present.select
          @browser.select_list(:name, "secretQuestion2").option(:text => secret).when_present.select
        rescue
          #ignore
        end
      end

      def mothers_maiden_name
        question "What is your mother's maiden name?"
      end

      def pets_name
        question "What is your pet's name?"
      end

      def birth_city
        question "What is your city of birth?"
      end

      def fathers_birth_place
        question "What is your father's birthplace?"
      end

      def street_name
        question "What street did you grow up on?"
      end

      def first_schools_name
        question "What is the name of your first school?"
      end

      def high_school_mascot
        question "What was your high school mascot?"
      end

      def first_cars_make_model
        question "What is the make and model of your first car?"
      end
    end

    def present?
      browser_helper.present? @browser.text_field(:id => "email")
    end

    def wait_until_present
      browser_helper.wait_until_present @browser.text_field(:id => "email")
      browser_helper.wait_until_present @browser.text_field(:id => "username")
      browser_helper.wait_until_present @browser.text_field(:id => "password")
      browser_helper.wait_until_present @browser.text_field(:id => "confirmPassword")
    end

    def referrer_name
      ReferrerName.new @browser
    end

    def email
      StampsTextbox.new @browser.text_field(:id => "email")
    end

    def user_id
      StampsTextbox.new @browser.text_field(:id => "username")
    end

    def password
      StampsTextbox.new @browser.text_field(:id => "password")
    end

    def retype_password
      StampsTextbox.new @browser.text_field(:id => "confirmPassword")
    end

    def usage_type
      UsageType.new @browser
    end

    def promo_code

    end

    def first_question
      FirstQuestion.new @browser
    end

    def first_answer
      StampsTextbox.new @browser.text_field(:id => "secretAnswer1")
    end

    def second_question
      SecondQuestion.new @browser
    end

    def second_answer
      StampsTextbox.new @browser.text_field(:id => "secretAnswer2")
    end

    def send_promo
      StampsButton.new @browser.input(:id => "optIn")
    end

    def continue
      StampsButton.new @browser.button(:id => "next")
    end

    def continue_to_mailing_info
      button = continue
      next_page = membership
      10.times do
        button.safe_click
        sleep1
        return next_page if next_page.present?
      end
    end

    def membership
      Membership.new @browser
    end
  end
end