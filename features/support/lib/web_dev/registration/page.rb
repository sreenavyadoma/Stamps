module Stamps
  module Registration
    module Profile
      # module Fields
      #   class RegProfileEmail < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(browser, browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(browser, browser.spans(css: "li[id=email]>div>div>div>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class RegProfileUsername < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(browser, browser.spans(css: "li[id=accountinfo]>div>div:nth-child(1)>div>span>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(browser,browser.spans(css: "li[id=accountinfo]>div>div:nth-child(1)>div>span>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class RegProfilePassword < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(browser, browser.lis(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(browser,browser.spans(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class RegProfileReTypePassword < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(browser, browser.spans(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(browser,browser.spans(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class RegProfilePromoCode < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(browser, browser.lis(css: "li[id=promocode]>div>div>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #   end
      #
      #   #unused
      #   class RegProfileSurveyQuetion < Stamps::Browser::StampsDropDownLovSubStr
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(browser,browser.lis(css: "li[id=survey]>div>div:nth-child(1)>div>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      # end

      #       class Page < Browser::BaseCache
      #         assign({})
      #         def cache
      #           self.class.cache
      #         end
      #
      #         def header
      # =begin
      #           if cache[:header].nil?||!cache[:header].present?
      #             cache[:header]=StampsField.new(browser.h1(css: "div[id=page]>div>div>h1"))
      #           else
      #             cache[:header]
      #           end
      # =end
      #           #@header=StampsField.new(browser.h1(css: "div[id=page]>div>div>h1")) if @header.nil?||!@header.present?
      #           #@header
      #           #
      #           (cache[:header].nil?||!cache[:header].present?)?cache[:header]=StampsField.new(browser.h1(css: "div[id=page]>div>div>h1")):cache[:header]
      #
      #         end
      #
      #         def present?
      #           email.present?
      #         end
      #
      #         def wait_until_present(*args)
      #           email.wait_until_present(*args)
      #
      #         end
      #
      #         def continue
      #           @membership ||= Stamps::Registration::Membership::MembershipPage.new(param)
      #           10.times do
      #             continue_btn.click
      #             @membership.wait_until_present(1)
      #             return @membership if @membership.present?
      #           end
      #         end
      #
      #         def email
      #             # @email ||= Fields::RegProfileEmail.new(browser.text_field(id: "email")) if @email.nil?||!@email.present?
      #             # @email
      #
      #          (cache[:email].nil?||!cache[:email].present?)?cache[:email]=Fields::RegProfileEmail.new(browser.text_field(id: "email")):cache[:email]
      #
      #         end
      #
      #         def survey_question #todo-Rob change from old to new format
      #           # field=browser.span(css: "button[data-id=usageType]>span[class*=option]")
      #           # list_of_values=browser.spans(css: "li[id=survey]>div>div>div>div[class*=select]>div>ul>li>a>span[class=text]")
      #           # @survey_question ||= StampsDropDownLovSubStr.new(field, field, list_of_values) if @survey_question.nil?||!@survey_question.present?
      #           # @survey_question
      #
      #           (cache[:survey_question].nil?||!cache[:survey_question].present?)?cache[:survey_question]=StampsDropDownLovSubStr.new(
      #               browser.span(css: "button[data-id=usageType]>span[class*=option]"),
      #               browser.span(css: "button[data-id=usageType]>span[class*=option]"),
      #               browser.spans(css: "li[id=survey]>div>div>div>div[class*=select]>div>ul>li>a>span[class=text]")):cache[:survey_question]
      #         end
      #
      #         def referer_name
      #           # field=browser.span(css: "button[data-id=referrerName]>span[class*=option]")
      #           # list_of_values=browser.spans(css: "li[id=survey]>div>div:nth-child(2)>div>div>div>ul>li>a>span[class=text]")
      #           # @referer_name ||= StampsDropDownLovSubStr.new(field, field, list_of_values) if @referer_name.nil?||!@referer_name.present?
      #           # @referer_name
      #
      #           (cache[:referer_name].nil?||!cache[:referer_name].present?)?cache[:referer_name]=StampsDropDownLovSubStr.new(
      #               browser.span(css: "button[data-id=referrerName]>span[class*=option]"),
      #               browser.span(css: "button[data-id=referrerName]>span[class*=option]"),
      #               browser.spans(css: "li[id=survey]>div>div:nth-child(2)>div>div>div>ul>li>a>span[class=text]")):cache[:referer_name]
      #
      #         end
      #
      #         def continue_btn
      #           # @continue_btn ||= StampsField.new(browser.button(id: "next")) if @continue_btn.nil?||!@continue_btn.present?
      #           # @continue_btn
      #
      #           (cache[:continue_btn].nil?||!cache[:continue_btn].present?)?cache[:continue_btn]=StampsField.new(browser.button(id: "next")):cache[:continue_btn]
      #         end
      #
      #         def account_username
      #           # @account_username=Fields::RegProfileUsername.new(browser.text_field(name: "username")) if @account_username.nil?||!@account_username.present?
      #           # @account_username
      #
      #           (cache[:account_username].nil?||!cache[:account_username].present?)?cache[:account_username]=Fields::RegProfileUsername.new(browser.text_field(name: "username")):cache[:account_username]
      #
      #         end
      #
      #         def account_password
      #           # @account_password=Fields::RegProfilePassword.new(browser.text_field(name: "password")) if @account_password.nil?||!@account_password.present?
      #           # @account_password
      #
      #           (cache[:account_password].nil?||!cache[:account_password].present?)?cache[:account_password]=Fields::RegProfilePassword.new(browser.text_field(name: "password")):cache[:account_password]
      #
      #         end
      #
      #         def retype_password
      #           # @retype_password=Fields::RegProfileReTypePassword.new(browser.text_field(id: "confirmPassword")) if @retype_password.nil?||!@retype_password.present?
      #           # @retype_password
      #
      #           (cache[:retype_password].nil?||!cache[:retype_password].present?)?cache[:retype_password]=Fields::RegProfileReTypePassword.new(browser.text_field(id: "confirmPassword")):cache[:retype_password]
      #         end
      #
      #         def side_account_header
      #           # @side_account_header ||= StampsField.new(browser.h3(css: "li[id=sideaccount]>h3")) if @side_account_header.nil?||!@side_account_header.present?
      #           # @side_account_header
      #
      #           (cache[:side_account_header].nil?||!cache[:side_account_header].present?)?cache[:side_account_header]=StampsField.new(browser.h3(css: "li[id=sideaccount]>h3")):cache[:side_account_header]
      #         end
      #
      #         def side_account_paragraph
      #           # @side_account_paragraph ||= StampsField.new(browser.p(css: "li[id=sideaccount]>p")) if @side_account_paragraph.nil?||!@side_account_paragraph.present?
      #           # @side_account_paragraph
      #
      #           (cache[:side_account_paragraph].nil?||!cache[:side_account_paragraph].present?)?cache[:side_account_paragraph]=StampsField.new(browser.p(css: "li[id=sideaccount]>p")):cache[:side_account_paragraph]
      #         end
      #
      #         def money_saving_offers_header
      #           # @money_saving_offers_header ||= StampsField.new(browser.h3(css: "li[id=sideoptin]>div[id=optInDiv]>h3")) if @money_saving_offers_header.nil?||!@money_saving_offers_header.present?
      #           # @money_saving_offers_header
      #
      #           (cache[:money_saving_offers_header].nil?||!cache[:money_saving_offers_header].present?)?cache[:money_saving_offers_header]=StampsField.new(browser.h3(css: "li[id=sideoptin]>div[id=optInDiv]>h3")):cache[:money_saving_offers_header]
      #         end
      #
      #         def money_saving_offers_checkbox
      #           # @money_saving_offers_checkbox ||= StampsWatirCheckbox.new(browser.checkbox(css: '#sideoptin > #optInDiv > div.checkbox > #optIn')) if @money_saving_offers_checkbox.nil?||!@money_saving_offers_checkbox.present?
      #           # @money_saving_offers_checkbox
      #
      #           (cache[:money_saving_offers_checkbox].nil?||!cache[:money_saving_offers_checkbox].present?)?cache[:money_saving_offers_checkbox]=StampsWatirCheckbox.new(browser.checkbox(css: '#sideoptin > #optInDiv > div.checkbox > #optIn')):cache[:money_saving_offers_checkbox]
      #
      #         end
      #
      #         def money_saving_offers_paragraph
      #           # @money_saving_offers_paragraph ||= StampsField.new(browser.span(css: "li[id=sideoptin]>div[id=optInDiv]>div>label>span")) if @money_saving_offers_paragraph.nil?||!@money_saving_offers_paragraph.present?
      #           # @money_saving_offers_paragraph
      #
      #           (cache[:money_saving_offers_paragraph].nil?||!cache[:money_saving_offers_paragraph].present?)?cache[:money_saving_offers_paragraph]=StampsField.new(browser.span(css: "li[id=sideoptin]>div[id=optInDiv]>div>label>span")):cache[:money_saving_offers_paragraph]
      #         end
      #
      #         def promo_code_link
      #           # @promo_code_link ||= StampsField.new(browser.a(id: 'showPromoCode')) if @promo_code_link.nil?||!@promo_code_link.present?
      #           # @promo_code_link
      #
      #           (cache[:promo_code_link].nil?||!cache[:promo_code_link].present?)?cache[:promo_code_link]=StampsField.new(browser.a(id: 'showPromoCode')):cache[:promo_code_link]
      #
      #         end
      #
      #         def promo_code
      #            # 20.times do
      #            #   @promo_code=Fields::RegProfilePromoCode.new(browser.text_field(id: 'promoCodeHidden'))
      #            #   alt_promo_code=StampsTextbox.new(browser.text_field(id: 'promoCode'))
      #            #   @promo_code=alt_promo_code if alt_promo_code.present?
      #            #  break if @promo_code.present?
      #            # end
      #
      #            # 20.times do
      #            # @promo_code = cache[:promo_code]=Fields::RegProfilePromoCode.new(browser.text_field(id: 'promoCodeHidden'))
      #            # alt_promo_code = cache[:promo_code]=StampsTextbox.new(browser.text_field(id: 'promoCode'))
      #            # @promo_code=alt_promo_code if alt_promo_code.present?
      #            # #break if @promo_code.present?
      #            # end
      #            #
      #
      #           (cache[:promo_code].nil?||!cache[:promo_code].present?)?cache[:promo_code]=Fields::RegProfilePromoCode.new(browser.text_field(id: 'promoCodeHidden')):cache[:promo_code]
      #
      #         end
      #
      #         def show_promo_code
      #           20.times do
      #             promo_code_link.click
      #             return promo_code if present?
      #           end
      #           expect(promo_code).to be_present, "Unable to show Promo Code textbox upon clicking Show Promo Code link."
      #         end
      #
      #       end #ProfilePage
      ##############new structure by class
      # class RegEmail < BaseCache
      #   def textbox
      #     (cache[:email].nil?||!cache[:email].present?)?cache[:email]=Stamps::Browser::StampsTextbox.new(browser.text_field(id: "email")):cache[:email]
      #
      #   end
      #
      #   def helpblock
      #     @help_block=RegHelpBlock.new(browser, browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #     @help_block
      #
      #   end
      # end



      ########################new structure
      module AccountInfo
        def email
          # @email ||= Fields::RegProfileEmail.new(browser.text_field(id: "email")) if @email.nil?||!@email.present?
          # @email

          (cache[:email].nil?||!cache[:email].present?)?cache[:email]=Stamps::Browser::StampsTextbox.new(browser.text_field(id: "email")).extend(AccountInfoEmailHelp):cache[:email]

        end

        def account_username
          # @account_username=Fields::RegProfileUsername.new(browser.text_field(name: "username")) if @account_username.nil?||!@account_username.present?
          # @account_username

          (cache[:account_username].nil?||!cache[:account_username].present?)?cache[:account_username]=Stamps::Browser::StampsTextbox.new(browser.text_field(name: "username")).extend(AccountInfoUserNameHelp):cache[:account_username]

        end

        def account_password
          # @account_password=Fields::RegProfilePassword.new(browser.text_field(name: "password")) if @account_password.nil?||!@account_password.present?
          # @account_password

          (cache[:account_password].nil?||!cache[:account_password].present?)?cache[:account_password]=Stamps::Browser::StampsTextbox.new(browser.text_field(name: "password")).extend(AccountInfoPasswordHelp):cache[:account_password]

        end

        def retype_password
          # @retype_password=Fields::RegProfileReTypePassword.new(browser.text_field(id: "confirmPassword")) if @retype_password.nil?||!@retype_password.present?
          # @retype_password

          (cache[:retype_password].nil?||!cache[:retype_password].present?)?cache[:retype_password]=Stamps::Browser::StampsTextbox.new(browser.text_field(id: "confirmPassword")).extend(AccountInfoRetypePasswordHelp):cache[:retype_password]
        end
      end
      module WebregSurvey
        def survey_question #todo-Rob change from old to new format
          # field=browser.span(css: "button[data-id=usageType]>span[class*=option]")
          # list_of_values=browser.spans(css: "li[id=survey]>div>div>div>div[class*=select]>div>ul>li>a>span[class=text]")
          # @survey_question ||= StampsDropDownLovSubStr.new(field, field, list_of_values) if @survey_question.nil?||!@survey_question.present?
          # @survey_question

          (cache[:survey_question].nil?||!cache[:survey_question].present?)?cache[:survey_question]=Stamps::Browser::StampsDropDownLovSubStr.new(
              browser.span(css: "button[data-id=usageType]>span[class*=option]"),
              browser.span(css: "button[data-id=usageType]>span[class*=option]"),
              browser.spans(css: "li[id=survey]>div>div>div>div[class*=select]>div>ul>li>a>span[class=text]")):cache[:survey_question]
        end

        def referer_name
          # field=browser.span(css: "button[data-id=referrerName]>span[class*=option]")
          # list_of_values=browser.spans(css: "li[id=survey]>div>div:nth-child(2)>div>div>div>ul>li>a>span[class=text]")
          # @referer_name ||= StampsDropDownLovSubStr.new(field, field, list_of_values) if @referer_name.nil?||!@referer_name.present?
          # @referer_name

          (cache[:referer_name].nil?||!cache[:referer_name].present?)?cache[:referer_name]=Stamps::Browser::StampsDropDownLovSubStr.new(
              browser.span(css: "button[data-id=referrerName]>span[class*=option]"),
              browser.span(css: "button[data-id=referrerName]>span[class*=option]"),
              browser.spans(css: "li[id=survey]>div>div:nth-child(2)>div>div>div>ul>li>a>span[class=text]")):cache[:referer_name]

        end
      end
      module WebregPromocode
        def promo_code_link
          # @promo_code_link ||= StampsField.new(browser.a(id: 'showPromoCode')) if @promo_code_link.nil?||!@promo_code_link.present?
          # @promo_code_link

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
          # @continue_btn ||= StampsField.new(browser.button(id: "next")) if @continue_btn.nil?||!@continue_btn.present?
          # @continue_btn

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
          # @side_account_header ||= StampsField.new(browser.h3(css: "li[id=sideaccount]>h3")) if @side_account_header.nil?||!@side_account_header.present?
          # @side_account_header

          (cache[:side_account_header].nil?||!cache[:side_account_header].present?)?cache[:side_account_header]=Stamps::Browser::StampsField.new(browser.h3(css: "li[id=sideaccount]>h3")):cache[:side_account_header]
        end

        def side_account_paragraph
          # @side_account_paragraph ||= StampsField.new(browser.p(css: "li[id=sideaccount]>p")) if @side_account_paragraph.nil?||!@side_account_paragraph.present?
          # @side_account_paragraph

          (cache[:side_account_paragraph].nil?||!cache[:side_account_paragraph].present?)?cache[:side_account_paragraph]=Stamps::Browser::StampsField.new(browser.p(css: "li[id=sideaccount]>p")):cache[:side_account_paragraph]
        end

        def money_saving_offers_header
          # @money_saving_offers_header ||= StampsField.new(browser.h3(css: "li[id=sideoptin]>div[id=optInDiv]>h3")) if @money_saving_offers_header.nil?||!@money_saving_offers_header.present?
          # @money_saving_offers_header

          (cache[:money_saving_offers_header].nil?||!cache[:money_saving_offers_header].present?)?cache[:money_saving_offers_header]=Stamps::Browser::StampsField.new(browser.h3(css: "li[id=sideoptin]>div[id=optInDiv]>h3")):cache[:money_saving_offers_header]
        end

        def money_saving_offers_checkbox
          # @money_saving_offers_checkbox ||= StampsWatirCheckbox.new(browser.checkbox(css: '#sideoptin > #optInDiv > div.checkbox > #optIn')) if @money_saving_offers_checkbox.nil?||!@money_saving_offers_checkbox.present?
          # @money_saving_offers_checkbox

          (cache[:money_saving_offers_checkbox].nil?||!cache[:money_saving_offers_checkbox].present?)?cache[:money_saving_offers_checkbox]=Stamps::Browser::StampsWatirCheckbox.new(browser.checkbox(css: '#sideoptin > #optInDiv > div.checkbox > #optIn')):cache[:money_saving_offers_checkbox]

        end

        def money_saving_offers_paragraph
          # @money_saving_offers_paragraph ||= StampsField.new(browser.span(css: "li[id=sideoptin]>div[id=optInDiv]>div>label>span")) if @money_saving_offers_paragraph.nil?||!@money_saving_offers_paragraph.present?
          # @money_saving_offers_paragraph

          (cache[:money_saving_offers_paragraph].nil?||!cache[:money_saving_offers_paragraph].present?)?cache[:money_saving_offers_paragraph]=Stamps::Browser::StampsField.new(browser.span(css: "li[id=sideoptin]>div[id=optInDiv]>div>label>span")):cache[:money_saving_offers_paragraph]
        end

      end
      module SecreteQuestions

        def  secrete_question_header
        (cache[:secrete_question_header].nil?||!cache[:secrete_question_header].present?)?cache[:secrete_question_header]=Stamps::Browser::StampsField.new(browser.h2(css: "li[id=secretquestions]>div>div:nth-child(1)>h2")):cache[:secrete_question_header]
        end

        def secrete_quesiton1
            # field=browser.span(css: "button[data-id=usageType]>span[class*=option]")
            # list_of_values=browser.spans(css: "li[id=survey]>div>div>div>div[class*=select]>div>ul>li>a>span[class=text]")
            # @survey_question ||= StampsDropDownLovSubStr.new(field, field, list_of_values) if @survey_question.nil?||!@survey_question.present?
            # @survey_question

            (cache[:secrete_quesiton1].nil?||!cache[:secrete_quesiton1].present?)?cache[:secrete_quesiton1]=Stamps::Browser::StampsDropDownLovSubStr.new(
                browser.span(css: "li[id=secretquestions]>div>div:nth-child(2)>div:nth-child(1)>div>button>span[class*=option]"),
                browser.span(css: "li[id=secretquestions]>div>div:nth-child(2)>div:nth-child(1)>div>button>span[class*=option]"),
                browser.spans(css: "li[id=secretquestions]>div>div:nth-child(2)>div:nth-child(1)>div>div>ul>li>a>[class=text]")).extend(AccountInfoSecretQuestions1Help):cache[:secrete_quesiton1]
        end

        def secrete_answer1
          # @account_username=Fields::RegProfileUsername.new(browser.text_field(name: "username")) if @account_username.nil?||!@account_username.present?
          # @account_username

          (cache[:secrete_answer1].nil?||!cache[:secrete_answer1].present?)?cache[:secrete_answer1]=Stamps::Browser::StampsTextbox.new(browser.text_field(id: "secretAnswer1")).extend(AccountInfoSecretAnswer1Help):cache[:secrete_answer1]

        end


        def secrete_quesiton2
          # field=browser.span(css: "button[data-id=usageType]>span[class*=option]")
          # list_of_values=browser.spans(css: "li[id=survey]>div>div>div>div[class*=select]>div>ul>li>a>span[class=text]")
          # @survey_question ||= StampsDropDownLovSubStr.new(field, field, list_of_values) if @survey_question.nil?||!@survey_question.present?
          # @survey_question

          (cache[:secrete_quesiton2].nil?||!cache[:secrete_quesiton2].present?)?cache[:secrete_quesiton2]=Stamps::Browser::StampsDropDownLovSubStr.new(
              browser.span(css: "li[id=secretquestions]>div>div:nth-child(3)>div:nth-child(1)>div>button>span[class*=option]"),
              browser.span(css: "li[id=secretquestions]>div>div:nth-child(3)>div:nth-child(1)>div>button>span[class*=option]"),
              browser.spans(css: "li[id=secretquestions]>div>div:nth-child(3)>div:nth-child(1)>div>div>ul>li>a>[class=text]")).extend(AccountInfoSecretQuestions2Help):cache[:secrete_quesiton2]
        end


        def secrete_answer2
          # @account_username=Fields::RegProfileUsername.new(browser.text_field(name: "username")) if @account_username.nil?||!@account_username.present?
          # @account_username

          (cache[:secrete_answer2].nil?||!cache[:secrete_answer2].present?)?cache[:secrete_answer2]=Stamps::Browser::StampsTextbox.new(browser.text_field(id: "secretAnswer2")).extend(AccountInfoSecretAnswer2Help):cache[:secrete_answer2]

        end


      end
      module AccountInfoEmailHelp
        def single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=email]>div>div>div>div>span")):cache[:single_field_help_block]
        end

        def help_block
          # @help_block=RegHelpBlock.new(browser, browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
          # @help_block

          (cache[:help_block].nil?||!cache[:help_block].present?)?cache[:help_block]=RegHelpBlock.new(browser, browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")):cache[:help_block]
        end
      end
      module AccountInfoUserNameHelp
        def single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=accountinfo]>div>div:nth-child(1)>div>span")):cache[:single_field_help_block]
        end

        def help_block
          # @help_block=RegHelpBlock.new(browser, browser.lis(css: "#accountinfo [class=col-xs-12]:nth-child(1) [class*='help-block filled'] li")) if @help_block.nil?||!@help_block.present?
          # @help_block

          (cache[:help_block].nil?||!cache[:help_block].present?)?cache[:help_block]=RegHelpBlock.new(browser, browser.lis(css: "#accountinfo [class=col-xs-12]:nth-child(1) [class*='help-block filled'] li")):cache[:help_block]
        end

      end
      module AccountInfoPasswordHelp
        def single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span")):cache[:single_field_help_block]
        end

        def help_block
          # @help_block=RegHelpBlock.new(browser, browser.lis(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span>span>ul>li")) if @help_block.nil?||!@help_block.present?
          # @help_block
          (cache[:help_block].nil?||!cache[:help_block].present?)?cache[:help_block]=RegHelpBlock.new(browser, browser.lis(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span>span>ul>li")):cache[:help_block]
        end

      end
      module AccountInfoRetypePasswordHelp
        def help_block
          # @help_block=RegHelpBlock.new(browser, browser.lis(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span>span>ul>li")) if @help_block.nil?||!@help_block.present?
          # @help_block

          (cache[:help_block].nil?||!cache[:help_block].present?)?cache[:help_block]=RegHelpBlock.new(browser, browser.lis(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span>span>ul>li")):cache[:help_block]

        end
        def single_field_help_block
          # @single_field_help_block=RegHelpBlock.new(browser,browser.spans(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
          # @single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span")):cache[:single_field_help_block]
        end

      end
      module AccountInfoPromocodeHelp

        def help_block
          # @help_block=RegHelpBlock.new(browser, browser.lis(css: "li[id=promocode]>div>div>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
          # @help_block

          (cache[:help_block].nil?||!cache[:help_block].present?)?cache[:help_block]=RegHelpBlock.new(browser, browser.lis(css: "li[id=promocode]>div>div>div>div>span>ul>li")):cache[:help_block]
        end

      end
      module AccountInfoSecretQuestions1Help
        def single_field_help_block
          # @single_field_help_block=RegHelpBlock.new(browser,browser.lis(css: "#secretquestions>div>div:nth-child(2)>div.form-group.fancy-input.has-error>span>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
          # @single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=survey]>div>div:nth-child(1)>div>div>span")):cache[:single_field_help_block]
        end
      end
      module AccountInfoSecretAnswer1Help
        def single_field_help_block
          # @single_field_help_block=RegHelpBlock.new(browser,browser.lis(css: "#secretquestions>div>div:nth-child(2)>div.form-group.fancy-input.has-error>span>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
          # @single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=secretquestions]>div>div:nth-child(2)>div.form-group.fancy-input.has-error>span>span")):cache[:single_field_help_block]
        end
      end
      module AccountInfoSecretQuestions2Help
        def single_field_help_block
          # @single_field_help_block=RegHelpBlock.new(browser,browser.lis(css: "#secretquestions>div>div:nth-child(2)>div.form-group.fancy-input.has-error>span>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
          # @single_field_help_block
          (cache[:single_field_help_block].nil?||!cache[:single_field_help_block].present?)?cache[:single_field_help_block]=RegHelpBlock.new(browser, browser.spans(css: "li[id=secretquestions]>div>div:nth-child(3)>div:nth-child(1)>span>span")):cache[:single_field_help_block]
        end
      end
      module AccountInfoSecretAnswer2Help
        def single_field_help_block
          # @single_field_help_block=RegHelpBlock.new(browser,browser.lis(css: "#secretquestions>div>div:nth-child(2)>div.form-group.fancy-input.has-error>span>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
          # @single_field_help_block
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
        # =begin
#           if cache[:header].nil?||!cache[:header].present?
#             cache[:header]=StampsField.new(browser.h1(css: "div[id=page]>div>div>h1"))
#           else
#             cache[:header]
#           end
# =end
#@header=StampsField.new(browser.h1(css: "div[id=page]>div>div>h1")) if @header.nil?||!@header.present?
#@header
#
          (cache[:header].nil?||!cache[:header].present?)?cache[:header]=StampsField.new(browser.h1(css: "div[id=page]>div>div>h1")):cache[:header]

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







