

#Set Print Modal Printer to "factory"


When /^Open Print Postage Modal$/ do
  log.info "Step: Open Print Modal"
  @print_window = print_postage.postage_base.print
end


Then /^Select Postage Printer \"(.*)\"$/ do |printer|
  log.info "Step: Select Printer #{printer}"
  print_postage.postage_base.print.printer.select printer
end


When /^Print Postage$/ do
  log.info "Step: Print"
  print_postage_modal = print_postage.postage_base.print
  @printer = print_postage_modal.printer.text_box.text
  @paper_tray = print_postage_modal.paper_tray.text_box.text
  @printing_error = print_postage_modal.print
end

Then /^Close Print Postage Modal$/ do
  log.info "Step: Close Print Modal"
  print_postage.postage_base.print.close
end

Then /^Print Postage  expecting error (.*)$/ do |error_message|
  log.info "Step: Print expecting error #{error_message}"
  print_postage_error = print_postage.postage_base.print_expecting_error
  actual_error_message = print_postage_error.error_message
  print_postage_error.ok
  log.info "Print expecting error \"#{error_message}\".  :  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should include error_message
end


Then /^Print Postage expecting invalid address error$/ do
  log.info "Step: Print expecting invalid address error"
  error_window = print_postage.postage_base.print_invalid_address
  error_window.close
end

When /^Print Postage expecting rating error$/ do
  log.info "Step: Print expecting rating error"
  error_window = orders.toolbar.print.print_expecting_rating_error
  actual_error_message = error_window.error_message
  error_window.close
  expect(actual_error_message.include? 'An error occurred while attempting to rate your postage').to be true
end


Then /^Print Postage raises a Printing Error/ do
  log.info "Step: Print raises a Printing Error"
  expect{print_postage.postage_base.print.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Postage Sample on (.*)$/ do |printer|
  log.info "Step: Print Sample on #{printer}"
  print_postage.postage_base.print(printer).print_sample
end

Then /^Print Postage Sample on (.*) raises a PrintingError$/ do |printer|
  log.info "Step: Print Sample on #{printer} raises a PrintingError"
  expect{print_postage.postage_base.print(printer).print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Postage Sample$/ do
  log.info "Step: Print Sample"
  print_postage.postage_base.print.print_sample
end

Then /^Print Postage Sample raises a Printing Error/ do
  log.info "Step: Print Sample raises a Printing Error"
  expect{print_postage.postage_base.print.print_sample_expecting_error}.to raise_error(PrintingError)
end



