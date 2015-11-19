When /^Select (\w+) side label$/ do |label_side|
  log.info "Step: Select #{label_side} side label"
  if label_side.casecmp("left") == 0
    selected = batch.toolbar.print_modal.starting_label.left
    log.info "#{label_side} side label was #{(selected)?'selected.':'not selected'}"
  elsif label_side.casecmp("right") == 0
    selected = batch.toolbar.print_modal.starting_label.right
    log.info "#{label_side} side label was #{(selected)?'selected.':'not selected'}"
  else
    raise "Label side #{label_side} is not a valid selection. Select either \"left\" or \"right\" side."
  end
end

Then /^Expect (\w+) side label selected$/ do |label|
  log.info "Expectation: Expect #{label} side label selected"
  if label.casecmp("left") == 0
    selected = batch.toolbar.print_modal.starting_label.left_selected?
    log.info "Expect #{label} side label selected.  Test #{(selected)?'Passed.':'Failed'}"
  elsif label.casecmp("right") == 0
    selected = batch.toolbar.print_modal.starting_label.right_selected?
    log.info "Expect #{label} side label selected.  Test #{(selected)?'Passed.':'Failed'}"
  else
    raise "Label side #{label_side} is not a valid selection. Select either \"left\" or \"right\" side."
  end
end

Then /^Set Print Modal Ship Date to today$/ do
  #log.info "Step: Set Print Modal Ship Date to today:"
  #batch.toolbar.print_modal.ship_date.set test_helper.print_date(days)
end

Then /^Set Print Modal Ship Date to today plus one day$/ do |day|
  log.info "Set Print Modal Ship Date to today plus #{day}"
  @ship_date = batch.toolbar.print_modal.date_picker.today # returns string of format, Nov 19
  @ship_date = batch.toolbar.print_modal.date_picker.todays_date # returns string of format, Nov 19

end

Then /^Set Print Modal Ship Date to today plus two days$/ do |day|
  log.info "Set Print Modal Ship Date to today plus #{day}"
  @ship_date = batch.toolbar.print_modal.date_picker.today # returns string of format, Nov 19
  @ship_date = batch.toolbar.print_modal.date_picker.todays_date # returns string of format, Nov 19
end

Then /^Expect Shipped Tab Date Printed to be today&/ do

end

Then /^Expect Shipped Tab Ship Date to be today&/ do

end

Then /^Expect Shipped Tab Ship Date to be today plus one&/ do

end

Then /^Expect Shipped Tab Ship Date to be today plus two&/ do

end

Then /^Expect Shipped Tab Ship Date to be today plus three&/ do

end

Then /^Set Print Modal Ship Date to today plus three days$/ do |day|
  log.info "Set Print Modal Ship Date to today plus #{day}"
  @ship_date = batch.toolbar.print_modal.date_picker.today # returns string of format, Nov 19
  @ship_date = batch.toolbar.print_modal.date_picker.todays_date # returns string of format, Nov 19
end

Then /^Expect Print Window Ship Date to be (\d+) day\(s\) from today/ do |day|
  log.info "Expectation: Expect Print Window Ship Date to be #{day} day(s) from today"
  actual = batch.toolbar.print_modal.ship_date.text
  expected = test_helper.print_date day
  log.info "Expect Print Window Ship Date to be #{expected}. Got #{actual}.  Test #{(actual.eql? expected)?'Passed':'Failed'}"
  actual.should eql expected
end

When /^Open Print Modal$/ do
  log.info "Step: Open Print Modal"
  @print_window = batch.toolbar.print_modal
end

Then /^Select Print Media \"(.*)\"$/ do |print_media|
  log.info "Step: Select Print Media #{print_media}"
  batch.toolbar.print_modal.printing_on.select print_media
end

Then /^Select Printer \"(.*)\"$/ do |printer|
  log.info "Step: Select Printer #{printer}"
  batch.toolbar.print_modal.printer.select printer
end

