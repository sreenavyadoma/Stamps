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


