When /^Print on (.*)$/ do |printer|
  batch.toolbar.print(printer).print
end

When /^Open Print Window$/ do
  log "Open Print Window"
  @print_window
  @print_window = batch.toolbar.print
end

Then /^Close Print Window$/ do
  (@print_window.close if @print_window.present?) unless @print_window.nil?
end

When /^Print$/ do
  @old_balance = batch.navigation_bar.balance
  @print_window = batch.toolbar.print_window if @print_window.nil?
  @print_window.print
  log "Printing Error:  #{@printing_error}"
end

Then /^Print expecting invalid address error$/ do
  error_window = batch.toolbar.print_expecting_invalid_address
  error_window.OK
end

Then /^Print expecting indicium error$/ do
  error_window = batch.toolbar.print_expecting_indicium_error
  actual_error_message = error_window.error_message
  error_window.OK
  expect(actual_error_message.include? 'createLabelIndicium Error').to be true
end

When /^Print expecting rating error$/ do
  error_window = batch.toolbar.print.print_expecting_rating_error
  actual_error_message = error_window.error_message
  error_window.OK
  expect(actual_error_message.include? 'An error occurred while attempting to rate your postage').to be true
end

When /^Print expecting some orders can not be printed$/ do
  error_window = batch.toolbar.print_expecting_errors
  actual_error_message = error_window.error_message
  error_window.continue.print
  expect(actual_error_message.include? 'To print the remaining orders, click Continue').to be true
end

Then /^Expect Print Window label to be "You have (\d+) labels ready to print"$/ do |expectation|
  log "Expect Print Window label to be \"You have #{expectation} labels ready to print\""
  print_window = batch.toolbar.print
  actual = print_window.labels_ready_to_print
  print_window.close
  actual.should eql expectation
end

Then /^Expect Print Window Total Cost to be \$([0-9.]*)$/ do |expectation|
  begin
    print_window = batch.toolbar.print
    actual_value = print_window.total_cost
    10.times { |counter|
      log_expectation_eql "#{counter}. Print Window Total Cost", expectation, actual_value
      break if actual_value.eql? expectation
      actual_value = print_window.total_cost
    }
    print_window.close
    actual_value.should eql expectation
  end unless expectation.length == 0
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



