Then /^[Ee]xpect [Cc]ontacts [Dd]elete [Mm]essage [Bb]ox [Ii]s [Aa]vailable$/ do
  message_box = SdcContacts.contacts_delete_message_box
  message_box.title.safe_wait_until_present(timeout: 10)
end
Then /^[Ee]xpect [Ee]mpty [Cc]ontacts [Gg]rid [Ii]s [Aa]vailable$/ do
  empty_search = SdcContacts.contacts_grid.empty_grid
  empty_search.safe_wait_until_present(timeout: 10)
  empty_search. flash
end


