Then /^Envelopes: Set Ship-From to (.*)/ do |value|
  log.info "Step: Set Print Postage Ship-From to: \n #{value}"
  @envelope = postage.envelope if @envelope.nil?
  @envelope.ship_from.select value
end

Then /^Envelopes: Set Ship-To country to (.*)/ do |country|
  log.info "Step: Set Print Postage Country to: \n #{country}"
  @envelope = postage.envelope if @envelope.nil?
  @envelope.ship_to.country.select country
end

Then /^Envelopes: Set Ounces to (.*)/ do |ounces|
  log.info "Step: Envelopes: Set Print Postage Ounces to: \n #{ounces}"
  @envelope.weight.oz.set ounces
end

Then /^Envelopes: Set Pounds to (.*)/ do |pounds|
  log.info "Step: Envelopes: Set Print Postage Pounds to: \n #{pounds}"
  @envelope.weight.lbs.set pounds
end

Then /^Envelopes: Set Service to \"(.*)\"/ do |service|
  log.info "Step: Envelopes: Set Print Postage Service to: \n #{service}"
  @envelope.service.select service
end

Then /^Envelopes: Set Ship-To address to$/ do |table|
  ship_to = OrdersHelper.instance.address_hash_to_str table.hashes.first
  log.info "Step: Envelopes: Set Print Postage Form Ship-To address to \n#{ship_to}"
  step "Envelopes: Set Ship-To address to #{ship_to}"
end

Then /^Envelopes: Set Ship-To to Random Address in Zone 1$/ do
  step "Envelopes: Set Ship-To address to zone 1"
end

Then /^Envelopes: Set Ship-To to Random Address in Zone 2$/ do
  step "Envelopes: Set Ship-To address to zone 2"
end

Then /^Envelopes: Set Ship-To to Random Address in Zone 3$/ do
  step "Envelopes: Set Ship-To address to zone 3"
end

Then /^Envelopes: Set Ship-To to Random Address in Zone 4$/ do
  step "Envelopes: Set Ship-To address to zone 4"
end

Then /^Envelopes: Set Ship-To to Random Address in Zone 5$/ do
  step "Envelopes: Set Ship-To address to zone 5"
end

Then /^Envelopes: Set Ship-To to Random Address in Zone 6$/ do
  step "Envelopes: Set Ship-To address to zone 6"
end

Then /^Envelopes: Set Ship-To to Random Address in Zone 7$/ do
  step "Envelopes: Set Ship-To address to zone 7"
end

Then /^Envelopes: Set Ship-To to Random Address in Zone 8$/ do
  step "Envelopes: Set Ship-To address to zone 8"
end

Then /^Envelopes: Set Ship-To to Random Address Between Zone 1 through 4$/ do
  step "Envelopes: Set Ship-To address to zone 1 through 4"
end

Then /^Envelopes: Set Ship-To to Random Address Between Zone 5 through 8$/ do
  step "Envelopes: Set Ship-To address to zone 5 through 8"
end

Then /^Envelopes: Set Ship-To address to (.*)$/ do |address|
  log.info "Step: Shipping Labels: Set Ship-To address to \"#{address}\""

  case address.downcase
    when /zone 1 through 4/
      address = test_helper.rand_zone_1_4
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Envelopes: Set Ship-To random zone 1 through 4 address to \"#{formatted_address}\""
    when /zone 5 through 8/
      address = test_helper.rand_zone_5_8
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Envelopes: Set Ship-To random zone 5 through 8 address to \"#{formatted_address}\""
    when /zone 1/
      address = test_helper.rand_zone_1
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Envelopes: Set Ship-To to Random Address in Zone 1 = \"#{formatted_address}\""
    when /zone 2/
      address = test_helper.rand_zone_2
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Envelopes: Set Ship-To to Random Address in Zone 2 = \"#{formatted_address}\""
    when /zone 3/
      address = test_helper.rand_zone_3
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Envelopes: Set Ship-To to Random Address in Zone 3 = \"#{formatted_address}\""
    when /zone 4/
      address = test_helper.rand_zone_4
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Envelopes: Set Ship-To to Random Address in Zone 4 = \"#{formatted_address}\""
    when /zone 5/
      address = test_helper.rand_zone_5
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Envelopes: Set Ship-To to Random Address in Zone 5 = \"#{formatted_address}\""
    when /zone 6/
      address = test_helper.rand_zone_6
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Envelopes: Set Ship-To to Random Address in Zone 6 = \"#{formatted_address}\""
    when /zone 7/
      address = test_helper.rand_zone_7
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Envelopes: Set Ship-To to Random Address in Zone 7 = \"#{formatted_address}\""
    when /zone 8/
      address = test_helper.rand_zone_8
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Envelopes: Set Ship-To to Random Address in Zone 8 = \"#{formatted_address}\""
    else
      formatted_address = OrdersHelper.instance.format_address address
  end

  @envelope.ship_to.set formatted_address

end

Then /^Envelopes: Set Include Return Address to Checked$/ do
  log.info "Step: Shipping Labels: Check Include Return Address"
  @envelope = postage.envelope if @envelope.nil?
  @envelope.form_view.include_return_address.check
end

Then /^Envelopes: Set Include Return Address to Unchecked$/ do
  log.info "Step: Shipping Labels: Uncheck Include Return Address"
  @envelope = postage.envelope if @envelope.nil?
  @envelope.form_view.include_return_address.uncheck
end

Then /^Envelopes: Set Include Delivery Address to Checked$/ do
  log.info "Step: Shipping Labels: Check Include Delivery Address"
  @envelope = postage.envelope if @envelope.nil?
  @envelope.form_view.include_delivery_address.check
end

Then /^Envelopes: Set Include Delivery Address to Unchecked$/ do
  log.info "Step: Shipping Labels: Uncheck Include Delivery Address"
  @envelope = postage.envelope if @envelope.nil?
  @envelope.form_view.include_delivery_address.uncheck
end

Then /^Envelopes: Set Include Postage to Checked$/ do
  log.info "Step: Shipping Labels: Check Include Postage"
  @envelope = postage.envelope if @envelope.nil?
  @envelope.form_view.include_postage.check
end

Then /^Envelopes: Set Include Postage to Unchecked$/ do
  log.info "Step: Shipping Labels: Uncheck Include Postage"
  @envelope = postage.envelope if @envelope.nil?
  @envelope.form_view.include_postage.uncheck
end

Then /^Envelopes: Set Reference Number to (.*)/ do |ref_no|
  log.info "Set Envelope Reference Number to #{ref_no}"
  @envelope = postage.envelope if @envelope.nil?
  @envelope.form_view.reference_number.set ref_no
end

Then /^Envelopes: Set Cost Code to (.*)/ do |code|
  log.info "Step: Envelopes: Set Cost Code to \n #{code}"
  @envelope = postage.envelope if @envelope.nil?
  @envelope.form_view.cost_code.select code
end