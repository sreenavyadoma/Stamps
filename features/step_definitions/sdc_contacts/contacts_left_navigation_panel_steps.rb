Then /^[Oo]n [Ll]eft [Nn]avigation [Mm]enu [Ss]earch [Cc]ontact (.*)$/ do |str|

  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.contacts_detail_panel.safe_wait_until_present(timeout: 15)
  if str=='newly added'
    value ||= TestData.hash[:full_name]
    step "set contacts filter panel search textbox to #{value}"
  else
    step "set contacts filter panel search textbox to #{str}"
  end
  #contacts_left_navigation= SdcContacts.contacts_left_navigation_panel
  #contacts_left_navigation.search_contacts.safe_wait_until_present(timeout: 15)
  #contacts_left_navigation.search_contacts.set(str)
  step "click contacts filter panel search button"
  #contacts_left_navigation.search_icon.safe_wait_until_present(timeout: 15)
  #contacts_left_navigation.search_icon.click
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

  Then /^[Ss]et [Cc]ontacts [Ff]ilter [Pp]anel [Ss]earch [Tt]extbox [Tt]o (.*)$/ do |str|
    contacts_left_navigation= SdcContacts.contacts_left_navigation_panel
    contacts_left_navigation.search_contacts.safe_wait_until_present(timeout: 15)
    contacts_left_navigation.search_contacts.set(str)
  end

  Then /^[Cc]lick [Cc]ontacts [Ff]ilter [Pp]anel [Ss]earch [Bb]utton$/ do
    contacts_left_navigation= SdcContacts.contacts_left_navigation_panel
    contacts_left_navigation.search_icon.safe_wait_until_present(timeout: 15)
    contacts_left_navigation.search_icon.click
  end

  Then /^[Ee]xpect [Cc]ount [Oo]f [Cc]ontact [Ss]earch [Rr]esults [Ii]s (.*)$/ do |count|
    search_results= SdcContacts.contacts_left_navigation_search_results
    actual_count =search_results.search_results_count.text_value
    #p 'actual :' + actual_count
    #p 'given :' + count
    expect(actual_count==count).to be (true)
  end


Then /^close the search results by clicking on remove button$/ do
    search_results= SdcContacts.contacts_left_navigation_search_results
    search_results.search_results_remove.safe_wait_until_present(timeout: 15)
    search_results.search_results_remove.click
end

