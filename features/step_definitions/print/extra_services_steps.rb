Then /^Postage Extra Services: Set COD to \$(\d+)/ do |amount|
  @extra_services.cod.set amount
end

Then /^Postage Extra Services: Click Save/ do
  @extra_services.save
end

Then /^Postage Extra Services: Set Security to (.*)/ do |security|
  @extra_services.security.select security
end

Then /^Postage Extra Services: Set Security Value to \$(\d+)/ do |value|
  @extra_services.security_value.set value
end

Then /^Postage Extra Services: Set Handling to (.*)/ do |handling|
  @extra_services.handling.select handling
  if handling == 'Live Animal (with Fee)' || handling == 'Live Animal' || handling == 'Hazardous Materials'
    @extra_services.special_contents_modal.save
  end
end

Then /^Postage Extra Services: Set Return Receipt to Checked$/ do
  log.info "Postage Extra Services: Check Return Receipt"
  @extra_services.return_receipt.checkbox.check
end

Then /^Postage Extra Services: Set Return Receipt to Unchecked$/ do
  log.info "Postage Extra Services: Uncheck Return Receipt"
  @extra_services.return_receipt.checkbox.uncheck
end

Then /^Postage Extra Services: Set Electronic Return Receipt to Checked$/ do
  log.info "Postage Extra Services: Check Electronic Return Receipt"
  @extra_services.electronic_return_receipt.checkbox.check
end

Then /^Postage Extra Services: Set Electronic Return Receipt to Unchecked$/ do
  log.info "Postage Extra Services: Electronic Uncheck Return Receipt"
  @extra_services.electronic_return_receipt.checkbox.uncheck
end

Then /^Postage Extra Services: Set Restricted Delivery to Checked$/ do
  log.info "Postage Extra Services: Check Restricted Delivery"
  @extra_services.restricted_delivery.checkbox.check
end

Then /^Postage Extra Services: Set Restricted Delivery to Unchecked$/ do
  log.info "Postage Extra Services: Uncheck Restricted Delivery"
  @extra_services.restricted_delivery.checkbox.uncheck
end

Then /^Postage Extra Services: Set Notice of Non-Delivery to Checked$/ do
  log.info "Postage Extra Services: Check Notice of Non-Delivery"
  @extra_services.non_delivery_notice.checkbox.check
end

Then /^Postage Extra Services: Set Notice of Non-Delivery to Unchecked$/ do
  log.info "Postage Extra Services: Uncheck Notice of Non-Delivery"
  @extra_services.non_delivery_notice.checkbox.uncheck
end

Then /^Postage Extra Services: Set Fragile to Checked$/ do
  log.info "Postage Extra Services: Check Fragile"
  @extra_services.fragile.checkbox.check
end

Then /^Postage Extra Services: Set Fragile to Unchecked$/ do
  log.info "Postage Extra Services: Uncheck Fragile"
  @extra_services.fragile.checkbox.uncheck
end

Then /^Postage Extra Services: Set Return Receipt for Merchandise to Checked$/ do
  log.info "Postage Extra Services: Check Return Receipt for Merchandise"
  @extra_services.merchandise_return_receipt.checkbox.check
end

Then /^Postage Extra Services: Set Return Receipt for Merchandise to Unchecked$/ do
  log.info "Postage Extra Services: Uncheck Return Receipt for Merchandise"
  @extra_services.merchandise_return_receipt.checkbox.uncheck
end

Then /^Postage Extra Services: Set Non-Rectangular to Checked$/ do
  log.info "Postage Extra Services: Check Non-Rectangular"
  @extra_services.non_rectangular.checkbox.check
  sleep 2
end

Then /^Postage Extra Services: Set Non-Rectangular to Unchecked$/ do
  log.info "Postage Extra Services: Uncheck Non-Rectangular"
  @extra_services.non_rectangular.checkbox.uncheck

end



