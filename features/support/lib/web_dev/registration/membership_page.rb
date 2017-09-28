module Stamps
  module Registration
    module Membership
      module MemberPersonalInfo
        def first_name
          @first_name ||= RegMembershipFirstName.new(browser.text_field(id: "firstName")) if @first_name.nil? || !@first_name.present?
          @first_name
        end

        def last_name
          @last_name ||= RegMembershipLastName.new(browser.text_field(id: "lastName")) if @last_name.nil? || !@last_name.present?
          @last_name
        end

        def company
          @company ||= StampsTextBox.new(browser.text_field(id: "companyName")) if @company.nil? || !@company.present?
          @company
        end

        def address
          @address ||= RegMembershipAddress.new(browser.text_field(id: "street")) if @address.nil? || !@address.present?
          @address
        end

        def city
          @city ||= RegMembershipCity.new(browser.text_field(id: "city")) if @city.nil? || !@city.present?
          @city
        end

        def state
          element = browser.spans(css: "button[data-id=state]>span").first
          @state ||= RegMembershipState.new(element, element, :span) if @state.nil? || !@state.present?
          @state
        end

        def zip
          @zip ||= StampsTextBox.new(browser.text_field(id: "zip")) if @zip.nil? || !@zip.present?
          @zip
        end

        def phone
          @phone ||= RegMembershipPhone.new(browser.text_field(id: "phone")) if @phone.nil? || !@phone.present?
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
          @billing_address = RegMembershipBillingAddress.new(browser.text_field(id: "billingStreet")) if @billing_address.nil? || !@billing_address.present?
          @billing_address
        end

        def billing_city
          @billing_city = RegMembershipBillingCity.new(browser.text_field(id: "billingCity")) if @billing_city.nil? || !@billing_city.present?
          @billing_city
        end

        def billing_state
          element = browser.span(css: "button[data-id=billingState]>span")
          list_of_values = browser.spans(css: "li[id=creditcard]>div>div>div[class*=billingAddressForm]>div>div[class*=menu]>ul>li>a>span[class=text]")
          @billing_state = RegMembershipBillingState.new(element, element, list_of_values) if @billing_state.nil? || !@billing_state.present?
          @billing_state
        end

        def billing_zip
          @billing_zip = RegMembershipBillingZip.new(browser.text_field(id: "billingZip")) if @billing_zip.nil? || !@billing_zip.present?
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
          @cc_holder_name ||= RegMembershipCardHolderName.new(browser.text_field(id: "ccName")) if @cc_holder_name.nil? || !@cc_holder_name.present?
          @cc_holder_name
        end

        def cc_number
          @cc_number ||= RegMembershipCreditCardNumber.new(browser.text_field(id: "ccNumber")) if @cc_number.nil? || !@cc_number.present?
          @cc_number
        end

        def cc_month
          element = browser.span(css: "button[data-id=ccMonth]>span")
          @cc_month ||= RegMembershipMonth.new(element, element, :span) if @cc_month.nil? || !@cc_month.present?
          @cc_month
        end

        def cc_year
          element = browser.span(css: "button[data-id=ccYear]>span[class*=option]")
          @cc_year ||= RegMembershipYear.new(element, element, :span) if @cc_year.nil? || !@cc_year.present?
          @cc_year
        end

        def cc_address
          @cc_address ||= RegMembershipBillingAddress.new(browser.text_field(id: "billingStreet")) if @cc_address.nil? || !@cc_address.present?
          @cc_address
        end

        def cc_city
          @cc_city ||= RegMembershipBillingCity.new(browser.text_field(id: "billingCity")) if @cc_city.nil? || !@cc_city.present?
          @cc_city
        end

        def cc_state
          element = browser.span(css: "button[data-id=billingState]>span")
          list_of_values = browser.spans(css: "li[id=creditcard]>div>div:nth-child(8)>div>div[class*=select]>div>ul>li>a>span[class=text]")
          @cc_state ||= RegMembershipBillingState.new(element, element, list_of_values) if @cc_state.nil? || !@cc_state.present?
          @cc_state
        end

        def cc_zip
          @cc_zip ||= RegMembershipBillingZip.new(browser.text_field(id: "billingZip")) if @cc_zip.nil? || !@cc_zip.present?
          @cc_zip
        end

        def use_mailing_for_billing
          @use_mailing_for_billing = StampsWatirCheckBox.new(browser.checkbox(name: 'useMailingAddressForBilling')) if @use_mailing_for_billing.nil? || !@use_mailing_for_billing.present?
          @use_mailing_for_billing
        end
      end

      module MembershipTermsAndConditions
        def agree_to_terms
          @agree_to_terms = RegMembershipTerms.new(browser.input(name: 'termsConditions')) if @agree_to_terms.nil? || !@agree_to_terms.present?
          @agree_to_terms
        end

        def terms_conditions_link
          @terms_conditions_link = StampsElement.new(browser.a(css: "a[class*='termsLabel terms-conditions-link'")) if @terms_conditions_link.nil? || !@terms_conditions_link.present?
          @terms_conditions_link
        end

        def pricing_billing_details_link
          @pricing_billing_details_link = StampsElement.new(browser.a(class: "pricing-billing-link")) if @pricing_billing_details_link.nil? || !@pricing_billing_details_link.present?
          @pricing_billing_details_link
        end

        def terms_label_1
          @terms_label_1 = StampsElement.new(browser.span(css: "label[for=termsConditions]>span")) if @terms_label_1.nil? || !@terms_label_1.present?
          @terms_label_1
        end

        def terms_label_2
          @terms_label_2 = StampsElement.new(browser.span(class: "termsLabel")) if @terms_label_2.nil? || !@terms_label_2.present?
          @terms_label_2
        end

        def terms_label
          "#{terms_label_1.text} #{terms_conditions_link.text} #{terms_label_2.text}"
        end
      end

      module MembershipPagination
        def back_btn
          @back_btn = StampsElement.new(browser.button(id: "prev")) if @back_btn.nil? || !@back_btn.present?
          @back_btn
        end

        def back
          back_btn.click_while_present
        end

        def continue_btn
          @continue_btn = StampsElement.new(browser.button(id: "next")) if @continue_btn.nil? || !@continue_btn.present?
          @continue_btn
        end

        def continue_to_next_page
          continue_btn.click_while_present
          continue_btn.wait_while_present(5)
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