Then /^Expect Print Media \"(.*)\" tooltip to include \"(.*)\"$/ do |print_media, expected_value|
  log.info "Expectation: Expect Print Media #{print_media} tooltip to include #{expected_value}"
  actual_value = batch.toolbar.print_modal.printing_on.selection :tooltip, print_media
  log.info "Expect Print Media \"#{print_media}\" tooltip to include \"#{expected_value}\" - Test #{(actual_value.include? expected_value)?"Passed":"Failed"}"
  actual_value.should include expected_value
end

When /^Print$/ do
  log.info "Step: Print"
  @printing_error = batch.toolbar.print_modal.print
end

Then /^Close Print Modal$/ do
  log.info "Step: Close Print Modal"
  batch.toolbar.print_modal.close
end

Then /^Print expecting error (.*)$/ do |error_message|
  log.info "Step: Print expecting error #{error_message}"
  order_error = batch.toolbar.print_expecting_error
  actual_error_message = order_error.error_message
  order_error.ok
  log.info "Print expecting error \"#{error_message}\".  :  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should include error_message
end

Then /^Print expecting (.*) selected orders have errors and cannot be printed. To print the remaining orders, click Continue.$/ do |error_message|
  log.info "Step: Print expecting #{error_message} selected orders have errors and cannot be printed. To print the remaining orders, click Continue."
  order_errors = batch.toolbar.print_expecting_error
  actual_error_message = order_errors.error_message
  order_errors.continue.print
  log.info "Print expecting error \"#{error_message}\" selected orders have errors and cannot be printed. To print the remaining orders, click Continue.   \nActual Error Message:  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should eql "#{error_message} selected orders have errors and cannot be printed.\nTo print the remaining orders, click Continue."
end

Then /^Print expecting invalid address error$/ do
  log.info "Step: Print expecting invalid address error"
  error_window = batch.toolbar.print_invalid_address
  error_window.close
end

When /^Print expecting rating error$/ do
  log.info "Step: Print expecting rating error"
  error_window = batch.toolbar.print_modal.print_expecting_rating_error
  actual_error_message = error_window.error_message
  error_window.close
  expect(actual_error_message.include? 'An error occurred while attempting to rate your postage').to be true
end

When /^Print expecting some orders can not be printed$/ do
  log.info "Step: Print expecting some orders can not be printed"
  error_window = batch.toolbar.print_expecting_error
  actual_error_message = error_window.error_message
  error_window.continue.print
  expect(actual_error_message.include? 'To print the remaining orders, click Continue').to be true
end

Then /^Expect Print Window title to be \"You have (.*) label\(s\) ready to print\"$/ do |expectation|
  log.info "Expectation: Expect Print Window title to be \"You have #{expectation} label\(s\) ready to print\""
  actual = batch.toolbar.print_modal.labels_ready_to_print
  batch.toolbar.print_modal.close
  log.info "You have #{expectation} label(s) ready to print.  Actual Value: #{expectation}  Test #{(expectation==actual)?'Passed':'Failed'}"
  "You have #{actual} label(s) ready to print".should eql "You have #{expectation} label(s) ready to print"
end

Then /^Expect Print Window requires (\d+) label sheets$/ do |sheets|
  log.info "Expectation: Expect Print Window requires #{sheets} label sheets"
  actual = batch.toolbar.print_modal.labels_required
  log.info "Requires #{sheets} label sheets. Actual Value: #{sheets}  Test #{(sheets==actual)?'Passed':'Failed'}"
  actual.should eql sheets
end

Then /^Print raises a Printing Error/ do
  log.info "Step: Print raises a Printing Error"
  expect{batch.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Sample on (.*)$/ do |printer|
  log.info "Step: Print Sample on #{printer}"
  batch.toolbar.print_modal(printer).print_sample
end

Then /^Print Sample on (.*) raises a PrintingError$/ do |printer|
  log.info "Step: Print Sample on #{printer} raises a PrintingError"
  expect{batch.toolbar.print_modal(printer).print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Sample$/ do
  log.info "Step: Print Sample"
  batch.toolbar.print_modal.print_sample
end

Then /^Print Sample raises a Printing Error/ do
  log.info "Step: Print Sample raises a Printing Error"
  expect{batch.toolbar.print_modal.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Expect (.*) pane selected$/ do |value|

end

Then /^Select (.*) pane$/ do |value|

end

Then /^Print Postage$/ do

end



