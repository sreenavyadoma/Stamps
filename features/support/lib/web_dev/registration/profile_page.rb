module Stamps
  module Registration
    module Profile
      module PromoCode
        def promo_code_link
          @promo_code_link ||= StampsElement.new(browser.a(id: 'showPromoCode')) if @promo_code_link.nil? || !@promo_code_link.present?
          @promo_code_link
        end

        def promo_code
          20.times do
            @promo_code = RegProfilePromoCode.new(browser.text_field(id: 'promoCodeHidden'))
            alt_promo_code = StampsTextBox.new(browser.text_field(id: 'promoCode'))
            @promo_code = alt_promo_code if alt_promo_code.present?
            break if @promo_code.present?
          end
           @promo_code
        end

        def show_promo_code
          20.times do
            promo_code_link.click
            return promo_code if present?
          end
          expect(promo_code).to be_present, "Unable to show Promo Code textbox upon clicking Show Promo Code link."
        end
      end

      module AccountInfo
        def account_username
          @account_username = RegProfileUsername.new(browser.text_field(name: "username")) if @account_username.nil? || !@account_username.present?
          @account_username
        end

        def account_password
          @account_password = RegProfilePassword.new(browser.text_field(name: "password")) if @account_password.nil? || !@account_password.present?
          @account_password
        end

        def retype_password
          @retype_password = RegProfileReTypePassword.new(browser.text_field(id: "confirmPassword")) if @retype_password.nil? || !@retype_password.present?
          @retype_password
        end
      end

      module SideAccount
        def side_account_header
          @side_account_header ||= StampsElement.new(browser.h3(css: "li[id=sideaccount]>h3")) if @side_account_header.nil? || !@side_account_header.present?
          @side_account_header
        end

        def side_account_paragraph
          @side_account_paragraph ||= StampsElement.new(browser.p(css: "li[id=sideaccount]>p")) if @side_account_paragraph.nil? || !@side_account_paragraph.present?
          @side_account_paragraph
        end
      end

      module MoneySavingOffers
        def money_saving_offers_header
          @money_saving_offers_header ||= StampsElement.new(browser.h3(css: "li[id=sideoptin]>div[id=optInDiv]>h3")) if @money_saving_offers_header.nil? || !@money_saving_offers_header.present?
          @money_saving_offers_header
        end

        def money_saving_offers_checkbox
          @money_saving_offers_checkbox ||= StampsWatirCheckBox.new(browser.checkbox(css: '#sideoptin > #optInDiv > div.checkbox > #optIn')) if @money_saving_offers_checkbox.nil? || !@money_saving_offers_checkbox.present?
          @money_saving_offers_checkbox
        end

        def money_saving_offers_paragraph
          @money_saving_offers_paragraph ||= StampsElement.new(browser.span(css: "li[id=sideoptin]>div[id=optInDiv]>div>label>span")) if @money_saving_offers_paragraph.nil? || !@money_saving_offers_paragraph.present?
          @money_saving_offers_paragraph
        end
      end

      module MainContent
        def present?
          email.present?
        end

        def wait_until_present(*args)
          email.wait_until_present(*args)
        end

        def continue
          @membership ||= Stamps::Registration::Membership::MembershipPage.new(param)
          10.times do
            continue_btn.click
            @membership.wait_until_present(1)
            return @membership if @membership.present?
          end
        end

        def email
          @email ||= RegProfileEmail.new(browser.text_field(id: "email")) if @email.nil? || !@email.present?
          @email
        end

        def survey_question
          element = browser.span(css: "button[data-id=usageType]>span[class*=option]")
          list_of_values = browser.spans(css: "li[id=survey]>div>div>div>div[class*=select]>div>ul>li>a>span[class=text]")
          @survey_question ||= StampsDropDownLovSubStr.new(element, element, list_of_values) if @survey_question.nil? || !@survey_question.present?
          @survey_question
        end

        def referer_name
          element = browser.span(css: "button[data-id=referrerName]>span[class*=option]")
          list_of_values = browser.spans(css: "li[id=survey]>div>div:nth-child(2)>div>div>div>ul>li>a>span[class=text]")
          @referer_name ||= StampsDropDownLovSubStr.new(element, element, list_of_values) if @referer_name.nil? || !@referer_name.present?
          @referer_name
        end

        def continue_btn
          @continue_btn ||= StampsElement.new(browser.button(id: "next")) if @continue_btn.nil? || !@continue_btn.present?
          @continue_btn
        end
      end

      class RegProfileEmail < Stamps::Browser::StampsTextBox
        def help_block
          @help_block = RegHelpBlock.new(browser, browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")) if @help_block.nil? || !@help_block.present?
          @help_block
        end

        def single_field_help_block
          @single_field_help_block = RegHelpBlock.new(browser, browser.spans(css: "li[id=email]>div>div>div>div>span")) if @single_field_help_block.nil? || !@single_field_help_block.present?
          @single_field_help_block
        end
      end

      class RegProfileUsername < Stamps::Browser::StampsTextBox
        def help_block
          @help_block = RegHelpBlock.new(browser, browser.spans(css: "li[id=accountinfo]>div>div:nth-child(1)>div>span>span>ul>li")) if @help_block.nil? || !@help_block.present?
          @help_block
        end

        def single_field_help_block
          @single_field_help_block = RegHelpBlock.new(browser,browser.spans(css: "li[id=accountinfo]>div>div:nth-child(1)>div>span")) if @single_field_help_block.nil? || !@single_field_help_block.present?
          @single_field_help_block
        end
      end

      class RegProfilePassword < Stamps::Browser::StampsTextBox
        def help_block
          @help_block = RegHelpBlock.new(browser, browser.lis(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span>span>ul>li")) if @help_block.nil? || !@help_block.present?
          @help_block
        end

        def single_field_help_block
          @single_field_help_block = RegHelpBlock.new(browser,browser.spans(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span")) if @single_field_help_block.nil? || !@single_field_help_block.present?
          @single_field_help_block
        end
      end

      class RegProfileReTypePassword < Stamps::Browser::StampsTextBox
        def help_block
          @help_block = RegHelpBlock.new(browser, browser.spans(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span>span>ul>li")) if @help_block.nil? || !@help_block.present?
          @help_block
        end

        def single_field_help_block
          @single_field_help_block = RegHelpBlock.new(browser,browser.spans(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span")) if @single_field_help_block.nil? || !@single_field_help_block.present?
          @single_field_help_block
        end
      end

      class RegProfilePromoCode < Stamps::Browser::StampsTextBox
        def help_block
          @help_block = RegHelpBlock.new(browser, browser.lis(css: "li[id=promocode]>div>div>div>div>span>ul>li")) if @help_block.nil? || !@help_block.present?
          @help_block
        end
      end

      class RegProfileSurveyQuetion < Stamps::Browser::StampsDropDownLovSubStr
        def single_field_help_block
          @single_field_help_block = RegHelpBlock.new(browser,browser.lis(css: "li[id=survey]>div>div:nth-child(1)>div>div>span")) if @single_field_help_block.nil? || !@single_field_help_block.present?
          @single_field_help_block
        end
      end

      class ProfilePage < Browser::StampsModal
        include SideAccount
        include MoneySavingOffers
        include AccountInfo
        include PromoCode
        include MainContent

        def header
          @header = StampsElement.new(browser.h1(css: "div[id=page]>div>div>h1")) if @header.nil? || !@header.present?
          @header
        end
      end #ProfilePage
    end #Profile module
  end #Registration module
end #Stamps







