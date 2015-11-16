# encoding: utf-8

Then /^Create page objects for Print On Shipping Label$/ do
  print_postage.print_on.select "Shipping Label - 8 ½” x 11” Paper"
  log print_postage.print_on.tooltip "Shipping Label - 8 ½” x 11” Paper"
  print_postage.print_on.select "Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”"
  log print_postage.print_on.tooltip "Shipping Label - Stamps.com SDC-1200, 4 ¼” x 6 ¾”"
  print_postage.print_on.select "Shipping Label - 5 ½” x 8 ½”"
  log print_postage.print_on.tooltip "Shipping Label - 5 ½” x 8 ½”"
  print_postage.print_on.select "Envelope - #10, 4 ⅛” x 9 ½”"
  log print_postage.print_on.tooltip "Envelope - #10, 4 ⅛” x 9 ½”"
  print_postage.print_on.select "Envelope - #9, 3 ⅞” x 8 ⅞”"
  log print_postage.print_on.tooltip "Envelope - #9, 3 ⅞” x 8 ⅞”"
  print_postage.print_on.select "Envelope - #A9, 5 ¾” x 8 ¾”"
  log print_postage.print_on.tooltip "Envelope - #A9, 5 ¾” x 8 ¾”"
  print_postage.print_on.select "Envelope - #6, 3 ⅝” x 6 ½”"
  log print_postage.print_on.tooltip "Envelope - #6, 3 ⅝” x 6 ½”"
  print_postage.print_on.select "Envelope - #A2, 4 ⅜” x 5 ¾”"
  log print_postage.print_on.tooltip "Envelope - #A2, 4 ⅜” x 5 ¾”"
  print_postage.print_on.select "Envelope - #7, 3 ⅞” x 7 ½”"
  log print_postage.print_on.tooltip "Envelope - #7, 3 ⅞” x 7 ½”"
  print_postage.print_on.select "Envelope - #11, 4 ½” x 10 ⅜”"
  log print_postage.print_on.tooltip "Envelope - #11, 4 ½” x 10 ⅜”"
  print_postage.print_on.select "Envelope - #12, 4 ¾” x 11”"
  log print_postage.print_on.tooltip "Envelope - #12, 4 ¾” x 11”"
  print_postage.print_on.select "Certified Mail Label - Stamps.com SDC-3610"
  log print_postage.print_on.tooltip "Certified Mail Label - Stamps.com SDC-3610"
  print_postage.print_on.select "Certified Mail Label - Stamps.com SDC-3710"
  log print_postage.print_on.tooltip "Certified Mail Label - Stamps.com SDC-3710"
  print_postage.print_on.select "Certified Mail Label - Stamps.com SDC-3910"
  log print_postage.print_on.tooltip "Certified Mail Label - Stamps.com SDC-3910"
  print_postage.print_on.select "Certified Mail #11 Envelope - Stamps.com SDC-3810"
  log print_postage.print_on.tooltip "Certified Mail #11 Envelope - Stamps.com SDC-3810"
  print_postage.print_on.select "Roll - 4” x 6” Shipping Label"
  log print_postage.print_on.tooltip "Roll - 4” x 6” Shipping Label"
  print_postage.print_on.select "Roll - 4 ⅛” x 6 ¼” Shipping Label"
  log print_postage.print_on.tooltip "Roll - 4 ⅛” x 6 ¼” Shipping Label"



  log print_postage.print_on.text_box.text
end
