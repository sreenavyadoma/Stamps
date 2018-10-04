module SdcContacts

  class ContactsToolbar < SdcPage
    #page_object(:toolbar){{xpath: '//*[contains(@class,"x-toolbar sdc-toolbar")]'}}
    page_object(:add, tag: :span, required: true, timeout: 45) { {xpath: '//span[text()="Add"]'} }
    page_object(:delete) { {xpath: '//*[@id="deleteContactToolBarBtn-btnInnerEl"]'} }
    page_object(:print_postage) { {xpath: '//*[text()="Print Postage"]'} }
    page_object(:groups) { {xpath: '//*[@id="GroupsMenu-btnInnerEl"]'}}
    page_object(:cost_codes) { {xpath: '//*[@id="CostCodesMenu-btnInnerEl"]'} }
    page_object(:ref){{xpath: '//span[@id="toolBarReferenceBtn-btnInnerEl"]'}}
    page_object(:move) { {xpath: '//*[@id="toolBarReferenceBtn-btnIconEl"]'} }
    page_object(:import) { {xpath: '//*[contains(@class, "sdc-icon-import")]'} }
    page_object(:export) { {xpath: '//*[contains(@class, "sdc-icon-export")]'} }
    page_object(:feedback) { {xpath: '//*[contains(@class, "sdc-icon-feedback")]'} }
    page_object(:settings) { {id: 'settingsButton-btnWrap'} }

  end

  class ContactsToolbarCostCodes< SdcPage
    #page_object(:toolbar){{xpath: '//*[contains(@class,"x-toolbar sdc-toolbar")]'}}
    #page_object(:cost_codes) { {xpath: '//*[@id="CostCodesMenu"]'} } ID Chnages
    page_object(:cost_codes) { {xpath: '//*[contains(@id,"button-")][text()="Cost Codes"]'} }
    page_object(:cost_codes_change_costcode, required: true, timeout: 10) { { xpath: '//span[text()="Change Cost Code"]'}}
    page_object(:cost_codes_add_edit_costcode, required: true, timeout: 10) { { xpath: '//span[text()="Add/Edit Cost Codes"]'}}
  end


  class << self
    def contacts_toolbar
      ContactsToolbar.new
    end

    def contacts_delete_message_box
      DeleteContactMessageBox.new
    end

    def contacts_toolbar_cost_codes
      ContactsToolbarCostCodes.new
    end

    def contacts_popup_cost_code
      ContactsPopupCostCode.new
    end

    def contact_toolbar_settings
      ContactsToolSettings.new
    end
  end

end