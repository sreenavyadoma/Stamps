Then /^click contacts add button$/ do
  toolbar =SdcContacts.contacts_toolbar
  toolbar.add.safe_wait_until_present(timeout: 30)
  toolbar.add.click
end

Then /^click contacts delete button$/ do
  toolbar = SdcContacts.contacts_toolbar
  toolbar.delete.safe_wait_until_present(timeout: 10)
  toolbar.delete.wait_until_present(timeout: 10)
  toolbar.delete.click
  end