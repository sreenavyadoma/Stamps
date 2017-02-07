module Stamps
  module WebReg

    class ReferrerName < Browser::Modal

      def present?
        (browser.label css: "label[for=referrerName]").present?
      end

      def referrer name
        begin
          browser.select_list(:id, "referrerName").option(text: name).when_present.select
          browser.select_list(:id, "referrerName").option(text: name).when_present.select
          browser.select_list(:id, "referrerName").option(text: name).when_present.select
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

      def clear
        referrer ""
      end

      #Added by Galina
      def help_element
        browser.span(css: "li[id=survey]>div:nth-child(2)>div>div>span") #if present?
      end

      def help_text
        element_helper.text help_element
      end
    end

    class UsageType < Browser::Modal

      def mostly_mailing
        begin
          browser.select_list(:id, "usageType").option(text: /Mostly mailing/).when_present.select
          browser.select_list(:id, "usageType").option(text: /Mostly mailing/).when_present.select
        rescue
          #ignore
        end
      end

      def mostly_shipping
        begin
          browser.select_list(:id, "usageType").option(text: /Mostly shipping packages/).when_present.select
          browser.select_list(:id, "usageType").option(text: /Mostly shipping packages/).when_present.select
        rescue
          #ignore
        end
      end

      def mailing_and_shipping
        begin
          browser.select_list(:id, "usageType").option(text: /Both mailing and shipping/).when_present.select
          browser.select_list(:id, "usageType").option(text: /Both mailing and shipping/).when_present.select
        rescue
          #ignore
        end
      end

      def individual
        begin
          browser.select_list(:id, "usageType").option(text: /Home Office/).when_present.select
          browser.select_list(:id, "usageType").option(text: /Home Office/).when_present.select
        rescue
          #ignore
        end


      end

      #Added by Galina
      def help_element
        browser.span(css: "li[class='module webreg_survey']>div>div>div>span")
      end

      def help_text
        element_helper.text help_element
      end

      def clear
        begin
          browser.select_list(:id, "usageType").option(text: //).when_present.select
          rescue
          #ignore
        end
      end

    end

    class FirstQuestion < Browser::Modal
      def select question
        select_element = browser.select_list(:name, "secretQuestion1")

        select_element.include? question

        select_element.option(text: question).when_present.select
        select_element.option(text: question).when_present.select
        select_element.option(text: question).when_present.select
        raise "Unable to select First Question: #{question}" unless select_element.selected? question
      end

      def mothers_maiden_name
        select "What is your mother's maiden name?"
      end

      def pets_name
        select "What is your pet's name?"
      end

      def birth_city
        select "What is your city of birth?"
      end

      def fathers_birth_place
        select "What is your father's birthplace?"
      end

      def street_name
        select "What street did you grow up on?"
      end

      def first_schools_name
        select "What is the name of your first school?"
      end

      def first_cars_make_model
        select "What is the make and model of your first car?"
      end

      def clear
        select ""
      end

      #Added by Galina
      def help_element
        browser.span(css: "li[class*=webreg_secretquestions]>div>:nth-child(1)>div>span")
      end

      def help_text
        element_helper.text help_element
      end
    end

    class SecondQuestion < Browser::Modal
      def select question
        select_element = browser.select_list(:name, "secretQuestion2")

        #validate that the selection exists
        select_element.include? question

        select_element.option(text: question).when_present.select
        select_element.option(text: question).when_present.select
        select_element.option(text: question).when_present.select
        raise "Unable to select Second Question: #{question}" unless select_element.selected? question
      end

      def mothers_maiden_name
        select "What is your mother's maiden name?"
      end

      def pets_name
        select "What is your pet's name?"
      end

      def birth_city
        select "What is your city of birth?"
      end

      def fathers_birth_place
        select "What is your father's birthplace?"
      end

      def street_name
        select "What street did you grow up on?"
      end

      def first_schools_name
        select "What is the name of your first school?"
      end

      def high_school_mascot
        select "What was your high school mascot?"
      end

      def first_cars_make_model
        select "What is the make and model of your first car?"
      end

      def clear
        select ""
        #browser.select_list(:name, "secretQuestion2").clear #you can only clear multi-selects (Watir::Exception::Error)
      end

      #Added by Galina
      def help_element
        browser.span(css: "li[class*=webreg_secretquestions]>div>:nth-child(3)>div>span")
      end

      def help_text
        element_helper.text help_element
      end

    end

    class ProfileEmail < StampsTextbox
      def help_element
        browser.span(css: "li[class='module webreg_email']>div>div>div>span")
      end

      def help_text
        element_helper.text help_element
      end

      def has_error?
        help_element.present?
      end

      def clear
        browser.text_field(id: "email").clear
      end
    end



    #Added by Galina
    class ProfileUserId < StampsTextbox
      def help_element
        browser.span(css: "li[class*=webreg_accountinfo]>div>div:nth-child(1)>div>span")
      end

      def help_text
        element_helper.text help_element
      end

      def clear
        browser.browser.text_field(id: "username").clear
      end
    end

    #Added by Galina
    class ProfilePassword < StampsTextbox
      def help_element
        browser.span(css: "li[class*=webreg_accountinfo]>div>div:nth-child(2)>div>span")
      end

      def help_text
        element_helper.text help_element
      end
    end

    #Added by Galina
    class ProfileRetypePassword < StampsTextbox
      def help_element
        browser.span(css: "li[class*=webreg_accountinfo]>div>div:nth-child(3)>div>span")
      end

      def help_text
        element_helper.text help_element
      end
    end

    #Added by Galina
    class ProfileFirstAnswer < StampsTextbox
      def help_element
        browser.span(css: "li[class*=webreg_secretquestions]>div>:nth-child(2)>div>span")
      end

      def help_text
        element_helper.text help_element
      end
    end

    #Added by Galina
    class ProfileSecondAnswer < StampsTextbox
      def help_element
        browser.span(css: "li[class*=webreg_secretquestions]>div>:nth-child(4)>div>span")
      end

      def help_text
        element_helper.text help_element
      end
    end



      class Profile < Browser::Modal
      attr_reader :referrer_name, :email, :user_id, :password, :retype_password, :usage_type, :first_question,
                  :first_answer, :second_question, :second_answer, :send_promo, :continue, :membership

      def initialize(param)
        super(param)
        @referrer_name = ReferrerName.new(param)
        @email = ProfileEmail.new browser.text_field(id: "email")
        @user_id = ProfileUserId.new browser.text_field(id: "username")
        @password = ProfilePassword.new browser.text_field(id: "password")
        @retype_password = ProfileRetypePassword.new browser.text_field(id: "confirmPassword")
        @usage_type = UsageType.new(param)
        @first_question = FirstQuestion.new(param)
        @first_answer = ProfileFirstAnswer.new browser.text_field(id: "secretAnswer1")
        @second_question = SecondQuestion.new(param)
        @second_answer = ProfileSecondAnswer.new browser.text_field(id: "secretAnswer2")
        @send_promo = StampsElement.new browser.text_field(id: "optIn")
        @continue = StampsElement.new browser.button(id: "next")
        @membership = Membership.new(param)
      end

      def present?
        browser.text_field(id: "email").present?
      end

      def wait_until_present
        browser.text_field(id: "email").wait_until_present 6
        browser.text_field(id: "username").wait_until_present
        browser.text_field(id: "password").wait_until_present
        browser.text_field(id: "confirmPassword").wait_until_present
        self
      end

      def promo_code
        raise 'promo_code not yet implemented.'
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

      # Added by Galina
      def tab
        browser.send_keys([:tab])
        sleep(0.35)
      end

  end
  end
end