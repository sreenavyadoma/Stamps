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


Then /^click on settings button of contacts toolbar$/ do
  settings = SdcContacts.contact_toolbar_settings
  settings.settings_button.safe_wait_until_present(timeout: 20)
  #sleep(5)
  settings.settings_button.click
end

Then /^select columns from contacts toolbar settings dropdown menu$/ do
  settings = SdcContacts.contact_toolbar_settings
  settings.settings_columns.safe_wait_until_present(timeout: 10)
  settings.settings_columns.flash
  settings.settings_columns.hover
end

Then /^check all the columns from the list to show all columns in the contacts grid$/ do
  columns=['Name','Prefix','First Name','Middle','Last Name','Suffix','Company','Title','Department',
           'Email','Phone','Ext.','City','State/Prv','Street Address','Postal Code','Country','Cost Code','Reference #']
  columns.each{|col|
    step "choose #{col} on contact settings columns menu list"
  }
  step "click on search bar of contacts left navigation panel"
end

Then /^choose (.*) on contact settings columns menu list$/ do |column|
  settings = SdcContacts.contact_toolbar_settings
  checkbox = settings.setting_columns_menu_item_checkbox(column)
  checkbox.flash
  # checkbox.checked? will return true if it is unchecked as the property_name in chooser item 'unchecked'
  if checkbox.checked?
    checkbox.check
  end
end

Then /^uncheck all the columns from the list to hide all columns in the contacts grid$/ do
  columns=['Name','Prefix','First Name','Middle','Last Name','Suffix','Company','Title','Department',
           'Email','Phone','Ext.','City','State/Prv','Street Address','Postal Code','Country','Cost Code','Reference #']
  columns.each{|col|
    step "unchoose #{col} on contact settings columns menu list"
  }
  step "click on search bar of contacts left navigation panel"
end

Then /^unchoose (.*) on contact settings columns menu list$/ do |column|
  settings = SdcContacts.contact_toolbar_settings
  checkbox = settings.setting_columns_menu_item_checkbox(column)
  checkbox.flash
  # checkbox.checked? will return true if it is unchecked as the property_name in chooser item 'unchecked'
  if checkbox.checked?
    #do nothing
  else
    checkbox.check
  end
end
Then(/^expect (.*) column is available on contacts grid$/) do |column|
  column_header =SdcContacts.contacts_col.contacts_header_element(column)
  column_header.scroll_into_view
  column_header.flash
  SdcLogger.info "Header Element Present? : #{column} - #{column_header.present?.to_s}"
  expect(column_header.present?).to be (true)
end

Then(/^expect (.*) column is not available on contacts grid$/) do |column|
  column_header =SdcContacts.contacts_col.contacts_header_element(column)
  column_header.scroll_into_view
  SdcLogger.info "Header Element Present? : #{column} - #{column_header.present?.to_s}"
  expect(column_header.present?).to be (false)
end

Then(/^expect all columns are available on the contacts grid$/) do
  columns=['Name','Prefix','First Name','Middle','Last Name','Suffix','Company','Title','Department',
           'Email','Phone','Ext.','City','State/Prv','Street Address','Postal Code','Country','Cost Code','Reference #']
  columns.each{|col|
    step "expect #{col} column is available on contacts grid"
  }
end

Then(/^expect all columns are not available on the contacts grid$/) do
  columns=['Name','Prefix','First Name','Middle','Last Name','Suffix','Company','Title','Department',
           'Email','Phone','Ext.','City','State/Prv','Street Address','Postal Code','Country','Cost Code','Reference #']
  columns.each{|col|
    step "expect #{col} column is not available on contacts grid"
  }
end


