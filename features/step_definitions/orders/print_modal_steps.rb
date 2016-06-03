
Then /^Print: Open Modal$/ do
  log.info "Print: Open Modal"
  @print_window = orders.toolbar.print_order.click

  if @print_window.instance_of? Orders::Toolbar::IncompleteOrderErrorModal
    log.info @print_window.error_message
    stop_test error_message
  end
end

Then /^Print: Print Incomplete Order$/ do
  log.info "Print: Open Modal"
  @incomplete_order_modal = orders.toolbar.print_order.click

  stop_test "Incomplete Order Modal did not open" unless @incomplete_order_modal.instance_of? Orders::Toolbar::IncompleteOrderErrorModal
end

Then /^Print: Close Modal$/ do
  log.info "Print: Close Modal"
  @print_window.close
end

Then /^Print: Set Printer to \"(.*)\"$/ do |printer|
  log.info "Print: Set Printer to \"#{printer}\""
  @print_window.printer.select printer
end

Then /^RePrint: Reprint$/ do
  log.info "RePrint: Reprint"
  orders.toolbar.reprint.reprint
end

Then /^Print: Set Ship Date to today$/ do
  step "Print: Set Ship Date to today plus #{1}"
end

Then /^Print: Set Ship Date to today plus (\d+)$/ do |day|
  ship_date = test_helper.now_plus_mon_dd day
  log.info "Print: Set Ship Date to #{ship_date}"
  @ship_date = @print_window.date_picker.today_plus day
end

Then /^Print: Check Hide Postage Value$/ do
  log.info "Print: Check Hide Postage Value"
  @print_window.print_options.hide_postage_value.check
end

Then /^Print: Uncheck Hide Postage Value$/ do
  log.info "Print: Uncheck Hide Postage Value"
  @print_window.print_options.hide_postage_value.uncheck
end

Then /^Print: Expect Hide Postage Value Checkbox is checked$/ do
  log.info "Print: Print: Expect Hide Postage Value Checkbox is checked"
  expectation = "Hide Postage Value Checkbox is checked"
  print_dialog = @print_window
  30.times do
    print_dialog.click
    actual_value = print_dialog.print_options.hide_postage_value.checked?
    print_dialog.click
    if actual_value
      expectation = "Hide Postage Value Checkbox is checked"
    else
      expectation = "Hide Postage Value Checkbox is NOT checked"
    end
    break if expectation=="Hide Postage Value Checkbox is checked"
  end
  log.info "Test #{(expectation=="Hide Postage Value Checkbox is checked")?"Passed":"Failed"}"
  expectation.should eql "Hide Postage Value Checkbox is checked"
end

Then /^Print: Check Email Tracking Details to Recipients$/ do
  log.info "Print: Check Email Tracking Details to Recipients"
  @print_window.print_options.email_tracking.check
end

Then /^Print: Uncheck Email Tracking Details to Recipients$/ do
  log.info "Print: Uncheck Email Tracking Details to Recipients"
  @print_window.print_options.email_tracking.uncheck
end

Then /^Print: Uncheck Print Reference # on Shipping Label$/ do
  log.info "Print: Uncheck Print Reference # on Shipping Label"
  @print_window.print_options.print_reference_no.uncheck
end

Then /^Print: Check Print Reference # on Shipping Label$/ do
  log.info "Print: Check Print Reference # on Shipping Label"
  @print_window.print_options.print_reference_no.check
end

When /^Print: Select left-side label$/ do
  log.info "Print: Select - Left side label"
  selected = @print_window.starting_label.left
  log.info "left-side label was #{(selected)?'selected.':'not selected'}"
end

When /^Print: Select right-side label$/ do
  log.info "Print: Select - Right side label"
  selected = @print_window.starting_label.right
  log.info "Print Modal right-side label was #{(selected)?'selected.':'not selected'}"
end

Then /^Print: Expect right-side label selected$/ do
  log.info "Print: Expect right-side label selected"
  selected = @print_window.starting_label.right_selected?
  log.info "Expect Left side label selected.  Test #{(selected)?'Passed.':'Failed'}"
end

Then /^Print: Expect left-side label selected$/ do
  log.info "Print: Expect left-side label selected"
  selected = @print_window.starting_label.left_selected?
  log.info "Expect Left side label selected.  Test #{(selected)?'Passed.':'Failed'}"
