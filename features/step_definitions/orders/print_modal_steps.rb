
Then /^Print Modal: Open Print Modal$/ do
  logger.step "Print Modal: Open Print Modal"
  step "Save Test Data"
  stamps.orders.toolbar.print_btn.print_modal
end

Then /^Print Modal: Print Incomplete Order$/ do
  logger.step "Print Modal: Open Print Modal"
  @incomplete_order_modal = stamps.orders.toolbar.print_btn.print_modal

  "Incomplete Order Modal did not open".should eql "Print Modal: Print Incomplete Order" unless @incomplete_order_modal.instance_of? Orders::Toolbar::PrintIncompleteOrderError
end

Then /^Print Modal: Expect Incomplete Order Error Message (.*)$/ do |expectation|
  logger.step "Print Modal: Expect Incomplete Order Error Message #{expectation}"
  @incomplete_order_modal.error_message.should include expectation
end

Then /^Print Modal: Close Print Modal$/ do
  logger.step "Print Modal: Close Print Modal"
  stamps.orders.toolbar.print_btn.print_modal.close
end

Then /^Print Modal: Set Printer to \"(.*)\"$/ do |printer|
  logger.step "Print Modal: Set Printer to \"#{printer}\""
  stamps.orders.toolbar.print_btn.print_modal.printer.select printer
end

Then /^RePrint Modal: Reprint$/ do
  logger.step "RePrint Modal: Reprint"
  stamps.orders.toolbar.reprint.reprint
end

Then /^Print Modal: Set Ship Date to today$/ do
  step "Print Modal: Set Ship Date to today plus #{1}"
end

Then /^Print Modal: Set Ship Date to today plus (\d+)$/ do |day|
  ship_date = ParameterHelper.now_plus_mon_dd day
  logger.step "Print Modal: Set Ship Date to #{ship_date}"
  @ship_date = stamps.orders.toolbar.print_btn.print_modal.ship_date.date_picker.today_plus day
end

Then /^Print Modal: Check Hide Mail Value$/ do
  logger.step "Print Modal: Check Hide Mail Value"
  stamps.orders.toolbar.print_btn.print_modal.print_options.hide_postage_value.check
end

Then /^Print Modal: Uncheck Hide Mail Value$/ do
  logger.step "Print Modal: Uncheck Hide Mail Value"
  stamps.orders.toolbar.print_btn.print_modal.print_options.hide_postage_value.uncheck
end

Then /^Print Modal: Expect Hide Mail Value Checkbox is checked$/ do
  logger.step "Print Modal: Print Modal: Expect Hide Mail Value Checkbox is checked"
  30.times do
    stamps.orders.toolbar.print_btn.print_modal.click
    break if stamps.orders.toolbar.print_btn.print_modal.print_options.hide_postage_value.checked?
  end
  stamps.orders.toolbar.print_btn.print_modal.print_options.hide_postage_value.checked?.should be true
end

Then /^Print Modal: Check Email Tracking Details to Recipients$/ do
  logger.step "Print Modal: Check Email Tracking Details to Recipients"
  stamps.orders.toolbar.print_btn.print_modal.print_options.email_tracking.check
end

Then /^Print Modal: Uncheck Email Tracking Details to Recipients$/ do
  logger.step "Print Modal: Uncheck Email Tracking Details to Recipients"
  stamps.orders.toolbar.print_btn.print_modal.print_options.email_tracking.uncheck
end

Then /^Print Modal: Uncheck Print Reference # on Shipping Label$/ do
  logger.step "Print Modal: Uncheck Print Reference # on Shipping Label"
  stamps.orders.toolbar.print_btn.print_modal.print_options.print_reference_no.uncheck
end

Then /^Print Modal: Check Print Reference # on Shipping Label$/ do
  logger.step "Print Modal: Check Print Reference # on Shipping Label"
  stamps.orders.toolbar.print_btn.print_modal.print_options.print_reference_no.check
end

When /^Print Modal: Select left-side label$/ do
  logger.step "Print Modal: Select - Left side label"
  stamps.orders.toolbar.print_btn.print_modal.starting_label.left
end

When /^Print Modal: Select right-side label$/ do
  logger.step "Print Modal: Select - Right side label"
  stamps.orders.toolbar.print_btn.print_modal.starting_label.right
end

Then /^Print Modal: Expect right-side label selected$/ do
  logger.step "Print Modal: Expect right-side label selected"
  stamps.orders.toolbar.print_btn.print_modal.starting_label.right_selected?.should be true
end

