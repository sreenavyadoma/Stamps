#todo-elie make sure changing print ons only happens in one place... here.  so check stamps_step definitions, envelope stap definitions etc.
Then /^Print Postage: Select Print On (.*)/ do |media|
  log.info "Select Print Postage Print On #{media}"
  postage.print_on.select media
end

Then /^Print Postage: Expect Print Media Tooltip to be (.*)$/ do |selection|
  postage.print_on.tooltip selection
end

Then /^Print Postage: Expect Print Media (.*) to be disabled$/ do |selection|
  postage.print_on.disabled? selection
end

Then /^Print Postage: Expect Print Media (.*) to be enabled$/ do |selection|
  postage.print_on.enabled? selection
end

Then /^Print Postage: Set Service to \"(.*)\"/ do |service|
  log.info "Step: Set Print Postage Service to: \n #{service}"
  @postage_form.service.select service
end

Then /^Print Postage: Set Ounces to (.*)/ do |ounces|
  log.info "Step: Set Print Postage Ounces to: \n #{ounces}"
  @postage_form.weight.ounces.set ounces
end

Then /^Print Postage: Set Pounds to (.*)/ do |pounds|
  log.info "Step: Set Print Postage Pounds to: \n #{pounds}"
  @postage_form.weight.pounds.set pounds
end

Then /^Print Postage: Set Ship-To address to$/ do |table|
  ship_to = PrintHelper.instance.address_hash_to_str table.hashes.first
  log.info "Step: Set Print Postage Form Ship-To address to \n#{ship_to}"
  step "Set Print Postage Form Ship-To address to #{ship_to}"
end

Then /^Print Postage: Set Ship-To to Random Address Between Zone 1 through 4$/ do
  step "Set Order Details Ship-To address to zone 1 through 4"
end

Then /^Print Postage: Set Ship-To to Random Address Between Zone 5 through 8$/ do
  step "Set Order Details Ship-To address to zone 5 through 8"
end

#todo-elie Fix ship_from
Then /^Print Postage: Set Ship-From to (.*)/ do |value|
  log.info "Step: Set Print Postage Ship-From to: \n #{value}"
  @postage_form.ship_from.select value
end

Then /^Print Postage: Set Ship-To country to (.*)/ do |country|
  log.info "Step: Set Print Postage Country to: \n #{country}"
  @postage_form.country.select country

end

Then /^Print Postage: Expect Ship-To address to be (.*)/ do |address|

end

Then /^Print Postage: Open Extra Services/ do

end

Then /^Extra Services: Set COD to (.*)/ do |amount|

end

Then /^Extra Services: Click Save/ do

end

Then /^Contacts: Search by group - (.*)/ do |filter|

end

Then /^Contacts: Search cost code - (.*)/ do |filter|

end

Then /^Print Postage: Open Contacts modal/ do

end

Then /Contacts: Cancel modal/ do

end