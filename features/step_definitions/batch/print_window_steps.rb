When /^Select (\w+) side label$/ do |label_side|
  if label_side.casecmp("left") == 0
    selected = @print_window.left_label
    log "#{label_side} side label was #{(selected)?'selected.':'not selected'}"
  elsif label_side.casecmp("right") == 0
    selected = @print_window.right_label
    log "#{label_side} side label was #{(selected)?'selected.':'not selected'}"
  else
    raise "Label side #{label_side} is not a valid selection. Select either \"left\" or \"right\" side."
  end
end

Then /^Expect (\w+) side label selected$/ do |label|
  if label.casecmp("left") == 0
    selected = @print_window.left_label_selected?
    log "Expect #{label} side label selected.  Test #{(selected)?'Passed.':'Failed'}"
  elsif label.casecmp("right") == 0
    selected = @print_window.right_label_selected?
    log "Expect #{label} side label selected.  Test #{(selected)?'Passed.':'Failed'}"
  else
    raise "Label side #{label_side} is not a valid selection. Select either \"left\" or \"right\" side."
  end
end

Then /^Set Ship Date to (\d+) day from today$/ do |days|
  @print_window.ship_date = test_helper.print_date(days)
end

Then /^Set Ship Date Picker to (\d+) day\(s\) from today$/ do |day|
  @print_window.pick_date day unless @print_window.nil?
end

Then /^Expect Print Window Ship Date to be (\d+) day\(s\) from today/ do |day|
  begin
    actual = @print_window.ship_date
    expected = test_helper.print_date day
    log "Expect Print Window Ship Date to be #{expected}. Got #{actual}.  Test #{(actual.eql? expected)?'Passed':'Failed'}"
    actual.should eql expected
  end unless @print_window.nil?
end

When /^Open Print Modal$/ do
  log "Open Print Modal"
  @print_window = batch.toolbar.print_modal
end

Then /^Select Print Media \"(.*)\"$/ do |print_media|
  @print_window = batch.toolbar.print_modal

  field = @print_window.print_media.selection :field, print_media
  log field.present?

  @print_window.print_media.selection :tooltip, print_media
  @print_window.print_media.select print_media
end

When /^Print$/ do
  @printing_error = batch.toolbar.print_modal.print
end

Then /^Close Print Window$/ do
  batch.toolbar.print_modal.close
end

Then /^Click Print Modal - Print button$/ do
  if @print_window.nil?
    @printing_error =  true
  else
    @printing_error = @print_window.print
  end
end

Then /^Print expecting error (.*)$/ do |error_message|
  order_error = batch.toolbar.print_expecting_error
  actual_error_message = order_error.error_message
  order_error.ok
  log "Print expecting error \"#{error_message}\".   \nActual Error Message:  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should include error_message
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
  error_window.close
end

When /^Print expecting rating error$/ do
  error_window = batch.toolbar.print_modal.print_expecting_rating_error
  actual_error_message = error_window.error_message
  error_window.close
  expect(actual_error_message.include? 'An error occurred while attempting to rate your postage').to be true
end

When /^Print expecting some orders can not be printed$/ do
  error_window = batch.toolbar.print_expecting_error
  actual_error_message = error_window.error_message
  error_window.continue.print
  expect(actual_error_message.include? 'To print the remaining orders, click Continue').to be true
end

Then /^Expect Print Window title to be \"You have (.*) label\(s\) ready to print\"$/ do |expectation|
  #print_window = batch.toolbar.print_modal
  if @print_window.nil? || !@print_window.present?
    raise "Print Window is not open."
  end
  actual = @print_window.labels_ready_to_print
  @print_window.close
  log "You have #{expectation} label(s) ready to print.  Actual Value: #{expectation}  Test #{(expectation==actual)?'Passed':'Failed'}"
  "You have #{actual} label(s) ready to print".should eql "You have #{expectation} label(s) ready to print"
end

Then /^Print raises a Printing Error/ do
  expect{batch.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Sample on (.*)$/ do |printer|
  batch.toolbar.print_modal(printer).print_sample
end

Then /^Print Sample on (.*) raises a PrintingError$/ do |printer|
  expect{batch.toolbar.print_modal(printer).print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Sample$/ do
  batch.toolbar.print_modal.print_sample
end

Then /^Print Sample raises a Printing Error/ do
  expect{batch.toolbar.print_modal.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Expect (.*) pane selected$/ do |value|

end

Then /^Select (.*) pane$/ do |value|

end

Then /^Print Postage$/ do

end



