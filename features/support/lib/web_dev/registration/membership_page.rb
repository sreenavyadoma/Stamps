module Stamps
  module Registration
    module Membership

      class MemberPersonalInfo < Browser::StampsModal
        attr_reader :first_name, :last_name, :company, :address, :city, :state, :zip, :phone
        def initialize(param)
          super
          @first_name = StampsTextBox.new(browser.text_field(id: "firstName"))
          @first_name.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span")

          @last_name = StampsTextBox.new(browser.text_field(id: "lastName"))
          @last_name.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(2)>div>div>span")

          @company = StampsTextBox.new(browser.text_field(id: "companyName"))

          @address = StampsTextBox.new(browser.text_field(id: "street"))
          @address.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(4)>div>div>span")

          @city = StampsTextBox.new(browser.text_field(id: "city"))
          @city.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(5)>div>div>span")

          element = browser.span(css: "button[data-id=state]>span")
          list_of_values = browser.spans(css: "li[id=personalinfo]>div>div:nth-child(6)>div>div>div[class*=menu]>ul>li>a>span[class=text]")
          @state = StampsDropDownLovSubStr.new(element, element, list_of_values)

          @zip = StampsTextBox.new(browser.text_field(id: "zip"))
          @phone = StampsTextBox.new(browser.text_field(id: "phone"))
          @phone.help_elements = browser.spans(css: "li[id=personalinfo]>div>div:nth-child(8)>div>div[class*=help]>span")
        end

        def present?
          first_name.present?
        end

        def wait_until_present(*args)
          first_name.wait_until_present(*args)
        end
      end

      class MemberBillingAddress < Browser::StampsModal
        attr_reader :billing_address, :billing_city, :billing_state, :billing_zip
        def initialize(param)
          super(param)
          @billing_address = StampsTextBox.new(browser.text_field(id: "billingStreet"))
          @billing_address.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span")
          @billing_address.index = 0

          @billing_city = StampsTextBox.new(browser.text_field(id: "billingCity"))
          @billing_city.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span")
          @billing_city.index = 1

          element = browser.span(css: "button[data-id=billingState]>span")
          list_of_values = browser.spans(css: "li[id=creditcard]>div>div>div[class*=billingAddressForm]>div>div[class*=menu]>ul>li>a>span[class=text]")
          @billing_state = StampsDropDownLovSubStr.new(element, element, list_of_values)
          @billing_state.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span")
          @billing_state.index = 2

          @billing_zip = StampsTextBox.new(browser.text_field(id: "billingZip"))
          @billing_zip.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span")
          @billing_zip.index = 3
        end

        def present?
          billing_address.present?
        end

        def wait_until_present(*args)
          billing_address.wait_until_present(*args)
        end
      end

      class MemberCreditCard < Browser::StampsModal
        attr_reader :cc_holder_name, :cc_number, :cc_month, :cc_year, :billing_address_same_as_mailing, :billing_address
        def initialize(param)
          super
          @cc_holder_name = StampsTextBox.new(browser.text_field(id: "ccName"))
          @cc_holder_name.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(1)>div>div[class*=help]>span")

          @cc_number = StampsTextBox.new(browser.text_field(id: "ccNumber"))
          @cc_number.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(2)>div>div[class*=help]>span")

          element = browser.span(css: "button[data-id=ccMonth]>span")
          list_of_values = browser.spans(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(1)>div>div[class*=select]>div>ul>li>a>span[class=text]")
          @cc_month = StampsDropDownLovSubStr.new(element, element, list_of_values)

          @cc_month.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(1)>div>div[class*=help]>span")

          element = browser.span(css: "button[data-id=ccYear]>span[class*=option]")
          list_of_values = browser.spans(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(2)>div>div[class*=select]>div>ul>li>a>span[class=text]")
          @cc_year = StampsDropDownLovSubStr.new(element, element, list_of_values)

          @cc_year.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(2)>div>div[class*=help]>span")

          @cc_address = StampsTextBox.new(browser.text_field(id: "billingStreet"))
          @cc_address.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(6)>div>div>span")

          @cc_city = StampsTextBox.new(browser.text_field(id: "billingCity"))
          @cc_city.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(7)>div>div>span")

          element = browser.span(css: "button[data-id=billingState]>span")
          list_of_values = browser.spans(css: "li[id=creditcard]>div>div:nth-child(8)>div>div[class*=select]>div>ul>li>a>span[class=text]")
          @cc_state = StampsDropDownLovSubStr.new(element, element, list_of_values)

          @cc_state.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(8)>div>div>span")

          @cc_zip = StampsTextBox.new(browser.text_field(id: "billingZip"))
          @cc_zip.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(9)>div>div>span")

          @billing_address_same_as_mailing = StampsWatirCheckBox.new(browser.checkbox(name: 'useMailingAddressForBilling'))
          @billing_address = MemberBillingAddress.new(param)
        end
      end

      class MembershipTermsAndConditions < Browser::StampsModal
        attr_reader :i_agree, :terms_conditions_link, :terms_label
        def initialize(param)
          super
          @i_agree = StampsWatirCheckBox.new(browser.checkbox(name: 'termsConditions'))
          browser.lis(css: "div[class=terms-msg]>span>span>ul>li")
        end

      end

      class MembershipPagination < Browser::StampsModal
        attr_reader

        def initialize(param)
          super
          @back = StampsElement.new browser.button(id: "prev")
          @submit_btn = StampsElement.new(browser.button(text: "Submit"))
        end

      end

      class MembershipPage < Browser::StampsModal
        attr_reader :personal_info, :credit_card, :terms_and_conditions, :pagination, :header

        def initialize(param)
          super
          @header = StampsElement.new(browser.h1(css: "div[id=page]>div>div>h1"))
          @personal_info = MemberPersonalInfo.new(param)
          @credit_card = MemberCreditCard.new(param)
          @terms_and_conditions = MembershipTermsAndConditions.new(param)
          @pagination = MembershipPagination.new(param)
          # @supplies = ChooseSupplies.new(param)
          # @userid_taken = UserIdTaken.new(param)
          # @download_page = DownloadPage.new(param)
          #
          # @loading = StampsElement.new browser.button(text: "Loading...")
          # @page_header = StampsElement.new browser.h1(text: 'Customize your Welcome Kit')
          #
          # @error_occured = RegistrationError.new(param)
          # @connection_failed = RegistrationSecureConnectionFailed.new(param)
        end

        def present?
          personal_info.present?
        end

        def wait_until_present(*args)
          personal_info.wait_until_present(*args)
        end

        def submit
          submit_button.wait_until_present 6
          expect(submit_button).to be_present
          submit_button.click
          submit_button.send_keys(:enter)
        end

        def tab
          browser.send_keys([:tab])
          sleep(0.35)
        end
      end
    end
  end
end
