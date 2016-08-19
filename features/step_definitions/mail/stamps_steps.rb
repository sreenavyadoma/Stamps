# encoding: utf-8

Then /^Postage Stamps: Set Serial Number to (.*)/ do |serial|
  logger.info "Set Stamps Serial Number to #{serial}"
  
  if serial == 'random'
    serial = "B#{Random.rand(10000..99999)}"
  end
  serial_prefix = serial.split('')[0]
  web_apps.mail.net_stamps.serial.set serial
  logger.info "Serial prefix: #{serial_prefix}"
  logger.info "Preview image: #{(web_apps.mail.net_stamps.form_view.preview_image(serial_prefix).present?)?"YES": "NO"}"
end

Then /^Postage Stamps: Set Ship-From to (.*)/ do |value|
  logger.info "Set Print Postage Ship-From to: \n #{value}"
  web_apps.mail.net_stamps.ship_from.select value
end

Then /^Postage Stamps: Set Ship-To country to (.*)/ do |country|
  logger.info "Set Print Postage Country to: \n #{country}"
  web_apps.mail.net_stamps.ship_to.country.select country
end

Then /^Postage Stamps: Set Ounces to (.*)/ do |ounces|
  logger.info "Postage Stamps: Set Ounces to: \n #{ounces}"
  web_apps.mail.net_stamps.weight.oz.set ounces
end

Then /^Postage Stamps: Set Pounds to (.*)/ do |pounds|
  logger.info "Postage Stamps: Set Pounds to: \n #{pounds}"
  
  web_apps.mail.net_stamps.weight.lbs.set pounds
end

Then /^Postage Stamps: Set Quantity to (.*)/ do |qty|
  logger.info "Postage Stamps: Set Quantity to: \n #{qty}"
  
  web_apps.mail.net_stamps.form_view.quantity.set qty
end

Then /^Postage Stamps: Set Print All to Checked$/ do
  logger.info "Postage Stamps: Check Print All"
  
  web_apps.mail.net_stamps.form_view.print_all.check
end

Then /^Postage Stamps: Set Print All to Unchecked$/ do
  logger.info "Postage Stamps: Uncheck Print All"
  
  web_apps.mail.net_stamps.form_view.print_all.uncheck
end

Then /^Postage Stamps: Set Reference Number to (.*)/ do |ref_no|
  logger.info "Set Stamps Reference Number to #{ref_no}"
  
  web_apps.mail.net_stamps.form_view.reference_number.set ref_no
end

Then /^Postage Stamps: Set Cost Code to (.*)/ do |code|
  logger.info "Postage Stamps: Set Cost Code to \n #{code}"
  
  web_apps.mail.net_stamps.form_view.cost_code.select code
end

Then /^Create page objects for Print On Shipping Label$/ do
  random_ship_to_address = ParameterHelper.rand_zone_1_4
  formatted_address = ParameterHelper.format_address(random_ship_to_address)

  shipping_label = web_apps.mail.net_stamps.print_on "Shipping Label - 8 ½” x 11” Paper"

  shipping_label.ship_to.domestic.delivery_address.set formatted_address
  logger.info shipping_label.ship_to.domestic.delivery_address.text

  shipping_label.email_tracking.checkbox.check
  shipping_label.email_tracking.checkbox.uncheck
  shipping_label.email_tracking.checkbox.check
  logger.info shipping_label.email_tracking.checkbox.checked?
  shipping_label.email_tracking.text_box.set "testuser123@stamps.com"
  logger.info shipping_label.email_tracking.tooltip



  #international_shipping_address = shipping_label.country.select "Canada"
  #shipping_label.ship_from.select ""
end


