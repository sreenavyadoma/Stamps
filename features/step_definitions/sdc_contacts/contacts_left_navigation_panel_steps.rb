Then /^search for contact (.*) from the contacts left navigation filter$/ do |str|
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.contacts_detail_panel.safe_wait_until_present(timeout: 15)
  if str=='newly added'
    value ||= TestData.hash[:full_name]
    step "set search text on contacts filter panel to #{value}"
  else
    step "set search text on contacts filter panel to #{str}"
  end

  step "click search button on contacts filter panel search button"

  SdcContacts.loading_contacts.safe_wait_until_present(timeout: 15)
  SdcContacts.contacts_body.safe_wait_until_present(timeout: 15)
  SdcContacts.contacts_left_navigation_search_results.results.safe_wait_until_present(timeout:30)
end

  Then /^[Dd]elete [Aa]ll [Aa]vailable [Cc]ontacts [Ww]ith [Tt]he [Vv]alue (.*)$/ do |str|
    step "on left navigation menu search contact #{str}"
    search_results= SdcContacts.contacts_left_navigation_search_results
    actual_count =search_results.search_results_count.text_value
    if actual_count.to_i != 0
      i=1
      while i<= actual_count.to_i
        step "in contacts grid check row #{i}"
        i=i+1
      end
      step "click contacts toolbar delete button"
      step "delete contacts message box click on yes button"
      #p 'actual :' + actual_count
      new_count =search_results.search_results_count.text_value
      #p 'new_count :' + new_count
      expect(new_count== '0').to be (true)
    end
  end

  Then /^set search text on contacts filter panel to (.*)$/ do |str|
    contacts_left_navigation= SdcContacts.contacts_left_navigation_panel
    contacts_left_navigation.search_contacts.safe_wait_until_present(timeout: 15)
    contacts_left_navigation.search_contacts.set(str)
  end

  Then /^click search button on contacts filter panel search button$/ do
    contacts_left_navigation= SdcContacts.contacts_left_navigation_panel
    contacts_left_navigation.search_icon.safe_wait_until_present(timeout: 15)
    contacts_left_navigation.search_icon.click
  end

  Then /^[Ee]xpect [Cc]ount [Oo]f [Cc]ontact [Ss]earch [Rr]esults [Ii]s (.*)$/ do |count|
    search_results= SdcContacts.contacts_left_navigation_search_results
    actual_count =search_results.search_results_count.text_value
    expect(actual_count==count).to be (true)
  end

Then /^[Cc]lose [Tt]he [Ss]earch [Rr]esults [Bb]y [Cc]licking [Oo]n [Rr]emove [Bb]utton$/ do
    search_results= SdcContacts.contacts_left_navigation_search_results
    search_results.search_results_remove.safe_wait_until_present(timeout: 15)
    search_results.search_results_remove.click
end

Then /^click on expand button of contacts left navigation$/ do
  left_navigation = SdcContacts.contacts_left_navigation_panel
  left_navigation.expand.safe_wait_until_present(timeout: 15)
  left_navigation.expand.click
  expect(left_navigation.collapse.present?).to be(true)
end

Then /^click on collapse button of contacts left navigation$/ do
  left_navigation = SdcContacts.contacts_left_navigation_panel
  left_navigation.collapse.safe_wait_until_present(timeout: 15)
  left_navigation.collapse.click
  expect(left_navigation.expand.present?).to be(true)
end

Then /^fetch total count of all contacts$/ do
  left_nav_all_contacts = SdcContacts.contacts_left_navigation_all_contacts
  left_nav_all_contacts.all_contacts.safe_wait_until_present(timeout: 15)
  p "All Contacts count : "+left_nav_all_contacts.all_contacts_count.text_value
end

