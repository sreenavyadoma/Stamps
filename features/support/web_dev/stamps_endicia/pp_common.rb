  module PartnerPortal
    class Common < SdcPage
      page_object(:global_header) { {xpath: "//header"} }

      #stamps endicia logo
      page_objects(:sdc_endicia_logo_mobile, index: 0)  { {xpath: "//img[@alt='Stamps.com Endicia | Partner Portal logo']"} }
      page_objects(:sdc_endicia_logo_browser, index: 1)  { {xpath: "//img[@alt='Stamps.com Endicia | Partner Portal logo']"} }

      #Partner Portal logo
      page_object(:partner_portal_logo)  { {xpath:  "//h3[contains(text(), 'Partner Portal')]"} }

    end

  end
