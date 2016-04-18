# encoding: utf-8

Then /^Postage Stamps: Select Specify Postage Amount/ do
  log.info "Step:  Select Stamps Specify Postage Amount"
  @print_postage = postage.print_postage if @postage_form.nil?
  @print_postage.specify_postage_amount
end

Then /^Postage Stamps: Set Stamp Amount to \$(.*)$/ do |amount|
  log.info "Step:  Set Stamps Stamp Amount to $#{amount}"
  @print_postage = postage.print_postage if @postage_form.nil?
  @print_postage.specify_postage_amount.stamp_amount.set amount
end

Then /^Postage Stamps: Set Specify Postage Service to \"(.*)\"/ do |service|
  log.info "Step: Envelopes: Set Print Postage Service to: \n #{service}"
  @print_postage.specify_postage_service.select service
end


