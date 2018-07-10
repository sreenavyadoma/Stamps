module WhiteLabel
  class ProfilePage < SdcPage
    text_field(:email, tag: :text_field, required: true) { { id: 'email' } }
    text_field(:username, tag: :text_field, required: true) { { id: 'username' } }
    text_field(:password, tag: :text_field, required: true) { { id: 'password' } }
    text_field(:confirm_password, tag: :text_field, required: true) { { id: 'confirmPassword' } }
    text_field(:confirm_password, tag: :text_field, required: true) { { id: 'confirmPassword' } }

    button(:survey) { { id: 'usageType' } }
    text_field(:text_field) {{xpath: '//button[contains(@class, "dropdown-toggle")][@data-id="usageType"]'}}

    def selection(str, name = :selection_element)
      page_object(name, timeout: 5) { { xpath: "//span[text()=' #{str} ']" } }
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