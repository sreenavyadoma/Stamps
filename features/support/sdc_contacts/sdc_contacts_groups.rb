module SdcContacts

  class ContactsToolbarGroups< SdcPage
    #page_object(:toolbar_groups) { {xpath: '//*[@id="GroupsMenu-btnInnerEl"]'} }
    #page_object(:toolbar_groups_change_groups, required: true, timeout: 20) { { xpath: '//span[@id="group-multi-selector-btn-textEl"][text()="Change Groups"]'}}
    #page_object(:toolbar_groups_add_edit_groups, required: true, timeout: 20) { { xpath: '//span[contains(@id, "control_groups_change_menu-textEl")][text()="Add/Edit Groups"]'}}
    page_object(:toolbar_groups, required: true, timeout: 20) { { xpath: '//span[contains(@id, "button-")][text()="Groups"]'}}
    page_object(:toolbar_groups_change_groups, required: true, timeout: 20) { { xpath: '//span[contains(@id, "menuitem-")][text()="Change Groups"]'}}
    page_object(:toolbar_groups_add_edit_groups, required: true, timeout: 20) { { xpath: '//span[contains(@id, "menuitem-")][text()="Add/Edit Groups"]'}}

  end

  class ContactsManageGroups < SdcPage
    page_object(:manage_groups_title, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Manage Groups"]'}}
    #page_object(:manage_groups_add_button, required: true, timeout: 10) { { xpath: '//*[@id="groups_add-btnEl"]'}}
    page_object(:manage_groups_add_button, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Manage Groups"]/following::span[text()="Add"]' } }
    page_objects(:manage_groups_table, required: true, timeout: 10) { {xpath: '//*[contains(@id,"title-")][text() = "Manage Groups"]/following::div[contains(@id,"tableview-")]//*[@class="x-grid-item-container"]//table'} }

    def group_name(row)
      #xpath_text = "//*[@id = 'multiselect-groups-grid']//*[@class='x-grid-item-container']//table[#{row}]//tbody//tr//td[2]"
      xpath_text = "//*[contains(@id,'title-')][text() = 'Manage Groups']/following::div[contains(@id,'tableview-')]//*[@class='x-grid-item-container']//table[#{row}]/tbody/tr/td"
      label = page_object(:group_text, required: true, timeout: 10){ { xpath: xpath_text }}
      label.text_value
    end
  end

  class ContactsAddGroups < SdcPage
    #page_object(:add_groups_add_group_name, tag: :span, required: true, timeout: 45 ) { { xpath: '//*span[text()="Group Name:"]'} } -
    #text_field(:add_groups_group_name_textbox, tag: :text_field) { {xpath: '//*[@id="new_group_field-inputEl"]'}
    #page_object(:add_groups_save_button, required: true, timeout: 10) { { xpath: '//*[@id="saveAddNewGroupDialogBtn-btnInnerEl"]'}}
    # page_object(:add_groups_error_message, required: true, timeout: 10) { { xpath: '//*[@id="new_group_field-errorEl"]'}}
    text_field(:add_groups_group_name_textbox, tag: :text_field) { { xpath: '//*[contains(@id,"title-")][text() = "Add Group"]//following::input[contains(@name,"textfield-")]'} }
    page_object(:add_groups_save_button, required: true, timeout: 10) { { xpath: '//*[contains(@id,"button-")][text()="Save"]' } }
    page_object(:add_groups_error_message, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Add Group"]//following::div[contains(@class,"-error-msg")]//ul'} }
    page_object(:error_message_text, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Add Group"]//following::div[contains(@class,"-error-msg")]//ul/li'} }
  end

  class ContactsChangeGroupsPopup < SdcPage
    page_object(:change_groups_title, required: true, timeout: 10) { { xpath: '//*[contains(@id,"title-")][text() = "Change Groups"]'}}
    #page_object(:change_groups_search, required: true, timeout: 10) { {xpath: '//*[@placeholder="Search Groups"]'} }
    text_field(:change_groups_search, tag: :text_field) { {xpath: '//*[@placeholder="Search Groups"]'} }
    #page_object(:change_groups_grid_body, required: true, timeout: 10) { {xpath: '//*[@id = "multiselect-groups-grid"]'} }
    page_object(:change_groups_grid_body, required: true, timeout: 10) { {xpath: '//*[contains(@id,"grid-")]'} }
    page_object(:groups_save_button, tag: :span, required: true, timeout: 45 ) { { xpath: '//span[text()="Save"]'} }
    #page_objects(:change_groups_table, required: true, timeout: 10) { {xpath: '//*[@id = "multiselect-groups-grid"]//*[@class="x-grid-item-container"]//table'} }
    page_objects(:change_groups_table, required: true, timeout: 10) { {xpath: '//*[contains(@id,"tableview-")]//*[@class="x-grid-item-container"]//table'} }

    def groups_checkbox_row_1(row)
      #contacts_scroll_into_view
      #chooser_xpath = "//*[@id = 'multiselect-groups-grid']//table[#{row}]//div[@class='x-grid-row-checker']"
      chooser_xpath = "//*[contains(@id,'group-multiselector-search-')]//*[contains(@id,'tableview-')]//table[#{row}]//div[@class='x-grid-row-checker']"
      chooser_name = "grid_chooser_#{row}"
      page_object(chooser_name) { { xpath: chooser_xpath } }
      # verify_xpath = "//*[@id = 'multiselect-groups-grid']//div[@class='x-grid-item-container']//table[#{row}]"
      verify_xpath = "//*[contains(@id,'group-multiselector-search-')]//*[contains(@id,'tableview-')]//div[@class='x-grid-item-container']//table[#{row}]"
      verify_name = "grid_verify_#{row}"
      page_object(verify_name) { { xpath: verify_xpath } }
      groups_checkbox_name = "grid_checkbox_#{row}"
      SdcPage.chooser(groups_checkbox_name, chooser_name, verify_name, :class, 'selected')
      instance_eval(groups_checkbox_name)
    end

    def group_name(row)
      #xpath_text = "//*[@id = 'multiselect-groups-grid']//*[@class='x-grid-item-container']//table[#{row}]//tbody//tr//td[2]"
      xpath_text = "//*[contains(@id,'tableview-')]//*[@class='x-grid-item-container']//table[#{row}]//tbody//tr//td[2]"
      label = page_object(:group_text, required: true, timeout: 10){ { xpath: xpath_text }}
      label.text_value
    end


  end




  class << self
    def contacts_toolbar_groups
      ContactsToolbarGroups.new
    end

    def contacts_manage_groups
      ContactsManageGroups.new
    end

    def contacts_add_groups
      ContactsAddGroups.new
    end
    def contacts_popup_groups
      ContactsChangeGroupsPopup.new
    end

  end
end
