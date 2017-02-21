
Then /^(?:I|i)n Orders Toolbar, click Print button$/ do
  step "Save Order Details data"
  stamps.orders.orders_toolbar.print_btn.print_modal
end

Then /^(?:I|i)n Print modal, click Print button Incomplete Order$/ do
  @incomplete_order_modal = stamps.orders.orders_toolbar.print_btn.print_modal

  expect("Incomplete Order Modal did not open").to eql "In Print modal, click Print button Incomplete Order" unless @incomplete_order_modal.instance_of? Orders::Toolbar::PrintIncompleteOrderError
end

Then /^(?:I|i)n Print modal, expect Incomplete Order Error Message (.*)$/ do |expectation|
  expect(@incomplete_order_modal.error_message).to include(expectation)
end

Then /^(?:I|i)n Print modal, click Close button$/ do
  stamps.orders.orders_toolbar.print_btn.print_modal.close
end

Then /^(?:I|i)n Print modal, set Printer to \"(.*)\"$/ do |printer|
  stamps.orders.orders_toolbar.print_btn.print_modal.printer.select printer
end

Then /^ReIn Print modal, Reprint$/ do
  stamps.orders.orders_toolbar.reprint.reprint
end

Then /^(?:I|i)n Print modal, set Ship Date to today$/ do
  step "In Print modal, set Ship Date to today plus #{1}"
end

Then /^(?:I|i)n Print modal, set Ship Date to today plus (\d+)$/ do |day|
  ship_date = ParameterHelper.now_plus_mon_dd day
  @ship_date = stamps.orders.orders_toolbar.print_btn.print_modal.ship_date.date_picker.today_plus day
end

Then /^(?:I|i)n Print modal, check Hide Mail Value$/ do
  stamps.orders.orders_toolbar.print_btn.print_modal.print_options.hide_postage_value.check
end

Then /^(?:I|i)n Print modal, uncheck Hide Mail Value$/ do
  stamps.orders.orders_toolbar.print_btn.print_modal.print_options.hide_postage_value.uncheck
end

Then /^(?:I|i)n Print modal, expect Hide Mail Value Checkbox is checked$/ do
  30.times do
    stamps.orders.orders_toolbar.print_btn.print_modal.click
    break if stamps.orders.orders_toolbar.print_btn.print_modal.print_options.hide_postage_value.checked?
  end
  expect(stamps.orders.orders_toolbar.print_btn.print_modal.print_options.hide_postage_value.checked?).to be true
end

Then /^(?:I|i)n Print modal, check Email Tracking Details to Recipients$/ do
  stamps.orders.orders_toolbar.print_btn.print_modal.print_options.email_tracking.check
end

Then /^(?:I|i)n Print modal, uncheck Email Tracking Details to Recipients$/ do
  stamps.orders.orders_toolbar.print_btn.print_modal.print_options.email_tracking.uncheck
end

Then /^(?:I|i)n Print modal, uncheck Print Reference # on Shipping Label$/ do
  stamps.orders.orders_toolbar.print_btn.print_modal.print_options.print_reference_no.uncheck
end

Then /^(?:I|i)n Print modal, check Print Reference # on Shipping Label$/ do
  stamps.orders.orders_toolbar.print_btn.print_modal.print_options.print_reference_no.check
end

When /^(?:I|i)n Print modal, select left-side label$/ do
  stamps.orders.orders_toolbar.print_btn.print_modal.starting_label.left
end

When /^(?:I|i)n Print modal, select right-side label$/ do
  stamps.orders.orders_toolbar.print_btn.print_modal.starting_label.right
end

Then /^(?:I|i)n Print modal, expect right-side label selected$/ do
  expect(stamps.orders.orders_toolbar.print_btn.print_modal.starting_label.right_selected?).to be true
end

Then /^(?:I|i)n Print modal, expect left-side label selected$/ do
  expect(stamps.orders.orders_toolbar.print_btn.print_modal.starting_label.left_selected?).to be true
end

Then /^(?:I|i)n Print modal, expect Ship Date is (\d+) day\(s\) from today/ do |day|
  expect(stamps.orders.orders_toolbar.print_btn.print_modal.ship_date.text).to eql ParameterHelper.date_printed(day)
end

Then /^(?:I|i)n Print modal, set Print-On to \"(.*)\"$/ do |expectation|
  stamps.orders.orders_toolbar.print_btn.print_modal.printing_on.select(expectation)
end

Then /^(?:I|i)n Print modal, expect Printing On Label is (.*)$/ do |expectation|
  expect(stamps.orders.orders_toolbar.print_btn.print_modal.printing_on.label.text).to eql expectation
end

Then /^Select Printer \"(.*)\"$/ do |printer|
  stamps.orders.orders_toolbar.print_btn.print_modal.printer.select(printer)
end

Then /^Close Reprint Modal$/ do
  stamps.orders.orders_toolbar.reprint.close
end

Then /^Close Label Unavailable Modal$/ do
  stamps.orders.orders_toolbar.ok.close
end

Then /^Print expecting error (.*)$/ do |error_message|
  modal = stamps.orders.orders_toolbar.print_btn.print_modal.print_expecting_error
  actual = modal.error_message
  modal.ok
  expect(actual).to include error_message
end

Then /^Print expecting (.*) selected orders have errors and cannot be printed. To print the remaining orders, click Continue.$/ do |error_message|
  modal = stamps.orders.orders_toolbar.print_btn.print_modal.print_expecting_error
  actual = modal.error_message
  modal.continue.print
  expect(actual).to eql "#{error_message} selected orders have errors and cannot be printed.\nTo mail the remaining orders, click Continue."
end

Then /^Print expecting invalid address error$/ do
  stamps.orders.orders_toolbar.print_btn.print_modal.print_invalid_address.close
end

When /^Print expecting rating error$/ do
  modal = stamps.orders.orders_toolbar.print_btn.print_modal.print_expecting_rating_error
  actual = modal.error_message
  modal.close
  expect(actual).to include "An error occurred while attempting to rate your mail"
end

When /^Print expecting some orders can not be printed$/ do
  modal = stamps.orders.orders_toolbar.print_btn.print_modal.print_expecting_error
  actual = modal.error_message
  modal.continue.print
  expect(actual).to include "To mail the remaining orders, click Continue"
end

Then /^(?:I|i)n Print modal, expect Modal Title is \"You have (.*) label\(s\) ready to print\"$/ do |expectation|
  actual = stamps.orders.orders_toolbar.print_btn.print_modal.labels_ready_to_print
  stamps.orders.orders_toolbar.print_btn.print_modal.close
  expect("You have #{actual} label(s) ready to mail").to eql "You have #{expectation} label(s) ready to mail"
end

Then /^(?:I|i)n Print modal, expect number of required label sheets is (\d+)$/ do |sheets|
  expect(stamps.orders.orders_toolbar.print_btn.print_modal.label_sheet_required_count).to eql sheets
end

Then /^Print raises a Printing Error/ do
  expect(stamps.orders.print.print_sample_expecting_error).to raise_error(PrintingError)
end

Then /^(?:I|i)n Print modal, click Print button Sample$/ do
  stamps.orders.orders_toolbar.print_btn.print_modal.print_sample
end

Then /^(?:I|i)n Print modal, click Print button Sample raises a Printing Error/ do
  expect(stamps.orders.orders_toolbar.print_btn.print_modal.print_sample_expecting_error).to raise_error(PrintingError)
end

Then /^Expect (.*) pane selected$/ do |value|

end

Then /^Select (.*) pane$/ do |value|

end



