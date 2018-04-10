module Stamps
  module WebDev
    module Portals
      class LoginPage < SdcPageObject
        text_field(:email, tag_name: :text_field, required: true) { {id: "email"} }
        element(:email_tooltip, required: true) { {xpath: "//*[@id='email']//span"} }

        label(:email_label, required: true) { {xpath: "//*[@id='email']/div/div/div/label"} }

        text_field(:password, tag_name: :text_field, required: true) { {id: "password"} }
        element(:password_tooltip, required: true) { {xpath: "xpath"} }
        label(:password_label, required: true) { {xpath: "//*[@id='accountinfo']/div/div[2]/div/label"} }

        button(:log_in, required: true) { {id: "next"} }

        link(:forgot_pw, required: true) {{id: "forgotpassword"}}
        element(:forgot_pw_tooltip, required: true) { {xpath: "xpath"} }


       # element(:dd_survey, required: true) { {id: "usageType"} }
        element(:dd_survey) { {xpath: "//*[@id='survey']/div[1]"} }
        element(:dd) { {xpath: "//span[contains(text(), 'Mostly shipping')]"} }


       #element(:checkbox) { {xpath: "//*[@id='optIn']"} }
        elements(:checkboxes) { {xpath: "//*[@id='optIn']"} }

        element(:checkbox_header) { {xpath: "//*[@id='optInDiv']/h3"} }

        element(:promo_link) {{id: "showPromoCode"}}
        _element(:checkbox) { checkboxes[1] }

        # Business Use - Mostly mailing (letters/postcards/flats)
        # def select
        #   # create the drop-down element
        #   element(:choice) { {xpath: "//span[contains(text(), 'Mostly shipping')]"} }
        #  # choice.safe_click
        #   # iter.to_i.times do
        #   #   dd_survey.safe_click unless selection.present?
        #   #   selection.safe_click
        #   #   break if dd.text_value.include str
        #   # end
        #
        #   #dd.text_value
        # end
       #
       def survey
         self.class.element(:dd) { {xpath: "//span[contains(text(), 'Mostly shipping')]"} }
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