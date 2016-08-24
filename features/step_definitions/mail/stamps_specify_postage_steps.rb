# encoding: utf-8

Then /^Postage Stamps: Select Specify Postage Amount/ do
  logger.info "Select Stamps Specify Postage Amount"
  web_apps.mail.netstamps.specify_postage_amount
end

Then /^Postage Stamps: Set Stamp Amount to \$(.*)$/ do |amount|
  logger.info "Set Stamps Stamp Amount to $#{amount}"
  web_apps.mail.netstamps.specify_postage_amount.stamp_amount.set amount
end

Then /^Postage Stamps: Set Specify Postage Service to (.*)/ do |service|
  logger.info "Envelopes: Set Print Postage Service to: \n #{service}"
  web_apps.mail.netstamps.drop_list.select service
end

Then /^Postage Stamps: Select Specify Postage Service Media Mail$/ do
  step "Postage Stamps: Set Specify Postage Service to Media Mail (2 - 3 Days)"
end

Then /^Postage Stamps: Select Specify Postage Service First Class$/ do
  step "Postage Stamps: Set Specify Postage Service to First Class Mail (1 - 3 Days)"
end

