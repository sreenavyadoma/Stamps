module Stamps
  module Registration
    module Membership
      module MemberPersonalInfo
        def first_name
          @first_name ||= RegMembershipFirstName.new(browser.text_field(id: "firstName"))
        end

        def last_name
          @last_name ||= RegMembershipLastName.new(browser.text_field(id: "lastName"))
          @last_name
        end

        def company
          @company ||= StampsTextBox.new(browser.text_field(id: "companyName"))
        end

        def address
          @address ||= RegMembershipAddress.new(browser.text_field(id: "street"))
        end

        def city
          @city ||= RegMembershipCity.new(browser.text_field(id: "city"))
        end

        def state
          element = browser.spans(css: "button[data-id=state]>span").first
          @state ||= RegMembershipState.new(element, element, :span)
        end

        def zip
          @zip ||= StampsTextBox.new(browser.text_field(id: "zip"))
        end

        def phone
          @phone ||= RegMembershipPhone.new(browser.text_field(id: "phone"))
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
          @billing_address = RegMembershipBillingAddress.new(browser.text_field(id: "billingStreet"))
          @billing_address
        end

        def billing_city
          @billing_city = RegMembershipBillingCity.new(browser.text_field(id: "billingCity"))
          @billing_city
        end

        def billing_state
          element = browser.span(css: "button[data-id=billingState]>span")
          list_of_values = browser.spans(css: "li[id=creditcard]>div>div>div[class*=billingAddressForm]>div>div[class*=menu]>ul>li>a>span[class=text]")
          @billing_state = RegMembershipBillingState.new(element, element, list_of_values)
          @billing_state
        end

        def billing_zip
          @billing_zip = RegMembershipBillingZip.new(browser.text_field(id: "billingZip"))
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
          @cc_holder_name ||= RegMembershipCardHolderName.new(browser.text_field(id: "ccName"))
        end

        def cc_number
          @cc_number ||= RegMembershipCreditCardNumber.new(browser.text_field(id: "ccNumber"))
        end

        def cc_month
          element = browser.span(css: "button[data-id=ccMonth]>span")
          @cc_month ||= RegMembershipMonth.new(element, element, :span)
        end

        def cc_year
          element = browser.span(css: "button[data-id=ccYear]>span[class*=option]")
          @cc_year ||= RegMembershipYear.new(element, element, :span)
        end

        def cc_address
          @cc_address ||= RegMembershipBillingAddress.new(browser.text_field(id: "billingStreet"))
        end

        def cc_city
          @cc_city ||= RegMembershipBillingCity.new(browser.text_field(id: "billingCity"))
        end

        def cc_state
          element = browser.span(css: "button[data-id=billingState]>span")
          list_of_values = browser.spans(css: "li[id=creditcard]>div>div:nth-child(8)>div>div[class*=select]>div>ul>li>a>span[class=text]")
          @cc_state ||= RegMembershipBillingState.new(element, element, list_of_values)
        end

        def cc_zip
          @cc_zip ||= RegMembershipBillingZip.new(browser.text_field(id: "billingZip"))
        end

        def use_mailing_for_billing
          StampsWatirCheckBox.new(browser.checkbox(name: 'useMailingAddressForBilling'))
        end
      end

      module MembershipTermsAndConditions
        def agree_to_terms
          @agree_to_terms = RegMembershipTerms.new(browser.input(name: 'termsConditions'))
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

      module MemberAddressValidationModel
        def model_header
          StampsElement.new(browser.h3(css: "div[id=addressValidationModal]>div>div>div>h3")).text
        end

        def model_header_instructions
          StampsElement.new(browser.p(id: "instructions")).text
        end

        def cancel
          StampsElement.new(browser.divs(css: "div[class='modal-footer']>button").first)
        end

        def continue
          StampsElement.new(browser.divs(css: "div[class='modal-footer']>button").last)
        end

        def address_list
          StampsElement.new(browser.divs(css: "div[id='multipleMatch']>table>tbody>tr>td>input").first)
        end
      end

      module MemberUsernameTakenModel
        def uname_model_header
          StampsElement.new(browser.h3(css: "div[id='error']>div>div>div[class='modal-header']>h3")).text
        end

        def uname_model_custom_body
          StampsElement.new(browser.p(css: "div[id='error']>div>div>div>div[id='prev-username']>p")).text
        end

        def uname_text_box
          @uname_text_box ||= StampsTextBox.new(browser.text_field(id: "newUsername"))
          @uname_text_box

        end

        def uname_continue_btn
          StampsElement.new(browser.button(id: "btnUserNameTakenContinue"))
        end
      end


      class RegMembershipFirstName < Stamps::Browser::StampsTextBox
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span"))
        end
      end

      class RegMembershipLastName < Stamps::Browser::StampsTextBox
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=personalinfo]>div>div:nth-child(2)>div>div>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=personalinfo]>div>div:nth-child(2)>div>div>span"))
        end
      end

      class RegMembershipAddress < Stamps::Browser::StampsTextBox
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=personalinfo]>div>div:nth-child(4)>div>div>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=personalinfo]>div>div:nth-child(4)>div>div>span"))
        end
      end

      class RegMembershipCity < Stamps::Browser::StampsTextBox
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=personalinfo]>div>div:nth-child(5)>div>div>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=personalinfo]>div>div:nth-child(5)>div>div>span"))
        end
      end

      class RegMembershipState < Stamps::Browser::StampsDropDown
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=personalinfo]>div>div:nth-child(6)>div>div>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=personalinfo]>div>div:nth-child(6)>div>div>span"))
        end
      end

      class RegMembershipPhone < Stamps::Browser::StampsTextBox
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=personalinfo]>div>div:nth-child(8)>div>div[class*=help]>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=personalinfo]>div>div:nth-child(8)>div>div[class*=help]>span"))
        end
      end

      class RegMembershipCardHolderName < Stamps::Browser::StampsTextBox
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=creditcard]>div>div:nth-child(1)>div>div[class*=help]>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=creditcard]>div>div:nth-child(1)>div>div[class*=help]>span"))
        end
      end

      class RegMembershipCreditCardNumber < Stamps::Browser::StampsTextBox
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=creditcard]>div>div:nth-child(2)>div>div[class*=help]>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=creditcard]>div>div:nth-child(2)>div>div[class*=help]>span"))
        end
      end

      class RegMembershipMonth < Stamps::Browser::StampsDropDown
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(1)>div>div[class*=help]>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(1)>div>div[class*=help]>span"))
        end
      end

      class RegMembershipYear < Stamps::Browser::StampsDropDown
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(2)>div>div[class*=help]>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(2)>div>div[class*=help]>span"))
        end
      end

      class RegMembershipBillingAddress < Stamps::Browser::StampsTextBox
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=creditcard]>div>div:nth-child(6)>div>div>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=creditcard]>div>div:nth-child(6)>div>div>span"))
        end
      end

      class RegMembershipBillingCity < Stamps::Browser::StampsTextBox
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=creditcard]>div>div:nth-child(7)>div>div>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=creditcard]>div>div:nth-child(7)>div>div>span"))
        end
      end

      class RegMembershipBillingState < Stamps::Browser::StampsDropDownLovSubStr
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=creditcard]>div>div:nth-child(8)>div>div>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=creditcard]>div>div:nth-child(8)>div>div>span"))
        end
      end

      class RegMembershipBillingZip < Stamps::Browser::StampsTextBox
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "li[id=creditcard]>div>div:nth-child(9)>div>div>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "li[id=creditcard]>div>div:nth-child(9)>div>div>span"))
        end
      end

      class RegMembershipTerms < Stamps::Browser::StampsWatirCheckBox
        def help_block
          RegHelpBlock.new(browser, browser.lis(css: "div[class=terms-msg]>span>ul>li"))
        end

        def single_field_help_block
          RegHelpBlock.new(browser, browser.spans(css: "div[class=terms-msg]>span"))
        end
      end

      class MembershipPage < Browser::StampsModal
        include MemberPersonalInfo
        include MemberCreditCard
        include MemberBillingAddress
        include MembershipPagination
        include MembershipTermsAndConditions
        include MemberAddressValidationModel
        include MemberUsernameTakenModel
        attr_reader :header
        def initialize(param)
          super
          @header = StampsElement.new(browser.h1(css: "div[id=page]>div>div>h1"))
        end
      end
    end
  end
end
