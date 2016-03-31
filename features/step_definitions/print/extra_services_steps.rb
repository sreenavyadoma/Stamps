Then /^Extra Services: Set COD to \$(\d+)/ do |amount|
  @extra_services.cod.set amount
end

Then /^Extra Services: Click Save/ do
  @extra_services.save
end

Then /^Extra Services: Set Security to (.*)/ do |security|
  @extra_services.security.select security
end

Then /^Extra Services: Set Security Value to \$(\d+)/ do |value|
  @extra_services.security_value.set value
end

Then /^Extra Services: Set Handling to (.*)/ do |handling|
  @extra_services.handling.select handling
  if handling == 'Live Animal (with Fee)' || handling == 'Live Animal' || handling == 'Hazardous Materials'
    @extra_services.special_contents_modal.save
  end
end

Then /^Extra Services: Set Return Receipt to Checked$/ do
  log.info "Step: Extra Services: Check Return Receipt"
  @extra_services.return_receipt.checkbox.check
end

Then /^Extra Services: Set Return Receipt to Unchecked$/ do
  log.info "Step: Extra Services: Uncheck Return Receipt"
  @extra_services.return_receipt.checkbox.uncheck
end

Then /^Extra Services: Set Electronic Return Receipt to Checked$/ do
  log.info "Step: Extra Services: Check Electronic Return Receipt"
  @extra_services.electronic_return_receipt.checkbox.check
end

Then /^Extra Services: Set Electronic Return Receipt to Unchecked$/ do
  log.info "Step: Extra Services: Electronic Uncheck Return Receipt"
  @extra_services.electronic_return_receipt.checkbox.uncheck
end

Then /^Extra Services: Set Restricted Delivery to Checked$/ do
  log.info "Step: Extra Services: Check Restricted Delivery"
  @extra_services.restricted_delivery.checkbox.check
end

Then /^Extra Services: Set Restricted Delivery to Unchecked$/ do
  log.info "Step: Extra Services: Uncheck Restricted Delivery"
  @extra_services.restricted_delivery.checkbox.uncheck
end

Then /^Extra Services: Set Notice of Non-Delivery to Checked$/ do
  log.info "Step: Extra Services: Check Notice of Non-Delivery"
  @extra_services.non_delivery_notice.checkbox.check
end

Then /^Extra Services: Set Notice of Non-Delivery to Unchecked$/ do
  log.info "Step: Extra Services: Uncheck Notice of Non-Delivery"
  @extra_services.non_delivery_notice.checkbox.uncheck
end

Then /^Extra Services: Set Fragile to Checked$/ do
  log.info "Step: Extra Services: Check Fragile"
  @extra_services.fragile.checkbox.check
end

Then /^Extra Services: Set Fragile to Unchecked$/ do
  log.info "Step: Extra Services: Uncheck Fragile"
  @extra_services.fragile.checkbox.uncheck
end

Then /^Extra Services: Set Return Receipt for Merchandise to Checked$/ do
  log.info "Step: Extra Services: Check Return Receipt for Merchandise"
  @extra_services.merchandise_return_receipt.checkbox.check
end

Then /^Extra Services: Set Return Receipt for Merchandise to Unchecked$/ do
  log.info "Step: Extra Services: Uncheck Return Receipt for Merchandise"
  @extra_services.merchandise_return_receipt.checkbox.uncheck
end

Then /^Extra Services: Set Non-Rectangular to Checked$/ do
  log.info "Step: Extra Services: Check Non-Rectangular"
  @extra_services.non_rectangular.checkbox.check
  sleep 2
end

Then /^Extra Services: Set Non-Rectangular to Unchecked$/ do
  log.info "Step: Extra Services: Uncheck Non-Rectangular"
  @extra_services.non_rectangular.checkbox.uncheck

end



