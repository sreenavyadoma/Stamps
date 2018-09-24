Then /^[Oo]n [Cc]ontacts [Ll]eft [Nn]avigation [Cc]lick [Oo]n [Gg]roups [Ee]xpand [Bb]utton$/ do
  left_nav_group  = SdcContacts.contacts_left_nav_group
  left_nav_group.groups_expand_button.safe_wait_until_present(timeout: 15)
  left_nav_group.groups_expand_button.click
end

Then /^[Oo]n [Cc]ontacts [Ll]eft [Nn]avigation [Cc]lick [Oo]n [Gg]roups [Cc]ollapse [Bb]utton$/ do
  left_nav_group  = SdcContacts.contacts_left_nav_group
  left_nav_group.groups_collapse_button.safe_wait_until_present(timeout: 15)
  left_nav_group.groups_collapse_button.click
end

Then /^[Oo]n [Cc]ontacts [Ll]eft [Nn]avigation [Gg]et [Cc]ount [Oo]f [Aa]ll [Tt]he [Gg]roups [Aa]vailable$/ do
  left_nav_group  = SdcContacts.contacts_left_nav_group
  row_count = left_nav_group.total_groups.count
  p "Total no of cost codes : " + row_count.to_s
  i=1
  while i<= row_count.to_i
    group_label = left_nav_group.group_name(i)
    p "name : "+group_label
    count = left_nav_group.group_count(i)
    p "count of #{group_label} is : " + count.to_s
    i=i+1
  end
end



