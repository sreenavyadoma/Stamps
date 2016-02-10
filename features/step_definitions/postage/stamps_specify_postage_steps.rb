# encoding: utf-8

Then /^Stamps: Select Specify Postage Amount/ do
  log.info "Step:  Select Stamps Specify Postage Amount"
  @stamps = postage.stamps if @postage_form.nil?
  @stamps.specify_postage_amount
end

Then /^Stamps: Set Stamp Amount to \$(.*)$/ do |amount|
  log.info "Step:  Set Stamps Stamp Amount to $#{amount}"
  @stamps = postage.stamps if @postage_form.nil?
  @stamps.specify_postage_amount.stamp_amount.set amount
end

Then /^Stamps: Set Specify Postage Service to \"(.*)\"/ do |service|
  log.info "Step: Envelopes: Set Print Postage Service to: \n #{service}"
  @stamps.specify_postage_service.select service
end


