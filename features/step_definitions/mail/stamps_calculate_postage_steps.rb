# encoding: utf-8

Then /^Postage Stamps: Select Calculate Postage Amount/ do
  logger.info "Select Stamps Calculate Postage Amount"
  web_apps.mail.netstamps.calculate_postage_amount
end

Then /^Postage Stamps: Set Weight (\d+) lbs (\d+) oz$/ do |lbs, oz|
  logger.info "Set Stamps Weight #{lbs} lbs #{oz} oz"
  weight = web_apps.mail.netstamps.calculate_postage_amount.weight
  weight.lbs.set lbs
  weight.oz.set oz
end

Then /^Postage Stamps: Set Calculate Postage Service to (.*)/ do |service|
  logger.info "Envelopes: Set Print Postage Service to: \n #{service}"
  web_apps.mail.netstamps.calculate_service_drop_list.select service
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