module SdcContacts

  class ContactsToolbar < SdcPage
    #page_object(:toolbar){{xpath: '//*[contains(@class,"x-toolbar sdc-toolbar")]'}}
    page_object(:add, tag: :span, required: true, timeout: 45) { {xpath: '//span[text()="Add"]'} }
    page_object(:delete) { {xpath: '//*[@id="deleteContactToolBarBtn-btnInnerEl"]'} }
    page_object(:print_postage) { {xpath: '//*[@id="printPostageToolBar-btnInnerEl"]'} }
    page_object(:groups) { {xpath: '//*[@id="GroupsMenu-btnInnerEl"]'}}
    page_object(:cost_codes) { {xpath: '//*[@id="CostCodesMenu-btnInnerEl"]'} }
    page_object(:move) { {xpath: '//*[@id="toolBarReferenceBtn-btnIconEl"]'} }
    page_object(:import) { {xpath: '//*[contains(@class, "sdc-icon-import")]'} }
    page_object(:export) { {xpath: '//*[contains(@class, "sdc-icon-export")]'} }
    page_object(:feedback) { {xpath: '//*[contains(@class, "sdc-icon-feedback")]'} }
    page_object(:settings) { {id: 'settingsButton-btnWrap'} }
  end

end