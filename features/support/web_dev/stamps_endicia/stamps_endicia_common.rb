module Stamps
  module WebDev
    module StampsEndicia
      module PartnerPortal
        class StampsEndiciaCommon < SdcPage
          #stamps and endicia logo
          page_objs(:sdc_endicia_logos)  {{xpath: "//img[@alt='Stamps.com and Endicia']"}}
          page_obj(:sdc_endicia_logo_browser) {:sdc_endicia_logos[0]}
          page_obj(:sdc_endicia_logo_mobile) {:sdc_endicia_logos[1]}
        end
      end
    end
  end
end