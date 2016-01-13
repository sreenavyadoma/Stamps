
Then /^Select Print Postage Print On (.*)/ do |media|
  log.info "Select Print Postage Print On #{media}"
  postage.print_on.select media
end

Then /^Expect Print Media Tooltip to be (.*)$/ do |selection|
  postage.print_on.tooltip selection
end

Then /^Expect Print Media (.*) to be disabled$/ do |selection|
  postage.print_on.disabled? selection
end

Then /^Expect Print Media (.*) to be enabled$/ do |selection|
  postage.print_on.enabled? selection
end

Then /^Set Print Postage Form Service to \"(.*)\"/ do |service|
  log.info "Step: Set Print Postage Service to: \n #{service}"
  @postage_form.service.select service
end

Then /^Set Print Postage Form Ounces to (.*)/ do |ounces|
  log.info "Step: Set Print Postage Ounces to: \n #{ounces}"
  @postage_form.weight.ounces.set ounces
end

Then /^Set Print Postage Form Pounds to (.*)/ do |pounds|
  log.info "Step: Set Print Postage Pounds to: \n #{pounds}"
  @postage_form.weight.pounds.set pounds
end

Then /^Set Print Postage Ship-From to (.*)/ do |value|
  log.info "Step: Set Print Postage Ship-From to: \n #{value}"
  @postage_form.ship_from.select value
end

Then /^Set Print Postage Form Ship-To country to (.*)/ do |country|
  log.info "Step: Set Print Postage Country to: \n #{country}"
  @postage_form.country.select country

end

Then /^Expect Print Postage Form Ship-To address to be (.*)/ do |address|

end

Then /^Open Extra Services/ do

end

Then /^Set Extra Services COD to (.*)/ do |amount|

end

Then /^Save Extra Services/ do

end

Then /^Search Contacts by group - (.*)/ do |filter|

end

Then /^Search Contacts by cost code - (.*)/ do |filter|

end

Then /^Open Contacts modal/ do

end

Then /Cancel Contacts modal/ do

end