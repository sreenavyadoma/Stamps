

Then /^Envelopes: Set Ounces to (.*)/ do |ounces|
  log.info "Step: Envelopes: Set Print Postage Ounces to: \n #{ounces}"
  @print_postage.weight.oz.set ounces
end

Then /^Envelopes: Set Pounds to (.*)/ do |pounds|
  log.info "Step: Envelopes: Set Print Postage Pounds to: \n #{pounds}"
  @print_postage.weight.lbs.set pounds
end

Then /^Envelopes: Select Service First-Class Mail Envelope$/ do
  step "Envelopes: Set Service to First-Class Mail Envelope"
end

Then /^Envelopes: Set Service to (.*)/ do |service|
  log.info "Step: Envelopes: Set Print Postage Service to: \n #{service}"
  @print_postage.service.select service
end

Then /^Postage: Set Ship-To to Random Address in Zone 1$/ do
  step "Postage: Set Ship-To to zone 1"
end

Then /^Envelopes: Set Include Return Address to Checked$/ do
  log.info "Step: Shipping Labels: Check Include Return Address"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.include_return_address.check
end

Then /^Envelopes: Set Include Return Address to Unchecked$/ do
  log.info "Step: Shipping Labels: Uncheck Include Return Address"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.include_return_address.uncheck
end

Then /^Envelopes: Set Include Delivery Address to Checked$/ do
  log.info "Step: Shipping Labels: Check Include Delivery Address"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.include_delivery_address.check
end

Then /^Envelopes: Set Include Delivery Address to Unchecked$/ do
  log.info "Step: Shipping Labels: Uncheck Include Delivery Address"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.include_delivery_address.uncheck
end

Then /^Envelopes: Set Include Postage to Checked$/ do
  log.info "Step: Shipping Labels: Check Include Postage"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.include_postage.check
end

Then /^Envelopes: Set Include Postage to Unchecked$/ do
  log.info "Step: Shipping Labels: Uncheck Include Postage"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.include_postage.uncheck
end

Then /^Envelopes: Set Reference Number to (.*)/ do |ref_no|
  log.info "Set Envelope Reference Number to #{ref_no}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.reference_number.set ref_no
end

Then /^Envelopes: Set Cost Code to (.*)/ do |code|
  log.info "Step: Envelopes: Set Cost Code to \n #{code}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.cost_code.select code
end