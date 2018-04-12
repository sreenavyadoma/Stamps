module Stamps
  module WebDev
    module Portals
      class DashboardPage < SdcPageObject

        element(:dashboard_page_header, required: true) {{xpath: "//h1['Welcome to USPS Portal']"}}

      end

    end
  end
end