module Stamps
  module Registration
    module Profile
      class SurveyQuestion < Browser::StampsModal
        attr_reader :drop_down, :text_box

        def initialize(param)
          super
          @drop_down = StampsElement.new(browser.button(css: "li[id=survey]>div>div>div>div>button"))
          @text_box = StampsElement.new(browser.span(css: "li[id=survey]>div>div>div>div>button>span[class*=filter-option]"))
        end

        def element(str)
          drop_down.click
          sleep(0.25)
          elements = browser.spans(css: "li[id=survey]>div>div>div>div>div>ul>li>a>span:nth-child(1)")
          5.times do
            drop_down.click if elements.size == 0
            break unless elements.size == 0
          end
          expect(elements.size).to eql(5)
          selection = nil
          5.times do
            elements.each { |span|
              selection = StampsElement.new(span)
              return selection if selection.text.downcase.include?(str.downcase)
            }
            return selection if !selection.nil? && selection.text.downcase.include?(str)
          end
          nil
        end

        def select(str)
          selection = element(str)
          expect(selection).not_to be_nil, "Invalid Selection: #{str}"
          10.times do
            drop_down.click unless selection.present?
            selection.click
            return text_box.text if text_box.text.downcase.include?(str.downcase)
          end
          expect(text_box.downcase.text).to include(str.downcase), "Invalid Selection: #{str}"
        end
      end

      class AccountInfo < Browser::StampsModal
        attr_reader :account_username, :account_password, :retype_password

        def initialize(param)
          super
          text_box = browser.text_field(name: "username")
          help_collection = browser.lis(css: "li[id=accountinfo]>div>div:nth-child(1)>div>span>span>ul>li")
          @account_username = StampsTextBoxModule.new(text_box, help_collection)

          text_box = browser.text_field(id: "password")
          help_collection = browser.lis(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span>span>ul>li")
          @account_password = StampsTextBoxModule.new(text_box, help_collection)

          text_box = browser.text_field(id: "confirmPassword")
          help_collection = browser.lis(css: "")
          @retype_password = StampsTextBoxModule.new(text_box, help_collection)
        end
      end

      class ProfileSecretQuestion
        attr_reader :drop_down, :text_box

        def initialize(drop_down, text_box)
          @drop_down = drop_down
          @text_box = text_box
        end

        def select(str)
          drop_down.click
          selection = StampsElement.new(browser.span(text: str))
          10.times do
            drop_down.click unless selection.present?
            selection.click
            break if text_box.text.downcase.include?(str)
          end
          expect(text_box.text).to include(str), "Invalid selection: #{str}. Check your page object."
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
          @secret_question_1 = ProfileSecretQuestion.new(drop_down, text_box)

          text_box = browser.text_field(id: "secretAnswer1")
          help_collection = browser.lis(css: "li[id=secretquestions]>div>div:nth-child(2)>div>span>span")
          @secret_answer_1 = StampsTextBoxModule.new(text_box, help_collection)

          drop_down = StampsElement.new(browser.button(css: "li[id=secretquestions]>div>div:nth-child(3)>div>div>button"))
          text_box = StampsElement.new(browser.span(css: "li[id=secretquestions]>div>div:nth-child(3)>div>div[class*=secret]>button>span[class*=option]"))
          @secret_question_2 = ProfileSecretQuestion.new(drop_down, text_box)

          text_box = browser.text_field(id: "secretAnswer2")
          help_collection = browser.lis(css: "li[id=secretquestions]>div>div:nth-child(3)>div>span>span")
          @secret_answer_2 = StampsTextBoxModule.new(text_box, help_collection)
        end
      end

      class PromoCode < Browser::StampsModal
        attr_reader :promo_code_link
        def initialize(param)
          super
          @promo_code_link = StampsElement.new(browser.a(id: 'showPromoCode'))
          help_collection = browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")
          @text_box = StampsTextBoxModule.new(text_box, help_collection)
        end

        def text_box
          promo_code = browser.text_field(id: 'promoCode')
          hidden_promo_code = browser.text_field(id: 'promoCodeHidden')
          20.times do
            return promo_code if promo_code.present?
            return hidden_promo_code if hidden_promo_code.present?
          end
        end

        def show_promo_code
          20.times do
            return text_box if text_box.present?
            promo_code_link.click unless text_box.present?
          end
          expect(text_box).to be_present, "Unable to show Promo Code textbox upon clicking Show Promo Code link."
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
          @checkbox = WatirCheckBoxWrapper.new(browser.checkbox(css: '#sideoptin > #optInDiv > div.checkbox > #optIn'))
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
        attr_reader :header, :email, :account_info, :survey_question, :promo_code, :security_questions, :side_content, :continue_btn, :membership
        def initialize(param)
          super
          @header = StampsElement.new(browser.h1(text: "Sign up for a new account"))
          text_box = browser.text_field(id: "email")
          help_collection = browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")
          @email = StampsTextBoxModule.new(text_box, help_collection)
          @account_info = AccountInfo.new(param)
          @survey_question = SurveyQuestion.new(param)
          text_box = browser.text_field(id: "promoCode")
          help_collection = browser.lis(css: "li[id=promocode]>div>div>div>div[class*=help]>span>ul>li")
          @promo_code = PromoCode.new(param)
          @security_questions = SecretQuestions.new(param)
          @continue_btn = StampsElement.new(browser.button(id: "next"))
          @side_content = SideContent.new(param)
          @membership = Membership::MembershipPage.new(param)
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






