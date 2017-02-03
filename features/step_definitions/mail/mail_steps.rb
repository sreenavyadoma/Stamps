# encoding: utf-8

Then /^Mail Stamps: Set Serial Number to (.*)/ do |serial|
  #logger.step "Set Stamps Serial Number to #{serial}"

  if serial == 'random'
    serial = "B#{Random.rand(10000..99999)}"
  end
  serial_prefix = serial.split('')[0]
  stamps.mail.netstamps.serial.set serial
  #logger.step "Serial prefix: #{serial_prefix}"
end

Then /^Mail Stamps: Set Ship-From to (.*)/ do |value|
  #logger.step "Set Print Mail Ship-From to: \n #{value}"
  stamps.mail.netstamps.ship_from.select(value)
end

Then /^Mail Stamps: Set Ship-To country to (.*)/ do |country|
  #logger.step "Set Print Mail Country to: \n #{country}"
  stamps.mail.netstamps.ship_to.country.select country
end

Then /^Mail Stamps: Set Ounces to (.*)/ do |ounces|
  #logger.step "Mail Stamps: Set Ounces to: \n #{ounces}"
  stamps.mail.netstamps.weight.oz.set ounces
end

Then /^Mail Stamps: Set Pounds to (.*)/ do |pounds|
  #logger.step "Mail Stamps: Set Pounds to: \n #{pounds}"
  
  stamps.mail.netstamps.weight.lb.set pounds
end

Then /^Mail Stamps: Set Quantity to (.*)/ do |qty|
  #logger.step "Mail Stamps: Set Quantity to: \n #{qty}"
  
  stamps.mail.netstamps.form_view.quantity.set qty
end

Then /^Mail Stamps: Set Print All to Checked$/ do
  #logger.step "Mail Stamps: Check Print All"
  
  stamps.mail.netstamps.form_view.print_all.check
end

Then /^Mail Stamps: Set Print All to Unchecked$/ do
  #logger.step "Mail Stamps: Uncheck Print All"
  
  stamps.mail.netstamps.form_view.print_all.uncheck
end

Then /^Mail Stamps: Set Reference Number to (.*)/ do |ref_no|
  #logger.step "Set Stamps Reference Number to #{ref_no}"
  
  stamps.mail.netstamps.form_view.reference_number.set ref_no
end

Then /^Mail Stamps: Set Cost Code to (.*)/ do |code|
  #logger.step "Mail Stamps: Set Cost Code to \n #{code}"
  
  stamps.mail.netstamps.form_view.cost_code.select code
end

Then /^Create page objects for Print On Shipping Label$/ do
  random_ship_to_address = ParameterHelper.rand_zone_1_4
  formatted_address = ParameterHelper.format_address(random_ship_to_address)

  shipping_label = stamps.mail.netstamps.print_on "Shipping Label - 8 ½” x 11” Paper"

  shipping_label.ship_to.domestic.delivery_address.set formatted_address
  logger.step shipping_label.ship_to.domestic.delivery_address.text

  shipping_label.email_tracking.checkbox.check
  shipping_label.email_tracking.checkbox.uncheck
  shipping_label.email_tracking.checkbox.check
  logger.step shipping_label.email_tracking.checkbox.checked?
  shipping_label.email_tracking.text_box.set "testuser123@stamps.com"
  logger.step shipping_label.email_tracking.tooltip



  #international_shipping_address = shipping_label.country.select "Canada"
  #shipping_label.ship_from.select ""
end


