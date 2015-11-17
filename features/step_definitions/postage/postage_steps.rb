# encoding: utf-8

Then /^This works$/ do
  print_postage.print_on.select "Shipping Label - 8 ½” x 11” Paper"
  log.info print_postage.print_on.tooltip "Shipping Label - 8 ½” x 11” Paper"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”"
  log.info print_postage.print_on.tooltip "Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Shipping Label - 5 ½” x 8 ½”"
  log.info print_postage.print_on.tooltip "Shipping Label - 5 ½” x 8 ½”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Envelope - #10, 4 ⅛” x 9 ½”"
  log.info print_postage.print_on.tooltip "Envelope - #10, 4 ⅛” x 9 ½”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Envelope - #9, 3 ⅞” x 8 ⅞”"
  log.info print_postage.print_on.tooltip "Envelope - #9, 3 ⅞” x 8 ⅞”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Envelope - #A9, 5 ¾” x 8 ¾”"
  log.info print_postage.print_on.tooltip "Envelope - #A9, 5 ¾” x 8 ¾”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Envelope - #6, 3 ⅝” x 6 ½”"
  log.info print_postage.print_on.tooltip "Envelope - #6, 3 ⅝” x 6 ½”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Envelope - #A2, 4 ⅜” x 5 ¾”"
  log.info print_postage.print_on.tooltip "Envelope - #A2, 4 ⅜” x 5 ¾”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Envelope - #7, 3 ⅞” x 7 ½”"
  log.info print_postage.print_on.tooltip "Envelope - #7, 3 ⅞” x 7 ½”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Envelope - #11, 4 ½” x 10 ⅜”"
  log.info print_postage.print_on.tooltip "Envelope - #11, 4 ½” x 10 ⅜”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Envelope - #12, 4 ¾” x 11”"
  log.info print_postage.print_on.tooltip "Envelope - #12, 4 ¾” x 11”"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Certified Mail Label - Stamps.com SDC-3610"
  log.info print_postage.print_on.tooltip "Certified Mail Label - Stamps.com SDC-3610"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Certified Mail Label - Stamps.com SDC-3710"
  log.info print_postage.print_on.tooltip "Certified Mail Label - Stamps.com SDC-3710"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Certified Mail Label - Stamps.com SDC-3910"
  log.info print_postage.print_on.tooltip "Certified Mail Label - Stamps.com SDC-3910"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Certified Mail #11 Envelope - Stamps.com SDC-3810"
  log.info print_postage.print_on.tooltip "Certified Mail #11 Envelope - Stamps.com SDC-3810"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Roll - 4” x 6” Shipping Label"
  log.info print_postage.print_on.tooltip "Roll - 4” x 6” Shipping Label"
  log.info print_postage.print_on.text_box.text

  print_postage.print_on.select "Roll - 4 ⅛” x 6 ¼” Shipping Label"
  log.info print_postage.print_on.tooltip "Roll - 4 ⅛” x 6 ¼” Shipping Label"
  log.info print_postage.print_on.text_box.text

end

Then /^Create page objects for Print On Shipping Label$/ do
  random_ship_to_address = test_helper.random_ship_to
  formatted_address = BatchHelper.instance.format_address(random_ship_to_address)

  shipping_label = print_postage.print_on.select "Shipping Label - 8 ½” x 11” Paper"

  shipping_label.ship_to.domestic.text_box.set formatted_address
  log shipping_label.ship_to.domestic.text_box.text

  shipping_label.email_tracking.check
  shipping_label.email_tracking.un_check
  log shipping_label.email_tracking.tooltip


  #international_shipping_address = shipping_label.country.select "Canada"
  #shipping_label.ship_from.select ""
end


