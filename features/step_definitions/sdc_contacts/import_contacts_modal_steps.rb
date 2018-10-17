Then /^expect import contacts modal is present$/ do
  import_window = SdcContacts.contacts_import
  import_window.window.safe_wait_until_present(timeout:15)
  expect(import_window.window.present?).to be (true)
end

Then /^click close icon of import contacts pop up$/ do
  import_window = SdcContacts.contacts_import
  import_window.close_icon.safe_wait_until_present(timeout:15)
  import_window.close_icon.click
end

Then /^expect select a csv file button on import contacts modal is present$/ do
import_window = SdcContacts.contacts_import
import_window.window.safe_wait_until_present(timeout:15)
expect(import_window.window.present?).to be (true)
end

Then /^click select a csv file on import contacts modal$/ do
  import_window = SdcContacts.contacts_import
  import_window.window.safe_wait_until_present(timeout:15)
  import_window.import_contacts_iframe_elements.flash
end

Then /^expect file has a header row checkbox on import contacts modal is present$/ do
  import_window = SdcContacts.contacts_import
  import_window.file_has_header.safe_wait_until_present(timeout:15)
  expect(import_window.file_has_header.present?).to be (true)
end

Then /^check file has a header row checkbox on import contacts modal$/ do
  import_window = SdcContacts.contacts_import
  import_window.file_has_header.safe_wait_until_present(timeout:15)
  checkbox=import_window.file_has_header
  checkbox.check unless checkbox.checked?
end

Then /^uncheck file has a header row checkbox on import contacts modal$/ do
  import_window = SdcContacts.contacts_import
  import_window.file_has_header.safe_wait_until_present(timeout:15)
  checkbox=import_window.file_has_header
  checkbox.uncheck if checkbox.checked?
end

Then /^expect assign contacts to group drop down on import contacts modal is present$/ do
  import_window = SdcContacts.contacts_import
  import_window.group_drop_down.safe_wait_until_present(timeout:15)
  expect(import_window.group_drop_down.present?).to be (true)
end

Then /^expect default value of assign contacts to group drop down on import contacts modal is None$/ do
  import_window = SdcContacts.contacts_import
  import_window.group_drop_down.safe_wait_until_present(timeout:15)
  import_window.group_drop_down.group_drop_down_option('None')
end


