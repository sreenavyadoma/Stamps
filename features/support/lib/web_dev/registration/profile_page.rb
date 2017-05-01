module Stamps
  module Registration
    module Profile

      class AccountInfo < Browser::StampsModal
        attr_reader :account_username, :account_password, :retype_password

        def initialize(param)
          super
          @account_username = StampsTextBox.new(browser.text_field(name: "username"))
          @account_username.help_elements = browser.lis(css: "li[id=accountinfo]>div>div:nth-child(1)>div>span>span>ul>li")

          @account_password = StampsTextBox.new(browser.text_field(id: "password"))
          @account_password.help_elements = browser.lis(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span>span>ul>li")

          @retype_password = StampsTextBox.new(browser.text_field(id: "confirmPassword"))
          @retype_password.help_elements = browser.lis(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span>span")
        end
      end

      # Valid secret questions are:
      #   What is your mother's maiden name?
      #   What is your pet's name?
      #   What is your city of birth?
      #   What is your father's birthplace?
      #   What street did you grow up on?
      #   What is the name of your first school?
      #   What is the make and model of your first car?
      #   What was your high school mascot?
      class SecretQuestions < Browser::StampsModal
        attr_reader :header, :secret_question_1, :secret_answer_1, :secret_question_2, :secret_answer_2

        def initialize(param)
          super
          @header = StampsElement.new(browser.h2(css: "li[id=secretquestions]>div>div>h2"))

          drop_down = StampsElement.new(browser.button(css: "li[id=secretquestions]>div>div:nth-child(2)>div>div>button"))
          text_box = StampsElement.new(browser.span(css: "li[id=secretquestions]>div>div:nth-child(2)>div>div[class*=secret]>button>span[class*=option]"))
          #@secret_question_1 = StampsDropDown.new(drop_down, text_box)

          @secret_answer_1 = StampsTextBox.new(browser.text_field(id: "secretAnswer1"))
          @secret_answer_1.help_elements = browser.lis(css: "li[id=secretquestions]>div>div:nth-child(2)>div>span>span")

          #drop_down = StampsElement.new(browser.button(css: "li[id=secretquestions]>div>div:nth-child(3)>div>div>button"))
          #text_box = StampsElement.new(browser.span(css: "li[id=secretquestions]>div>div:nth-child(3)>div>div[class*=secret]>button>span[class*=option]"))
          #@secret_question_2 = StampsDropDown.new(drop_down, text_box)

          @secret_answer_2 = StampsTextBox.new(browser.text_field(id: "secretAnswer2"))
          @secret_answer_2.help_elements = browser.lis(css: "li[id=secretquestions]>div>div:nth-child(3)>div>span>span")
        end
      end

      class PromoCode < Browser::StampsModal
        attr_reader :promo_code_link, :promo_code, :hidden_promo_code
        def initialize(param)
          super
          @promo_code_link = StampsElement.new(browser.a(id: 'showPromoCode'))

          @promo_code = StampsTextBox.new(browser.text_field(id: 'promoCode'))
          @promo_code.help_elements = browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")

          @hidden_promo_code = StampsTextBox.new(browser.text_field(id: 'promoCodeHidden'))
          @hidden_promo_code.help_elements = browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")
        end

        def show_promo_code
          20.times do
            return hidden_promo_code if hidden_promo_code.present?
            return promo_code if promo_code.present?
            promo_code_link.click unless hidden_promo_code.present?
          end
          expect(hidden_promo_code).to be_present, "Unable to show Promo Code textbox upon clicking Show Promo Code link."
        end
      end

      class SideAccount < Browser::StampsModal
        attr_reader :header, :paragraph
        def initialize(param)
          super
          @header = StampsElement.new(browser.h3(css: "li[id=sideaccount]>h3"))
          @paragraph = StampsElement.new(browser.p(css: "li[id=sideaccount]>p"))
        end
      end

      class MoneySavingOffers < Browser::StampsModal
        attr_reader :header, :checkbox, :paragraph
        def initialize(param)
          super
          @header = StampsElement.new(browser.h3(css: "li[id=sideoptin]>div[id=optInDiv]>h3"))
          @checkbox = StampsWatirCheckBox.new(browser.checkbox(css: '#sideoptin > #optInDiv > div.checkbox > #optIn'))
          @paragraph = StampsElement.new(browser.span(css: "li[id=sideoptin]>div[id=optInDiv]>div>label>span"))
        end
      end

      class SideContent < Browser::StampsModal
        attr_reader :money_saving_offers, :side_account
        def initialize(param)
          super
          @money_saving_offers = MoneySavingOffers.new(param)
          @side_account = SideAccount.new(param)
        end
      end

      class ProfilePage < Browser::StampsModal
        attr_reader :header, :email, :account_info, :survey_question, :referer_name, :promo_code, :security_questions, :side_content, :continue_btn, :membership
        def initialize(param)
          super
          @header = StampsElement.new(browser.h1(css: "div[id=page]>div>div>h1"))

          @email = StampsTextBox.new(browser.text_field(id: "email"))
          @email.help_elements = browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")

          @account_info = AccountInfo.new(param)

          element = browser.span(css: "button[data-id=usageType]>span")
          @survey_question = StampsDropDown.new(element, element)
          @survey_question.list_of_values = browser.spans(css: "li[id=survey]>div>div:nth-child(1)>div>div>div>ul>li>a>span[class=text]")

          element = browser.span(css: "button[data-id=referrerName]>span")
          @referer_name = StampsDropDown.new(element, element)
          @referer_name.list_of_values = browser.spans(css: "li[id=survey]>div>div:nth-child(2)>div>div>div>ul>li>a>span[class=text]")

          @promo_code = PromoCode.new(param)
          @security_questions = SecretQuestions.new(param)
          @continue_btn = StampsElement.new(browser.button(id: "next"))
          @side_content = SideContent.new(param)

          #@membership = Membership::MembershipPage.new(param)
        end

        def present?
          header.present?
        end

        def wait_until_present(*args)
          header.wait_until_present(*args)
          email.wait_until_present(*args)
        end

        def continue
          10.times do
            return membership if membership.present?
            continue_btn.click
            sleep(0.5)
          end
        end

      end

    end
  end
end






