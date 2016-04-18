
When /^Footer: Print International Postage$/ do
  log.info "Step: Print International Postage"
  postage.footer.print_international
  sleep 3
  intl_print_window = Windows::PrintWindow.new
  intl_print_window.print

end

When /^Postage: Open Print Modal$/ do
  log.info "Postage: Open Print Modal"
  @print_window = postage.footer.print
end

Then /^Postage Print Modal: Select Printer \"(.*)\"$/ do |printer|
  log.info "Step: Select Printer #{printer}"
  @print_window.printer.select printer
end

When /^Postage Print Modal: Print$/ do
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




