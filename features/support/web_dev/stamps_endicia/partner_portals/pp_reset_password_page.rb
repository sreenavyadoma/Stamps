module Stamps
  module WebDev
    module StampsEndicia

      class PPResetPasswordPage < SdcPage
        #sdcEndica content
        page_obj(:header) {{xpath: "//h1['Password Reset']"}}

        #Email
        text_field(:email, tag: :text_field, required: true) {{xpath: "//input[@name='email']"}}

        #submit
        button(:submit) {{xpath: "//button[@label='Submit']/span" }}

        #password Reset text
        page_objs(:p_content) {{xpath: "//p"}}
        page_objs_index(:text, index: 0) {:p_content}

      end

    end
  end
end