module Stamps
  module Registration
    module Membership

      class MembershipPersonalInfo < Browser::StampsModal
        attr_reader :first_name, :last_name, :company, :address, :city, :state, :zip, :phone

        def initialize(param)
          super
          text_box = browser.text_field(id: "firstName")
          help_collection = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(1)>div>div>span")
          @first_name = StampsTextBoxModule.new(text_box, help_collection)

          text_box = browser.text_field(id: "lastName")
          help_collection = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(2)>div>div>span")
          @last_name = StampsTextBoxModule.new(text_box, help_collection)

          @company = StampsTextBox.new(browser.text_field(id: "companyName"))

          text_box = browser.text_field(id: "street")
          help_collection = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(4)>div>div>span")
          @address = StampsTextBoxModule.new(text_box, help_collection)

          text_box = browser.text_field(id: "city")
          help_collection = browser.lis(css: "li[id=personalinfo]>div>div:nth-child(5)>div>div>span")
          @city = StampsTextBoxModule.new(text_box, help_collection)



          @state = MembershipState.new(param)


          @zip = StampsTextBox.new browser.text_field(id: "zip")
          @phone = MembershipPhone.new browser.text_field(id: "phone")
        end

        def present?

        end
      end

      class MembershipCreditCard < Browser::StampsModal
        attr_reader :card_holder_name, :card_number, :expiration_month, :expiration_year, :billing_same_as_mailing, :terms_and_conditions

        def initialize(param)
          super
          @card_holder_name = MembershipCardHolderName.new browser.text_field(id: "ccName")
          @card_holder_name = StampsTextBox.new browser.text_field(id: "ccName")
          @card_number = MembershipCardNumber.new browser.text_field(id: "ccNumber")
          @expiration_month = ExpirationMonth.new(param)
          @expiration_year = ExpirationYear.new(param)
          checkbox_field = browser.input id: "useMailingAddressForBilling"
          @billing_same_as_mailing = StampsCheckBox.new checkbox_field, checkbox_field, "checked", "checked"

          @billing_address = MembershipBillingAddress.new browser.text_field(id: "billingStreet")
          @billing_city = MembershipBillingAddress.new browser.text_field(id: "City")
          @billing_state = BillingState.new(param)
          @billing_zip = MembershipBillingZip.new browser.text_field(id: "billingZip")
        end
      end

      class MembershipTerms < Browser::StampsModal
        attr_reader

        def initialize(param)
          super
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

        attr_reader :personal_info, :credit_card, :terms,
                    :back,
                    :submit_button, :supplies, :userid_taken, :download_page, :membership_error, :billing_address,
                    :billing_city, :billing_state, :billing_zip, :loading, :page_header, :error_occured, :connection_failed

        def initialize(param)
          super
          @personal_info = MembershipPersonalInfo.new(param)
          @credit_card = MembershipCreditCard.new(param)
          @terms = MembershipTerms.new(param)
          @pagination = MembershipPagination.new(param)


          @supplies = ChooseSupplies.new(param)
          @userid_taken = UserIdTaken.new(param)
          @download_page = DownloadPage.new(param)
          @membership_error = MembershipError.new(param)

          @loading = StampsElement.new browser.button(text: "Loading...")
          @page_header = StampsElement.new browser.h1(text: 'Customize your Welcome Kit')

          @error_occured = RegistrationError.new(param)
          @connection_failed = RegistrationSecureConnectionFailed.new(param)

        end

        def wait_until_present(*args)
          browser.text_field(id: "firstName").wait_until_present(args[0])
        end

        def present?
          browser.h1(text: "Please enter your mailing information").present?
        end

        def submit_correct_errors registration_data
          expect(registration_data).to be_a(Hash)
          10.times do
            submit

            loading.wait_until_present 3
            page_header.wait_until_present 3

            if phone.has_error?
              err_text = phone.help_text
              if err_text == "This field is required"
                logger.error err_text
                phone.set registration_data[:phone]
                phone.send_keys registration_data[:phone]
              end
            end

            if card_number.has_error?
              err_text = card_number.help_text
              logger.error err_text
              expect("Card Number #{registration_data[:card_number]} failed verification.").to eql(err_text) if err_text.include? "failed verification"
              if err_text == "This field is required"
                card_number.set(registration_data[:card_number])
                card_number.send_keys(registration_data[:card_number])
              end
            end

            break unless submit_button.present?
          end
          15.times do
            sleep(0.35)
            break if browser.url.include? "catalog"
          end
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
