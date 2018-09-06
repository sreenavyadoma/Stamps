module SdcContacts
  class ContactsLeftNavigation < SdcPage
    text_field(:search_contacts, tag: :text_field) { {xpath: '//*[@placeholder="Search Contacts"]'} }
    page_object(:search_icon) { {xpath: '//*[contains(@class, "search-trigger-grey")]'} }

    link(:search_bar) { {xpath: '//*[@placeholder="Search Orders"]'} }
    link(:groups) { {xpath: '//*[text()="Groups"]'} }
    link(:cost_codes) { {xpath: '//*[text()="Cost Codes"]'} }
    link(:collapse) { {xpath: '//*[contains(@class, "sdc-icon-collapse")]'} }
    link(:expand) { {xpath: '//*[contains(@class, "expand-right")]'} }
  end
  class SearchResults < SdcPage
    page_object(:results){{xpath: '//*[@id="total_search_result"]'}}
    page_object(:search_results_count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-widget")]//div[@class="sdc-badge"])'} }
    page_object(:search_results_text) { {xpath: '(//*[contains(@class, "sdc-badgebutton-text")])'} }
    page_object(:search_results_remove) { {xpath: '//*[contains(@class, "sdc-icon-remove")]'} }
  end

  class LeftNavigationGroups <SdcPage
    #yet to code
  end

  class LeftNavigationCostCodes <SdcPage
    #yet to code
  end



end