Then /^Print Postage: Select Print On (.*)/ do |media|
  log.info "Select Print Postage Print On #{media}"

  postage.print_on.select media

  if media.include? 'Stamps'
    @stamps = postage.stamps
  elsif media.include? 'Shipping Label'
    @shipping_label = postage.shipping_label
  elsif media.include? 'Envelope'
    @envelope = postage.envelope
  elsif media.include? 'Certified Mail'
    @certified_mail = postage.certified_mail
  end
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
