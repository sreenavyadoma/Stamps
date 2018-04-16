module Stamps
  module WebDev
    module StampsEndicia

      class PasswordResetPage < SdcPage
        #sdcEndica content
        page_obj(:header, required: true) {{xpath: "//h1['Password Reset']"}}
        page_obj(:sdc_endicia_logo_browser, required: true)
      end

    end
  end
end