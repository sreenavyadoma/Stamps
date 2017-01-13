# encoding: utf-8

Then /^Mail Stamps: Select Calculate Mail Amount/ do
  logger.step "Select Stamps Calculate Mail Amount"
  stamps.mail.netstamps.calculate_postage_amount
end

Then /^Mail Stamps: Set Weight (\d+) lb (\d+) oz$/ do |lb, oz|
  logger.step "Set Stamps Weight #{lb} lb #{oz} oz"
  weight = stamps.mail.netstamps.calculate_postage_amount.weight
  weight.lb.set lb
  weight.oz.set oz
end

Then /^Mail Stamps: Set Calculate Mail Service to (.*)/ do |service|
  logger.step "Envelopes: Set Print Mail Service to: \n #{service}"
  stamps.mail.netstamps.calculate_service_drop_list.select service
end

Then /^Mail Stamps: Select Calculate Mail Service First-Class Mail Postcard$/ do
  step "Mail Stamps: Set Calculate Mail Service to First-Class Mail Postcard"
end

Then /^Mail Stamps: Select Calculate Mail Service First-Class Mail Letter$/ do
  step "Mail Stamps: Set Calculate Mail Service to First-Class Mail Letter"
end

Then /^Mail Stamps: Select Calculate Mail Service First-Class Mail Large Envelope-Flat$/ do
  step "Mail Stamps: Set Calculate Mail Service to FCM Package"
end

Then /^Mail Stamps: Select Calculate Mail Service First-Class Mail International Envelope$/ do
  step "Mail Stamps: Set Calculate Mail Service to First-Class Mail International Envelope"
end

Then /^Mail Stamps: Select Calculate Mail Service First-Class Mail International Large Envelope-Flat$/ do
  step "Mail Stamps: Set Calculate Mail Service to FCMI Large Envelope"
end

Then /^Mail Stamps: Open Extra Services$/ do

end