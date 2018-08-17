module WhiteLabel
  class WlSDCWebsite < SdcPage

    page_object(:hp_left_content_hdr) { {xpath: '//li[@id="breadcrumb_Profile"]/span'} }


  end
end