Then /^Print Modal: Expect left-side label selected$/ do
  logger.step "Print Modal: Expect left-side label selected"
  stamps.orders.toolbar.print_btn.print_modal.starting_label.left_selected?.should be true
end

Then /^Print Modal: Expect Ship Date is (\d+) day\(s\) from today/ do |day|
  logger.step "Print Modal: Expect Ship Date is #{day} day(s) from today"
  stamps.orders.toolbar.print_btn.print_modal.ship_date.text.should eql ParameterHelper.date_printed(day)
end

Then /^Print Modal: Set Printing On \"(.*)\"$/ do |expectation|
  logger.step "Print Modal: Set Printing On #{expectation}"
  stamps.orders.toolbar.print_btn.print_modal.printing_on.select(expectation)
end

Then /^Print Modal: Expect Printing On Label is (.*)$/ do |expectation|
  logger.step "Print Modal: Set Printing On #{expectation}"
  stamps.orders.toolbar.print_btn.print_modal.printing_on.label.text.should eql expectation
end

Then /^Select Printer \"(.*)\"$/ do |printer|
  logger.step "Select Printer #{printer}"
  stamps.orders.toolbar.print_btn.print_modal.printer.select(printer)
end

Then /^Close Reprint Modal$/ do
  logger.step "Print Modal: Close Print Modal"
  stamps.orders.toolbar.reprint.close
end

Then /^Close Label Unavailable Modal$/ do
  logger.step "Close Label Unavailable Modal"
  stamps.orders.toolbar.ok.close
end

Then /^Print expecting error (.*)$/ do |error_message|
  logger.step "Print expecting error #{error_message}"
  modal = stamps.orders.toolbar.print_btn.print_modal.print_expecting_error
  actual = modal.error_message
  modal.ok
  actual.should include error_message
end

Then /^Print expecting (.*) selected orders have errors and cannot be printed. To print the remaining orders, click Continue.$/ do |error_message|
  logger.step "Print expecting #{error_message} selected orders have errors and cannot be printed. To mail the remaining orders, click Continue."
  modal = stamps.orders.toolbar.print_btn.print_modal.print_expecting_error
  actual = modal.error_message
  modal.continue.print
  actual.should eql "#{error_message} selected orders have errors and cannot be printed.\nTo mail the remaining orders, click Continue."
end

Then /^Print expecting invalid address error$/ do
  logger.step "Print expecting invalid address error"
  stamps.orders.toolbar.print_btn.print_modal.print_invalid_address.close
end

When /^Print expecting rating error$/ do
  logger.step "Print expecting rating error"
  modal = stamps.orders.toolbar.print_btn.print_modal.print_expecting_rating_error
  actual = modal.error_message
  modal.close
  actual.should include "An error occurred while attempting to rate your mail"
end

When /^Print expecting some orders can not be printed$/ do
  logger.step "Print expecting some orders can not be printed"
  modal = stamps.orders.toolbar.print_btn.print_modal.print_expecting_error
  actual = modal.error_message
  modal.continue.print
  actual.should include "To mail the remaining orders, click Continue"
end

Then /^Print Modal: Expect Modal Title is \"You have (.*) label\(s\) ready to print\"$/ do |expectation|
  logger.step "Print Modal: Expect Modal Title is \"You have #{expectation} label\(s\) ready to mail\""
  actual = stamps.orders.toolbar.print_btn.print_modal.labels_ready_to_print
  stamps.orders.toolbar.print_btn.print_modal.close
  "You have #{actual} label(s) ready to mail".should eql "You have #{expectation} label(s) ready to mail"
end

Then /^Print Modal: Expect number of required label sheets is (\d+)$/ do |sheets|
  logger.step "Print Modal: Expect Requires #{sheets} label sheets"
  stamps.orders.toolbar.print_btn.print_modal.label_sheet_required_count.should eql sheets
end

Then /^Print raises a Printing Error/ do
  logger.step "Print raises a Printing Error"
  stamps.orders.print.print_sample_expecting_error.should raise_error(PrintingError)
end

Then /^Print Modal: Print Sample$/ do
  logger.step "Print Modal: Print Sample"
  stamps.orders.toolbar.print_btn.print_modal.print_sample
end

Then /^Print Modal: Print Sample raises a Printing Error/ do
  logger.step "Print Modal: Print Sample raises a Printing Error"
  stamps.orders.toolbar.print_btn.print_modal.print_sample_expecting_error.should raise_error(PrintingError)
end

Then /^Expect (.*) pane selected$/ do |value|

end

Then /^Select (.*) pane$/ do |value|

end



