Then /^click on groups expand button of contacts left navigation$/ do
  left_nav_group  = SdcContacts.contacts_left_nav_group
  left_nav_group.groups_expand_button.safe_wait_until_present(timeout: 15)
  left_nav_group.groups_expand_button.click
  expect(left_nav_group.groups_collapse_button.present?).to be(true)
end

Then /^click on groups collapse button of contacts left navigation$/ do
  left_nav_group  = SdcContacts.contacts_left_nav_group
  left_nav_group.groups_collapse_button.safe_wait_until_present(timeout: 15)
  left_nav_group.groups_collapse_button.click
  expect(left_nav_group.groups_expand_button.present?).to be(true)
end

Then /^fetch total against each group available$/ do
  left_nav_group  = SdcContacts.contacts_left_nav_group
  row_count = left_nav_group.total_groups.count
  p "Total no of groups : " + row_count.to_s
  i=1
  while i<= row_count.to_i
    group_label = left_nav_group.group('name',i)
    p "name : "+group_label.to_s
    count = left_nav_group.group('count',i)
    p "count of #{group_label} is : " + count.to_s
    i=i+1
  end
end

Then /^select (.*) from groups menu dropdown of contacts toolbar$/ do |str|
  toolbar = SdcContacts.contacts_toolbar_groups
  case str
  when 'Change Groups'
    p str
    toolbar.toolbar_groups_change_groups.safe_wait_until_present(timeout: 15)
    toolbar.toolbar_groups_change_groups.click

  when 'Add/Edit Groups'
    toolbar.toolbar_groups_add_edit_groups.safe_wait_until_present(timeout: 15)
    toolbar.toolbar_groups_add_edit_groups.click
    step 'expect manage groups pop up is displayed'
  end
end


Then /^expect manage groups pop up is displayed$/ do
  manage_groups = SdcContacts.contacts_manage_groups
  manage_groups.manage_groups_title.safe_wait_until_present(timeout: 10)
  expect(manage_groups.manage_groups_title.present?).to be(true)
end

Then /^click add button on manage groups window toolbar$/ do
  manage_groups = SdcContacts.contacts_manage_groups
  manage_groups.manage_groups_title.safe_wait_until_present(timeout: 10)
  manage_groups.manage_groups_add_button.click
  step "expect add groups pop up is displayed"
end

Then /^expect add groups pop up is displayed$/ do
  add_groups = SdcContacts.contacts_add_groups
  add_groups.add_groups_group_name_textbox.safe_wait_until_present(timeout: 10)
  expect(add_groups.add_groups_group_name_textbox.present?).to be(true)
end

Then /^set group name on add group pop up to (.*)$/ do |name|
  add_groups = SdcContacts.contacts_add_groups
  add_groups.add_groups_group_name_textbox.safe_wait_until_present(timeout: 10)
  case name
  when "blank"
    group_name=""
  when "random"
    group_name = TestHelper.rand_group_name
    TestData.hash[:group_name] = group_name
  when "existing"
    manage_groups=SdcContacts.contacts_manage_groups
    row_count = manage_groups.manage_groups_table.count
    p "exsisting group count" +row_count.to_s
    if row_count != 0
      str = manage_groups.group_name(row_count)
      group_name=str
    end
  else
    group_name=name
  end
  add_groups.add_groups_group_name_textbox.set(group_name)
end

Then /^click on save button of add groups pop up window$/ do
  add_groups = SdcContacts.contacts_add_groups
  add_groups.add_groups_save_button.safe_wait_until_present(timeout: 10)
  add_groups.add_groups_save_button.click
end

Then /^expect error message of blank group name is displayed on add groups pop up window$/ do
  add_groups = SdcContacts.contacts_add_groups
  add_groups.add_groups_save_button.safe_wait_until_present(timeout: 10)
  expect(add_groups.add_groups_error_message.present?).to be(true)
  p add_groups.error_message_text.text_value
  expect(add_groups.error_message_text.text_value).to eql("Group name required.")
end

Then /^expect error message of existing group name is displayed on add groups pop up window$/ do
  add_groups = SdcContacts.contacts_add_groups
  add_groups.add_groups_save_button.safe_wait_until_present(timeout: 10)
  expect(add_groups.add_groups_error_message.present?).to be(true)
  p add_groups.error_message_text.text_value
  expect(add_groups.error_message_text.text_value).to eql("This group name is already in use. Please choose a unique group name")
end

Then /^expect error message is not displayed on add groups pop up window$/ do
  add_groups = SdcContacts.contacts_add_groups
  add_groups.add_groups_save_button.safe_wait_until_present(timeout: 10)
  expect(add_groups.add_groups_error_message.present?).to be(false)
end

Then /^expect group name added is available in the manage group pop up table$/ do
  actual_added||=TestData.hash[:group_name]
  manage_groups=SdcContacts.contacts_manage_groups
  row_count = manage_groups.manage_groups_table.count
    p "exsisting group count" +row_count.to_s
    i=1
    group_name_available = 'no'
    while  i <= row_count
      str = manage_groups.group_name(i)
      if str==actual_added
        group_name_available = 'yes'
        p "Newly added Group is available in the Manange Groups table"
        break
      end
      i=i+1
    end
  expect(group_name_available=='yes').to eql(true)
end




