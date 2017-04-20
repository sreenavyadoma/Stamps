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
          elements = browser.spans(css: "li[id=survey]>div>div>div>div>div>ul>li>a>span:nth-child(1)")
          expect(elements.size).to eql(5)
          selection = nil
          5.times do
            elements.each { |span|
              selection = StampsElement.new(span)
              p selection.text
              return selection if selection.text.downcase.include?(str)
            }
            return selection if !selection.nil? && selection.text.downcase.include?(str)
          end
          nil
        end

        def select(str)
          drop_down.click
          selection = element(str)
          expect(selection).not_to be_nil, "Invalid Survey Question selection: #{str}. Valid options are Mostly mailing, Mostly shipping, Both mailing and shipping and Individua."
          10.times do
            drop_down.click unless selection.present?
            selection.click
            return text_box.text if text_box.text.downcase.include?(str)
          end
          expect(text_box.text).to include(str), "Invalid Survey Question selection: #{str}. Valid options are Mostly mailing, Mostly shipping, Both mailing and shipping and Individua."
        end
      end

      class AccountInfo < Browser::StampsModal
        attr_reader :username, :password, :retype_password

        def initialize(param)
          super
          text_box = browser.text_field(id: "username")
          help_collection = browser.lis(css: "li[id=accountinfo]>div>div:nth-child(1)>div>span>span>ul>li")
          @username = StampsTextBoxModule.new(text_box, help_collection)

          text_box = browser.text_field(id: "password")
          help_collection = browser.lis(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span>span>ul>li")
          @password = StampsTextBoxModule.new(text_box, help_collection)

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
          expect(text_box.text).to include(str), "Invalid Secret Question selection: #{str}. Check your feature file."
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

      class SideAccount < Browser::StampsModal
        attr_reader :header, :paragraph
        def initialize(param)
          super
          @header = StampsElement.new(browser.h3(css: "li[id=sideaccount]>h3"))
          @paragraph = StampsElement.new(browser.p(css: "li[id=sideaccount]>p"))
        end
      end

      class SideOptIn < Browser::StampsModal
        attr_reader :header, :opt_in, :paragraph
        def initialize(param)
          super
          @header = StampsElement.new(browser.h3(css: "li[id=sideoptin]>div[id=optInDiv]>h3"))
          @opt_in = WatirCheckboxWrapper.new(browser.checkbox(name: 'optIn'))
          @paragraph = StampsElement.new(browser.span(css: "li[id=sideoptin]>div[id=optInDiv]>div>label>span"))
        end
      end

      class PromoCode < Browser::StampsModal
        attr_reader :promocode_link, :promo_code
        def initialize(param)
          super
          @promocode_link = StampsElement.new(browser.a(id: 'showPromoCode'))
          text_box = browser.text_field(id: 'promoCodeHidden')
          help_collection = browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")
          @promo_code = StampsTextBoxModule.new(text_box, help_collection)
        end

        def show_promo_code
          10.times do
            promocode_link.click if promocode_link.present?
            promo_code if promo_code.present?
          end
          expect(promo_code).to be_present, "Unable to show Promo Code textbox upon clicking Show Promo Code link."
        end
      end

      class ProfilePage < Browser::StampsModal
        attr_reader :header, :email, :account_info, :survey_questions, :promo_code, :security_questions, :side_opt_in, :side_account, :continue_btn, :membership
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
          @side_opt_in = SideOptIn.new(param)
          @side_account = SideAccount.new(param)
          @continue_btn = StampsElement.new(browser.button(id: "next"))
          #@membership = Membership::MembershipPage.new(param)
        end

        def present?
          header.present?
        end

        def wait_until_present(*args)
          header.wait_until_present(*args)
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






