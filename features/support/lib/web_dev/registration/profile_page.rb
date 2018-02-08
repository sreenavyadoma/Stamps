module Stamps
  module Registration
    module Profile
      module Fields
        class Email < Browser::Base
          def textbox
            cache[:email].nil? || !cache[:email].present? ? cache[:email] = Stamps::Browser::StampsTextbox.new(browser.text_field(name: "email")):cache[:email]
          end

          def tooltip
            (cache[:tooltip].nil? || !cache[:tooltip].present?) ? cache[:tooltip] = Stamps::Registration::RegHelpBlock.new(browser.span(css: "li[id=email]>div>div>div>div>span")) : cache[:tooltip]
          end
        end

        class UserName < Browser::Base
          def textbox
            (cache[:account_username].nil? || !cache[:account_username].present?) ? cache[:account_username] = Stamps::Browser::StampsTextbox.new(browser.text_field(name: "username")): cache[:account_username]
          end

          def tooltip
            (cache[:tooltip].nil? || !cache[:tooltip].present?) ? cache[:tooltip] = Stamps::Registration::RegHelpBlock.new(browser.span(css: "li[id=accountinfo]>div>div:nth-child(1)>div>span")) : cache[:tooltip]
          end
        end

        class Password < Browser::Base
          def textbox
            (cache[:account_password].nil? || !cache[:account_password].present?) ? cache[:account_password] = Stamps::Browser::StampsTextbox.new(browser.text_field(name: "password")): cache[:account_password]
          end

          def tooltip
            (cache[:tooltip].nil? || !cache[:tooltip].present?) ? cache[:tooltip] = Stamps::Registration::RegHelpBlock.new(browser.span(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span")) : cache[:tooltip]
          end

        end

        class RetypePassword < Browser::Base
          def textbox
            (cache[:retype_password].nil? || !cache[:retype_password].present?) ? cache[:retype_password] = Stamps::Browser::StampsTextbox.new(browser.text_field(id: "confirmPassword")) : cache[:retype_password]
          end

          def tooltip
            (cache[:tooltip].nil? || !cache[:tooltip].present?) ? cache[:tooltip] = Stamps::Registration::RegHelpBlock.new(browser.span(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span")) : cache[:tooltip]
          end
        end

        class WebRegSurvey1 < Browser::Base
          def survey_question_dropdown #todo-Rob change from old to new format
            (cache[:survey_question].nil? || !cache[:survey_question].present?) ? cache[:survey_question] = Stamps::Browser::StampsDropDownLovSubStr.new(
                browser.span(css: "button[data-id=usageType]>span[class*=option]"),
                browser.span(css: "button[data-id=usageType]>span[class*=option]"),
                browser.spans(css: "li[id=survey]>div>div>div>div[class*=select]>div>ul>li>a>span[class=text]")) : cache[:survey_question]
          end

          def tooltip
            (cache[:tooltip].nil? || !cache[:tooltip].present?) ? cache[:tooltip] = Stamps::Registration::RegHelpBlock.new(browser.span(css: "li[id=survey]>div>div:nth-child(1)>div>div>span")) : cache[:tooltip]
          end

        end
        class WebRegSurvey2 < Browser::Base
          def referer_name_dropdown
            (cache[:referer_name].nil? || !cache[:referer_name].present?) ? cache[:referer_name] = Stamps::Browser::StampsDropDownLovSubStr.new(
                browser.span(css: "button[data-id=referrerName]>span[class*=option]"),
                browser.span(css: "button[data-id=referrerName]>span[class*=option]"),
                browser.spans(css: "li[id=survey]>div>div:nth-child(2)>div>div>div>ul>li>a>span[class=text]")) : cache[:referer_name]
          end

          def tooltip
            (cache[:tooltip].nil? || !cache[:tooltip].present?) ? cache[:tooltip] = Stamps::Registration::RegHelpBlock.new(browser.span(css: "li[id=survey]>div>div:nth-child(2)>div>div> span")) : cache[:tooltip]
          end

        end
        class WebRegPromoCode < Browser::Base
          def link
            (cache[:promo_code_link].nil? || !cache[:promo_code_link].present?) ? cache[:promo_code_link] = Stamps::Browser::StampsField.new(browser.a(id: 'showPromoCode')): cache[:promo_code_link]
          end

          def textbox
            (cache[:promo_code].nil? || !cache[:promo_code].present?) ? cache[:promo_code] = Stamps::Browser::StampsTextbox.new(browser.text_field(id: 'promoCodeHidden')) : cache[:promo_code]
          end

          def tooltip
            (cache[:tooltip].nil? || !cache[:tooltip].present?) ? cache[:tooltip] = Stamps::Registration::RegHelpBlock.new(browser.span(css: "li[id=promocode]>div>div>div>div>span")) : cache[:tooltip]
          end

        end

        class SecreteQuestions < Browser::Base
          def secrete_question_header
            (cache[:secrete_question_header].nil? || !cache[:secrete_question_header].present?) ? cache[:secrete_question_header] = Stamps::Browser::StampsField.new(browser.h2(css: "li[id=secretquestions]>div>div:nth-child(1)>h2")) : cache[:secrete_question_header]
          end

          def secrete_quesiton1
            (cache[:secrete_quesiton1].nil? || !cache[:secrete_quesiton1].present?) ? cache[:secrete_quesiton1] = Stamps::Browser::StampsDropDownLovSubStr.new(
                browser.span(css: "li[id=secretquestions]>div>div:nth-child(2)>div:nth-child(1)>div>button>span[class*=option]"),
                browser.span(css: "li[id=secretquestions]>div>div:nth-child(2)>div:nth-child(1)>div>button>span[class*=option]"),
                browser.spans(css: "li[id=secretquestions]>div>div:nth-child(2)>div:nth-child(1)>div>div>ul>li>a>[class=text]")).extend(AccountInfoSecretQuestions1Help) : cache[:secrete_quesiton1]
          end

          def secrete_answer1
            (cache[:secrete_answer1].nil? || !cache[:secrete_answer1].present?) ? cache[:secrete_answer1] = Stamps::Browser::StampsTextbox.new(browser.text_field(id: "secretAnswer1")).extend(AccountInfoSecretAnswer1Help) : cache[:secrete_answer1]
          end


          def secrete_quesiton2
            (cache[:secrete_quesiton2].nil? || !cache[:secrete_quesiton2].present?) ? cache[:secrete_quesiton2] = Stamps::Browser::StampsDropDownLovSubStr.new(
                browser.span(css: "li[id=secretquestions]>div>div:nth-child(3)>div:nth-child(1)>div>button>span[class*=option]"),
                browser.span(css: "li[id=secretquestions]>div>div:nth-child(3)>div:nth-child(1)>div>button>span[class*=option]"),
                browser.spans(css: "li[id=secretquestions]>div>div:nth-child(3)>div:nth-child(1)>div>div>ul>li>a>[class=text]")).extend(AccountInfoSecretQuestions2Help) : cache[:secrete_quesiton2]
          end


          def secrete_answer2
            (cache[:secrete_answer2].nil? || !cache[:secrete_answer2].present?) ? cache[:secrete_answer2] = Stamps::Browser::StampsTextbox.new(browser.text_field(id: "secretAnswer2")).extend(AccountInfoSecretAnswer2Help) : cache[:secrete_answer2]
          end
        end  #TODO MH

        module SideContent
          def side_account_header
            (cache[:side_account_header].nil? || !cache[:side_account_header].present?) ? cache[:side_account_header] = Stamps::Browser::StampsField.new(browser.h3(css: "li[id=sideaccount]>h3")) : cache[:side_account_header]
          end

          def side_account_paragraph
            (cache[:side_account_paragraph].nil? || !cache[:side_account_paragraph].present?) ? cache[:side_account_paragraph] = Stamps::Browser::StampsField.new(browser.p(css: "li[id=sideaccount]>p")) : cache[:side_account_paragraph]
          end

          def money_saving_offers_header
            (cache[:money_saving_offers_header].nil? || !cache[:money_saving_offers_header].present?) ? cache[:money_saving_offers_header] = Stamps::Browser::StampsField.new(browser.h3(css: "li[id=sideoptin]>div[id=optInDiv]>h3")) : cache[:money_saving_offers_header]
          end

          def money_saving_offers_checkbox
            (cache[:money_saving_offers_checkbox].nil? || !cache[:money_saving_offers_checkbox].present?) ? cache[:money_saving_offers_checkbox] = Stamps::Browser::StampsWatirCheckbox.new(browser.checkbox(css: '#sideoptin > #optInDiv > div.checkbox > #optIn')) : cache[:money_saving_offers_checkbox]
          end

          def money_saving_offers_paragraph
            (cache[:money_saving_offers_paragraph].nil? || !cache[:money_saving_offers_paragraph].present?) ? cache[:money_saving_offers_paragraph] = Stamps::Browser::StampsField.new(browser.span(css: "li[id=sideoptin]>div[id=optInDiv]>div>label>span")) : cache[:money_saving_offers_paragraph]
          end

        end

        module WebRegPagination
          def continue_btn
            (cache[:continue_btn].nil? || !cache[:continue_btn].present?) ? cache[:continue_btn] = Stamps::Browser::StampsField.new(browser.button(id: "next")) : cache[:continue_btn]
          end
        end
      end

      class Page < Browser::Base
        include Fields
        include Fields::SideContent
        include Fields::WebRegPagination

        def header
          (cache[:header].nil?||!cache[:header].present?)?cache[:header]=StampsField.new(browser.h1(css: "div[id=page]>div>div>h1")):cache[:header]
        end

        def email
          cache[:email] = Fields::Email.new(param) if cache[:email].nil?
          cache[:email]
        end

        def account_username
          cache[:account_username] = Fields::UserName.new(param) if cache[:account_username].nil?
          cache[:account_username]
        end

        def account_password
          cache[:password] = Fields::Password.new(param) if cache[:password].nil?
          cache[:password]
        end

        def retype_password
          cache[:retypepassword] = Fields::RetypePassword.new(param) if cache[:retypepassword].nil?
          cache[:retypepassword]
        end

        def survey_question
          cache[:survey_question] = Fields::WebRegSurvey1.new(param) if cache[:survey_question].nil?
          cache[:survey_question]
        end

        def referer_name
          cache[:referer_name] = Fields::WebRegSurvey2.new(param) if cache[:referer_name].nil?
          cache[:referer_name]
        end

        def promo_code
          cache[:promo_code] = Fields::WebRegPromoCode.new(param) if cache[:promo_code].nil?
          cache[:promo_code]
        end

      end #ProfilePage

    end #Profile module
  end #Registration module
end #Stamps

# Stamps::Registration::Profile::Page
# Stamps::Registration::Profile::Fields::Email.new
#
#
# Stamps::Registration::Membership::Page
# Stamps::Registration::Membership::Fields::Email.new
#
#



