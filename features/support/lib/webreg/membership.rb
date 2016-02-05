module WebReg
  class State < Stamps::Browser::BrowserObject
    def select state
      begin
        @browser.select_list(:id, "state").option(:text => state).when_present.select
        @browser.select_list(:id, "state").option(:text => state).when_present.select
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

  class ExpirationMonth < Stamps::Browser::BrowserObject
    def select month
      begin
        @browser.select_list(:id, "ccMonth").option(:text => month).when_present.select
        @browser.select_list(:id, "ccMonth").option(:text => month).when_present.select
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

  class ExpirationYear < Stamps::Browser::BrowserObject
    def select year
      begin
        @browser.select_list(:id, "ccYear").option(:text => year).when_present.select
        @browser.select_list(:id, "ccYear").option(:text => year).when_present.select
      rescue
        #ignore
      end
    end
  end

  class TermsAndConditions < Stamps::Browser::BrowserObject
    def must_agree_label
      Label.new @browser.span(:text => "You must agree to the Terms & Conditions to proceed.")
    end

    def check
      agree_label = must_agree_label
      checkbox_field = Button.new @browser.input(:id => "termsConditions")
      10.times do
        checkbox_field.safe_click
        sleep 1
        return unless agree_label.present?
      end
    end

    def uncheck
      agree_label = must_agree_label
      checkbox_field = Button.new @browser.input(:id => "termsConditions")
      10.times do
        checkbox_field.safe_click
        sleep 1
        return if agree_label.present?
      end
    end
  end

  class Membership < Stamps::Browser::BrowserObject
    def wait_until_present
      browser_helper.wait_until_present @browser.text_field(:id => "firstName")
      browser_helper.wait_until_present @browser.text_field(:id => "lastName")
      browser_helper.wait_until_present @browser.text_field(:id => "companyName")
      browser_helper.wait_until_present @browser.text_field(:id => "street")
      browser_helper.wait_until_present @browser.text_field(:id => "city")
      browser_helper.wait_until_present @browser.text_field(:id => "zip")
    end

    def present?
      browser_helper.present? @browser.h1 :text => "Please enter your mailing information"
    end

    def first_name
      Textbox.new @browser.text_field(:id => "firstName")
    end

    def last_name
      Textbox.new @browser.text_field(:id => "lastName")
    end

    def company
      Textbox.new @browser.text_field(:id => "companyName")
    end

    def address
      Textbox.new @browser.text_field(:id => "street")
    end

    def city
      Textbox.new @browser.text_field(:id => "city")
    end

    def state
      State.new @browser
    end

    def zip
      Textbox.new @browser.text_field(:id => "zip")
    end

    def phone
      Textbox.new @browser.text_field(:id => "phone")
    end

    def ext
      Textbox.new @browser.text_field(:id => "extension")
    end

    def card_holder_name
      Textbox.new @browser.text_field(:id => "ccName")
    end

    def card_number
      Textbox.new @browser.text_field(:id => "ccNumber")
    end

    def expiration_month
      ExpirationMonth.new @browser
    end

    def expiration_year
      ExpirationYear.new @browser
    end

    def billing_same_as_mailing
      checkbox_field = @browser.input :id => "useMailingAddressForBilling"
      Stamps::Browser::Checkbox.new checkbox_field, checkbox_field, "checked", "checked"
    end

    def i_agree
      TermsAndConditions.new @browser
    end

    def back
      Button.new @browser.button(:id => "prev")
    end

    def submit
      button = Button.new @browser.button(:text => "Submit")
      loading = Button.new @browser.button(:text => "Loading...")
      welcome = NewAccountWelcomePage.new @browser
      50.times do
        button.safe_click
        sleep 1
        loading.wait_while_present
        return if welcome.present?
      end
    end
  end
end