module Stamps
  module WebDev
    module StampsEndicia
      module PartnerPortal
        class LoginPage < SdcPage

          #Welcome content
          page_objs(:p_content) {{xpath: "//p"}}
          _page_object(:welcome_content, required: true) {p_content[0]}



          #Error Message
          _page_object(:error_message, required: true) {p_content[1]}


          #sdcEndica logo
          page_obj(:sdc_endicia_logo, required: true) {{xpath: "//img[@alt='Stamps.com and Endicia']"}}

          #USPS Portal content
          page_obj(:usps_portal_content, required: true) {{xpath: "//h3['USPS Portal']"}}

          #Email textbox
          text_field(:email, tag: :text_field, required: true) { {name: "email"} }
          page_obj(:email_tooltip, required: true) { {xpath: "//*[@name='email']/div/div/span"} }
          label(:email_placeholder, required: true) { {xpath: "//input[@placeholder='EMAIL']"} }

          #Password textbox
          text_field(:password, tag: :text_field, required: true) { {name: "password"} }
          page_obj(:password_tooltip, required: true) { {xpath: "//*[@name='password']/div/div/span"} }
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
end