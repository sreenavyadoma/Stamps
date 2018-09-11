Then /^[Ee]xpect [Cc]ontacts [Dd]elete [Mm]essage [Bb]ox [Ii]s [Aa]vailable$/ do
  message_box = SdcContacts.contacts_delete_message_box
  message_box.title.safe_wait_until_present(timeout: 10)
end