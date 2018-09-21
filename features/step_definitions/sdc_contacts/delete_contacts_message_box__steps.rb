
Then /^[Dd]elete [Cc]ontacts [Mm]essage [Bb]ox [Cc]lick [Oo]n [Yy]es [Bb]utton$/ do
  message_box = SdcContacts.contacts_delete_message_box
  message_box.yes_button.safe_wait_until_present(timeout: 10)
  message_box.yes_button.click
  contacts_grid = SdcContacts.contacts_body
  contacts_grid.wait_until_present(timeout: 20)
end

Then /^[Dd]elete [Cc]ontacts [Mm]essage [Bb]ox [Cc]lick [Oo]n [Nn]o [Bb]utton$/ do
  message_box = SdcContacts.contacts_delete_message_box
  message_box.no_button.safe_wait_until_present(timeout: 10)
  message_box.no_button.click
  contacts_grid = SdcContacts.contacts_body
  contacts_grid.wait_until_present(timeout: 20)
end

Then /^delete contacts message box click on close button$/ do
    message_box = SdcContacts.contacts_delete_message_box
    message_box.close.safe_wait_until_present(timeout: 10)
    message_box.close.click
    contacts_grid = SdcContacts.contacts_body
    contacts_grid.wait_until_present(timeout: 20)
end