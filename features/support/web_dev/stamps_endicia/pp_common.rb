  module PartnerPortal
    class Common < SdcPage
      page_objects(:sdc_endicia_logo_browser, index: 0)  { {xpath: "//img[@alt='Stamps.com and Endicia']"} }
      page_objects(:sdc_endicia_logo_mobile, index: 1)  { {xpath: "//img[@alt='Stamps.com and Endicia']"} }
    end

  end