end

Then /^Print: Expect Ship Date to be (\d+) day\(s\) from today/ do |day|
  log.info "Print: Expect Ship Date to be #{day} day(s) from today"
  actual = @print_window.ship_date.text
  expected = test_helper.date_printed day
  log.info "Print: Expect Ship Date to be #{expected}. Got #{actual}.  Test #{(actual.eql? expected)?'Passed':'Failed'}"
  actual.should eql expected
end

Then /^Print: Set Printing On \"(.*)\"$/ do |expectation|
  log.info "Print: Set Printing On #{expectation}"
  @print_window.printing_on.select expectation
end

Then /^Print: Expect Printing On Label to be (.*)$/ do |expectation|
  log.info "Print: Set Printing On #{expectation}"
  actual_value = @print_window.printing_on.label.text
  log.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Select Printer \"(.*)\"$/ do |printer|
  log.info "Select Printer #{printer}"
  @print_window.printer.select printer
end

Then /^Close Reprint Modal$/ do
  log.info "Print: Close Modal"
  orders.toolbar.reprint.close
end

Then /^Close Label Unavailable Modal$/ do
  log.info "Close Label Unavailable Modal"
  orders.toolbar.ok.close
end

Then /^Print expecting error (.*)$/ do |error_message|
  log.info "Print expecting error #{error_message}"
  order_error = @print_window.print_expecting_error
  actual_error_message = order_error.error_message
  order_error.ok
  log.info "Print expecting error \"#{error_message}\".  :  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should include error_message
end

Then /^Print expecting (.*) selected orders have errors and cannot be printed. To print the remaining orders, click Continue.$/ do |error_message|
  log.info "Print expecting #{error_message} selected orders have errors and cannot be printed. To print the remaining orders, click Continue."
  order_errors = @print_window.print_expecting_error
  actual_error_message = order_errors.error_message
  order_errors.continue.print
  log.info "Print expecting error \"#{error_message}\" selected orders have errors and cannot be printed. To print the remaining orders, click Continue.   \nActual Error Message:  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should eql "#{error_message} selected orders have errors and cannot be printed.\nTo print the remaining orders, click Continue."
end

Then /^Print expecting invalid address error$/ do
  log.info "Print expecting invalid address error"
  error_window = @print_window.print_invalid_address
  error_window.close
end

When /^Print expecting rating error$/ do
  log.info "Print expecting rating error"
  error_window = @print_window.print_expecting_rating_error
  actual_error_message = error_window.error_message
  error_window.close
  expect(actual_error_message.include? 'An error occurred while attempting to rate your print').to be true
end

When /^Print expecting some orders can not be printed$/ do
  log.info "Print expecting some orders can not be printed"
  error_window = @print_window.print_expecting_error
  actual_error_message = error_window.error_message
  error_window.continue.print
  expect(actual_error_message.include? 'To print the remaining orders, click Continue').to be true
end

Then /^Print: Expect Modal Title to be \"You have (.*) label\(s\) ready to print\"$/ do |expectation|
  log.info "Print: Expect Modal Title to be \"You have #{expectation} label\(s\) ready to print\""
  actual = @print_window.labels_ready_to_print
  @print_window.close
  log.info "You have #{expectation} label(s) ready to print.  Actual Value: #{expectation}  Test #{(expectation==actual)?'Passed':'Failed'}"
  "You have #{actual} label(s) ready to print".should eql "You have #{expectation} label(s) ready to print"
end

Then /^Print: Expect number of required label sheets to be (\d+)$/ do |sheets|
  log.info "Print: Expect Requires #{sheets} label sheets"
  actual = @print_window.labels_required
  log.info "Requires #{sheets} label sheets. Actual Value: #{sheets}  Test #{(sheets==actual)?'Passed':'Failed'}"
  actual.should eql sheets
end

Then /^Print raises a Printing Error/ do
  log.info "Print raises a Printing Error"
  expect{orders.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print: Print Sample$/ do
  log.info "Print: Print Sample"
  @print_window.print_sample
end

Then /^Print: Print Sample raises a Printing Error/ do
  log.info "Print: Print Sample raises a Printing Error"
  expect{@print_window.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Expect (.*) pane selected$/ do |value|

end

Then /^Select (.*) pane$/ do |value|

end



