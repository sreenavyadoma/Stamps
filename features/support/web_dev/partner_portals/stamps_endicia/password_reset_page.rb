module Stamps
  module WebDev
    module Portals
      class PasswordResetPage < SdcPageObject
        #sdcEndica content
        element(:password_reset_header, required: true) {{xpath: "//h1['Password Reset']"}}
      end
    end
  end
end