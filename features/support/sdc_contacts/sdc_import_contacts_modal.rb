module SdcContacts

class ContactsImport <SdcPage
  page_object(:window){{xpath: '//div[@id="iFrameHolderIdParent_header"]'}}
  page_object(:header){{xpath: '//*//*[contains(@class,"x-window-header-title")]//div[text()="Import Contacts"]'}}
  page_object(:close_icon){{xpath: '//*[contains(@class,"sdc-icon-mobile-close-light")]'}}

  page_object(:body_iframe){{xpath:'//div[@id="iFrameHolderIdParent-body"]/iframe'}}
  page_object(:select_file_button){{xpath:'//span(text()="Select a CSV File")'}}

  def file_has_header()
    page_object(:chooser){{xpath:'xxxxxxxx'}}
    page_object(:verify){{xpath:'xxxxxxxx'}}
    checkbox('file_has_header_checkbox',:chooser,:verify,:class,"selected")
  end

    page_object(:group_drop_down){ { xpath: '//select[@id="mapTemplate"]' } }

  def group_drop_down_option(str)
        page_object(:group_selected){{xpath:"//select[@id='mapTemplate']/option[contains(text(),'#{str}')]" }}
  end



   def import_contacts_iframe
     '//div[@id="iFrameHolderIdParent-body"]/iframe'
   end
  #
   def import_contacts_iframe_elements
     import_contacts_iframe.span(text: "Select a CSV File")
      #page_object(:select_file_button){{xpath:'//span(text()="Select a CSV File")'}}
  end

end

  class << self

   def contacts_import
      ContactsImport.new
    end
  end
end