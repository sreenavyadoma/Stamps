# encoding: utf-8

Then /^Mail Stamps: Select Specify Mail Amount/ do
  logger.info "Select Stamps Specify Mail Amount"
  web_apps.mail.netstamps.specify_postage_amount
end

Then /^Mail Stamps: Set Stamp Amount to \$(.*)$/ do |amount|
  logger.info "Set Stamps Stamp Amount to $#{amount}"
  web_apps.mail.netstamps.specify_postage_amount.stamp_amount.set amount
end

Then /^Mail Stamps: Set Specify Mail Service to (.*)/ do |service|
  logger.info "Envelopes: Set Print Mail Service to: \n #{service}"
  web_apps.mail.netstamps.specify_service_drop_list.select service
end

Then /^Mail Stamps: Select Specify Mail Service Media Mail$/ do
  step "Mail Stamps: Set Specify Mail Service to Media Mail (2 - 3 Days)"
end

Then /^Mail Stamps: Select Specify Mail Service First Class$/ do
  step "Mail Stamps: Set Specify Mail Service to First Class Mail (1 - 3 Days)"
end

