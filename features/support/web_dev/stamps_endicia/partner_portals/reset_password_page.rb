module Stamps
  module WebDev
    module StampsEndicia

      class ResetPasswordPage < SdcPage
        #sdcEndica content
        page_obj(:header) {{xpath: "//h1['Password Reset']"}}

        #Email
        text_field(:email, tag: :text_field, required: true) {{xpath: "//input[@name='email']"}}

        #submit
        button(:submit) {{xpath: "//button[@label='Submit']/span" }}



      end

    end
  end
end