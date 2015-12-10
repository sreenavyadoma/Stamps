# encoding: utf-8

Then /^Select Print Postage print media(.*)/ do |media|

end

Then /^Set Print Postage Form Ship-To to international address/ do |table|

end

Then /^Set Print Postage Form Ship-To address to (.*)/ do |address|

end

Then /^Set Print Postage Form Ship-To address to$/ do |table|

end

Then /^Enter Serial Number (.*)/ do |serial|

end

Then /^Select Specify Postage Amount/ do

end

Then /^Select Calculate Postage Amount/ do

end

Then /^Set Print Postage Form Ship-From to (.*)/ do |address|

end

Then /^Set Print Postage Form Ship-To country to (.*)/ do |country|

end

Then /^Set Print Postage Form Service to (.*)/ do |service|

end

Then /^Set Print Postage Form Stamp Amount to (.*)/ do |amount|

end

Then /^Set Print Postage Form Ounces to (.*)/ do |ounces|

end

Then /^Set Print Postage Form Pounds to (.*)/ do |pounds|

end

Then /^Expect Print Postage Form Ship-To address to be (.*)/ do |address|

end

Then /^Open Extra Services/ do

end

Then /^Set Extra Services COD to (.*)/ do |amount|

end

Then /^Save Extra Services/ do

end

Then /^Search Contacts by group - (.*)/ do |filter|

end

Then /^Search Contacts by cost code - (.*)/ do |filter|

end

Then /^Open Contacts modal/ do

end

Then /Cancel Contacts modal/ do

end

Then /^This works$/ do
  print_postage.print_on "Shipping Label - 8 ½” x 11” Paper"
  log.info print_postage.print_on.tooltip "Shipping Label - 8 ½” x 11” Paper"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”"
  log.info print_postage.print_on.tooltip "Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Shipping Label - 5 ½” x 8 ½”"
  log.info print_postage.print_on.tooltip "Shipping Label - 5 ½” x 8 ½”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Envelope - #10, 4 ⅛” x 9 ½”"
  log.info print_postage.print_on.tooltip "Envelope - #10, 4 ⅛” x 9 ½”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Envelope - #9, 3 ⅞” x 8 ⅞”"
  log.info print_postage.print_on.tooltip "Envelope - #9, 3 ⅞” x 8 ⅞”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Envelope - #A9, 5 ¾” x 8 ¾”"
  log.info print_postage.print_on.tooltip "Envelope - #A9, 5 ¾” x 8 ¾”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Envelope - #6, 3 ⅝” x 6 ½”"
  log.info print_postage.print_on.tooltip "Envelope - #6, 3 ⅝” x 6 ½”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Envelope - #A2, 4 ⅜” x 5 ¾”"
  log.info print_postage.print_on.tooltip "Envelope - #A2, 4 ⅜” x 5 ¾”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Envelope - #7, 3 ⅞” x 7 ½”"
  log.info print_postage.print_on.tooltip "Envelope - #7, 3 ⅞” x 7 ½”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Envelope - #11, 4 ½” x 10 ⅜”"
  log.info print_postage.print_on.tooltip "Envelope - #11, 4 ½” x 10 ⅜”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Envelope - #12, 4 ¾” x 11”"
  log.info print_postage.print_on.tooltip "Envelope - #12, 4 ¾” x 11”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Certified Mail Label - Stamps.com SDC-3610"
  log.info print_postage.print_on.tooltip "Certified Mail Label - Stamps.com SDC-3610"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Certified Mail Label - Stamps.com SDC-3710"
  log.info print_postage.print_on.tooltip "Certified Mail Label - Stamps.com SDC-3710"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Certified Mail Label - Stamps.com SDC-3910"
  log.info print_postage.print_on.tooltip "Certified Mail Label - Stamps.com SDC-3910"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Certified Mail #11 Envelope - Stamps.com SDC-3810"
  log.info print_postage.print_on.tooltip "Certified Mail #11 Envelope - Stamps.com SDC-3810"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Roll - 4” x 6” Shipping Label"
  log.info print_postage.print_on.tooltip "Roll - 4” x 6” Shipping Label"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on "Roll - 4 ⅛” x 6 ¼” Shipping Label"
  log.info print_postage.print_on.tooltip "Roll - 4 ⅛” x 6 ¼” Shipping Label"
  log.info print_postage.print_on.text_box.text

end

Then /^Create page objects for Print On Shipping Label$/ do
  random_ship_to_address = test_helper.rand_ship_to_zone_1_4
  formatted_address = OrdersHelper.instance.format_address(random_ship_to_address)

  shipping_label = print_postage.print_on "Shipping Label - 8 ½” x 11” Paper"

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


