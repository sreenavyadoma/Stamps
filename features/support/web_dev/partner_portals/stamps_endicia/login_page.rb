module Stamps
  module WebDev
    module Portals
      class LoginPage < SdcPageObject

        #Welcome content
         element(:welcome_content, required: true) {{xpath: "//p['Welcome to the']"}}

        #sdcEndica content
        element(:sdc_endicia_content, required: true) {{xpath: "//img[@alt='Stamps.com and Endicia']"}}

        #USPS Portal content
         element(:usps_portal_content, required: true) {{xpath: "//p['USPS Portal']"}}

        #Email textbox
        text_field(:email, tag_name: :text_field, required: true) { {name: "email"} }
        element(:email_tooltip, required: true) { {xpath: "//*[@name='email']/div/div/span"} }
        label(:email_placeholder, required: true) { {xpath: "//input[@placeholder='EMAIL']"} }

        #Password textbox
        text_field(:password, tag_name: :text_field, required: true) { {name: "password"} }
        element(:password_tooltip, required: true) { {xpath: "//*[@name='password']/div/div/span"} }
        label(:password_placeholder, required: true) { {xpath: "//input[@placeholder='PASSWORD']"} }

        #Log In button
        button(:log_in, required: true) { {xpath: "//button[@label='Log In']"} }
        button(:login_label, required: true) {{xpath: "//button[@label='Log In']/span"}}

        #Forgot Password? link
        link(:forgot_pw, required: true) {{xpath: "//a[@href='/password-reset/request']"}}





      end
    end
  end
end