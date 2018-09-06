module SdcContacts
  class ContactsDetailsPanel < SdcPage
    page_object(:contacts_detail_panel, required: true, timeout:20){{xpath: '//*[@id="contactDetailsPanel"]'}}
    page_object(:title, required: true, timeout: 20) { { xpath: '//label[contains(@class, "panel-header-text")]' } }
    #Name Fields
    page_object(:name, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="Name-inputEl"]' } }
    page_object(:name_expand,  required: true, timeout: 10) { { xpath: '//*[@id="Name-labelEl"][contains(@class, "nmExpandable" )]' } }
    page_object(:name_collapse,  required: true, timeout: 10) { { xpath: '//*[@id="Name-labelEl"][contains(@class, "nmCollapsible" )]' } }

    page_object(:first_name, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="FirstName-inputEl"]' } }
    page_object(:error_first_name,  required: true, timeout: 10){{xpath: '//*[@id="FirstName-errorEl"]'} }

    page_object(:middle_name, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="MiddleName-inputEl"]' } }
    page_object(:error_middle_name,  required: true, timeout: 10){{xpath: '//*[@id="MiddleName-errorEl"]'} }

    page_object(:last_name, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="LastName-inputEl"]' } }
    page_object(:error_last_name,  required: true, timeout: 10){{xpath: '//*[@id="LastName-errorEl"]'} }

    page_object(:name_suffix, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="Suffix-inputEl"]' } }
    page_object(:error_suffix,  required: true, timeout: 10){{xpath: '//*[@id="Suffix-errorEl"]'} }

    #Company Fields
    page_object(:company, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="Company-inputEl"]' } }
    page_object(:company_expand,  required: true, timeout: 10) { { xpath: '//*[@id="Company-labelEl"][contains(@class, "cmpnyExpandable " )]' } }
    page_object(:company_collapse,  required: true, timeout: 10) { { xpath: '//*[@id="Company-labelEl"][contains(@class, "cmpnyCollapsible" )]' } }

    page_object(:department, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="Department-inputEl"]' } }
    page_object(:error_department,  required: true, timeout: 10){{xpath: '//*[@id="Department-errorEl"]'} }

    page_object(:title, tag: :text_field,  required: true, timeout: 10) { { xpath: '//*[@id="Title-inputEl"]' } }
    page_object(:error_title,  required: true, timeout: 10){{xpath: '//*[@id="Title-errorEl"]'} }

    page_object(:street_address, required: true, timeout: 20) { { xpath: '//*[@id="StreetAddress-inputEl"]' } }
    page_object(:city, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="City-inputEl"]' } }
    #page_object(:state, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="stateContactDetailsCmb-inputEl"]' } }
    page_object(:province, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="Province-inputEl"]'} }
    page_object(:postal_code, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="PostalCode-inputEl"]' } }
    page_object(:email, tag: :text_field, required: true, timeout: 20) { { xpath: '//*[@id="Email-inputEl"]' } }
    #text_field(:email){ { xpath: '//*(@id="Email-inputEl")]' } }
    page_object(:phone, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="Phone-inputEl"]' } }
    page_object(:phone_ext, tag: :text_field,  required: true, timeout: 20){ { xpath: '//*[@id="PhoneExt-inputEl"]' } }
   # page_object(:groups , tag: :text_field, required: true, timeout: 20){ { xpath: '//*[@id="groupsContactDetailsCmb-listWrapper"]' } }
    page_object(:reference_number , tag: :text_field, required: true, timeout: 20) { { xpath: '//*[@id="ReferenceNumber-inputEl"]' } }

    #def expand_collapsed_panel
      page_object(:expand_button, required: true, timeout: 20) { { xpath: '//*[@class="x-tool-img x-tool-expand-left"]'}}
    #end

  end

  class ContactsDetailsToolBarMenu < SdcPage
    #page_object(:menu_button, required: true, timeout: 20) { { xpath: '//a[contains(@class, "x-btn toolbar-menu")]' } }
    page_object(:menu_button, required: true, timeout: 10) { { xpath: '//div[@id="contactDetailsPanel_header-innerCt"]//a'}}
    page_object(:menu_print_postage, required: true, timeout: 10) { { xpath: '//span[contains(@id, "menuitem-")][text()="Print Postage"]'}}
    page_object(:menu_delete, required: true, timeout: 10) { { xpath: '//span[contains(@id, "menuitem-")][text()="Delete"]'}}
    page_object(:menu_collapse_panel, required: true, timeout: 10) { { xpath: '//span[contains(@id, "menuitem-")][text()="Collapse Panel"]'}}
  end

  class ContactsNamePrefix < SdcPage
    text_field(:prefix_text_field, tag: :text_field) { { xpath: '//*[@id="Prefix-inputEl"]' } }
    page_object(:prefix_drop_down) { { xpath: '//*[@id="Prefix-trigger-picker"]' } }

    def prefix_selection(name: 'selection', value: 'None')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end

  end

  class ContactsCountry < SdcPage

    text_field(:text_field, tag: :text_field) { { xpath: '//input[contains(@id, "countryContactDetailsCmb")]' } }
    page_object(:drop_down) { { xpath: '//*[contains(@id, "countryContactDetailsCmb")][contains(@class, "arrow")]' } }

    def selection_country(name: 'selection', value: 'None')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end

  end

  class ContactsState < SdcPage

    text_field(:text_field, tag: :text_field) { { xpath: '//input[contains(@id, "stateContactDetailsCmb")]' } }
    page_object(:drop_down) { { xpath: '//*[contains(@id, "stateContactDetailsCmb")][contains(@class, "arrow")]' } }

    def selection_state(name: 'selection', value: 'None')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end

  end

  class ContactsGroup < SdcPage

    text_field(:text_field, tag: :text_field) { { xpath: '//input[contains(@id, "groupsContactDetailsCmb")]' } }
    text_field(:text_list, tag: :text_field) { { xpath: '//input[contains(@id, "groupsContactDetailsCmb-itemList")]' } }
    page_object(:drop_down) { { xpath: '//*[contains(@id, "groupsContactDetailsCmb")][contains(@class, "arrow")]' } }

    def selection_group(name: 'selection', value: 'None')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end

  end

  class ContactsCostCode < SdcPage

    text_field(:text_field, tag: :text_field) { { xpath: '//input[contains(@id, "costCodesContactDetailsCmb")]' } }
    page_object(:drop_down) { { xpath: '//*[contains(@id, "costCodesContactDetailsCmb")][contains(@class, "arrow")]' } }

    def selection_costcode(name: 'selection', value: 'None')
      page_object(name) { { xpath: "//li[text()='#{value}']" } }
    end

  end

  class ContactsEmailErrorMessage < SdcPage
    page_object(:email_error,  required: true, timeout: 20){{xpath: '//*[@id="Email-errorEl"]//ul'}}
    page_object(:email_error_message){{xpath: '//div[@id="Email-errorEl"]//li'}}
  end

end