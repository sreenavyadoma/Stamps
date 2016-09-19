
Then /^Print: Open Modal$/ do
  logger.info "Print: Open Modal"
  web_apps.orders.toolbar.print_btn.print_modal
end

Then /^Print: Print Incomplete Order$/ do
  logger.info "Print: Open Modal"
  @incomplete_order_modal = web_apps.orders.toolbar.print_btn.print_modal

  "Incomplete Order Modal did not open".should eql "Print: Print Incomplete Order" unless @incomplete_order_modal.instance_of? Orders::Toolbar::IncompleteOrderErrorModal
end

Then /^Print: Expect Incomplete Order Error Message (.*)$/ do |expectation|
  logger.info "Print: Expect Incomplete Order Error Message #{expectation}"
  error_message = @incomplete_order_modal.error_message
  logger.info "Test #{(error_message.include? expectation)?"Passed":"Failed"}"
  error_message.should include expectation
end

Then /^Print: Close Modal$/ do
  logger.info "Print: Close Modal"
  web_apps.orders.toolbar.print_btn.print_modal.close
end

Then /^Print: Set Printer to \"(.*)\"$/ do |printer|
  logger.info "Print: Set Printer to \"#{printer}\""
  web_apps.orders.toolbar.print_btn.print_modal.printer.select printer
end

Then /^RePrint: Reprint$/ do
  logger.info "RePrint: Reprint"
  web_apps.orders.toolbar.reprint.reprint
end

Then /^Print: Set Ship Date to today$/ do
  step "Print: Set Ship Date to today plus #{1}"
end

Then /^Print: Set Ship Date to today plus (\d+)$/ do |day|
  ship_date = ParameterHelper.now_plus_mon_dd day
  logger.info "Print: Set Ship Date to #{ship_date}"
  @ship_date = web_apps.orders.toolbar.print_btn.print_modal.date_picker.today_plus day
end

Then /^Print: Check Hide Mail Value$/ do
  logger.info "Print: Check Hide Mail Value"
  web_apps.orders.toolbar.print_btn.print_modal.print_options.hide_postage_value.check
end

Then /^Print: Uncheck Hide Mail Value$/ do
  logger.info "Print: Uncheck Hide Mail Value"
  web_apps.orders.toolbar.print_btn.print_modal.print_options.hide_postage_value.uncheck
end

Then /^Print: Expect Hide Mail Value Checkbox is checked$/ do
  logger.info "Print: Print: Expect Hide Mail Value Checkbox is checked"
  expectation = "Hide Mail Value Checkbox is checked"
  print_dialog = web_apps.orders.toolbar.print_btn.print_modal
  30.times do
    print_dialogger.click
    actual_value = print_dialogger.print_options.hide_postage_value.checked?
    print_dialogger.click
    if actual_value
      expectation = "Hide Mail Value Checkbox is checked"
    else
      expectation = "Hide Mail Value Checkbox is NOT checked"
    end
    break if expectation=="Hide Mail Value Checkbox is checked"
  end
  logger.info "Test #{(expectation=="Hide Mail Value Checkbox is checked")?"Passed":"Failed"}"
  expectation.should eql "Hide Mail Value Checkbox is checked"
end

Then /^Print: Check Email Tracking Details to Recipients$/ do
  logger.info "Print: Check Email Tracking Details to Recipients"
  web_apps.orders.toolbar.print_btn.print_modal.print_options.email_tracking.check
end

Then /^Print: Uncheck Email Tracking Details to Recipients$/ do
  logger.info "Print: Uncheck Email Tracking Details to Recipients"
  web_apps.orders.toolbar.print_btn.print_modal.print_options.email_tracking.uncheck
end

Then /^Print: Uncheck Print Reference # on Shipping Label$/ do
  logger.info "Print: Uncheck Print Reference # on Shipping Label"
  web_apps.orders.toolbar.print_btn.print_modal.print_options.print_reference_no.uncheck
end

Then /^Print: Check Print Reference # on Shipping Label$/ do
  logger.info "Print: Check Print Reference # on Shipping Label"
  web_apps.orders.toolbar.print_btn.print_modal.print_options.print_reference_no.check
end

When /^Print: Select left-side label$/ do
  logger.info "Print: Select - Left side label"
  selected = web_apps.orders.toolbar.print_btn.print_modal.starting_label.left
  logger.info "left-side label was #{(selected)?'selected.':'not selected'}"
  "Print: Select left-side label".should eql "Left side label not Selected" unless selected
end

When /^Print: Select right-side label$/ do
  logger.info "Print: Select - Right side label"
  selected = web_apps.orders.toolbar.print_btn.print_modal.starting_label.right
  logger.info "Print Modal right-side label was #{(selected)?'selected.':'not selected'}"
  "Print: Select right-side label".should eql "Right side label not Selected" unless selected
end

Then /^Print: Expect right-side label selected$/ do
  logger.info "Print: Expect right-side label selected"
  selected = web_apps.orders.toolbar.print_btn.print_modal.starting_label.right_selected?
  logger.info "Expect Left side label selected.  Test #{(selected)?'Passed.':'Failed'}"
end

