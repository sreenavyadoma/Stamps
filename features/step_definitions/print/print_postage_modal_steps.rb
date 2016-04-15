

#Print: Set Printer to "factory"


When /^Footer: Print International Postage$/ do
  log.info "Step: Print International Postage"
  postage.footer.print_international
  sleep 3
  intl_print_window = Windows::PrintWindow.new
  intl_print_window.print

end

When /^Footer: Open Print Postage Modal$/ do
  log.info "Step: Print: Open Modal"
  @print_window = postage.footer.print
end


Then /^Print: Select Postage Printer \"(.*)\"$/ do |printer|
  log.info "Step: Select Printer #{printer}"
  @print_window.printer.select printer
end


When /^Footer: Print Postage$/ do
  log.info "Step: Print"
  print_postage_modal = postage.footer.print
  @printer = print_postage_modal.printer.text_box.text
  @paper_tray = print_postage_modal.paper_tray.text_box.text
  @printing_error = print_postage_modal.print
end

Then /^Postage: Print: Close$/ do
  log.info "Step: Close Print Postage Print Modal"
  postage.postage.close
end

Then /^Footer: Print Postage  expecting error (.*)$/ do |error_message|
  log.info "Step: Print expecting error #{error_message}"
  print_postage_error = postage.print_expecting_error
  actual_error_message = print_postage_error.error_message
  print_postage_error.ok
  log.info "Print expecting error \"#{error_message}\".  :  #{actual_error_message}. #{(actual_error_message.include?error_message)?'Passed':'Failed'}"
  actual_error_message.should include error_message
end


Then /^Print Postage expecting invalid address error$/ do
  log.info "Step: Print expecting invalid address error"
  error_window = postage.print_invalid_address
  error_window.close
end

When /^Print Postage expecting rating error$/ do
  log.info "Step: Print expecting rating error"
  error_window = orders.toolbar.postage.print_expecting_rating_error
  actual_error_message = error_window.error_message
  error_window.close
  expect(actual_error_message.include? 'An error occurred while attempting to rate your print').to be true
end


Then /^Print Postage raises a Printing Error/ do
  log.info "Step: Print raises a Printing Error"
  expect{postage.postage.print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Postage Sample on (.*)$/ do |printer|
  log.info "Step: Print: Print Sample on #{printer}"
  postage.print(printer).print_sample
end

Then /^Print Postage Sample on (.*) raises a PrintingError$/ do |printer|
  log.info "Step: Print: Print Sample on #{printer} raises a PrintingError"
  expect{postage.print(printer).print_sample_expecting_error}.to raise_error(PrintingError)
end

Then /^Print Postage Sample$/ do
  log.info "Step: Print: Print Sample"
  postage.postage.print_sample
end

Then /^Print Postage Sample raises a Printing Error/ do
  log.info "Step: Print: Print Sample raises a Printing Error"
  expect{postage.postage.print_sample_expecting_error}.to raise_error(PrintingError)
end




