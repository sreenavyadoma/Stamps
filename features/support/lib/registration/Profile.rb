module WebReg
  class Profile < Stamps::Browser::BrowserObject
    class ReferrerName < Stamps::Browser::BrowserObject

      def web_banner
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Web Banner").when_present.select
        rescue
          #ignore
        end
      end

      def streaming_audio
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Radio/Podcast/Streaming Audio").when_present.select
        rescue
          #ignore
        end
      end

      def television_commercial
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Television Commercial").when_present.select
        rescue
          #ignore
        end
      end

      def telephone_call
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Telephone Call").when_present.select
        rescue
          #ignore
        end
      end

      def other
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Other").when_present.select
        rescue
          #ignore
        end
      end

      def recommended_by_friend
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Recommended by Friend").when_present.select
        rescue
          #ignore
        end
      end

      def recommended_by_usps
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Recommended by USPS").when_present.select
        rescue
          #ignore
        end
      end

      def newspapaer_ad
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Newspaper Ad").when_present.select
        rescue
          #ignore
        end
      end

      def magazine_ad
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Magazine Ad").when_present.select
        rescue
          #ignore
        end
      end

      def received_mailer
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Received Mailer").when_present.select
        rescue
          #ignore
        end
      end

      def already_used_in_office
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Already used in office").when_present.select
        rescue
          #ignore
        end
      end

      def trade_show
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Trade show/convention").when_present.select
        rescue
          #ignore
        end
      end

      def web_search
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Web Search").when_present.select
        rescue
          #ignore
        end
      end

      def email_from_stamps
        begin
          @browser.select_list(:id, "referrerName").option(:text => "Email from Stamps.com").when_present.select
        rescue
          #ignore
        end
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
      def mothers_maiden_name
        begin
          @browser.select_list(:name, "secretQuestion1").option(:text => "What is your mother's maiden name?").when_present.select
          @browser.select_list(:name, "secretQuestion1").option(:text => "What is your mother's maiden name?").when_present.select
        rescue
          #ignore
        end
      end

      def pets_name
        begin
          @browser.select_list(:name, "secretQuestion1").option(:text => "What is your pet's name?").when_present.select
          @browser.select_list(:name, "secretQuestion1").option(:text => "What is your pet's name?").when_present.select
        rescue
          #ignore
        end
      end

      def birth_city
        begin
          @browser.select_list(:name, "secretQuestion1").option(:text => "What is your city of birth?").when_present.select
          @browser.select_list(:name, "secretQuestion1").option(:text => "What is your city of birth?").when_present.select
        rescue
          #ignore
        end
      end

      def fathers_birth_place
        begin
          @browser.select_list(:name, "secretQuestion1").option(:text => "What is your father's birthplace?").when_present.select
          @browser.select_list(:name, "secretQuestion1").option(:text => "What is your father's birthplace?").when_present.select
        rescue
          #ignore
        end
      end

      def street_name
        begin
          @browser.select_list(:name, "secretQuestion1").option(:text => "What street did you grow up on?").when_present.select
          @browser.select_list(:name, "secretQuestion1").option(:text => "What street did you grow up on?").when_present.select
        rescue
          #ignore
        end
      end

      def first_schools_name
        begin
          @browser.select_list(:name, "secretQuestion1").option(:text => "What is the name of your first school?").when_present.select
          @browser.select_list(:name, "secretQuestion1").option(:text => "What is the name of your first school?").when_present.select
        rescue
          #ignore
        end
      end

      def first_cars_make_model
        begin
          @browser.select_list(:name, "secretQuestion1").option(:text => "What is the make and model of your first car?").when_present.select
          @browser.select_list(:name, "secretQuestion1").option(:text => "What is the make and model of your first car?").when_present.select
        rescue
          #ignore
        end
      end
    end

    class SecondQuestion < Stamps::Browser::BrowserObject
      def mothers_maiden_name
        begin
          @browser.select_list(:name, "secretQuestion2").option(:text => "What is your mother's maiden name?").when_present.select
          @browser.select_list(:name, "secretQuestion2").option(:text => "What is your mother's maiden name?").when_present.select
        rescue
          #ignore
        end
      end

      def pets_name
        begin
          @browser.select_list(:name, "secretQuestion2").option(:text => "What is your pet's name?").when_present.select
        rescue
          #ignore
        end
      end

      def birth_city
        begin
          @browser.select_list(:name, "secretQuestion2").option(:text => "What is your city of birth?").when_present.select
          @browser.select_list(:name, "secretQuestion2").option(:text => "What is your city of birth?").when_present.select
        rescue
          #ignore
        end
      end

      def fathers_birth_place
        begin
          @browser.select_list(:name, "secretQuestion2").option(:text => "What is your father's birthplace?").when_present.select
          @browser.select_list(:name, "secretQuestion2").option(:text => "What is your father's birthplace?").when_present.select
        rescue
          #ignore
        end
      end

      def street_name
        begin
          @browser.select_list(:name, "secretQuestion2").option(:text => "What street did you grow up on?").when_present.select
          @browser.select_list(:name, "secretQuestion2").option(:text => "What street did you grow up on?").when_present.select
        rescue
          #ignore
        end
      end

      def first_schools_name
        begin
          @browser.select_list(:name, "secretQuestion2").option(:text => "What is the name of your first school?").when_present.select
          @browser.select_list(:name, "secretQuestion2").option(:text => "What is the name of your first school?").when_present.select
        rescue
          #ignore
        end
      end

      def high_school_mascot
        begin
          @browser.select_list(:name, "secretQuestion2").option(:text => "What was your high school mascot?").when_present.select
          @browser.select_list(:name, "secretQuestion2").option(:text => "What was your high school mascot?").when_present.select
        rescue
          #ignore
        end
      end

      def first_cars_make_model
        begin
          @browser.select_list(:name, "secretQuestion2").option(:text => "What is the make and model of your first car?").when_present.select
          @browser.select_list(:name, "secretQuestion2").option(:text => "What is the make and model of your first car?").when_present.select
        rescue
          #ignore
        end
      end
    end

    def referrer_name
      ReferrerName.new @browser
    end

    def email
      Textbox.new @browser.text_field(:id => "email")
    end

    def user_id
      Textbox.new @browser.text_field(:id => "username")
    end

    def password
      Textbox.new @browser.text_field(:id => "password")
    end

    def retype_password
      Textbox.new @browser.text_field(:id => "confirmPassword")
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
      Textbox.new @browser.text_field(:id => "secretAnswer1")
    end

    def second_question
      SecondQuestion.new @browser
    end

    def second_answer
      Textbox.new @browser.text_field(:id => "secretAnswer2")
    end

    def send_promo
      Button.new @browser.input(:id => "optIn")
    end

    def continue
      Button.new @browser.button(:id => "next")
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