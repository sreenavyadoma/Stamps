module Stamps
  module WebDev
    module Portals
      class LoginPage < SdcPageObject

        #Header
         element(:header, required: true) {{xpath: "xxx"}}

        #Email textbox
        text_field(:email, tag_name: :text_field, required: true) { {id: "email"} }
        element(:email_tooltip, required: true) { {xpath: "xxx"} }
        label(:email_label, required: true) { {xpath: "xxx"} }

        #Password textbox
        text_field(:password, tag_name: :text_field, required: true) { {id: "password"} }
        element(:password_tooltip, required: true) { {xpath: "xpath"} }
        label(:password_label, required: true) { {xpath: "xxx"} }

        #Log In button
        button(:log_in, required: true) { {id: "xxx"} }

        #Forgot Password? link
        link(:forgot_pw, required: true) {{id: "xxxx"}}
        element(:forgot_pw_tooltip, required: true) { {xpath: "xpath"} }




      end
    end
  end
end