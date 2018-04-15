module Stamps
  module Orders

    ##
    # Orders Landing Page
    class LandingPage < SdcPage
      page_obj(:username, tag: :text_field) { {xpath: "//input[@placeholder='USERNAME']"} }
      page_obj(:password, tag: :text_field) { {xpath: "//input[@placeholder='PASSWORD']"} }
      page_obj(:sign_in) { {xpath: "//span[contains(text(), 'Sign In')]"} }

      page_url { |env| "https://print#{env}.stamps.com/SignIn/Default.aspx?env=Orders&" }

    end
  end
end