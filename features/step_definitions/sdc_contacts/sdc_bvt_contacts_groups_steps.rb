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


