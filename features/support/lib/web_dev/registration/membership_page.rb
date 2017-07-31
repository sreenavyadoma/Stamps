module Stamps
  module Registration
    module Membership
      module MemberPersonalInfo
        def first_name
          @first_name ||= StampsTextBox.new(browser.text_field(id: "firstName"))
          @first_name.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span")
          @first_name
        end

        def last_name
          @last_name ||= StampsTextBox.new(browser.text_field(id: "lastName"))
          @last_name.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(2)>div>div>span")
          @last_name
        end

        def company
          @company ||= StampsTextBox.new(browser.text_field(id: "companyName"))
        end

        def address
          @address ||= StampsTextBox.new(browser.text_field(id: "street"))
          @address.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(4)>div>div>span")
          @address
        end

        def city
          @city ||= StampsTextBox.new(browser.text_field(id: "city"))
          @city.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(5)>div>div>span")
          @city
        end

        def state
          element = browser.span(css: "button[data-id=state]>span")
          @state ||= StampsDropDown.new(element, element, :span)
        end

        def zip
          @zip ||= StampsTextBox.new(browser.text_field(id: "zip"))
        end

        def phone
          @phone ||= StampsTextBox.new(browser.text_field(id: "phone"))
          @phone.help_elements = browser.spans(css: "li[id=personalinfo]>div>div:nth-child(8)>div>div[class*=help]>span")
          @phone
        end

        def present?
          first_name.present?
        end

        def wait_until_present(*args)
          first_name.wait_until_present(*args)
        end

        def wait_while_present(*args)
          first_name.wait_while_present(*args)
        end
      end

      module MemberBillingAddress
        def billing_address
          @billing_address = StampsTextBox.new(browser.text_field(id: "billingStreet"))
          @billing_address.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span")
          @billing_address.index = 0
          @billing_address
        end

        def billing_city
          @billing_city = StampsTextBox.new(browser.text_field(id: "billingCity"))
          @billing_city.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span")
          @billing_city.index = 1
          @billing_city
        end

        def billing_state
          element = browser.span(css: "button[data-id=billingState]>span")
          list_of_values = browser.spans(css: "li[id=creditcard]>div>div>div[class*=billingAddressForm]>div>div[class*=menu]>ul>li>a>span[class=text]")
          @billing_state = StampsDropDownLovSubStr.new(element, element, list_of_values)
          @billing_state.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span")
          @billing_state.index = 2
          @billing_state
        end

        def billing_zip
          @billing_zip = StampsTextBox.new(browser.text_field(id: "billingZip"))
          @billing_zip.help_elements = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span")
          @billing_zip.index = 3
          @billing_zip
        end

        def present?
          billing_address.present?
        end

        def wait_until_present(*args)
          billing_address.wait_until_present(*args)
        end
      end

      module MemberCreditCard
        def cc_holder_name
          @cc_holder_name ||= StampsTextBox.new(browser.text_field(id: "ccName"))
          @cc_holder_name.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(1)>div>div[class*=help]>span")
          @cc_holder_name
        end

        def cc_number
          @cc_number ||= StampsTextBox.new(browser.text_field(id: "ccNumber"))
          @cc_number.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(2)>div>div[class*=help]>span")
          @cc_number
        end

        def cc_month
          element = browser.span(css: "button[data-id=ccMonth]>span")
          @cc_month ||= StampsDropDown.new(element, element, :span)
          @cc_month.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(1)>div>div[class*=help]>span")
          @cc_month
        end

        def cc_year
          element = browser.span(css: "button[data-id=ccYear]>span[class*=option]")
          @cc_year ||= StampsDropDown.new(element, element, :span)
          @cc_year.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(2)>div>div[class*=help]>span")
          @cc_year
        end

        def cc_address
          @cc_address ||= StampsTextBox.new(browser.text_field(id: "billingStreet"))
          @cc_address.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(6)>div>div>span")
          @cc_address
        end

        def cc_city
          @cc_city ||= StampsTextBox.new(browser.text_field(id: "billingCity"))
          @cc_city.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(7)>div>div>span")
          @cc_city
        end

        def cc_state
          element = browser.span(css: "button[data-id=billingState]>span")
          list_of_values = browser.spans(css: "li[id=creditcard]>div>div:nth-child(8)>div>div[class*=select]>div>ul>li>a>span[class=text]")
          @cc_state ||= StampsDropDownLovSubStr.new(element, element, list_of_values)
          @cc_state.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(8)>div>div>span")
          @cc_state
        end

        def cc_zip
          @cc_zip ||= StampsTextBox.new(browser.text_field(id: "billingZip"))
          @cc_zip.help_elements = browser.spans(css: "li[id=creditcard]>div>div:nth-child(9)>div>div>span")
          @cc_zip
        end

        def use_mailing_for_billing
          StampsWatirCheckBox.new(browser.checkbox(name: 'useMailingAddressForBilling'))
        end
      end

      module MembershipTermsAndConditions
        def agree_to_termss
          @agree_to_termss = StampsWatirCheckBox.new(browser.checkbox(name: 'termsConditions'))
          @agree_to_termss.help_elements = browser.lis(css: "div[class=terms-msg]>span")
          @agree_to_termss
        end

        def terms_conditions_link
          @terms_conditions_link = StampsElement.new(browser.a(css: "a[class*='termsLabel terms-conditions-link'"))
        end

        def pricing_billing_details_link
          @pricing_billing_details_link = StampsElement.new(browser.a(class: "pricing-billing-link"))
        end

        def terms_label_1
          @terms_label_1 = StampsElement.new(browser.span(css: "label[for=termsConditions]>span"))
        end

        def terms_label_2
          @terms_label_2 = StampsElement.new(browser.span(class: "termsLabel"))
        end

        def terms_label
          "#{terms_label_1.text} #{terms_conditions_link.text} #{terms_label_2.text}"
        end
      end

      module MembershipPagination
        def back_btn
          StampsElement.new(browser.button(id: "prev"))
        end

        def back
          back_btn.click_while_present
        end

        def continue_btn
          StampsElement.new(browser.button(id: "next"))
        end

        def continue_to_next_page
          continue_btn.click_while_present
          continue_btn.wait_while_present(3)
        end

        def continue
          continue_btn.click
        end
      end

      class MembershipPage < Browser::StampsModal
        include MemberPersonalInfo
        include MemberCreditCard
        include MemberBillingAddress
        include MembershipPagination
        include MembershipTermsAndConditions
        attr_reader :header
        def initialize(param)
          super
          @header = StampsElement.new(browser.h1(css: "div[id=page]>div>div>h1"))
        end
      end
    end
  end
end
