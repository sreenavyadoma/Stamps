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
  step "Open Print Window"
  @print_window.print
  log "Printing Error:  #{@printing_error}"
end

When /^Open Print Window$/ do
  log "Open Print Window"
  @print_window = batch.toolbar.print_window
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



