Then /^On Left Navigation menu search contact (.*)$/ do |str|
  SdcContacts.contacts_left_navigation_panel.search_contacts.set(str)
  SdcContacts.contacts_left_navigation_panel.search_icon.click
  end

  Then /^aloha[Ss]et Filter Panel Search textbox to (.*)$/ do |str|
    TestData.hash[:filter_panel_search_str] = str
    SdcOrders.filter_panel.search_orders.set(TestData.hash[:filter_panel_search_str])
  end

  Then /^aloha[Cc]lick Filter Panel Search [Bb]utton$/ do
    SdcOrders.filter_panel.search.safe_wait_while_present(timeout: 2)
    SdcOrders.filter_panel.search.click
    end
