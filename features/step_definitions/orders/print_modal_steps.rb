# encoding: utf-8
When /^Select Print Modal left-side label$/ do
  log.info "Step: Select Print Modal - Left side label"
  selected = orders.toolbar.print.starting_label.left
  log.info "left-side label was #{(selected)?'selected.':'not selected'}"
end

When /^Select Print Modal right-side label$/ do
  log.info "Step: Select Print Modal - Right side label"
  selected = orders.toolbar.print.starting_label.right
  log.info "Print Modal right-side label was #{(selected)?'selected.':'not selected'}"
end

Then /^Expect Print Modal right-side label selected$/ do
  log.info "Expectation: Expect Print Modal right-side label selected"
  selected = orders.toolbar.print.starting_label.right_selected?
  log.info "Expect Left side label selected.  Test #{(selected)?'Passed.':'Failed'}"
end

Then /^Expect Print Modal left-side label selected$/ do
  log.info "Expectation: Expect Print Modal left-side label selected"
  selected = orders.toolbar.print.starting_label.left_selected?
  log.info "Expect Left side label selected.  Test #{(selected)?'Passed.':'Failed'}"
end

Then /^Set Print Modal Ship Date to today$/ do
  step "Set Print Modal Ship Date to today plus #{1}"
end

Then /^Set Print Modal Ship Date to today plus (\d+)$/ do |day|
  ship_date = test_helper.now_plus_mon_dd day
  log.info "Set Print Modal Ship Date to #{ship_date}"
  @ship_date = orders.toolbar.print.date_picker.today_plus day
end

Then /^Expect Shipped Tab Date Printed to be today$/ do
  today = test_helper.now_plus_mon_dd 0
  orders.filter.shipped.date_printed.sort.descending
  actual_date_printed = orders.filter.shipped.date_printed.row 1
  log.info "#{(actual_date_printed)}"
  log.info "Expectation: Shipped Tab Date Printed to be today #{today}"
end

Then /^Expect Shipped Tab Ship Date to be today$/ do

end

Then /^Expect Shipped Tab Ship Date to be today plus (\d+)/ do |day|

end

Then /^Expect Print Window Ship Date to be (\d+) day\(s\) from today/ do |day|
  log.info "Expectation: Expect Print Window Ship Date to be #{day} day(s) from today"
  actual = orders.toolbar.print.ship_date.text
  expected = test_helper.print_date day
  log.info "Expect Print Window Ship Date to be #{expected}. Got #{actual}.  Test #{(actual.eql? expected)?'Passed':'Failed'}"
  actual.should eql expected
end

When /^Open Print Modal$/ do
  log.info "Step: Open Print Modal"
  @print_window = orders.toolbar.print
end

Then /^Select Print Media \"(.*)\"$/ do |print_media|
  log.info "Step: Select Print Media #{print_media}"
  orders.toolbar.print.printing_on.select print_media
end

Then /^Select Printer \"(.*)\"$/ do |printer|
  log.info "Step: Select Printer #{printer}"
  orders.toolbar.print.printer.select printer
end

Then /^Expect Print Media \"(.*)\" tooltip to include \"(.*)\"$/ do |print_media, expected_value|
  log.info "Expectation: Expect Print Media #{print_media} tooltip to include #{expected_value}"
  actual_value = orders.toolbar.print.printing_on.selection :tooltip, print_media
  log.info "Expect Print Media \"#{print_media}\" tooltip to include \"#{expected_value}\" - Test #{(actual_value.include? expected_value)?"Passed":"Failed"}"
  actual_value.should include expected_value
end

When /^Print$/ do
  log.info "Step: Print"
  print_modal = orders.toolbar.print
  @ship_date = print_modal.ship_date.text
  @paper_tray = print_modal.paper_tray.text_box.text
  @printer = print_modal.printer.text_box.text
  @printing_on = print_modal.printing_on.text_box.text
  @printing_error = print_modal.print
end

Then /^Close Print Modal$/ do
  log.info "Step: Close Print Modal"
  orders.toolbar.print.close
end

Then /^Print expecting error (.*)$/ do |error_message|
  log.info "Step: Print expecting error #{error_message}"
  order_error = orders.toolbar.print_expecting_error
  actual_error_message = order_error.error_message
  order_error.ok
  log.info "Print expecting error \"#{error_message}\".  :  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should include error_message
end

Then /^Print expecting (.*) selected orders have errors and cannot be printed. To print the remaining orders, click Continue.$/ do |error_message|
  log.info "Step: Print expecting #{error_message} selected orders have errors and cannot be printed. To print the remaining orders, click Continue."
  order_errors = orders.toolbar.print_expecting_error
  actual_error_message = order_errors.error_message
  order_errors.continue.print
  log.info "Print expecting error \"#{error_message}\" selected orders have errors and cannot be printed. To print the remaining orders, click Continue.   \nActual Error Message:  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should eql "#{error_message} selected orders have errors and cannot be printed.\nTo print the remaining orders, click Continue."
end

Then /^Print expecting invalid address error$/ do
  log.info "Step: Print expecting invalid address error"
  error_window = orders.toolbar.print_invalid_address
  error_window.close
end

When /^Print expecting rating error$/ do
  log.info "Step: Print expecting rating error"
  error_window = orders.toolbar.print.print_expecting_rating_error
  actual_error_message = error_window.error_message
  error_window.close
  expect(actual_error_message.include? 'An error occurred while attempting to rate your postage').to be true
end

When /^Print expecting some orders can not be printed$/ do
  log.info "Step: Print expecting some orders can not be printed"
  error_window = orders.toolbar.print_expecting_error
  actual_error_message = error_window.error_message
  error_window.continue.print
  expect(actual_error_message.include? 'To print the remaining orders, click Continue').to be true
end

Then /^Expect Print Window title to be \"You have (.*) label\(s\) ready to print\"$/ do |expectation|
  log.info "Expectation: Expect Print Window title to be \"You have #{expectation} label\(s\) ready to print\""
  actual = orders.toolbar.print.labels_ready_to_print
  orders.toolbar.print.close
  log.info "You have #{expectation} label(s) ready to print.  Actual Value: #{expectation}  Test #{(expectation==actual)?'Passed':'Failed'}"
  "You have #{actual} label(s) ready to print".should eql "You have #{expectation} label(s) ready to print"
end

Then /^Expect Print Window requires (\d+) label sheets$/ do |sheets|
  log.info "Expectation: Expect Print Window requires #{sheets} label sheets"
  actual = orders.toolbar.print.labels_required
  log.info "Requires #{sheets} label sheets. Actual Value: #{sheets}  Test #{(sheets==actual)?'Passed':'Failed'}"
  actual.should eql sheets
end

Then /^Print raises a Printing Error/ do
  log.info "Step: Print raises a Printing Error"
  expect{orders.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Sample on (.*)$/ do |printer|
  log.info "Step: Print Sample on #{printer}"
  orders.toolbar.print(printer).print_sample
end

Then /^Print Sample on (.*) raises a PrintingError$/ do |printer|
  log.info "Step: Print Sample on #{printer} raises a PrintingError"
  expect{orders.toolbar.print(printer).print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Sample$/ do
  log.info "Step: Print Sample"
  orders.toolbar.print.print_sample
end

Then /^Print Sample raises a Printing Error/ do
  log.info "Step: Print Sample raises a Printing Error"
  expect{orders.toolbar.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Expect (.*) pane selected$/ do |value|

end

Then /^Select (.*) pane$/ do |value|

end

Then /^Print Postage$/ do

end



