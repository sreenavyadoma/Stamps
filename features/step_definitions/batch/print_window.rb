When /^Print on (.*)$/ do |printer|
  batch.toolbar.print(printer).print
end

When /^Print$/ do
  batch.toolbar.print.print
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