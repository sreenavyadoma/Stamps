module Stamps
  module WebDev
    module StampsEndicia

        class StampsEndiciaCommon < SdcPage
          #stamps and endicia logo
          page_objs(:sdc_endicia_logos)  {{xpath: "//img[@alt='Stamps.com and Endicia']"}}
          _page_object(:sdc_endicia_logo_browser) {:sdc_endicia_logos[0]}
          _page_object(:sdc_endicia_logo_mobile) {:sdc_endicia_logos[1]}

        end

    end
  end
end