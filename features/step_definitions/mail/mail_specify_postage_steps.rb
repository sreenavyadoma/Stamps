# encoding: utf-8

Then /^Mail Stamps: Select Specify Mail Amount/ do
  #logger.step "Select Stamps Specify Mail Amount"
  stamps.mail.netstamps.specify_postage_amount
end

Then /^Mail Stamps: Set Stamp Amount to \$(.*)$/ do |amount|
  #logger.step "Set Stamps Stamp Amount to $#{amount}"
  stamps.mail.netstamps.specify_postage_amount.stamp_amount.set amount
end
