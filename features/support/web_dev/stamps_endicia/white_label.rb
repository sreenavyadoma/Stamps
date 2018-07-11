module WhiteLabel
  class ProfilePage < SdcPage
    text_field(:email, tag: :text_field, required: true) { { id: 'email' } }
    text_field(:username, tag: :text_field, required: true) { { id: 'username' } }
    text_field(:password, tag: :text_field, required: true) { { id: 'password' } }
    text_field(:confirm_password, tag: :text_field, required: true) { { id: 'confirmPassword' } }
    link(:promo_code_link) { { id: 'showPromoCode' } }
    text_field(:promo_code_textbox, tag: :text_field, required: true) { { id: 'promoCodeHidden' } }
    page_object(:survey) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="usageType"]'}}
    page_object(:referrer_name) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="referrerName"]'}}
    page_objects(:money_saving_offers,  index: 0) { {id: "optIn"} }
    button(:continue) {{id: 'next'}}

    def survey_selection(str, name = :survey_element)
      page_object(name) { { xpath: "//span[text()=' #{str} ']" } }
    end

    def referrer_name_selection(str, name = :referrer_name_element)
      page_object(name) { { xpath: "//span[text()='#{str}']" } }
    end

  end

  class MembershipPage < SdcPage
    page_object(:header) { {xpath: '//h1[(contains(text(), "Set up your personal Post Office"))]'} }
    text_field(:first_name, tag: :text_field, required: true) { { id: 'firstName' } }
    text_field(:last_name, tag: :text_field, required: true) { { id: 'lastName' } }
    text_field(:company, tag: :text_field) { { id: 'companyName' } }
    text_field(:address, tag: :text_field, required: true) { { id: 'street' } }
    text_field(:city, tag: :text_field, required: true) { { id: 'city' } }
    page_object(:state) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="state"]'}}
    text_field(:zip, tag: :text_field) { { id: 'zip' } }
    text_field(:phone, tag: :text_field, required: true) { { id: 'phone' } }
    text_field(:cc_holder_name, tag: :text_field, required: true) { { id: 'ccName' } }
    text_field(:cc_number, tag: :text_field, required: true) { { id: 'ccNumber' } }
    page_object(:cc_month) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="ccMonth"]'}}
    page_object(:cc_year) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="ccYear"]'}}
    page_object(:use_mailing_address_for_billing) {{id: 'useMailingAddressForBilling'}}
    page_object(:terms_conditions) {{id: 'termsConditions'}}
    button(:back) {{id: 'prev'}}
    button(:submit) {{id: 'next'}}

    def dropdown_selection(str, name = :dropdown_element)
      page_object(name) { { xpath: "//span[text()='#{str}']" } }
    end

  end

  class ChooseSupplies < SdcPage
    page_object(:place_order) {{id: 'mincartButtonTopDpawr'}}
  end

  class << self

    def profile_page
      ProfilePage.new
    end

    def membership_page
      MembershipPage.new
    end

    def choose_supplies
      ChooseSupplies.new
    end

    def common_page
      Common.new
    end

    def sdcw_website
      SDCWWebsite.new
    end

    def ew_website
      EWWebsite.new
    end

  end

end