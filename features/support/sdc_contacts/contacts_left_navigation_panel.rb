module SdcContacts
  class ContactsLeftNavigation < SdcPage
    text_field(:search_contacts, tag: :text_field) { {xpath: '//*[@placeholder="Search Contacts"]'} }
    page_object(:search_icon) { {xpath: '//*[contains(@class, "search-trigger-grey")]'} }
    link(:search_bar) { {xpath: '//*[@placeholder="Search Orders"]'} }
    link(:shipped) { {xpath: '//*[text()="Shipped"]'} }
    link(:canceled) { {xpath: '//*[text()="Canceled"]'} }
    link(:on_hold) { {xpath: '//*[text()="On Hold"]'} }
    link(:collapse) { {xpath: '//*[contains(@class, "sdc-icon-collapse")]'} }
    link(:expand) { {xpath: '//*[contains(@class, "expand")]'} }
  end
end