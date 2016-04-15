# encoding: utf-8

Then /^Stamps: Set Serial Number to (.*)/ do |serial|
  log.info "Set Stamps Serial Number to #{serial}"
  @print_postage = postage.print_postage if @print_postage.nil?

  if serial == 'random'
    serial = "B#{Random.rand(10000..99999)}"
  end
  serial_prefix = serial.split('')[0]
  @print_postage.serial.set serial
  log.info "Serial prefix: #{serial_prefix}"
  log.info "Preview image: #{(@print_postage.form_view.preview_image(serial_prefix).present?)?"YES": "NO"}"
end

Then /^Stamps: Set Ship-From to (.*)/ do |value|
  log.info "Step: Set Print Postage Ship-From to: \n #{value}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.ship_from.select value
end

Then /^Stamps: Set Ship-To country to (.*)/ do |country|
  log.info "Step: Set Print Postage Country to: \n #{country}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.country.select country
end

Then /^Stamps: Set Ounces to (.*)/ do |ounces|
  log.info "Step: Stamps: Set Ounces to: \n #{ounces}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.weight.oz.set ounces
end

Then /^Stamps: Set Pounds to (.*)/ do |pounds|
  log.info "Step: Stamps: Set Pounds to: \n #{pounds}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.weight.lbs.set pounds
end

Then /^Stamps: Set Quantity to (.*)/ do |qty|
  log.info "Step: Stamps: Set Quantity to: \n #{qty}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.quantity.set qty
end

Then /^Stamps: Set Print All to Checked$/ do
  log.info "Step: Stamps: Check Print All"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.print_all.check
end

Then /^Stamps: Set Print All to Unchecked$/ do
  log.info "Step: Stamps: Uncheck Print All"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.print_all.uncheck
end

Then /^Stamps: Set Reference Number to (.*)/ do |ref_no|
  log.info "Set Stamps Reference Number to #{ref_no}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.reference_number.set ref_no
end

Then /^Stamps: Set Cost Code to (.*)/ do |code|
  log.info "Step: Stamps: Set Cost Code to \n #{code}"
  @print_postage = postage.print_postage if @print_postage.nil?
  @print_postage.form_view.cost_code.select code
end

Then /^Create page objects for Print On Shipping Label$/ do
  random_ship_to_address = test_helper.rand_zone_1_4
  formatted_address = OrdersHelper.instance.format_address(random_ship_to_address)

  shipping_label = postage.print_on "Shipping Label - 8 ½” x 11” Paper"

  shipping_label.ship_to.domestic.delivery_address.set formatted_address
  log.info shipping_label.ship_to.domestic.delivery_address.text

  shipping_label.email_tracking.checkbox.check
  shipping_label.email_tracking.checkbox.uncheck
  shipping_label.email_tracking.checkbox.check
  log.info shipping_label.email_tracking.checkbox.checked?
  shipping_label.email_tracking.text_box.set "testuser123@stamps.com"
  log.info shipping_label.email_tracking.tooltip



  #international_shipping_address = shipping_label.country.select "Canada"
  #shipping_label.ship_from.select ""
end


