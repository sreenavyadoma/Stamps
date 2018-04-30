module Stamps
  module Registration
    module Membership
      # module Fields
      #   class FirstName < Stamps::Browser::StampsTextbox
      #     # def text_box
      #     #   StampsTextbox.new(driver.text_field(id: "firstName"))
      #     # end
      #
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #       # StampsTextbox.set text
      #       # driver.text_field
      #       # driver.input
      #       #
      #       # yy = StampsField.new(driver.span(text: 'some text'))
      #       # yy.scroll_into_view
      #       # driver.div
      #       # driver.span
      #       # driver.label
      #
      #     end
      #
      #   end
      #
      #   class LastName < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=personalinfo]>div>div:nth-child(2)>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=personalinfo]>div>div:nth-child(2)>div>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class StreetAddress < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=personalinfo]>div>div:nth-child(4)>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=personalinfo]>div>div:nth-child(4)>div>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class City < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=personalinfo]>div>div:nth-child(5)>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=personalinfo]>div>div:nth-child(5)>div>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class State < Stamps::Browser::StampsDropdown
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=personalinfo]>div>div:nth-child(6)>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=personalinfo]>div>div:nth-child(6)>div>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class Phone < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=personalinfo]>div>div:nth-child(8)>div>div[class*=help]>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=personalinfo]>div>div:nth-child(8)>div>div[class*=help]>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class CardHolderName < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=creditcard]>div>div:nth-child(1)>div>div[class*=help]>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=creditcard]>div>div:nth-child(1)>div>div[class*=help]>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class CreditCardNumber < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=creditcard]>div>div:nth-child(2)>div>div[class*=help]>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=creditcard]>div>div:nth-child(2)>div>div[class*=help]>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class Month < Stamps::Browser::StampsDropdown
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(1)>div>div[class*=help]>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(1)>div>div[class*=help]>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class Year < Stamps::Browser::StampsDropdown
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(2)>div>div[class*=help]>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=creditcard]>div>div:nth-child(3)>div>div:nth-child(2)>div>div[class*=help]>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class BillingAddress < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=creditcard]>div>div:nth-child(6)>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #       driver.span(css: "li[id=personalinfo] div[class*='col-xs-12']:nth-child(4) div[class*=help-block] span")
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=creditcard]>div>div:nth-child(6)>div>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class BillingCity < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=creditcard]>div>div:nth-child(7)>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=creditcard]>div>div:nth-child(7)>div>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class BillingState < Stamps::Browser::StampsDropDownLovSubStr
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=creditcard]>div>div:nth-child(8)>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=creditcard]>div>div:nth-child(8)>div>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class BillingZip < Stamps::Browser::StampsTextbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "li[id=creditcard]>div>div:nth-child(9)>div>div>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "li[id=creditcard]>div>div:nth-child(9)>div>div>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      #
      #   class Terms < Stamps::Browser::StampsWatirCheckbox
      #     def help_block
      #       @help_block=RegHelpBlock.new(driver, driver.lis(css: "div[class=terms-msg]>span>ul>li")) if @help_block.nil?||!@help_block.present?
      #       @help_block
      #     end
      #
      #     def single_field_help_block
      #       @single_field_help_block=RegHelpBlock.new(driver, driver.spans(css: "div[class=terms-msg]>span")) if @single_field_help_block.nil?||!@single_field_help_block.present?
      #       @single_field_help_block
      #     end
      #   end
      # end








      ##updated structure
      module PersonalInfo
        def first_name
          # @first_name ||= Fields::FirstName.new(param) if @first_name.nil?||!@first_name.present?
          # @first_name

          (cache[:first_name].nil? || !cache[:header].present?) ? cache[:first_name] = StampsTextbox.new(driver.text_field(id: "firstName")) : cache[:first_name]


        end

        def last_name
          # @last_name ||= Fields::LastName.new(driver.text_field(id: "lastName")) if @last_name.nil?||!@last_name.present?
          # @last_name
          (cache[:last_name].nil? || !cache[:header].present?) ? cache[:last_name] = StampsTextbox.new(driver.text_field(id: "lastName")) : cache[:last_name]

        end

        def company
          # @company ||= StampsTextbox.new(driver.text_field(id: "companyName")) if @company.nil?||!@company.present?
          # @company

          (cache[:company].nil? || !cache[:company].present?) ? cache[:company] = StampsTextbox.new(driver.text_field(id: "companyName")) : cache[:company]
        end

        def address
          # @address ||= StreetAddress.new(driver.text_field(id: "street")) if @address.nil?||!@address.present?
          # @address
          (cache[:address].nil? || !cache[:address].present?) ? cache[:address] = StampsTextbox.new(driver.text_field(id: "street")) : cache[:address]

        end

        def city
          # @city ||= City.new(driver.text_field(id: "city")) if @city.nil?||!@city.present?
          # @city

          (cache[:city].nil? || !cache[:city].present?) ? cache[:city] = StampsTextbox.new(driver.text_field(id: "city")) : cache[:city]
        end

        def state
          field = driver.spans(css: "button[data-id=state]>span").first
          #   @state ||= State.new(field, field, :span) if @state.nil?||!@state.present?
          #   @state

          (cache[:state].nil? || !cache[:state].present?) ? cache[:state] = StampsDropdown.new(field, field, :span) : cache[:state]
        end

        def zip
          # @zip ||= StampsTextbox.new(driver.text_field(id: "zip")) if @zip.nil?||!@zip.present?
          # @zip
          (cache[:zip].nil? || !cache[:zip].present?) ? cache[:zip] = StampsTextbox.new(driver.text_field(id: "zip")) : cache[:zip]

        end

        def phone
          # @phone ||= Phone.new(driver.text_field(id: "phone")) if @phone.nil?||!@phone.present?
          # @phone

          (cache[:phone].nil? || !cache[:phone].present?) ? cache[:phone] = StampsTextbox.new(driver.text_field(id: "phone")) : cache[:phone]

        end

      end

      module CreditCard
        def cc_holder_name
          # @cc_holder_name ||= CardHolderName.new(driver.text_field(id: "ccName")) if @cc_holder_name.nil?||!@cc_holder_name.present?
          # @cc_holder_name

          (cache[:cc_holder_name].nil? || !cache[:cc_holder_name].present?) ? cache[:cc_holder_name] = StampsTextbox.new(driver.text_field(id: "ccName")) : cache[:cc_holder_name]
        end

        def cc_number
          # @cc_number ||= CreditCardNumber.new(driver.text_field(id: "ccNumber")) if @cc_number.nil?||!@cc_number.present?
          # @cc_number
          (cache[:cc_number].nil? || !cache[:cc_number].present?) ? cache[:cc_number] = StampsTextbox.new(driver.text_field(id: "ccNumber")) : cache[:cc_number]
        end

        def cc_month
          field = driver.span(css: "button[data-id=ccMonth]>span")
          # @cc_month ||= Month.new(field, field, :span) if @cc_month.nil?||!@cc_month.present?
          # @cc_month

          (cache[:cc_month].nil? || !cache[:cc_month].present?) ? cache[:cc_month] = StampsDropdown.new(field, field, :span) : cache[:cc_month]
        end

        def cc_year
          field = driver.span(css: "button[data-id=ccYear]>span[class*=option]")
          # @cc_year ||= Year.new(field, field, :span) if @cc_year.nil?||!@cc_year.present?
          # @cc_year

          (cache[:cc_year].nil? || !cache[:cc_year].present?) ? cache[:cc_year] = StampsDropdown.new(field, field, :span) : cache[:cc_year]
        end

        def use_mailing_for_billing
          # @use_mailing_for_billing=StampsWatirCheckbox.new(driver.checkbox(name: 'useMailingAddressForBilling')) if @use_mailing_for_billing.nil?||!@use_mailing_for_billing.present?
          # @use_mailing_for_billing

          (cache[:use_mailing_for_billing].nil? || !cache[:use_mailing_for_billing].present?) ? cache[:use_mailing_for_billing] = StampsWatirCheckbox.new(driver.checkbox(name: 'useMailingAddressForBilling')) : cache[:use_mailing_for_billing]
        end

        def billing_address
          # @billing_address=BillingAddress.new(driver.text_field(id: "billingStreet")) if @billing_address.nil?||!@billing_address.present?
          # @billing_address

          (cache[:billing_address].nil? || !cache[:billing_address].present?) ? cache[:billing_address] = StampsTextbox.new(driver.text_field(id: "billingStreet")) : cache[:billing_address]
        end

        def billing_city
          # @billing_city=BillingCity.new(driver.text_field(id: "billingCity")) if @billing_city.nil?||!@billing_city.present?
          # @billing_city
          (cache[:billing_city].nil? || !cache[:billing_city].present?) ? cache[:billing_city] = StampsTextbox.new(driver.text_field(id: "billingCity")) : cache[:billing_city]

        end

        def billing_state
          # field=driver.span(css: "button[data-id=billingState]>span")
          # list_of_values=driver.spans(css: "li[id=creditcard]>div>div>div[class*=billingAddressForm]>div>div[class*=menu]>ul>li>a>span[class=text]")
          # @billing_state=BillingState.new(field, field, list_of_values) if @billing_state.nil?||!@billing_state.present?
          # @billing_state
          #
          (cache[:billing_state].nil? || !cache[:billing_state].present?) ? cache[:billing_state] = StampsDropDownLovSubStr.new(
              driver.span(css: "button[data-id=billingState]>span"),
              driver.span(css: "button[data-id=billingState]>span"),
              driver.spans(css: "li[id=creditcard]>div>div>div[class*=billingAddressForm]>div>div[class*=menu]>ul>li>a>span[class=text]")) : cache[:survey_question]

        end

        def billing_zip
          # @billing_zip=BillingZip.new(driver.text_field(id: "billingZip")) if @billing_zip.nil?||!@billing_zip.present?
          # @billing_zip
          (cache[:billing_zip].nil? || !cache[:billing_zip].present?) ? cache[:billing_zip] = StampsTextbox.new(driver.text_field(id: "billingZip")) : cache[:billing_zip]
        end
      end

      module TermsAndConditions
        def agree_to_terms
          # @agree_to_terms=Terms.new(driver.input(name: 'termsConditions')) if @agree_to_terms.nil?||!@agree_to_terms.present?
          # @agree_to_terms

          (cache[:agree_to_terms].nil? || !cache[:agree_to_terms].present?) ? cache[:agree_to_terms] = StampsWatirCheckbox.new(driver.input(name: 'termsConditions')) : cache[:agree_to_terms]
        end

        def terms_conditions_link
          # @terms_conditions_link=StampsField.new(driver.a(css: "a[class*='termsLabel terms-conditions-link'")) if @terms_conditions_link.nil?||!@terms_conditions_link.present?
          # @terms_conditions_link
          (cache[:terms_conditions_link].nil? || !cache[:terms_conditions_link].present?) ? cache[:terms_conditions_link] = StampsField.new(driver.a(css: "a[class*='termsLabel terms-conditions-link'")) : cache[:terms_conditions_link]
        end

        def pricing_billing_details_link
          @pricing_billing_details_link = StampsField.new(driver.a(class: "pricing-billing-link")) if @pricing_billing_details_link.nil? || !@pricing_billing_details_link.present?
          @pricing_billing_details_link

          (cache[:pricing_billing_details_link].nil? || !cache[:pricing_billing_details_link].present?) ? cache[:pricing_billing_details_link] = StampsField.new(driver.a(class: "pricing-billing-link")) : cache[:pricing_billing_details_link]
        end

        def terms_label_1
          # @terms_label_1=StampsField.new(driver.span(css: "label[for=termsConditions]>span")) if @terms_label_1.nil?||!@terms_label_1.present?
          # @terms_label_1

          (cache[:terms_label_1].nil? || !cache[:terms_label_1].present?) ? cache[:terms_label_1] = StampsField.new(driver.span(css: "label[for=termsConditions]>span")) : cache[:terms_label_1]
        end

        def terms_label_2
          # @terms_label_2=StampsField.new(driver.span(class: "termsLabel")) if @terms_label_2.nil?||!@terms_label_2.present?
          # @terms_label_2

          (cache[:terms_label_2].nil? || !cache[:terms_label_2].present?) ? cache[:terms_label_2] = StampsField.new(driver.span(class: "termsLabel")) : cache[:terms_label_2]
        end

        def terms_label
          "#{terms_label_1.text} #{terms_conditions_link.text} #{terms_label_2.text}"
        end
      end

      module Pagination
        def back_btn
          # @back_btn=StampsField.new(driver.button(id: "prev")) if @back_btn.nil?||!@back_btn.present?
          # @back_btn

          (cache[:back_btn].nil? || !cache[:back_btn].present?) ? cache[:back_btn] = StampsField.new(driver.button(id: "prev")) : cache[:back_btn]

        end

        # def back
        #   back_btn.click_while_present
        # end

        def continue_btn
          # @continue_btn=StampsField.new(driver.button(id: "next")) if @continue_btn.nil?||!@continue_btn.present?
          # @continue_btn

          (cache[:continue_btn].nil? || !cache[:continue_btn].present?) ? cache[:continue_btn] = StampsField.new(driver.button(id: "next")) : cache[:continue_btn]

        end

        def continue_to_next_page
          continue_btn.click_while_present
          continue_btn.wait_while_present(5)
        end

        # def continue
        #   continue_btn.click
        # end
      end

      module MemberAddressValidationModel
        def model_header
          @model_header = StampsField.new(driver.h3(css: "div[id=addressValidationModal]>div>div>div>h3")).text if @model_header.nil? || !@model_header.present?
          @model_header
        end

        def model_header_instructions
          @model_header_instructions = StampsField.new(driver.p(id: "instructions")).text if @model_header_instructions.nil? || !@model_header_instructions.present?
          @model_header_instructions
        end

        def cancel
          @cancel = StampsField.new(driver.divs(css: "div[class='modal-footer']>button").first) if @cancel.nil? || !@cancel.present?
          @cancel
        end

        def continue
          @continue = StampsField.new(driver.divs(css: "div[class='modal-footer']>button").last) if @continue.nil? || !@continue.present?
          @continue


        end

        def address_list
          @address_list = StampsField.new(driver.divs(css: "div[id='multipleMatch']>table>tbody>tr>td>input").first) if @address_list.nil? || !@address_list.present?
          @address_list
        end
      end

      module MemberUsernameTakenModel
        def uname_model_header
          @uname_model_header = StampsField.new(driver.h3(css: "div[id='error']>div>div>div[class='modal-header']>h3")).text if @uname_model_header.nil? || !@uname_model_header.present?
          @uname_model_header
        end

        def uname_model_custom_body
          @uname_model_custom_body = StampsField.new(driver.p(css: "div[id='error']>div>div>div>div[id='prev-username']>p")).text if @uname_model_custom_body.nil? || !@uname_model_custom_body.present?
          @uname_model_custom_body
        end

        def uname_text_box
          @uname_text_box ||= StampsTextbox.new(driver.text_field(id: "newUsername")) if @uname_text_box.nil? || !@uname_text_box.present?
          @uname_text_box
        end

        def uname_continue_btn
          @uname_continue_btn = StampsField.new(driver.button(id: "btnUserNameTakenContinue")) if @uname_continue_btn.nil? || !@uname_continue_btn.present?
          @uname_continue_btn
        end
      end

      class MembershipPage < WebApps::Base
        include PersonalInfo
        include CreditCard
        include TermsAndConditions
        include Pagination
        include MemberAddressValidationModel
        include MemberUsernameTakenModel
      end


    end
  end
 end




