Then /^Contacts: Search by group - (.*)/ do |filter|

end

Then /^Contacts: Search by cost code - (.*)/ do |filter|

end

Then /^Contacts: Close$/ do
  #logger.step "Contacts: Close"
  @contacts.close
end

Then /Contacts: Click Contacts Page Link$/ do
  #logger.step "Contacts: Click Contacts Page Link"
  @contacts.view_contacts
end