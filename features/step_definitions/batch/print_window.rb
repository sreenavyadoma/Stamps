When /^Print on (.*)$/ do |printer|
  batch.toolbar.print(printer).print
end

When /^Print$/ do
  @old_balance = batch.navigation_bar.balance
  batch.toolbar.print.print
  log "Printing Error:  #{@printing_error}"
end

When /^Expect Print Error ([\w .]*)$/ do |error_message|
  actual_error_message = batch.toolbar.print.error_message
  batch.toolbar.print.ok
  expect(actual_error_message.include? error_message).to be true
end

When /^Expect Print Error (.+) selected orders have errors and cannot be printed.  To print the remaining orders, click Continue.$/ do |error_message|
  @old_balance = batch.navigation_bar.balance
  actual_error_message = batch.toolbar.print.error_message
  batch.toolbar.print.continue.print
  expect(actual_error_message.error_message.include? error_message).to be true
end

When /^Open Print Window$/ do
  log "Open Print Window"
  @print_window = batch.toolbar.print
end

Then /^Close Print Window$/ do
  @print_window.close
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



