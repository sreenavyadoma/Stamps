module Stamps
  module WebDev
    module Portals
      class DashboardPage < SdcPageObject

        #welcome header
        element(:header) {{xpath: "//h1['Welcome to USPS Portal']"}}

        #stamps and endicia logo
        elements(:sdc_endicia_logos)  {{xpath: "//img[@alt='Stamps.com and Endicia']"}}
        _element(:sdc_endicia_logo_browser) {:sdc_endicia_logos[0]}
        _element(:sdc_endicia_logo_mobile) {:sdc_endicia_logos[1]}

        #hamburger button
        button(:hamburger, required: true) {{class: "navbar-toggle collapsed"}}

      end

    end
  end
end