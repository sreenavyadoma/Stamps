Then /^Contacts: Search by group - (.*)/ do |filter|

end

Then /^Contacts: Search by cost code - (.*)/ do |filter|

end

Then /^Contacts: Close$/ do
  log.info "Step: Contacts: Close"
  @contacts.close
end

Then /Contacts: Cancel$/ do
  log.info "Step: Contacts: Cancel"
  @contacts.cancel
end