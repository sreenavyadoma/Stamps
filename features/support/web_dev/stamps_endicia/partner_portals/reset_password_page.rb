module Stamps
  module WebDev
    module StampsEndicia

      class ResetPasswordPage < SdcPage
        #sdcEndica content
        page_obj(:header, required: true) {{xpath: "//h1['Password Reset']"}}

      end

    end
  end
end