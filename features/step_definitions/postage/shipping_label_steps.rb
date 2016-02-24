Then /^Shipping Labels: Set Ship-From to (.*)/ do |value|
  log.info "Step: Shipping Labels - Set Print Postage Ship-From to: \n #{value}"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.ship_from.select value
end

Then /^Shipping Labels: Set Ship-To country to (.*)/ do |country|
  log.info "Step: Shipping Labels - Set Print Postage Country to: \n #{country}"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.ship_to.country.select country
end

Then /^Shipping Labels: Set Ounces to (.*)/ do |ounces|
  log.info "Step: Shipping Labels - Set Print Postage Ounces to: \n #{ounces}"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.weight.oz.set ounces
end

Then /^Shipping Labels: Set Pounds to (.*)/ do |pounds|
  log.info "Step: Shipping Labels - Set Print Postage Pounds to: \n #{pounds}"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.weight.lbs.set pounds
end

Then /^Shipping Labels: Set Service to \"(.*)\"/ do |service|
  log.info "Step: Shipping Labels - Set Print Postage Service to: \n #{service}"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.service.select service
end

Then /^Shipping Labels: Set Ship-To address to$/ do |table|
  ship_to = OrdersHelper.instance.address_hash_to_str table.hashes.first
  log.info "Step: Shipping Labels - Set Print Postage Form Ship-To address to \n#{ship_to}"
  step "Shipping Labels: Set Ship-To address to #{ship_to}"
end



Then /^Shipping Labels: Open Extra Services$/ do
  log.info "Step: Shipping Labels: Open Extra Services"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @extra_services = @shipping_label.extra_services
end

Then /^Shipping Labels: Open Customs Form$/ do
  log.info "Step: Shipping Labels: Open Customs Form"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @customs_form = @shipping_label.customs
end

Then /^Shipping Labels: Open Contacts modal/ do
  log.info "Step: Shipping Labels: Open Contacts Modal"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @contacts = @shipping_label.contacts.open
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 1$/ do
  step "Shipping Labels: Set Ship-To address to zone 1"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 2$/ do
  step "Shipping Labels: Set Ship-To address to zone 2"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 3$/ do
  step "Shipping Labels: Set Ship-To address to zone 3"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 4$/ do
  step "Shipping Labels: Set Ship-To address to zone 4"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 5$/ do
  step "Shipping Labels: Set Ship-To address to zone 5"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 6$/ do
  step "Shipping Labels: Set Ship-To address to zone 6"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 7$/ do
  step "Shipping Labels: Set Ship-To address to zone 7"
end

Then /^Shipping Labels: Set Ship-To to Random Address in Zone 8$/ do
  step "Shipping Labels: Set Ship-To address to zone 8"
end

Then /^Shipping Labels: Set Ship-To to Random Address Between Zone 1 through 4$/ do
  step "Shipping Labels: Set Ship-To address to zone 1 through 4"
end

Then /^Shipping Labels: Set Ship-To to Random Address Between Zone 5 through 8$/ do
  step "Shipping Labels: Set Ship-To address to zone 5 through 8"
end

Then /^Shipping Labels: Set Ship-To address to (.*)$/ do |address|
  log.info "Step: Shipping Labels: Set Ship-To address to \"#{address}\""
  @shipping_label = postage.shipping_label if @shipping_label.nil?

  case address.downcase
    when /zone 1 through 4/
      address = test_helper.rand_zone_1_4
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To random zone 1 through 4 address to \"#{formatted_address}\""
    when /zone 5 through 8/
      address = test_helper.rand_zone_5_8
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To random zone 5 through 8 address to \"#{formatted_address}\""
    when /zone 1/
      address = test_helper.rand_zone_1
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 1 = \"#{formatted_address}\""
    when /zone 2/
      address = test_helper.rand_zone_2
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 2 = \"#{formatted_address}\""
    when /zone 3/
      address = test_helper.rand_zone_3
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 3 = \"#{formatted_address}\""
    when /zone 4/
      address = test_helper.rand_zone_4
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 4 = \"#{formatted_address}\""
    when /zone 5/
      address = test_helper.rand_zone_5
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 5 = \"#{formatted_address}\""
    when /zone 6/
      address = test_helper.rand_zone_6
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 6 = \"#{formatted_address}\""
    when /zone 7/
      address = test_helper.rand_zone_7
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 7 = \"#{formatted_address}\""
    when /zone 8/
      address = test_helper.rand_zone_8
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Shipping Labels: Set Ship-To to Random Address in Zone 8 = \"#{formatted_address}\""
    else
      formatted_address = OrdersHelper.instance.format_address address
  end

  @shipping_label.ship_to.set formatted_address

end

Then /^Shipping Label: Expect Domestic Address field displays (.*)$/ do |value|
  log.info "Step: Shipping Label: Expect Domestic Address to be #{value}"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  5.times{
    begin
      actual = @shipping_label.ship_to.text_area.text
      actual_stripped = actual.gsub(/ \n/,", ")
      actual_stripped_final = actual_stripped.gsub(/\n/,", ")
      break if actual_stripped_final == value
      sleep 2
    end
  }
  actual = @shipping_label.ship_to.text_area.text
  actual_stripped = actual.gsub(/ \n/,", ")
  actual_stripped_final = actual_stripped.gsub(/\n/,", ")
  #log_expectation_eql "Address text", value, actual_stripped
  actual_stripped_final.should eql value
  log.info 'Address Cleansed -- Expected Result Confirmed'
end

Then /^Shipping Labels: Set Hide Postage Value to Checked$/ do
  log.info "Step: Shipping Labels: Check Hide Postage Value"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.form_view.hide_postage_value.check
end

Then /^Shipping Labels: Set Hide Postage Value to Unchecked$/ do
  log.info "Step: Shipping Labels: Uncheck Hide Postage Value"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.form_view.hide_postage_value.uncheck
end

Then /^Shipping Labels: Set Print Receipt to Checked$/ do
  log.info "Step: Shipping Labels: Check Print Receipt"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.form_view.print_receipt.check
end

Then /^Shipping Labels: Set Print Receipt to Unchecked$/ do
  log.info "Step: Shipping Labels: Uncheck Print Receipt"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.form_view.print_receipt.uncheck
end

Then /^Shipping Labels: Set Print Reference Number to Checked$/ do
  log.info "Step: Shipping Labels: Check Print Reference Number"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.form_view.print_reference_number.check
end

Then /^Shipping Labels: Set Print Reference Number to Unchecked$/ do
  log.info "Step: Shipping Labels: Uncheck Print Reference Number"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.form_view.print_reference_number.uncheck
end

Then /^Shipping Labels: Set Reference Number to (.*)/ do |ref_no|
  log.info "Set Shipping Label Reference Number to #{ref_no}"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.form_view.reference_number.set ref_no
end

Then /^Shipping Labels: Set Cost Code to (.*)/ do |code|
  log.info "Step: Shipping Labels: Set Cost Code to \n #{code}"
  @shipping_label = postage.shipping_label if @shipping_label.nil?
  @shipping_label.form_view.cost_code.select code
end