# encoding: utf-8

Then /^Select Print Postage print media(.*)/ do |media|
  @netstamps = print_postage.print_on media
end


Then /^Enter Serial Number (.*)/ do |serial|
  @postage_form = print_postage.postage_base.stamps
  @postage_form.serial.set serial
end

Then /^Select Specify Postage Amount/ do
  @postage_form.specify_postage_button.click
end

Then /^Select Calculate Postage Amount/ do
  @postage_form.calculate_postage_button.click
end

Then /^Set Print Postage Form Stamp Amount to (.*)/ do |amount|
  @postage_form.stamp_amount.textbox.set amount
  log.info "done"
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


