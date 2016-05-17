
When /^Footer: Print International Postage$/ do
  log.info "Print International Postage"
  postage.footer.print_international
end

When /^Postage: Open Print Modal$/ do
  log.info "Postage: Open Print Modal"
  @print_window = postage.footer.print
end

When /^Postage: Open Print Sample Modal$/ do
  log.info "Postage: Open Print Sample Modal"
  @print_window = postage.footer.print_sample
end

Then /^Postage Print Modal: Select Printer \"(.*)\"$/ do |printer|
  log.info "Select Printer #{printer}"
  @print_window.printer.select printer
end

When /^Postage Print Modal: Print$/ do
  log.info "Print"
  print_postage_modal = postage.footer.print
  @printer = print_postage_modal.printer.text_box.text
  @paper_tray = print_postage_modal.paper_tray.text_box.text
  @printing_error = print_postage_modal.print
end

When /^Postage Print Modal: Print Sample$/ do
  log.info "Print Sample"
  print_postage_modal = postage.footer.print_sample
  @printer = print_postage_modal.printer.text_box.text
  @paper_tray = print_postage_modal.paper_tray.text_box.text
  @printing_error = print_postage_modal.print
end

Then /^Postage: Print: Close$/ do
  log.info "Close Print Postage Print Modal"
  postage.postage.close
end




