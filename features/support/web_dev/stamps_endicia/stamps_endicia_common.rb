module Stamps
  module StampsEndicia
    class Common < SdcPage
      #stamps and endicia logo
      page_objs(:sdc_endicia_logos)  {{xpath: "//img[@alt='Stamps.com and Endicia']"}}
      page_objs_index(:sdc_endicia_logo_browser, index: 0) {:sdc_endicia_logos}
      page_objs_index(:sdc_endicia_logo_mobile, index: 0) {:sdc_endicia_logos}
    end

  end
end