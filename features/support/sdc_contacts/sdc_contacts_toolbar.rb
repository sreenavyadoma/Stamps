module SdcContacts

  class ContactsToolbar < SdcPage
    #page_object(:toolbar){{xpath: '//*[contains(@class,"x-toolbar sdc-toolbar")]'}}
    page_object(:add, tag: :span, required: true, timeout: 45) { {xpath: '//span[text()="Add"]'} }
    page_object(:delete) { {xpath: '//*[@id="deleteContactToolBarBtn-btnInnerEl"]'} }
    page_object(:print_postage) { {xpath: '//*[@id="printPostageToolBar-btnInnerEl"]'} }
    page_object(:groups) { {xpath: '//*[@id="GroupsMenu-btnInnerEl"]'}}
    page_object(:cost_codes) { {xpath: '//*[@id="CostCodesMenu-btnInnerEl"]'} }
    page_object(:ref){{xpath: '//span[@id="toolBarReferenceBtn-btnInnerEl"]'}}
    page_object(:move) { {xpath: '//*[@id="toolBarReferenceBtn-btnIconEl"]'} }
    page_object(:import) { {xpath: '//*[contains(@class, "sdc-icon-import")]'} }
    page_object(:export) { {xpath: '//*[contains(@class, "sdc-icon-export")]'} }
    page_object(:feedback) { {xpath: '//*[contains(@class, "sdc-icon-feedback")]'} }
    page_object(:settings) { {id: 'settingsButton-btnWrap'} }

  end

  class ContactsToolSettings< SdcPage
    #page_object(:menu_button, required: true, timeout: 20) { { xpath: '//a[contains(@class, "x-btn toolbar-menu")]' } }
    page_object(:settings_button, required: true, timeout: 10) { { xpath: '//span[contains(@class, "sdc-icon-settings")]'}}
    page_object(:settings_columns, required: true, timeout: 10) { { xpath: '//span[contains(@id, "menuitem-")][text()="Columns"]'}}
    page_object(:settings_freeze_columns,required: true, timeout: 10) { { xpath: '//span[contains(@id, "menuitem-")][text()="Freeze Columns"]'}}
    page_object(:column_list_name){ {xpath:'//div[contains(@id,"menucheckitem")][text()="Name"]'} }
  end

  class ContactsToolbarCostCodes< SdcPage
    #page_object(:toolbar){{xpath: '//*[contains(@class,"x-toolbar sdc-toolbar")]'}}
    page_object(:cost_codes) { {xpath: '//*[@id="CostCodesMenu-btnInnerEl"]'} }
    page_object(:cost_codes_changecostcode, required: true, timeout: 10) { { xpath: '//span[contains(@id, "cost-codes-multi-selector-btn-textEl")][text()="Change Cost Code"]'}}
    page_object(:cost_codes_addeditcostcode, required: true, timeout: 10) { { xpath: '//span[contains(@id, "add-edit-cost-code-item-textEl")][text()="Add/Edit Cost Codes"]'}}
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