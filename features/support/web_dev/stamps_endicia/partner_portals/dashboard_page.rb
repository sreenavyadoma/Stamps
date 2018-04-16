module Stamps
  module WebDev
    module StampsEndicia

      class DashboardPage < SdcPage
        #welcome header
        page_obj(:header) {{xpath: "//h1['Welcome to USPS Portal']"}}

        #hamburger button
        button(:hamburger, required: true) {{class: "navbar-toggle collapsed"}}

        #x button
        button(:x, required: true) {{class: "xxx"}}
      end

    end
  end
end