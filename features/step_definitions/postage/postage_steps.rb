Then /^Create page objects for Print On Shipping Label$/ do
  print_postage.print_on.select "Shipping Label - 8 ½” x 11” Paper"
  log print_postage.print_on.tooltip "Shipping Label - 8 ½” x 11” Paper"
  log print_postage.print_on.text_box.text
end
