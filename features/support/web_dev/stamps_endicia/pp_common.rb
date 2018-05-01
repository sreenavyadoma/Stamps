  module PartnerPortal
    class Common < SdcPage
      page_objects(:sdc_endicia_logo_browser, index: 1)  { {xpath: "//img[@alt='Stamps.com Endicia | Partner Portal logo']"} }
      page_objects(:sdc_endicia_logo_mobile, index: 0)  { {xpath: "//img[@alt='Stamps.com Endicia | Partner Portal logo']"} }
    end

  end
