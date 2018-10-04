Then /^click add button on contacts toolbar$/ do
  toolbar =SdcContacts.contacts_toolbar
  toolbar.cost_codes.safe_wait_until_present(timeout: 15)
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

Then /^click contacts toolbar print postage button$/ do
  SdcContacts.contacts_toolbar.print_postage.safe_click
  step 'expect mail server error is not present'
end

Then /^[Cc]lick [Cc]ontacts [Tt]oolbar [Aa]dd [Rr]eference [Bb]utton$/ do
  toolbar = SdcContacts.contacts_toolbar
  toolbar.ref.safe_wait_until_present(timeout: 15)
  toolbar.ref.click
  add_ref_win = SdcContacts.reference_message_box
  add_ref_win.add_reference_window.safe_wait_until_present(timeout: 30)
end

Then /^click on groups menu dropdown on contacts toolbar$/ do
  toolbar = SdcContacts.contacts_toolbar_groups
  step "hover on groups button of contacts toolbar"
  toolbar.toolbar_groups(timeout: 15)
  toolbar.toolbar_groups.click
end

Then /^hover on groups button of contacts toolbar$/ do
  toolbar = SdcContacts.contacts_toolbar_groups
  toolbar.toolbar_groups.safe_wait_until_present(timeout: 15)
  toolbar.toolbar_groups.hover
end


