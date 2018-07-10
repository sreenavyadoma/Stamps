module WhiteLabel
  class ProfilePage < SdcPage
    text_field(:email, tag: :text_field, required: true) { { id: 'email' } }
    text_field(:username, tag: :text_field, required: true) { { id: 'username' } }
    text_field(:password, tag: :text_field, required: true) { { id: 'password' } }
    text_field(:confirm_password, tag: :text_field, required: true) { { id: 'confirmPassword' } }
    link(:promo_code_link) { { id: 'showPromoCode' } }
    text_field(:promo_code_textbox, tag: :text_field, required: true) { { id: 'promoCodeHidden' } }
    page_object(:survey) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="usageType"]'}}

    def survey_selection(str, name = :survey_element)
      page_object(name) { { xpath: "//span[text()=' #{str} ']" } }
    end

  end

  class << self

    def profile_page
      ProfilePage.new
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