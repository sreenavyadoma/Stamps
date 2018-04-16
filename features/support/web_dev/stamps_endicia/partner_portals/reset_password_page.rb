module Stamps
  module WebDev
    module StampsEndicia
      module PartnerPortal
        class PasswordResetPage < SdcPage
          #sdcEndica content
          element(:header, required: true) {{xpath: "//h1['Password Reset']"}}
          element(:sdc_endicia_logo_browser, required: true)
        end
      end
    end
  end
end