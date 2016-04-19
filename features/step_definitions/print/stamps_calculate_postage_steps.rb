# encoding: utf-8

Then /^Postage Stamps: Select Calculate Postage Amount/ do
  log.info "Step:  Select Stamps Calculate Postage Amount"
  @print_postage.calculate_postage_amount
end

Then /^Postage Stamps: Set Weight (\d+) lbs (\d+) oz$/ do |lbs, oz|
  log.info "Step:  Set Stamps Weight #{lbs} lbs #{oz} oz"
  weight = @print_postage.calculate_postage_amount.weight
  weight.lbs.set lbs
  weight.oz.set oz
end

Then /^Postage Stamps: Set Calculate Postage Service to (.*)/ do |service|
  log.info "Step: Envelopes: Set Print Postage Service to: \n #{service}"
  @print_postage.calculate_postage_service.select service
end

Then /^Postage Stamps: Select Calculate Postage Service First-Class Mail Postcard$/ do
  step "Postage Stamps: Set Calculate Postage Service to First-Class Mail Postcard"
end

Then /^Postage Stamps: Select Calculate Postage Service First-Class Mail Letter$/ do
  step "Postage Stamps: Set Calculate Postage Service to First-Class Mail Letter"
end

Then /^Postage Stamps: Select Calculate Postage Service First-Class Mail Large Envelope-Flat$/ do
  step "Postage Stamps: Set Calculate Postage Service to First-Class Mail Large Envelope/Flat"
end

Then /^Postage Stamps: Select Calculate Postage Service First-Class Mail International Envelope$/ do
  step "Postage Stamps: Set Calculate Postage Service to First-Class Mail International Envelope"
end

Then /^Postage Stamps: Select Calculate Postage Service First-Class Mail International Large Envelope-Flat$/ do
  step "Postage Stamps: Set Calculate Postage Service to First-Class Mail International Large Envelope/Flat"
end

Then /^Postage Stamps: Open Extra Services$/ do

end