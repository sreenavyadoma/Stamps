# encoding: utf-8

Then /^Postage Stamps: Select Specify Postage Amount/ do
  log.info "Step:  Select Stamps Specify Postage Amount"
  @print_postage.specify_postage_amount
end

Then /^Postage Stamps: Set Stamp Amount to \$(.*)$/ do |amount|
  log.info "Step:  Set Stamps Stamp Amount to $#{amount}"
  @print_postage.specify_postage_amount.stamp_amount.set amount
end

Then /^Postage Stamps: Set Specify Postage Service to (.*)/ do |service|
  log.info "Step: Envelopes: Set Print Postage Service to: \n #{service}"
  @print_postage.specify_postage_service.select service
end

Then /^Postage Stamps: Select Specify Postage Service Media Mail$/ do
  step "Postage Stamps: Set Specify Postage Service to Media Mail (2 - 3 Days)"
end

Then /^Postage Stamps: Select Specify Postage Service First Class$/ do
  step "Postage Stamps: Set Specify Postage Service to First Class (1 - 3 Days)"
end

