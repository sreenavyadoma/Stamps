Then /^Print Postage: Select Stamps$/ do
  step "Print Postage: Set Print On Stamps"
end

Then /^Print Postage: Select Shipping Label 5 x 8$/ do
  step "Print Postage: Set Print On Shipping Label - 5 ½” x 8 ½”"
end

Then /^Print Postage: Select Shipping Label 8 x 11$/ do
  step "Print Postage: Set Print On Shipping Label - 8 ½” x 11” Paper"
end

Then /^Print Postage: Select Shipping Label 4 x 6$/ do
  step "Print Postage: Set Print On Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”"
end

Then /^Print Postage: Select Envelope - #10$/ do
  step "Print Postage: Set Print On Envelope - #10, 4 ⅛” x 9 ½”"
end

Then /^Print Postage: Select Envelope - #6$/ do
  step "Print Postage: Set Print On Envelope - #6, 3 ⅝” x 6 ½”"
end

Then /^Print Postage: Select Envelope - #7$/ do
  step "Print Postage: Set Print On Envelope - #7, 3 ⅞” x 7 ½”"
end

Then /^Print Postage: Select Envelope - #9$/ do
  step "Print Postage: Set Print On Envelope - #9, 3 ⅞” x 8 ⅞”"
end

Then /^Print Postage: Select Envelope - #11$/ do
  step "Print Postage: Set Print On Envelope - #11, 4 ½” x 10 ⅜”"
end

Then /^Print Postage: Select Envelope - #12$/ do
  step "Print Postage: Set Print On Envelope - #12, 4 ¾” x 11”"
end

Then /^Print Postage: Select Envelope - #A2$/ do
  step "Print Postage: Set Print On Envelope - #A2, 4 ⅜” x 5 ¾”"
end

Then /^Print Postage: Select Envelope - #A9$/ do
  step "Print Postage: Set Print On Envelope - #A9, 5 ¾” x 8 ¾”"
end

Then /^Print Postage: Set Print On (.*)/ do |media|
  log.info "Print Postage: Set Print On #{media}"
  @print_postage = postage.print_on media
end

Then /^Envelopes: Set Ship-From to (.*)/ do |value|
  log.info "Step: Set Print Postage Ship-From to: \n #{value}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.ship_from.select value
end

Then /^Envelopes: Set Ship-To country to (.*)/ do |country|
  log.info "Step: Set Print Postage Country to: \n #{country}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.ship_to.country.select country
end

Then /^Print Postage: Set Ship-To to Random Address in Zone 2$/ do
  step "Print Postage: Set Ship-To address to zone 2"
end

Then /^Print Postage: Set Ship-To to Random Address in Zone 3$/ do
  step "Print Postage: Set Ship-To address to zone 3"
end

Then /^Print Postage: Set Ship-To to Random Address in Zone 4$/ do
  step "Print Postage: Set Ship-To address to zone 4"
end

Then /^Print Postage: Set Ship-To to Random Address in Zone 5$/ do
  step "Print Postage: Set Ship-To address to zone 5"
end

Then /^Print Postage: Set Ship-To to Random Address in Zone 6$/ do
  step "Print Postage: Set Ship-To address to zone 6"
end

Then /^Print Postage: Set Ship-To to Random Address in Zone 7$/ do
  step "Print Postage: Set Ship-To address to zone 7"
end

Then /^Print Postage: Set Ship-To to Random Address in Zone 8$/ do
  step "Print Postage: Set Ship-To address to zone 8"
end

Then /^Print Postage: Set Ship-To to Random Address Between Zone 1 through 4$/ do
  step "Print Postage: Set Ship-To address to zone 1 through 4"
end

Then /^Print Postage: Set Ship-To to Random Address Between Zone 5 through 8$/ do
  step "Print Postage: Set Ship-To address to zone 5 through 8"
end

Then /^Print Postage: Set Ship-To to$/ do |table|
  ship_to = OrdersHelper.instance.address_hash_to_str table.hashes.first
  log.info "Step: Envelopes: Set Print Postage Form Ship-To address to \n#{ship_to}"
  step "Print Postage: Set Ship-To address to #{ship_to}"
end

Then /^Print Postage: Set Ship-To address to (.*)$/ do |address|
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
      log.info "Print Postage: Set Ship-To to Random Address in Zone 1 = \"#{formatted_address}\""
    when /zone 2/
      address = test_helper.rand_zone_2
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Print Postage: Set Ship-To to Random Address in Zone 2 = \"#{formatted_address}\""
    when /zone 3/
      address = test_helper.rand_zone_3
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Print Postage: Set Ship-To to Random Address in Zone 3 = \"#{formatted_address}\""
    when /zone 4/
      address = test_helper.rand_zone_4
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Print Postage: Set Ship-To to Random Address in Zone 4 = \"#{formatted_address}\""
    when /zone 5/
      address = test_helper.rand_zone_5
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Print Postage: Set Ship-To to Random Address in Zone 5 = \"#{formatted_address}\""
    when /zone 6/
      address = test_helper.rand_zone_6
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Print Postage: Set Ship-To to Random Address in Zone 6 = \"#{formatted_address}\""
    when /zone 7/
      address = test_helper.rand_zone_7
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Print Postage: Set Ship-To to Random Address in Zone 7 = \"#{formatted_address}\""
    when /zone 8/
      address = test_helper.rand_zone_8
      formatted_address = OrdersHelper.instance.format_address address
      log.info "Print Postage: Set Ship-To to Random Address in Zone 8 = \"#{formatted_address}\""
    else
      formatted_address = OrdersHelper.instance.format_address address
  end

  @print_postage.ship_to.set formatted_address

end

Then /^Print Postage: Expect Print Media Tooltip to be (.*)$/ do |selection|
  postage.print_on.tooltip selection
end

Then /^Print Postage: Expect Print Media (.*) to be disabled$/ do |selection|
  postage.print_on.disabled? selection
end

Then /^Print Postage: Expect Print Media (.*) to be enabled$/ do |selection|
  postage.print_on.enabled? selection
end

Then /^Print Postage: Set Service to \"(.*)\"/ do |service|
  log.info "Step: Set Print Postage Service to: \n #{service}"
  @postage_form.service.select service
end

Then /^Print Postage: Set Ounces to (.*)/ do |ounces|
  log.info "Step: Set Print Postage Ounces to: \n #{ounces}"
  @postage_form.weight.ounces.set ounces
end

Then /^Print Postage: Set Pounds to (.*)/ do |pounds|
  log.info "Step: Set Print Postage Pounds to: \n #{pounds}"
  @postage_form.weight.pounds.set pounds
end

Then /^Print Postage: Set Ship-To address to$/ do |table|
  ship_to = PrintHelper.instance.address_hash_to_str table.hashes.first
  log.info "Step: Set Print Postage Form Ship-To address to \n#{ship_to}"
  step "Set Print Postage Form Ship-To address to #{ship_to}"
end

Then /^Print Postage: Set Ship-From to (.*)/ do |value|
  log.info "Step: Set Print Postage Ship-From to: \n #{value}"
  @postage_form.ship_from.select value
end

Then /^Print Postage: Set Ship-To country to (.*)/ do |country|
  log.info "Step: Set Print Postage Country to: \n #{country}"
  @postage_form.country.select country

end

Then /^Print Postage: Expect Ship-To address to be (.*)/ do |address|

end
