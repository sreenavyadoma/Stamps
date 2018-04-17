module Stamps
  module WebDev
    module StampsEndicia

      class PPLoginPage < SdcPage
        #Welcome content
        page_objs(:p_content) {{xpath: "//p"}}
        page_objs_index(:welcome_content, index: 0) {:p_content}

        #Error Message
        page_objs_index(:error_message, index: 1) {:p_content}

        #sdcEndica logo
        page_obj(:sdc_endicia_logo) {{xpath: "//img[@alt='Stamps.com and Endicia']"}}

        #USPS Portal content
        page_obj(:usps_portal_content) {{xpath: "//h3['USPS Portal']"}}

        #Email textbox
        text_field(:email, tag: :text_field, required: true) { {name: "email"} }
        page_obj(:email_tooltip) { {xpath: "//*[@name='email']/div/div/span"} }
        label(:email_placeholder) { {xpath: "//input[@placeholder='EMAIL']"} }

        #Password textbox
        text_field(:password, tag: :text_field, required: true) { {name: "password"} }
        page_obj(:password_tooltip) { {xpath: "//*[@name='password']/div/div/span"} }
        label(:password_placeholder) { {xpath: "//input[@placeholder='PASSWORD']"} }

        #Log In button
        button(:log_in) { {xpath: "//button[@label='Log In']"} }
        button(:login_label) {{xpath: "//button[@label='Log In']/span"}}

        #Forgot Password? link
        link(:forgot_pw) {{xpath: "//a[@href='/password-reset/request']"}}

      end

    end
  end
end