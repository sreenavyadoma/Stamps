module Stamps
  module Registration
    module Profile
      module PromoCode
        def promo_code_link
          @promo_code_link ||= StampsElement.new(browser.a(id: 'showPromoCode'))
        end

        def promo_code
          50.times do
            @promo_code = StampsTextBox.new(browser.text_field(id: 'promoCodeHidden'))
            alt_promo_code = StampsTextBox.new(browser.text_field(id: 'promoCode'))
            @promo_code = alt_promo_code if alt_promo_code.present?
            break if @promo_code.present?
          end
          @promo_code.help_elements = browser.lis(css: "li[id=promocode]>div>div>div>div>span>ul>li")
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
          @account_username = StampsTextBox.new(browser.text_field(name: "username"))
          @account_username.help_elements = browser.lis(css: "li[id=accountinfo]>div>div:nth-child(1)>div>span>span>ul>li")
          @account_username
        end

        def account_password
          @account_password = StampsTextBox.new(browser.text_field(name: "password"))
          @account_password.help_elements = browser.lis(css: "li[id=accountinfo]>div>div:nth-child(2)>div>span>span>ul>li")
          @account_password
        end

        def retype_password
          @retype_password = StampsTextBox.new(browser.text_field(id: "confirmPassword"))
          @retype_password.help_elements = browser.lis(css: "li[id=accountinfo]>div>div:nth-child(3)>div>span>span")
          @retype_password
        end
      end

      module SideAccount
        def side_account_header
          @side_account_header ||= StampsElement.new(browser.h3(css: "li[id=sideaccount]>h3"))
        end

        def side_account_paragraph
          @side_account_paragraph ||= StampsElement.new(browser.p(css: "li[id=sideaccount]>p"))
        end
      end

      module MoneySavingOffers
        def money_saving_offers_header
          @money_saving_offers_header ||= StampsElement.new(browser.h3(css: "li[id=sideoptin]>div[id=optInDiv]>h3"))
        end

        def money_saving_offers_checkbox
          @money_saving_offers_checkbox ||= StampsWatirCheckBox.new(browser.checkbox(css: '#sideoptin > #optInDiv > div.checkbox > #optIn'))
        end

        def money_saving_offers_paragraph
          @money_saving_offers_paragraph ||= StampsElement.new(browser.span(css: "li[id=sideoptin]>div[id=optInDiv]>div>label>span"))
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
          5.times do
            return @membership if @membership.present?
            continue_btn.click
            @membership.wait_until_present(5)
          end
        end

        def email
          @email ||= StampsTextBox.new(browser.text_field(id: "email"))
          @email.help_elements = browser.lis(css: "li[id=email]>div>div>div>div>span>ul>li")
          @email
        end

        def survey_question
          element = browser.span(css: "button[data-id=usageType]>span[class*=option]")
          list_of_values = browser.spans(css: "li[id=survey]>div>div>div>div[class*=select]>div>ul>li>a>span[class=text]")
          @survey_question ||= StampsDropDownLovSubStr.new(element, element, list_of_values)
        end

        def referer_name
          element = browser.span(css: "button[data-id=referrerName]>span[class*=option]")
          list_of_values = browser.spans(css: "li[id=survey]>div>div:nth-child(2)>div>div>div>ul>li>a>span[class=text]")
          @referer_name ||= StampsDropDownLovSubStr.new(element, element, list_of_values)
        end

        def continue_btn
          @continue_btn ||= StampsElement.new(browser.button(id: "next"))
        end
      end

      class ProfilePage < Browser::StampsModal
        include SideAccount
        include MoneySavingOffers
        include AccountInfo
        include PromoCode
        include MainContent
        attr_reader :header
        def initialize(param)
          super
          @header = StampsElement.new(browser.h1(css: "div[id=page]>div>div>h1"))
        end
      end #ProfilePage
    end #Profile module
  end #Registration module
end #Stamps






