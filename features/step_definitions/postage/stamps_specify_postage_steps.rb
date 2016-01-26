# encoding: utf-8

Then /^Select Stamps Specify Postage Amount/ do
  log.info "Step:  Select Stamps Specify Postage Amount"
  @postage_form = postage.stamps if @postage_form.nil?
  @postage_form.specify_postage_amount
end

Then /^Set Stamps Stamp Amount to \$(.*)$/ do |amount|
  log.info "Step:  Set Stamps Stamp Amount to $#{amount}"
  @postage_form = postage.stamps if @postage_form.nil?
  @postage_form.specify_postage_amount.stamp_amount.set amount
end
