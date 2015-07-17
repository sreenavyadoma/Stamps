When /^Print on (.*)$/ do |printer|
  batch.toolbar.print(printer).print
end

When /^Print$/ do
  @old_balance = batch.navigation_bar.balance
  @printing_error = batch.toolbar.print.print
  log @printing_error
end

When /^Open Print Window$/ do
  log "Open Print Window"
  batch.toolbar.print
end

Then /^Expect Print Window label to be "You have (\d+) labels ready to print"$/ do |expectation|
  log "Expect Print Window label to be \"You have #{expectation} labels ready to print\""
  print_window = batch.toolbar.print
  labels_to_print_count = print_window.labels_ready_to_print_count
  print_window.close
  labels_to_print_count.should eql expectation
end

Then /^Expect Print Window Total Cost to be \$([0-9.]*)$/ do |expected|
  begin
    print_window = batch.toolbar.print
    actual = print_window.total_cost
    10.times { |counter|
      log_expectation_eql "#{counter}. Print Window Total Cost", expected, actual
      break if actual.eql? expected
      actual = print_window.total_cost
    }
    print_window.close
    actual.should eql expected
  end unless expected.length == 0
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



