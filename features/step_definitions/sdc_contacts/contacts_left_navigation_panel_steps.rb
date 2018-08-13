Then /^[Oo]n [Ll]eft [Nn]avigation [Mm]enu [Ss]earch [Cc]ontact (.*)$/ do |str|
  contacts_left_navigation= SdcContacts.contacts_left_navigation_panel
  contacts_left_navigation.search_contacts.safe_wait_until_present(timeout: 20)
  contacts_left_navigation.search_contacts.set(str)
  contacts_left_navigation.search_icon.safe_wait_until_present(timeout: 20)
  contacts_left_navigation.search_icon.click
  contacts_grid = SdcContacts.contacts_body
  contacts_grid.safe_wait_until_present(timeout: 20)

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
