module Stamps
  ##
  # Orders Landing Page
  class SdcLandingPage < SdcPage
    page_obj(:username, tag: :text_field) { {xpath: "//input[@placeholder='USERNAME']"} }
    page_obj(:password, tag: :text_field) { {xpath: "//input[@placeholder='PASSWORD']"} }
    page_obj(:sign_in) { {xpath: "//span[contains(text(), 'Sign In')]"} }
    page_objs(:sign_ins) { {xpath: "//span[contains(text(), 'Sign In')]"} }
    page_objs(:sign_in_elem) { {xpath: "//span[contains(text(), 'Sign In')]"} }
    _page_object(:textbox) { sign_in_elem[0] }

    page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

  end
end
