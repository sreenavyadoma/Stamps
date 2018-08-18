module WhiteLabel
  class WlSDCWebsite < SdcPage

    # homepage
    page_object(:hp_left_content_hdr) { {xpath: '//h1[(contains(text(), "POSTAGE"))]'} }
    page_object(:hp_left_content_txt) { {xpath: '//h2[(contains(text(), "Print your own postage and shipping labels in seconds."))]'} }
    page_objects(:hp_click, index: 0) {{xpath: '//div[@id="click-print-mail"]/div'}}
    page_object(:hp_click_hdr) { {xpath: '//h3[(contains(text(), "CLICK"))]'} }
    page_objects(:hp_click_txt, index: 0) { {xpath: '//div[@id="click-print-mail"]/div/p'} }
    page_objects(:hp_print, index: 1) {{xpath: '//div[@id="click-print-mail"]/div'}}
    page_object(:hp_print_hdr) { {xpath: '//h3[(contains(text(), "PRINT"))]'} }
    page_objects(:hp_print_txt, index: 1) { {xpath: '//div[@id="click-print-mail"]/div/p'} }
    page_objects(:hp_mail, index: 2) {{xpath: '//div[@id="click-print-mail"]/div'}}
    page_object(:hp_mail_hdr) { {xpath: '//h3[(contains(text(), "MAIL"))]'} }
    page_objects(:hp_mail_txt, index: 2) { {xpath: '//div[@id="click-print-mail"]/div/p'} }


  end
end