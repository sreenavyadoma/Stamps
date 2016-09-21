# encoding: utf-8

Then /^Mail Stamps: Select Calculate Mail Amount/ do
  logger.info "Select Stamps Calculate Mail Amount"
  web_apps.mail.netstamps.calculate_postage_amount
end

Then /^Mail Stamps: Set Weight (\d+) lbs (\d+) oz$/ do |lbs, oz|
  logger.info "Set Stamps Weight #{lbs} lbs #{oz} oz"
  weight = web_apps.mail.netstamps.calculate_postage_amount.weight
  weight.lbs.set lbs
  weight.oz.set oz
end

Then /^Mail Stamps: Set Calculate Mail Service to (.*)/ do |service|
  logger.info "Envelopes: Set Print Mail Service to: \n #{service}"
  web_apps.mail.netstamps.calculate_service_drop_list.select service
end

Then /^Mail Stamps: Select Calculate Mail Service First-Class Mail Postcard$/ do
  step "Mail Stamps: Set Calculate Mail Service to First-Class Mail Postcard"
end

Then /^Mail Stamps: Select Calculate Mail Service First-Class Mail Letter$/ do
  step "Mail Stamps: Set Calculate Mail Service to First-Class Mail Letter"
end

Then /^Mail Stamps: Select Calculate Mail Service First-Class Mail Large Envelope-Flat$/ do
  step "Mail Stamps: Set Calculate Mail Service to First-Class Mail Large Envelope/Flat"
end

Then /^Mail Stamps: Select Calculate Mail Service First-Class Mail International Envelope$/ do
  step "Mail Stamps: Set Calculate Mail Service to First-Class Mail International Envelope"
end

Then /^Mail Stamps: Select Calculate Mail Service First-Class Mail International Large Envelope-Flat$/ do
  step "Mail Stamps: Set Calculate Mail Service to First-Class Mail International Large Envelope/Flat"
end

Then /^Mail Stamps: Open Extra Services$/ do

end