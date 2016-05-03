
Then /^Print: Open Modal$/ do
  log.info "Print: Open Modal"
  @print_window = orders.toolbar.print_modal
end

Then /^Print: Close Modal$/ do
  log.info "Step: Print: Close Modal"
  orders.toolbar.print_modal.close
end

Then /^Print: Set Printer to \"(.*)\"$/ do |printer|
  log.info "Print: Set Printer to \"#{printer}\""
  orders.toolbar.print_modal.printer.select printer
end

Then /^RePrint: Reprint$/ do
  orders.toolbar.reprint.reprint
end

Then /^Print: Set Ship Date to today$/ do
  step "Print: Set Ship Date to today plus #{1}"
end

Then /^Print: Set Ship Date to today plus (\d+)$/ do |day|
  ship_date = test_helper.now_plus_mon_dd day
  log.info "Print: Set Ship Date to #{ship_date}"
  @ship_date = orders.toolbar.print_modal.date_picker.today_plus day
end

Then /^Print: Check Email Tracking Details to Recipients$/ do
  log.info "Print: Check Email Tracking Details to Recipients"
  orders.toolbar.print_modal.print_options.email_tracking.check
end

Then /^Print: Uncheck Email Tracking Details to Recipients$/ do
  log.info "Print: Uncheck Email Tracking Details to Recipients"
  orders.toolbar.print_modal.print_options.email_tracking.uncheck
end

Then /^Print: Uncheck Print Reference # on Shipping Label$/ do
  log.info "Print: Uncheck Print Reference # on Shipping Label"
  orders.toolbar.print_modal.print_options.print_reference_no.uncheck
end

Then /^Print: Check Print Reference # on Shipping Label$/ do
  log.info "Print: Check Print Reference # on Shipping Label"
  orders.toolbar.print_modal.print_options.print_reference_no.check
end

When /^Print: Select left-side label$/ do
  log.info "Step: Print: Select - Left side label"
  selected = orders.toolbar.print_modal.starting_label.left
  log.info "left-side label was #{(selected)?'selected.':'not selected'}"
end

When /^Print: Select right-side label$/ do
  log.info "Step: Print: Select - Right side label"
  selected = orders.toolbar.print_modal.starting_label.right
  log.info "Print Modal right-side label was #{(selected)?'selected.':'not selected'}"
end

Then /^Print: Expect right-side label selected$/ do
  log.info "Step: Print: Expect right-side label selected"
  selected = orders.toolbar.print_modal.starting_label.right_selected?
  log.info "Expect Left side label selected.  Test #{(selected)?'Passed.':'Failed'}"
end

Then /^Print: Expect left-side label selected$/ do
  log.info "Step: Print: Expect left-side label selected"
  selected = orders.toolbar.print_modal.starting_label.left_selected?
  log.info "Expect Left side label selected.  Test #{(selected)?'Passed.':'Failed'}"
end

Then /^Print: Expect Ship Date to be (\d+) day\(s\) from today/ do |day|
  log.info "Step: Print: Expect Ship Date to be #{day} day(s) from today"
  actual = orders.toolbar.print_modal.ship_date.text
  expected = test_helper.date_printed day
  log.info "Print: Expect Ship Date to be #{expected}. Got #{actual}.  Test #{(actual.eql? expected)?'Passed':'Failed'}"
  actual.should eql expected
end

Then /^Print: Set Printing On \"(.*)\"$/ do |expectation|
  log.info "Step: Print: Set Printing On #{expectation}"
  orders.toolbar.print_modal.printing_on.select expectation
end

Then /^Print: Expect Printing On Label to be (.*)$/ do |expectation|
  log.info "Step: Print: Set Printing On #{expectation}"
  actual_value = orders.toolbar.print_modal.printing_on.label
  log.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Select Printer \"(.*)\"$/ do |printer|
  log.info "Step: Select Printer #{printer}"
  orders.toolbar.print_modal.printer.select printer
end

Then /^Close Reprint Modal$/ do
  log.info "Step: Print: Close Modal"
  orders.toolbar.reprint.close
end

Then /^Close Label Unavailable Modal$/ do
  log.info "Step: Close Label Unavailable Modal"
  orders.toolbar.ok.close
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
  error_window = orders.toolbar.print_modal.print_expecting_rating_error
  actual_error_message = error_window.error_message
  error_window.close
  expect(actual_error_message.include? 'An error occurred while attempting to rate your print').to be true
end

When /^Print expecting some orders can not be printed$/ do
  log.info "Step: Print expecting some orders can not be printed"
  error_window = orders.toolbar.print_expecting_error
  actual_error_message = error_window.error_message
  error_window.continue.print
  expect(actual_error_message.include? 'To print the remaining orders, click Continue').to be true
end

Then /^Print: Expect Modal Title to be \"You have (.*) label\(s\) ready to print\"$/ do |expectation|
  log.info "Step: Print: Expect Modal Title to be \"You have #{expectation} label\(s\) ready to print\""
  actual = orders.toolbar.print_modal.labels_ready_to_print
  orders.toolbar.print_modal.close
  log.info "You have #{expectation} label(s) ready to print.  Actual Value: #{expectation}  Test #{(expectation==actual)?'Passed':'Failed'}"
  "You have #{actual} label(s) ready to print".should eql "You have #{expectation} label(s) ready to print"
end

Then /^Print: Expect number of required label sheets to be (\d+)$/ do |sheets|
  log.info "Step: Print: Expect Requires #{sheets} label sheets"
  actual = orders.toolbar.print_modal.labels_required
  log.info "Requires #{sheets} label sheets. Actual Value: #{sheets}  Test #{(sheets==actual)?'Passed':'Failed'}"
  actual.should eql sheets
end

Then /^Print raises a Printing Error/ do
  log.info "Step: Print raises a Printing Error"
  expect{orders.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print: Print Sample on (.*)$/ do |printer|
  log.info "Step: Print: Print Sample on #{printer}"
  orders.toolbar.print_modal(printer).print_sample
end

Then /^Print: Print Sample on (.*) raises a PrintingError$/ do |printer|
  log.info "Step: Print: Print Sample on #{printer} raises a PrintingError"
  expect{orders.toolbar.print_modal(printer).print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print: Print Sample$/ do
  log.info "Step: Print: Print Sample"
  orders.toolbar.print_modal.print_sample
end

Then /^Print: Print Sample raises a Printing Error/ do
  log.info "Step: Print: Print Sample raises a Printing Error"
  expect{orders.toolbar.print_modal.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Expect (.*) pane selected$/ do |value|

end

Then /^Select (.*) pane$/ do |value|

end



