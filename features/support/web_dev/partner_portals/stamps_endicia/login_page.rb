module Stamps
  module WebDev
    module Portals
      module StampsEndicia
        module Fields
            class Email < SdcPageObject
              text_field(:username, tag_name: :text_field, required: true) { {id: "username"} }
              element(:tooltip, required: true) { {xpath: "xpath "} }
            end

            class Password < SdcPageObject
              text_field(:password, tag_name: :text_field, required: true) { {id: "password "} }
              element(:tooltip, required: true) { {xpath: "xpath "} }
            end

            class LogIn < SdcPageObject
              button(:log_in, required: true) { {xpath: "xpath "} }
            end

            class ForgotPassowrd < SdcPageObject
              link(:forgot_pw, required: true) {{id: "forgotpassword"}}
              element(:tooltip, required: true) { {xpath: "xpath "} }
            end
         end

          class LoginPage < SdcPageObject

            def email
                Fields::Email.new()
            end

            def password
              Fields::Password.new()
            end

            def forgot_password
              Fields::ForgotPassowrd.new()
            end

            def login
              Fields::LogIn.new()
            end


            def sign_in_with(usr, pw)
              self.username.set usr
              username.set pw
              log_in.click
              log_in.send_keys :enter
              username.safe_wait_while_present
            end
        end
      end
    end
  end
end