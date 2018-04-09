module Stamps
  module WebDev
    module Portals
      module StampsEndicia
        module Fields
          class SurveyDropDown
            element(:dd, tag_name: :text_field, required: true) { {id: "usageType"} }

            # Business Use - Mostly mailing (letters/postcards/flats)
            def select(str, iter: 3)
              # create the drop-down element
              self.class.element(:selection) { {xpath: "//span[contains(text(), ' #{str} ')]"} }

              iter.to_i.times do
                selection.present? unless dd.safe_click
                selection.safe_click
                break if dd.text_value.include str
              end

              dd.text_value
            end
          end

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
          text_field(:username, tag_name: :text_field, required: true) { {id: "username"} }
          element(:username_tooltip, required: true) { {xpath: "xpath "} }

          text_field(:password, tag_name: :text_field, required: true) { {id: "password "} }
          element(:tooltip, required: true) { {xpath: "xpath "} }

          def email
            @email ||= Fields::Email.new()
          end
# login_page.password.set ''
# login_page.username.set ''
# login_page.sign_in.click
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