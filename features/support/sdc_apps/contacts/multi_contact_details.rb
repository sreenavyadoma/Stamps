module SdcContacts
  module MultiContactDetails
    class Panel < SdcPage
      page_object(:menu_button, required: true, timeout: 10) { { xpath: '//div[contains(@id,"multicontactdetails")]/a[contains(@class,"x-btn-after-title")]'}}
    end


  end
end