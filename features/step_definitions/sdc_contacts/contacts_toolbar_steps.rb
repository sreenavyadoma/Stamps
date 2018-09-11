Then /^[Cc]lick [Cc]ontacts [Tt]oolbar [Aa]dd [Bb]utton$/ do
  toolbar =SdcContacts.contacts_toolbar
  toolbar.add.safe_wait_until_present(timeout: 15)
  toolbar.add.click
  contacts_detail= SdcContacts.contacts_detail
  contacts_detail.contacts_detail_panel.safe_wait_until_present(timeout: 10)
end

Then /^[Cc]lick [Cc]ontacts [Tt]oolbar [Dd]elete [Bb]utton$/ do
  toolbar = SdcContacts.contacts_toolbar
  toolbar.delete.safe_wait_until_present(timeout: 10)
  toolbar.delete.wait_until_present(timeout: 10)
  toolbar.delete.click
  del_con_win =SdcContacts.contacts_delete_message_box
  del_con_win.title.safe_wait_until_present(timeout:10)
end

Then /^[Cc]lick [Cc]ontacts [Tt]oolbar [Aa]dd [Rr]eference [Bb]utton$/ do
  toolbar = SdcContacts.contacts_toolbar
  toolbar.ref.safe_wait_until_present(timeout: 15)
  toolbar.ref.click
  add_ref_win = SdcContacts.reference_message_box
  add_ref_win.add_reference_window.safe_wait_until_present(timeout: 30)
end

Then /^[Cc]lick [Cc]ontacts [Tt]oolbar [Ss]ettings [Bb]utton$/ do
  settings = SdcContacts.contact_toolbar_settings
  settings.settings_button.safe_wait_until_present(timeout: 10)
  settings.settings_button.wait_until_present(timeout: 10)
  sleep(5)
  settings.settings_button.click
end

Then /^[Ff]rom [Cc]ontacts [Tt]oolbar [Ss]ettings [Dd]ropdown [Ss]elect [Cc]olumns$/ do
  settings = SdcContacts.contact_toolbar_settings
  settings.settings_columns.safe_wait_until_present(timeout: 10)
  settings.settings_columns.wait_until_present(timeout: 10)
  settings.settings_columns.hover
  settings.column_name.flash
  p "is checked"
  p settings.column_name.checked?
end

Then /^[Cc]lick [Cc]ontacts [Tt]oolbar [Cc]ost [Cc]odes [Dd]ropdown$/ do
  toolbar = SdcContacts.contacts_toolbar_cost_codes
  toolbar.cost_codes.click
end

Then /^Select Cost Codes to (.*)$/ do |str|

  toolbar = SdcContacts.contacts_toolbar_cost_codes
  case str
  when 'Change Cost Code'
    toolbar.cost_codes_changecostcode.click
    toolbar.cost_codes_changecostcode.flash
  when 'Add/Edit Cost Codes'
    toolbar.cost_codes_addeditcostcode.click
  end

end

