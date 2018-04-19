module Stamps
  ##
  # Orders Landing Page
  class SdcOrdersLandingPage < SdcPage
    page_obj(:username, tag: :text_field) { {xpath: "//input[@placeholder='USERNAME']"} }
    page_obj(:password, tag: :text_field) { {xpath: "//input[@placeholder='PASSWORD']"} }
    page_obj(:sign_in) { {xpath: "//span[contains(text(), 'Sign In')]"} }

    page_objs(:textbox, tag: :text_fields, index: 0) { {xpath: "//input[@placeholder='USERNAME']"} }

    page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

  end
end
