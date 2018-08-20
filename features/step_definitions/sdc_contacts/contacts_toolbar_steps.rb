Then /^[Cc]lick [Cc]ontacts [Aa]dd [Bb]utton$/ do
  toolbar =SdcContacts.contacts_toolbar
  toolbar.add.safe_wait_until_present(timeout: 10)
  toolbar.add.wait_until_present(timeout: 10)
  sleep(5)
  toolbar.add.click
end

Then /^[Cc]lick [Cc]ontacts [Dd]elete [Bb]utton$/ do
  toolbar = SdcContacts.contacts_toolbar
  toolbar.delete.safe_wait_until_present(timeout: 10)
  toolbar.delete.wait_until_present(timeout: 10)
  toolbar.delete.click
end