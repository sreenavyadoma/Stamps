module Stamps
  module WebDev
    module StampsEndicia
      module PartnerPortal
        class PasswordResetPage < SdcPageObject
          #sdcEndica content
          element(:header, required: true) {{xpath: "//h1['Password Reset']"}}
        end
      end
    end
  end
end