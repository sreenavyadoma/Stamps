module Stamps
  module WebReg
    class State < Browser::Modal
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
    end

    class ExpirationMonth < Browser::Modal
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

    end

    class ExpirationYear < Browser::Modal
      def select year
        begin
          browser.select_list(:id, "ccYear").option(text: year).when_present.select
          browser.select_list(:id, "ccYear").option(text: year).when_present.select
        rescue
          #ignore
        end
      end
    end

    class TermsAndConditions < Browser::Modal
      attr_reader :checkbox
      def initialize param
        super param
        @checkbox ||= browser.checkbox id: "termsConditions"
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
    end

    class UserIdTaken < Browser::Modal
      def present?
        (browser.h3 text: "User ID Taken").present?
      end

      def message
        element_helper.text ((browser.ps id: "topMessage").last)
      end

      def user_id
        TextBoxElement.new browser.text_field(id: "newUsername")
      end

      def continue
        ElementWrapper.new browser.button(id: "btnUserNameTakenContinue")
      end
    end

    class MembershipError < Browser::Modal
      attr_reader :title, :top_message, :error_code, :error_description

      def initialize param
        super param
        @title ||= ElementWrapper.new browser.h3 text: 'An Error Occurred'
        @top_message ||= ElementWrapper.new browser.p id: 'topMessage'
        @error_code ||= ElementWrapper.new browser.p id: 'errorCode'
        @error_description ||= ElementWrapper.new browser.p id: 'errorDescription'
      end

      def present?
        title.present?
      end
    end

    class Membership < Browser::Modal
      attr_reader :first_name, :last_name, :company, :address, :city, :state, :zip, :phone, :ext, :card_holder_name,
                  :card_number, :expiration_month, :expiration_year, :billing_same_as_mailing, :terms_and_conditions, :back,
                  :submit_button, :supplies, :userid_taken, :download_page, :membership_error

      def initialize param
        super param
        @first_name ||= TextBoxElement.new browser.text_field(id: "firstName")
        @last_name ||= TextBoxElement.new browser.text_field(id: "lastName")
        @company ||= TextBoxElement.new browser.text_field(id: "companyName")
        @address ||= TextBoxElement.new browser.text_field(id: "street")
        @city ||= TextBoxElement.new browser.text_field(id: "city")
        @state ||= State.new param
        @zip ||= TextBoxElement.new browser.text_field(id: "zip")
        @phone ||= TextBoxElement.new browser.text_field(id: "phone")
        @ext ||= TextBoxElement.new browser.text_field(id: "extension")
        @card_holder_name ||= TextBoxElement.new browser.text_field(id: "ccName")
        @card_number ||= TextBoxElement.new browser.text_field(id: "ccNumber")
        @expiration_month ||= ExpirationMonth.new param
        @expiration_year ||= ExpirationYear.new param
        checkbox_field = browser.text_field id: "useMailingAddressForBilling"
        @billing_same_as_mailing ||= Browser::CheckboxElement.new checkbox_field, checkbox_field, "checked", "checked"
        @terms_and_conditions ||= TermsAndConditions.new param
        @back ||= ElementWrapper.new browser.button(id: "prev")

        @submit_button = ElementWrapper.new browser.button(text: "Submit")
        @supplies = ChooseSupplies.new param
        @userid_taken = UserIdTaken.new param
        @download_page = DownloadPage.new param
        @membership_error = MembershipError.new param
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
        (browser.h1 text: "Please enter your mailing information").present?
      end

      def submit
        loading = ElementWrapper.new browser.button(text: "Loading...")
        page_header = ElementWrapper.new browser.h1 text: 'Customize your Welcome Kit'
        20.times do
          submit_button.safely_wait_until_present 4
          submit_button.safe_click
          loading.safely_wait_while_present 3
          page_header.safely_wait_until_present 10
          return userid_taken if userid_taken.present?
          return supplies if supplies.present?
          return download_page if download_page.present?
          if membership_error.present?
            err_message = "#{membership_error.title.text}\n#{membership_error.top_message.text}\n#{membership_error.error_code.text}\n#{membership_error.error_description.text}"
            logger.info err_message
            raise err_message
          end
        end
      end
    end
  end
end