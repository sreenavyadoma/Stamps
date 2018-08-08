module SdcContacts
  class ContactsDetailsPanel < SdcPage
    page_object(:title, required: true, timeout: 20) { { xpath: '//label[contains(@class, "panel-header-text")]' } }
    page_object(:name, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="Name-inputEl"]' } }
    page_object(:company, tag: :text_field,  required: true, timeout: 20) { { xpath: '//*[@id="Company-inputEl"]' } }
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
#on_blur
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
    page_object(:email_error,  required: true, timeout: 20){{xpath: '//*[@id="Email-errorEl"]'}}
  end

end