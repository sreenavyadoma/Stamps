Then /^Envelopes: Set Print Postage Ship-From to (.*)/ do |value|
  log.info "Step: Set Print Postage Ship-From to: \n #{value}"
  @postage_form.ship_from.select value
end

Then /^Envelopes: Set Print Postage Form Ship-To country to (.*)/ do |country|
  log.info "Step: Set Print Postage Country to: \n #{country}"
  @postage_form.country.select country
end

Then /^Envelopes: Set Print Postage Form Ounces to / do |ounces|
  log.info "Step: Envelopes: Set Print Postage Ounces to: \n #{ounces}"
  @postage_form.weight.ounces.set ounces
end

Then /^Envelopes: Set Print Postage Form Pounds to / do |pounds|
  log.info "Step: Envelopes: Set Print Postage Pounds to: \n #{pounds}"
  @postage_form.weight.pounds.set pounds
end

Then /^Envelopes: Set Print Postage Form Service to \"(.*)\"/ do |service|
  log.info "Step: Envelopes: Set Print Postage Service to: \n #{service}"
  @postage_form.service.select service
end

Then /^Envelopes: Set Print Postage Form Ship-To address to$/ do |table|
  ship_to = PrintHelper.instance.address_hash_to_str table.hashes.first
  log.info "Step: Envelopes: Set Print Postage Form Ship-To address to \n#{ship_to}"
  step "Set Print Postage Form Ship-To address to #{ship_to}"
end