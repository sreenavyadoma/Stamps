# encoding: utf-8

Then /^Select Stamps Specify Postage Amount/ do
  @postage_form.specify_postage_button.click
end

Then /^Set Stamps Stamp Amount to \$(.*)$/ do |amount|
  @postage_form.stamp_amount.textbox.set amount
  log.info "done"
end

