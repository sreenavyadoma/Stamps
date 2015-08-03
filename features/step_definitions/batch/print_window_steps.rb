When /^Select (\w+) side label$/ do |label_side|
  if label_side.casecmp("left") == 0
    @print_window.left_label
  elsif label_side.casecmp("right") == 0
    @print_window.right_label
  else
    raise "Label side #{label_side} is not a valid selection. Select either \"left\" or \"right\" side."
  end
end

When /^Print$/ do
  if @print_window.nil? || !@print_window.present?
    step 'Click Toolbar Print Button'
  end
  @print_window.print
  #log "Printing Error:  #{@printing_error}" unless @printing_error.nil? || @printing_error.length > 0
end

Then /^Set Ship Date to (\d+) day from today$/ do |days|
  @print_window.ship_date=test_helper.date_now(days)
end

Then /^Set Ship Date Picker to today$/ do
  @print_window.date_picker "today"
end

Then /^Expect Print Window Ship Date to be today$/ do
  actual = @print_window.ship_date
  expected = test_helper.date_now 0
  actual.should eql expected
end

When /^Click Toolbar Print Button$/ do
  log "Click Toolbar Print Button"
  @print_window = batch.toolbar.print
end

Then /^Close Print Window$/ do
  @print_window.close
end

Then /^Click Print Window - Print button$/ do
  @print_window.print
end

Then /^Expect default print label to be Left side$/ do
  default_selected = @print_window.default_label_selected?
  default_selected.should be true
end

Then /^Print expecting error (.*)$/ do |error_message|
  order_error = batch.toolbar.print_expecting_error
  actual_error_message = order_error.error_message
  order_error.ok
  log "Print expecting error \"#{error_message}\".   \nActual Error Message:  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should eql error_message
end

Then /^Print expecting (.*) selected orders have errors and cannot be printed. To print the remaining orders, click Continue.$/ do |error_message|
  order_errors = batch.toolbar.print_expecting_error
  actual_error_message = order_errors.error_message
  order_errors.continue.print
  log "Print expecting error \"#{error_message}\" selected orders have errors and cannot be printed. To print the remaining orders, click Continue.   \nActual Error Message:  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should eql "#{error_message} selected orders have errors and cannot be printed.\nTo print the remaining orders, click Continue."
end


Then /^Print expecting invalid address error$/ do
  error_window = batch.toolbar.print_invalid_address
  error_window.ok
end

When /^Print expecting rating error$/ do
  error_window = batch.toolbar.print.print_expecting_rating_error
  actual_error_message = error_window.error_message
  error_window.ok
  expect(actual_error_message.include? 'An error occurred while attempting to rate your postage').to be true
end

When /^Print expecting some orders can not be printed$/ do
  error_window = batch.toolbar.print_expecting_error
  actual_error_message = error_window.error_message
  error_window.continue.print
  expect(actual_error_message.include? 'To print the remaining orders, click Continue').to be true
end

Then /^Expect Print Window title to be \"(.*)\"$/ do |title|
  print_window = batch.toolbar.print
  actual = print_window.labels_ready_to_print
  print_window.close
  actual.should eql title
end

Then /^Print raises a Printing Error/ do
  expect{batch.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Sample on (.*)$/ do |printer|
  batch.toolbar.print(printer).print_sample
end

Then /^Print Sample on (.*) raises a PrintingError$/ do |printer|
  expect{batch.toolbar.print(printer).print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Sample$/ do
  batch.toolbar.print.print_sample
end

Then /^Print Sample raises a Printing Error/ do
  expect{batch.toolbar.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Expect (.*) pane selected$/ do |value|

end

Then /^Select (.*) pane$/ do |value|

end

Then /^Print Postage$/ do

end



