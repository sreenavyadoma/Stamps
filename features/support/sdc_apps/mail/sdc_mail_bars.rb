module SdcMail
  class SdcMailToolbar < SdcPage
    page_object(:print) { {xpath: '//*[contains(@class, "sdc-icon-print")]'} }
    page_object(:print_dropdown) { {xpath: '(//*[contains(@class, "x-btn-arrow-right")])[1]'} }
    page_object(:print_label) { {xpath: '//*[text()="Print Label"][contains(@id, "menuitem")]'} }
    page_object(:print_sample) { {xpath: '//*[text()="Print Sample"][contains(@id, "menuitem")]'} }

    page_object(:favorites) { {xpath: '//span[text()="Favorites"]'} }
    page_object(:save_as_favorite) { {xpath: '//*[text()="Save as Favorite"]'} }
    page_object(:manage_favorites) { {xpath: '//*[text()="Manage Favorites"]'} }

    page_object(:reset) { {xpath: '//*[contains(@class, "sdc-icon-reset")]'} }
    page_object(:feedback) { {xpath: '//*[contains(@class, "sdc-icon-feedback")]'} }
    page_object(:settings) { {xpath: '//*[contains(@class, "sdc-icon-settings")]'} }
  end

  class SdcMailStatusbar < SdcPage
    page_object(:total) { {xpath: '//*[contains(text(), "Total: $")]'} }
    page_object(:print) { {xpath: '(//*[contains(@class, "toolbar-background-color")]//a)[2]'} }
    page_object(:print_sample) { {xpath: '//*[text()="Print Sample"][contains(@id, "button")]'} }
  end
end