Then /^[Oo]n [Ll]eft [Nn]avigation [Mm]enu [Ss]earch [Cc]ontact (.*)$/ do |str|
   contacts_left_navigation= SdcContacts.contacts_left_navigation_panel
  contacts_left_navigation.search_contacts.safe_wait_until_present(timeout: 15)
  contacts_left_navigation.search_contacts.set(str)
  contacts_left_navigation.search_icon.safe_wait_until_present(timeout: 15)
  sleep(5)
  contacts_left_navigation.search_icon.click
  SdcContacts.loading_contacts.safe_wait_until_present(timeout: 30)
  SdcContacts.contacts_body.safe_wait_until_present(timeout: 30)
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
