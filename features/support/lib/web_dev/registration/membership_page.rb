module Stamps
  module Registration
    module Membership

      class State < Browser::StampsModal
        def select state
          begin
            browser.select_list(:id, "state").option(text: state).when_present.select
            browser.select_list(:id, "state").option(text: state).when_present.select
          rescue
            #ignore
          end
        end

        def armed_forces_americas
          select "AA Armed Forces Americas"
        end

        def armed_forces
          select "AE Armed Forces"
        end

        def alaska
          select "AK Alaska"
        end

        def alabama
          select "AL Alabama"
        end

        def armed_forces_pacific
          select "AP Armed Forces Pacific"
        end

        def arkansa
          select "AR Arkansas"
        end

        def american_samoa
          select "AS American Samoa"
        end

        def arizona
          select "AZ Arizona"
        end

        def california
          select "CA California"
        end

        def colorado
          select "CO Colorado"
        end

        def connecticut
          select "CT Connecticut"
        end

        def canal_zone
          select "CZ Canal Zone"
        end

        def district_of_columbia
          select "DC District of Columbia"
        end

        def delaware
          select "DE Delaware"
        end

        def florida
          select "FL Florida"
        end

        def micronesia
          select "FM Micronesia"
        end

        def georgia
          select "GA Georgia"
        end

        def guam
          select "GU Guam"
        end

        def hawaii
          select "HI Hawaii"
        end

        def iowa
          select "IA Iowa"
        end

        def idaho
          select "ID Idaho"
        end

        def illinois
          select "IL Illinois"
        end

        def kansas
          select "KS Kansas"
        end

        def kentucky
          select "KY Kentucky"
        end

        def louisiana
          select "LA Louisiana"
        end

        def massachusetts
          select "MA Massachusetts"
        end

        def maryland
          select "MD Maryland"
        end

        def maine
          select "ME Maine"
        end

        def marshall_islands
          select "MH Marshall Islands"
        end

        def michigan
          select "MI Michigan"
        end

        def minnesota
          select "MN Minnesota"
        end

        def missouri
          select "MO Missouri"
        end

        def mariana_islands
          select "MP Mariana Islands"
        end

        def mississippi
          select "MS Mississippi"
        end

        def montana
          select "MT Montana"
        end

        def north_carolina
          select "NC North Carolina"
        end

        def north_dakota
          select "ND North Dakota"
        end

        def nebraska
          select "NE Nebraska"
        end

        def new_hampshire
          select "NH New Hampshire"
        end

        def new_jersey
          select "NJ New Jersey"
        end

        def new_mexico
          select "NM New Mexico"
        end

        def nevada
          select "NV Nevada"
        end

        def new_york
          select "NY New York<"
        end

        def ohio
          select "OH Ohio"
        end

        def oklahoma
          select "OK Oklahoma"
        end

        def oregon
          select "OR Oregon"
        end

        def pennsylvania
          select "PA Pennsylvania"
        end

        def puerto_rico
          select "PR Puerto Rico"
        end

        def palau
          select "PW Palau"
        end

        def rhode_island
          select "RI Rhode Island"
        end

        def south_carolina
          select "SC South Carolina"
        end

        def south_dakota
          select "SD South Dakota"
        end

        def tennessee
          select "TN Tennessee"
        end

        def texas
          select "TX Texas"
        end

        def utah
          select "UT Utah"
        end

        def virginia
          select "VA Virginia"
        end

        def virgin_islands
          select "VI Virgin Islands"
        end

        def vermont
          select "VT Vermont"
        end

        def washington
          select "WA Washington"
        end

        def wisconsin
          select "WI Wisconsin"
        end

        def west_virginia
          select "WV West Virginia"
        end

        def wyoming
          select "WY Wyoming"
        end

        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_personalinfo]>div>:nth-child(6)>div>span")).text
        end
      end

      class ExpirationMonth < Browser::StampsModal
        def select month
          begin
            browser.select_list(:id, "ccMonth").option(text: month).when_present.select
            browser.select_list(:id, "ccMonth").option(text: month).when_present.select
          rescue
            #ignore
          end
        end

        def jan
          select "Jan (01)"
        end

        def feb
          select "Feb (02)"
        end

        def mar
          select "Mar (03)"
        end

        def apr
          select "Apr (04)"
        end

        def may
          select "May (05)"
        end

        def jun
          select "Jun (06)"
        end

        def jul
          select "Jul (07)"
        end

        def aug
          select "Aug (08)"
        end

        def sep
          select "Sep (09)"
        end

        def oct
          select "Oct (10)"
        end

        def nov
          select "Nov (11)"
        end

        def dec
          select "Dec (12)"
        end

        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_creditcard]>div>:nth-child(3)>div>span")).text
        end

      end

      class ExpirationYear < Browser::StampsModal
        def select year
          begin
            browser.select_list(:id, "ccYear").option(text: year).when_present.select
            browser.select_list(:id, "ccYear").option(text: year).when_present.select
          rescue
            #ignore
          end
        end
      end

      class TermsAndConditions < Browser::StampsModal
        attr_reader :checkbox
        def initialize(param)
          super
          @checkbox = browser.checkbox id: "termsConditions"
        end

        def check
          5.times do
            checkbox.set
            break if checkbox.set?
          end
        end

        def uncheck
          5.times do
            checkbox.clear
            break unless checkbox.set?
          end
        end

        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_terms]>div>div>div>div>span.help-block")).text
        end
      end

      class UserIdTaken < Browser::StampsModal
        def present?
          (browser.h3 text: "User ID Taken").present?
        end

        def message
          StampsElement.new(((browser.ps id: "topMessage").last)).text
        end

        def user_id
          StampsTextBox.new browser.text_field(id: "newUsername")
        end

        def continue
          StampsElement.new browser.button(id: "btnUserNameTakenContinue")
        end
      end

      class MembershipError < Browser::StampsModal
        attr_reader :title, :top_message, :error_code, :error_description

        def initialize(param)
          super
          @title = StampsElement.new browser.h3 text: 'An Error Occurred'
          @top_message = StampsElement.new browser.p id: 'topMessage'
          @error_code = StampsElement.new browser.p id: 'errorCode'
          @error_description = StampsElement.new browser.p id: 'errorDescription'
        end

        def present?
          title.present?
        end
      end

      class RegistrationError < Browser::StampsModal
        def present?
          browser.text.include? "An Error Occurred"

        end

        def error_message
          text = browser.text
          return text.split(/Secure Connection Failed/).last if text.include? 'An Error Occurred'
          return ""
        end
      end

      class RegistrationSecureConnectionFailed < Browser::StampsModal
        def present?
          browser.text.include? "Secure Connection Failed"
        end

        def error_message
          text = browser.text
          return text.split(/Secure Connection Failed/).last if text.include? 'Secure Connection Failed'
          return ""
        end
      end


      class MembershipPhone < StampsTextBox
        attr_reader :help_element

        def initialize(param)
          super
          @help_element = browser.span(css: "li[class*=registration_personalinfo]>div>:nth-child(8)>div>span")
        end

        def has_error?
          help_element.present?
        end

        def help_text
          help_element.text
        end
      end

      class MembershipFirstName < StampsTextBox
        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_personalinfo]>div>:nth-child(1)>div>span")).text
        end
      end

      class MembershipLastName < StampsTextBox
        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_personalinfo]>div>:nth-child(2)>div>span")).text
        end
      end

      class MembershipAddress < StampsTextBox
        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_personalinfo]>div>:nth-child(4)>div>span")).text
        end
      end

      class MembershipCity < StampsTextBox
        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_personalinfo]>div>:nth-child(5)>div>span")).text
        end
      end

      class MembershipCardHolderName < StampsTextBox
        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_creditcard]>div>:nth-child(1)>div>span")).text
        end
      end

      class MembershipCardName< StampsTextBox
        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_creditcard]>div>:nth-child(2)>div>span")).text
        end
      end

      class MembershipBillingAddress < StampsTextBox
        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_creditcard]>div>:nth-child(6)>div>span")).text
        end
      end

      class MembershipBillingCity< StampsTextBox
        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_creditcard]>div>:nth-child(7)>div>span")).text
        end
      end

      class BillingState < Browser::StampsModal
        def select(state)
          begin
            browser.select_list(:id, "billingState").option(text: state).when_present.select
            browser.select_list(:id, "billingState").option(text: state).when_present.select
          rescue
            #ignore
          end
        end

        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_creditcard]>div>:nth-child(8)>div>span")).text
        end
      end

      class MembershipBillingZip < StampsTextBox
        def help_text
          StampsElement.new(browser.span(css: "li[class*=registration_creditcard]>div>:nth-child(9)>div>span")).text
        end
      end

      class MembershipCardNumber < StampsTextBox
        attr_reader :help_element

        def initialize(param)
          super
          @help_element = StampsElement.new(browser.span(css: 'li.registration_creditcard>div>div:nth-child(2)>div>span'))
        end

        def help_text
          help_element.text
        end

        def has_error?
          help_element.present?
        end
      end

      class MembershipPage < Browser::StampsModal

        attr_reader :first_name, :last_name, :company, :address, :city, :state, :zip, :phone, :ext, :card_holder_name,
                    :card_number, :expiration_month, :expiration_year, :billing_same_as_mailing, :terms_and_conditions, :back,
                    :submit_button, :supplies, :userid_taken, :download_page, :membership_error, :billing_address,
                    :billing_city, :billing_state, :billing_zip, :loading, :page_header, :error_occured, :connection_failed

        def initialize(param)
          super

          @phone = MembershipPhone.new browser.text_field(id: "phone")
          @first_name = MembershipFirstName.new browser.text_field(id: "firstName")
          @last_name = MembershipLastName.new browser.text_field(id: "lastName")
          @company = StampsTextBox.new browser.text_field(id: "companyName")
          @address = MembershipAddress.new browser.text_field(id: "street")
          @city = MembershipCity.new browser.text_field(id: "city")
          @state = State.new(param)
          @zip = StampsTextBox.new browser.text_field(id: "zip")
          @ext = StampsTextBox.new browser.text_field(id: "extension")
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

          @terms_and_conditions = TermsAndConditions.new(param)
          @back = StampsElement.new browser.button(id: "prev")

          @submit_button = StampsElement.new(browser.button(text: "Submit"))
          @supplies = ChooseSupplies.new(param)
          @userid_taken = UserIdTaken.new(param)
          @download_page = DownloadPage.new(param)
          @membership_error = MembershipError.new(param)

          @loading = StampsElement.new browser.button(text: "Loading...")
          @page_header = StampsElement.new browser.h1(text: 'Customize your Welcome Kit')

          @error_occured = RegistrationError.new(param)
          @connection_failed = RegistrationSecureConnectionFailed.new(param)

        end

        def wait_until_present
          browser.text_field(id: "firstName").wait_until_present 6
          browser.text_field(id: "lastName").wait_until_present
          browser.text_field(id: "companyName").wait_until_present
          browser.text_field(id: "street").wait_until_present
          browser.text_field(id: "city").wait_until_present
          browser.text_field(id: "zip").wait_until_present
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
