Then /^Print Modal: Set Printer to \"(.*)\"$/ do |printer|
  log.info "Print Modal: Set Printer to \"#{printer}\""
  orders.toolbar.print.printer.select printer
end

Then /^Reprint Modal: Reprint$/ do
  orders.toolbar.reprint.reprint
end

Then /^Print Modal: Set Ship Date to today$/ do
  step "Print Modal: Set Ship Date to today plus #{1}"
end

Then /^Print Modal: Set Ship Date to today plus (\d+)$/ do |day|
  ship_date = test_helper.now_plus_mon_dd day
  log.info "Print Modal: Set Ship Date to #{ship_date}"
  @ship_date = orders.toolbar.print.date_picker.today_plus day
end

When /^Print Modal: Select left-side label$/ do
  log.info "Step: Print Modal: Select - Left side label"
  selected = orders.toolbar.print.starting_label.left
  log.info "left-side label was #{(selected)?'selected.':'not selected'}"
end

When /^Print Modal: Select right-side label$/ do
  log.info "Step: Print Modal: Select - Right side label"
  selected = orders.toolbar.print.starting_label.right
  log.info "Print Modal right-side label was #{(selected)?'selected.':'not selected'}"
end

Then /^Expect Print Modal right-side label selected$/ do
  log.info "Step: Expect Print Modal right-side label selected"
  selected = orders.toolbar.print.starting_label.right_selected?
  log.info "Expect Left side label selected.  Test #{(selected)?'Passed.':'Failed'}"
end

Then /^Expect Print Modal left-side label selected$/ do
  log.info "Step: Expect Print Modal left-side label selected"
  selected = orders.toolbar.print.starting_label.left_selected?
  log.info "Expect Left side label selected.  Test #{(selected)?'Passed.':'Failed'}"
end

Then /^Expect Shipped Tab Date Printed to be today$/ do
  today = test_helper.now_plus_mon_dd 0
  orders.filter.shipped.print_date.sort.descending
  actual_print_date = orders.filter.shipped.print_date.row 1
  log.info "#{(actual_print_date)}"
  log.info "Step: Shipped Tab Date Printed to be today #{today}"
end

Then /^Expect Shipped Tab Ship Date to be today$/ do

end

Then /^Expect Shipped Tab Ship Date to be today plus (\d+)/ do |day|

end

Then /^Expect Print Window Ship Date to be (\d+) day\(s\) from today/ do |day|
  log.info "Step: Expect Print Window Ship Date to be #{day} day(s) from today"
  actual = orders.toolbar.print.ship_date.text
  expected = test_helper.print_date day
  log.info "Expect Print Window Ship Date to be #{expected}. Got #{actual}.  Test #{(actual.eql? expected)?'Passed':'Failed'}"
  actual.should eql expected
end

Then /^Print Modal: Set Media \"(.*)\"$/ do |print_media|
  log.info "Step: Print Modal: Set Media #{print_media}"
  orders.toolbar.print.printing_on.select print_media
end

Then /^Select Printer \"(.*)\"$/ do |printer|
  log.info "Step: Select Printer #{printer}"
  orders.toolbar.print.printer.select printer
end

Then /^Expect Print Modal Print Media \"(.*)\" tooltip to include \"(.*)\"$/ do |print_media, data_qtip|
  log.info "Expect Print Modal Print Media #{print_media} tooltip to include #{data_qtip}"
  tooltips = data_qtip.split "||"
  actual_tooltip = orders.toolbar.print.printing_on.tooltip print_media
  tooltips.each { |tooltip|
    log.info "Test #{(actual_tooltip.include? tooltip)?"Passed":"Failed"}"
    actual_tooltip.should include tooltip
  }
end

Then /^Close Print Modal$/ do
  log.info "Step: Close Print Modal"
  orders.toolbar.print.close
end

Then /^Close Reprint Modal$/ do
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
  log.info "Step: Expect Print Window title to be \"You have #{expectation} label\(s\) ready to print\""
  actual = orders.toolbar.print.labels_ready_to_print
  orders.toolbar.print.close
  log.info "You have #{expectation} label(s) ready to print.  Actual Value: #{expectation}  Test #{(expectation==actual)?'Passed':'Failed'}"
  "You have #{actual} label(s) ready to print".should eql "You have #{expectation} label(s) ready to print"
end

Then /^Expect Print Window Requires (\d+) label sheets$/ do |sheets|
  log.info "Step: Expect Print Window Requires #{sheets} label sheets"
  actual = orders.toolbar.print.labels_required
  log.info "Requires #{sheets} label sheets. Actual Value: #{sheets}  Test #{(sheets==actual)?'Passed':'Failed'}"
  actual.should eql sheets
end

Then /^Print raises a Printing Error/ do
  log.info "Step: Print raises a Printing Error"
  expect{orders.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Modal: Print Sample on (.*)$/ do |printer|
  log.info "Step: Print Modal: Print Sample on #{printer}"
  orders.toolbar.print(printer).print_sample
end

Then /^Print Modal: Print Sample on (.*) raises a PrintingError$/ do |printer|
  log.info "Step: Print Modal: Print Sample on #{printer} raises a PrintingError"
  expect{orders.toolbar.print(printer).print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Modal: Print Sample$/ do
  log.info "Step: Print Modal: Print Sample"
  orders.toolbar.print.print_sample
end

Then /^Print Modal: Print Sample raises a Printing Error/ do
  log.info "Step: Print Modal: Print Sample raises a Printing Error"
  expect{orders.toolbar.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Expect (.*) pane selected$/ do |value|

end

Then /^Select (.*) pane$/ do |value|

end



