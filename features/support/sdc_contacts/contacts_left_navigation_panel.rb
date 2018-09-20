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

  class LeftNavigationSelected <SdcPage
    #page_object(:selected){{xpath: '//*[@id=""]'}}
    #page_object(:selected_count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-widget")]//div[@class="sdc-badge"])'} }
    #page_object(:selected_text) { {xpath: '(//*[contains(@class, "sdc-badgebutton-text")])'} }
    page_object(:selected) { {xpath: '(//*[contains(@class, "sdc-badgebutton sdc-badgebutton-first")])[2]'}}
    page_object(:selected_count) { {xpath: '(//*[contains(@class, "sdc-badgebutton-widget")]//div[contains(@class, "sdc-badge")])[2]'} }
    page_object(:label) { {xpath: '(//*[contains(@class, "sdc-badgebutton-text")])[2]'} }
  end

  class LeftNavigationAllContacts <SdcPage
    page_object(:all_contacts){{xpath: '//*[@id="total_contacts"]'}}
    page_object(:all_contacts_count) { {xpath: '(//*[@id="total_contacts"]//div[contains(@class, "sdc-badgebutton-widget")]//div[@class="sdc-badge"])'} }
    page_object(:all_contacts_text) { {xpath: '([@id="total_contacts"]//div[contains(@class, "sdc-badgebutton-text")])'} }
  end

  class LeftNavigationGroups <SdcPage
    #yet to code
  end

  class LeftNavigationCostCodes <SdcPage
    page_object(:cost_codes_expand_button,required: true, timeout: 45 ) { { xpath: '//*[@id="left_nav_costcodes_fieldset"]//*[@class="x-tool-img x-tool-expand-bottom"]'} }
    page_object(:cost_codes_results_count) { {xpath: '(//*[@id="left_nav_costcodes_fieldset"]//div[@class="sdc-badge"])'} }
    page_object(:cost_codes_results_text) { {xpath: '(//*[@id="left_nav_costcodes_fieldset"]//div[@class="table-cell-inner sdc-badgebutton-text"])'} }
    page_objects(:total_costcodes) { {xpath: '(//*[@id="left_nav_costcodes_fieldset-targetEl"]//table[@class="sdc-badgebutton x-box-item sdc-badgebutton-default"])'} }

    #chooser_xpath_value = "//*[@id='left_nav_costcodes_fieldset-targetEl']//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']"


    def cost_code_name(position)
      xpath_text = "(//*[@id='left_nav_costcodes_fieldset-targetEl']//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[1]/div[@class='table-cell-inner sdc-badgebutton-text'])[#{position}]"
      #chooser_xpath_value = "(//*[@id='left_nav_costcodes_fieldset-targetEl']//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[1]/div[@class, 'table-cell-inner sdc-badgebutton-widget])[#{row}]"
      label = page_object(:cost_code_text, required: true, timeout: 10){ { xpath: xpath_text }}
      label.text_value
    end

    def cost_code_count(row)
      xpath_count = "(//*[@id='left_nav_costcodes_fieldset-targetEl']//table[@class='sdc-badgebutton x-box-item sdc-badgebutton-default']//tr/td[2]/div[@class='table-cell-inner sdc-badgebutton-widget'])[#{row}]"
      value = page_object(:cost_codes_value, required: true, timeout: 10){ { xpath: xpath_count }}
      value.text_value
    end

  end

  class << self
    def contacts_left_navigation_panel
      ContactsLeftNavigation.new
    end

    def contacts_left_navigation_search_results
      SearchResults.new
    end

    def contacts_left_navigation_selected_contacts
      LeftNavigationSelected.new
    end

    def contacts_left_navigation_all_contacts
      LeftNavigationAllContacts.new
    end

    def contacts_left_nav_cost_code
      LeftNavigationCostCodes.new
    end

  end


end