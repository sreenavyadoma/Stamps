# encoding: utf-8

Then /^Mail Stamps: Select Calculate Mail Amount/ do
  #logger.step "Select Stamps Calculate Mail Amount"
  stamps.mail.netstamps.calculate_postage_amount
end

Then /^Mail Stamps: Set Weight (\d+) lb (\d+) oz$/ do |lb, oz|
  #logger.step "Set Stamps Weight #{lb} lb #{oz} oz"
  weight = stamps.mail.netstamps.calculate_postage_amount.weight
  weight.lb.set lb
  weight.oz.set oz
end

Then /^Mail Stamps: Open Extra Services$/ do

end