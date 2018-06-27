module SdcMail

  class SdcMailToolbar < SdcPage
    page_object(:settings) { {xpath: '//*[contains(@class, "sdc-icon-settings")]'} }
    page_object(:print) { {xpath: '//*[contains(@class, "sdc-icon-print")]'} }
    page_object(:reset) { {xpath: '//*[contains(@class, "sdc-icon-reset")]'} }
    page_object(:feedback) { {xpath: '//*[contains(@class, "sdc-icon-feedback")]'} }
    page_object(:favorites) { {xpath: '//*[text()="Favorites"]'} }
  end

end
