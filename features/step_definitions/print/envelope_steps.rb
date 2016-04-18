

Then /^Postage Envelopes: Set Ounces to (.*)/ do |ounces|
  log.info "Step: Envelopes: Set Print Postage Ounces to: \n #{ounces}"
  @print_postage.weight.oz.set ounces
end

Then /^Postage Envelopes: Set Pounds to (.*)/ do |pounds|
  log.info "Step: Postage Envelopes: Set Print Postage Pounds to: \n #{pounds}"
  @print_postage.weight.lbs.set pounds
end

Then /^Postage Envelopes: Select Service First-Class Mail Letter$/ do
  step "Postage Envelopes: Set Service to First-Class Mail Letter"
end

Then /^Postage Envelopes: Set Service to (.*)/ do |service|
  log.info "Step: Postage Envelopes: Set Print Postage Service to: \n #{service}"
  @print_postage.service.select service
end

Then /^Postage Envelopes: Set Include Return Address to Checked$/ do
  log.info "Step: Postage Envelopes:  Check Include Return Address"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.include_return_address.check
end

Then /^Postage Envelopes: Set Include Return Address to Unchecked$/ do
  log.info "Step: Postage Envelopes: Uncheck Include Return Address"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.include_return_address.uncheck
end

Then /^Postage Envelopes: Set Include Delivery Address to Checked$/ do
  log.info "Step: Postage Envelopes: Check Include Delivery Address"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.include_delivery_address.check
end

Then /^Postage Envelopes: Set Include Delivery Address to Unchecked$/ do
  log.info "Step: Postage Envelopes: Uncheck Include Delivery Address"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.include_delivery_address.uncheck
end

Then /^Postage Envelopes: Set Include Postage to Checked$/ do
  log.info "Step: Postage Envelopes: Check Include Postage"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.include_postage.check
end

Then /^Postage Envelopes: Set Include Postage to Unchecked$/ do
  log.info "Step: Postage Envelopes: Uncheck Include Postage"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.include_postage.uncheck
end

Then /^Postage Envelopes: Set Reference Number to (.*)/ do |ref_no|
  log.info "Step: Postage Envelopes: Set Reference Number to #{ref_no}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.reference_number.set ref_no
end

Then /^Postage Envelopes: Set Cost Code to (.*)/ do |code|
  log.info "Step: Postage Envelopes: Set Cost Code to \n #{code}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.cost_code.select code
end