# encoding: utf-8

Then /^Stamps: Set Serial Number to (.*)/ do |serial|
  log.info "Set Stamps Serial Number to #{serial}"
  @stamps = postage.stamps if @stamps.nil?
  @stamps.serial.set serial
end

Then /^Stamps: Set Ship-From to (.*)/ do |value|
  log.info "Step: Set Print Postage Ship-From to: \n #{value}"
  @stamps.ship_from.select value
end

Then /^Stamps: Set Ship-To country to (.*)/ do |country|
  log.info "Step: Set Print Postage Country to: \n #{country}"
  @stamps.country.select country
end

Then /^Stamps: Set Ounces to (.*)/ do |ounces|
  log.info "Step: Envelopes: Set Print Postage Ounces to: \n #{ounces}"
  @stamps.weight.ounces.set ounces
end

Then /^Stamps: Set Pounds to (.*)/ do |pounds|
  log.info "Step: Envelopes: Set Print Postage Pounds to: \n #{pounds}"
  @stamps.weight.pounds.set pounds
end





Then /^This works$/ do
  postage.print_on "Shipping Label - 8 ½” x 11” Paper"
  log.info postage.print_on.tooltip "Shipping Label - 8 ½” x 11” Paper"
  log.info postage.print_on.text_box.text

  postage.print_on "Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”"
  log.info postage.print_on.tooltip "Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”"
  log.info postage.print_on.text_box.text

  postage.print_on "Shipping Label - 5 ½” x 8 ½”"
  log.info postage.print_on.tooltip "Shipping Label - 5 ½” x 8 ½”"
  log.info postage.print_on.text_box.text

  postage.print_on "Envelope - #10, 4 ⅛” x 9 ½”"
  log.info postage.print_on.tooltip "Envelope - #10, 4 ⅛” x 9 ½”"
  log.info postage.print_on.text_box.text

  postage.print_on "Envelope - #9, 3 ⅞” x 8 ⅞”"
  log.info postage.print_on.tooltip "Envelope - #9, 3 ⅞” x 8 ⅞”"
  log.info postage.print_on.text_box.text

  postage.print_on "Envelope - #A9, 5 ¾” x 8 ¾”"
  log.info postage.print_on.tooltip "Envelope - #A9, 5 ¾” x 8 ¾”"
  log.info postage.print_on.text_box.text

  postage.print_on "Envelope - #6, 3 ⅝” x 6 ½”"
  log.info postage.print_on.tooltip "Envelope - #6, 3 ⅝” x 6 ½”"
  log.info postage.print_on.text_box.text

  postage.print_on "Envelope - #A2, 4 ⅜” x 5 ¾”"
  log.info postage.print_on.tooltip "Envelope - #A2, 4 ⅜” x 5 ¾”"
  log.info postage.print_on.text_box.text

  postage.print_on "Envelope - #7, 3 ⅞” x 7 ½”"
  log.info postage.print_on.tooltip "Envelope - #7, 3 ⅞” x 7 ½”"
  log.info postage.print_on.text_box.text

  postage.print_on "Envelope - #11, 4 ½” x 10 ⅜”"
  log.info postage.print_on.tooltip "Envelope - #11, 4 ½” x 10 ⅜”"
  log.info postage.print_on.text_box.text

  postage.print_on "Envelope - #12, 4 ¾” x 11”"
  log.info postage.print_on.tooltip "Envelope - #12, 4 ¾” x 11”"
  log.info postage.print_on.text_box.text

  postage.print_on "Certified Mail Label - Stamps.com SDC-3610"
  log.info postage.print_on.tooltip "Certified Mail Label - Stamps.com SDC-3610"
  log.info postage.print_on.text_box.text

  postage.print_on "Certified Mail Label - Stamps.com SDC-3710"
  log.info postage.print_on.tooltip "Certified Mail Label - Stamps.com SDC-3710"
  log.info postage.print_on.text_box.text

  postage.print_on "Certified Mail Label - Stamps.com SDC-3910"
  log.info postage.print_on.tooltip "Certified Mail Label - Stamps.com SDC-3910"
  log.info postage.print_on.text_box.text

  postage.print_on "Certified Mail #11 Envelope - Stamps.com SDC-3810"
  log.info postage.print_on.tooltip "Certified Mail #11 Envelope - Stamps.com SDC-3810"
  log.info postage.print_on.text_box.text

  postage.print_on "Roll - 4” x 6” Shipping Label"
  log.info postage.print_on.tooltip "Roll - 4” x 6” Shipping Label"
  log.info postage.print_on.text_box.text

  postage.print_on "Roll - 4 ⅛” x 6 ¼” Shipping Label"
  log.info postage.print_on.tooltip "Roll - 4 ⅛” x 6 ¼” Shipping Label"
  log.info postage.print_on.text_box.text

end

Then /^example$/ do
  postage.netstamps.weight.ounces.increment 5
  postage.netstamps.weight.ounces.decrement 5
  postage.netstamps.weight.ounces.set 5
  postage.netstamps.weight.ounces.text_box.tooltip
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


