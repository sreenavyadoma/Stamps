module Stamps
  module WebDev
    module Portals
      module StampsEndicia
        class LoginPage < SdcPageObject
            text_field(:email, tag_name: :text_field, required: true) { {id: "email"} }
            element(:email_tooltip, required: true) { {xpath: "xpath "} }
            element(:email_label, required: true) { {xpath: " //*[@id='email']/div/div/div/label"} }

            text_field(:password, tag_name: :text_field, required: true) { {id: "password "} }
            element(:password_tooltip, required: true) { {xpath: "xpath "} }

            button(:log_in, required: true) { {xpath: "xpath "} }

            link(:forgot_pw, required: true) {{id: "forgotpassword"}}
            element(:forgot_pw_tooltip, required: true) { {xpath: "xpath "} }


            element(:dd, tag_name: :text_field, required: true) { {id: "usageType"} }

            # Business Use - Mostly mailing (letters/postcards/flats)
            def select(str, iter: 3)
              # create the drop-down element
              self.class.element(:selection) { {xpath: "//span[contains(text(), ' #{str} ')]"} }

              iter.to_i.times do
                dd.safe_click unless selection.present?
                selection.safe_click
                break if dd.text_value.include str
              end

              dd.text_value
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