Then /^Print: Expect left-side label selected$/ do
  logger.info "Print: Expect left-side label selected"
  selected = web_apps.orders.toolbar.print_btn.print_modal.starting_label.left_selected?
  logger.info "Expect Left side label selected.  Test #{(selected)?'Passed.':'Failed'}"
end

Then /^Print: Expect Ship Date to be (\d+) day\(s\) from today/ do |day|
  logger.info "Print: Expect Ship Date to be #{day} day(s) from today"
  actual = web_apps.orders.toolbar.print_btn.print_modal.ship_date.text
  expected = ParameterHelper.date_printed day
  logger.info "Print: Expect Ship Date to be #{expected}. Got #{actual}.  Test #{(actual.eql? expected)?'Passed':'Failed'}"
  actual.should eql expected
end

Then /^Print: Set Printing On \"(.*)\"$/ do |expectation|
  logger.info "Print: Set Printing On #{expectation}"
  web_apps.orders.toolbar.print_btn.print_modal.printing_on.select expectation
end

Then /^Print: Expect Printing On Label to be (.*)$/ do |expectation|
  logger.info "Print: Set Printing On #{expectation}"
  actual_value = web_apps.orders.toolbar.print_btn.print_modal.printing_on.label.text
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Select Printer \"(.*)\"$/ do |printer|
  logger.info "Select Printer #{printer}"
  web_apps.orders.toolbar.print_btn.print_modal.printer.select printer
end

Then /^Close Reprint Modal$/ do
  logger.info "Print: Close Modal"
  web_apps.orders.toolbar.reprint.close
end

Then /^Close Label Unavailable Modal$/ do
  logger.info "Close Label Unavailable Modal"
  web_apps.orders.toolbar.ok.close
end

Then /^Print expecting error (.*)$/ do |error_message|
  logger.info "Print expecting error #{error_message}"
  order_error = web_apps.orders.toolbar.print_btn.print_modal.print_expecting_error
  actual_error_message = order_error.error_message
  order_error.ok
  logger.info "Print expecting error \"#{error_message}\".  :  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should include error_message
end

Then /^Print expecting (.*) selected orders have errors and cannot be printed. To print the remaining orders, click Continue.$/ do |error_message|
  logger.info "Print expecting #{error_message} selected orders have errors and cannot be printed. To mail the remaining orders, click Continue."
  order_errors = web_apps.orders.toolbar.print_btn.print_modal.print_expecting_error
  actual_error_message = order_errors.error_message
  order_errors.continue.print
  logger.info "Print expecting error \"#{error_message}\" selected orders have errors and cannot be printed. To mail the remaining orders, click Continue.   \nActual Error Message:  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should eql "#{error_message} selected orders have errors and cannot be printed.\nTo mail the remaining orders, click Continue."
end

Then /^Print expecting invalid address error$/ do
  logger.info "Print expecting invalid address error"
  error_window = web_apps.orders.toolbar.print_btn.print_modal.print_invalid_address
  error_window.close
end

When /^Print expecting rating error$/ do
  logger.info "Print expecting rating error"
  error_window = web_apps.orders.toolbar.print_btn.print_modal.print_expecting_rating_error
  actual_error_message = error_window.error_message
  error_window.close
  expect(actual_error_message.include? 'An error occurred while attempting to rate your mail').to be true
end

When /^Print expecting some orders can not be printed$/ do
  logger.info "Print expecting some orders can not be printed"
  error_window = web_apps.orders.toolbar.print_btn.print_modal.print_expecting_error
  actual_error_message = error_window.error_message
  error_window.continue.print
  expect(actual_error_message.include? 'To mail the remaining orders, click Continue').to be true
end

Then /^Print: Expect Modal Title to be \"You have (.*) label\(s\) ready to print\"$/ do |expectation|
  logger.info "Print: Expect Modal Title to be \"You have #{expectation} label\(s\) ready to mail\""
  actual = web_apps.orders.toolbar.print_btn.print_modal.labels_ready_to_print
  web_apps.orders.toolbar.print_btn.print_modal.close
  logger.info "You have #{expectation} label(s) ready to mail.  Actual Value: #{expectation}  Test #{(expectation==actual)?'Passed':'Failed'}"
  "You have #{actual} label(s) ready to mail".should eql "You have #{expectation} label(s) ready to mail"
end

Then /^Print: Expect number of required label sheets to be (\d+)$/ do |sheets|
  logger.info "Print: Expect Requires #{sheets} label sheets"
  actual = web_apps.orders.toolbar.print_btn.print_modal.labels_required
  logger.info "Requires #{sheets} label sheets. Actual Value: #{sheets}  Test #{(sheets==actual)?'Passed':'Failed'}"
  actual.should eql sheets
end

Then /^Print raises a Printing Error/ do
  logger.info "Print raises a Printing Error"
  expect{web_apps.orders.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print: Print Sample$/ do
  logger.info "Print: Print Sample"
  web_apps.orders.toolbar.print_btn.print_modal.print_sample
end

Then /^Print: Print Sample raises a Printing Error/ do
  logger.info "Print: Print Sample raises a Printing Error"
  expect{web_apps.orders.toolbar.print_btn.print_modal.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Expect (.*) pane selected$/ do |value|

end

Then /^Select (.*) pane$/ do |value|

end



