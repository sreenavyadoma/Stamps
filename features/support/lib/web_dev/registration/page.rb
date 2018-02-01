module Stamps
  module Registration
    module Profile
      module AccountInfo
        def email
          (cache[:email].nil?||!cache[:email].present?)?cache[:email]=Stamps::Browser::StampsTextbox.new(browser.text_field(id: "email")).extend(AccountInfoEmailHelp):cache[:email]
        end

        def account_username
          (cache[:account_username].nil?||!cache[:account_username].present?)?cache[:account_username]=Stamps::Browser::StampsTextbox.new(browser.text_field(name: "username")).extend(AccountInfoUserNameHelp):cache[:account_username]
        end

        def account_password
          (cache[:account_password].nil?||!cache[:account_password].present?)?cache[:account_password]=Stamps::Browser::StampsTextbox.new(browser.text_field(name: "password")).extend(AccountInfoPasswordHelp):cache[:account_password]
        end

        def retype_password
          (cache[:retype_password].nil?||!cache[:retype_password].present?)?cache[:retype_password]=Stamps::Browser::StampsTextbox.new(browser.text_field(id: "confirmPassword")).extend(AccountInfoRetypePasswordHelp):cache[:retype_password]
        end
      end
      module WebregSurvey
        def survey_question #todo-Rob change from old to new format
          (cache[:survey_question].nil?||!cache[:survey_question].present?)?cache[:survey_question]=Stamps::Browser::StampsDropDownLovSubStr.new(
              browser.span(css: "button[data-id=usageType]>span[class*=option]"),
              browser.span(css: "button[data-id=usageType]>span[class*=option]"),
              browser.spans(css: "li[id=survey]>div>div>div>div[class*=select]>div>ul>li>a>span[class=text]")):cache[:survey_question]
        end

        def referer_name
          (cache[:referer_name].nil?||!cache[:referer_name].present?)?cache[:referer_name]=Stamps::Browser::StampsDropDownLovSubStr.new(
              browser.span(css: "button[data-id=referrerName]>span[class*=option]"),
              browser.span(css: "button[data-id=referrerName]>span[class*=option]"),
              browser.spans(css: "li[id=survey]>div>div:nth-child(2)>div>div>div>ul>li>a>span[class=text]")):cache[:referer_name]
        end
      end
      module WebregPromocode
        def promo_code_link
          (cache[:promo_code_link].nil?||!cache[:promo_code_link].present?)?cache[:promo_code_link]=Stamps::Browser::StampsField.new(browser.a(id: 'showPromoCode')).extend(AccountInfoPromocodeHelp):cache[:promo_code_link]
        end

        def promo_code
          # 20.times do
          #   @promo_code=Fields::RegProfilePromoCode.new(browser.text_field(id: 'promoCodeHidden'))
          #   alt_promo_code=StampsTextbox.new(browser.text_field(id: 'promoCode'))
          #   @promo_code=alt_promo_code if alt_promo_code.present?
          #  break if @promo_code.present?
          # end

          # 20.times do
          # @promo_code = cache[:promo_code]=Fields::RegProfilePromoCode.new(browser.text_field(id: 'promoCodeHidden'))
          # alt_promo_code = cache[:promo_code]=StampsTextbox.new(browser.text_field(id: 'promoCode'))
          # @promo_code=alt_promo_code if alt_promo_code.present?
          # #break if @promo_code.present?
          # end
          #
          (cache[:promo_code].nil?||!cache[:promo_code].present?)?cache[:promo_code]=Stamps::Browser::StampsTextbox.new(browser.text_field(id: 'promoCodeHidden')):cache[:promo_code]
        end

        def show_promo_code
          20.times do
            promo_code_link.click
            return promo_code if present?
          end
          expect(promo_code).to be_present, "Unable to show Promo Code textbox upon clicking Show Promo Code link."
        end
      end
      module WebregPagination
        def continue_btn
          (cache[:continue_btn].nil?||!cache[:continue_btn].present?)?cache[:continue_btn]=Stamps::Browser::StampsField.new(browser.button(id: "next")):cache[:continue_btn]
        end
        def continue
          @membership ||= Stamps::Registration::Membership::MembershipPage.new(param)
          10.times do
            continue_btn.click
            @membership.wait_until_present(1)
            return @membership if @membership.present?
          end
        end
      end
      module SideContent
        def side_account_header
           (cache[:side_account_header].nil?||!cache[:side_account_header].present?)?cache[:side_account_header]=Stamps::Browser::StampsField.new(browser.h3(css: "li[id=sideaccount]>h3")):cache[:side_account_header]
        end

        def side_account_paragraph
          (cache[:side_account_paragraph].nil?||!cache[:side_account_paragraph].present?)?cache[:side_account_paragraph]=Stamps::Browser::StampsField.new(browser.p(css: "li[id=sideaccount]>p")):cache[:side_account_paragraph]
        end

        def money_saving_offers_header
          (cache[:money_saving_offers_header].nil?||!cache[:money_saving_offers_header].present?)?cache[:money_saving_offers_header]=Stamps::Browser::StampsField.new(browser.h3(css: "li[id=sideoptin]>div[id=optInDiv]>h3")):cache[:money_saving_offers_header]
        end

        def money_saving_offers_checkbox
          (cache[:money_saving_offers_checkbox].nil?||!cache[:money_saving_offers_checkbox].present?)?cache[:money_saving_offers_checkbox]=Stamps::Browser::StampsWatirCheckbox.new(browser.checkbox(css: '#sideoptin > #optInDiv > div.checkbox > #optIn')):cache[:money_saving_offers_checkbox]
        end

        def money_saving_offers_paragraph
          (cache[:money_saving_offers_paragraph].nil?||!cache[:money_saving_offers_paragraph].present?)?cache[:money_saving_offers_paragraph]=Stamps::Browser::StampsField.new(browser.span(css: "li[id=sideoptin]>div[id=optInDiv]>div>label>span")):cache[:money_saving_offers_paragraph]
        end

      end
      module SecreteQuestions

        def  secrete_question_header
        (cache[:secrete_question_header].nil?||!cache[:secrete_question_header].present?)?cache[:secrete_question_header]=Stamps::Browser::StampsField.new(browser.h2(css: "li[id=secretquestions]>div>div:nth-child(1)>h2")):cache[:secrete_question_header]
        end

        def secrete_quesiton1
          (cache[:secrete_quesiton1].nil?||!cache[:secrete_quesiton1].present?)?cache[:secrete_quesiton1]=Stamps::Browser::StampsDropDownLovSubStr.new(
              browser.span(css: "li[id=secretquestions]>div>div:nth-child(2)>div:nth-child(1)>div>button>span[class*=option]"),
              browser.span(css: "li[id=secretquestions]>div>div:nth-child(2)>div:nth-child(1)>div>button>span[class*=option]"),
              browser.spans(css: "li[id=secretquestions]>div>div:nth-child(2)>div:nth-child(1)>div>div>ul>li>a>[class=text]")).extend(AccountInfoSecretQuestions1Help):cache[:secrete_quesiton1]
        end

        def secrete_answer1
          (cache[:secrete_answer1].nil?||!cache[:secrete_answer1].present?)?cache[:secrete_answer1]=Stamps::Browser::StampsTextbox.new(browser.text_field(id: "secretAnswer1")).extend(AccountInfoSecretAnswer1Help):cache[:secrete_answer1]
        end


        def secrete_quesiton2
          (cache[:secrete_quesiton2].nil?||!cache[:secrete_quesiton2].present?)?cache[:secrete_quesiton2]=Stamps::Browser::StampsDropDownLovSubStr.new(
              browser.span(css: "li[id=secretquestions]>div>div:nth-child(3)>div:nth-child(1)>div>button>span[class*=option]"),
              browser.span(css: "li[id=secretquestions]>div>div:nth-child(3)>div:nth-child(1)>div>button>span[class*=option]"),
              browser.spans(css: "li[id=secretquestions]>div>div:nth-child(3)>div:nth-child(1)>div>div>ul>li>a>[class=text]")).extend(AccountInfoSecretQuestions2Help):cache[:secrete_quesiton2]
        end


        def secrete_answer2
          (cache[:secrete_answer2].nil?||!cache[:secrete_answer2].present?)?cache[:secrete_answer2]=Stamps::Browser::StampsTextbox.new(browser.text_field(id: "secretAnswer2")).extend(AccountInfoSecretAnswer2Help):cache[:secrete_answer2]
        end

      end
      module AccountInfoEmailHelp
        def single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=email]>div>div>div>div>span")):cache[:single_field_help_block]
        end

        def help_block
            (cache[:help_block].nil?||!cache[:help_block].present?)?cache[:help_block]=RegHelpBlock.new(browser, browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")):cache[:help_block]
        end
      end
      module AccountInfoUserNameHelp
        def single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=accountinfo]>div>div:nth-child(1)>div>span")):cache[:single_field_help_block]
        end

        def help_block
          (cache[:help_block].nil?||!cache[:help_block].present?)?cache[:help_block]=RegHelpBlock.new(browser, browser.lis(css: "#accountinfo [class=col-xs-12]:nth-child(1) [class*='help-block filled'] li")):cache[:help_block]
        end

      end
      module AccountInfoPasswordHelp
        def single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span")):cache[:single_field_help_block]
        end

        def help_block
          (cache[:help_block].nil?||!cache[:help_block].present?)?cache[:help_block]=RegHelpBlock.new(browser, browser.lis(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span>span>ul>li")):cache[:help_block]
        end

      end
      module AccountInfoRetypePasswordHelp
        def help_block
           (cache[:help_block].nil?||!cache[:help_block].present?)?cache[:help_block]=RegHelpBlock.new(browser, browser.lis(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span>span>ul>li")):cache[:help_block]
        end
        def single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span")):cache[:single_field_help_block]
        end

      end
      module AccountInfoPromocodeHelp

        def help_block
          (cache[:help_block].nil?||!cache[:help_block].present?)?cache[:help_block]=RegHelpBlock.new(browser, browser.lis(css: "li[id=promocode]>div>div>div>div>span>ul>li")):cache[:help_block]
        end

      end
      module AccountInfoSecretQuestions1Help
        def single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.span(css: "li[id=secretquestions]>div:nth-child(1)>div:nth-child(2)>div:nth-child(1)>span:nth-child(2)>span")):cache[:single_field_help_block]
        end
      end
      module AccountInfoSecretAnswer1Help
        def single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.span(css: "li[id=secretquestions]>div>div:nth-child(2)>div:nth-child(2)>span>span")):cache[:single_field_help_block]
        end
      end
      module AccountInfoSecretQuestions2Help
        def single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=secretquestions]>div>div:nth-child(3)>div:nth-child(1)>span>span")):cache[:single_field_help_block]
        end
      end
      module AccountInfoSecretAnswer2Help
        def single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=secretquestions]>div>div:nth-child(3)>div:nth-child(2)>span>span")):cache[:single_field_help_block]
        end
      end

      class Page < Browser::BaseCache
        assign({})

        def cache
          self.class.cache
        end

        include AccountInfo
        include WebregSurvey
        include WebregPromocode
        include WebregPagination
        include SideContent

        def header
          (cache[:header].nil?||!cache[:header].present?)?cache[:header] = StampsField.new(browser.h1(css: "div[id=page]>div>div>h1")):cache[:header]
        end

        def present?
          email.present?
        end

        def wait_until_present(*args)
          email.wait_until_present(*args)
        end

      end#ProfilePage
    end #Profile module
  end #Registration module
end #Stamps







