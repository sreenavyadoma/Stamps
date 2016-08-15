
When /^Postage: Print International Postage$/ do
  logger.info "Print International Postage"
  web_apps.mail.footer.print_international
end

When /^Postage: Open Print Modal$/ do
  logger.info "Postage: Open Print Modal"
  @print_window = web_apps.mail.footer.print
end

When /^Postage: Open Print Sample Modal$/ do
  logger.info "Postage: Open Print Sample Modal"
  @print_window = web_apps.mail.footer.print_sample
end

Then /^Postage Print Modal: Select Printer \"(.*)\"$/ do |printer|
  logger.info "Select Printer #{printer}"
  @print_window.printer.select printer
end

When /^Postage Print Modal: Print$/ do
  logger.info "Print"
  print_postage_modal = web_apps.mail.footer.print
  @printer = print_postage_modal.printer.text_box.text
  @paper_tray = print_postage_modal.paper_tray.text_box.text
  @printing_error = print_postage_modal.print
end

When /^Postage Print Modal: Print Sample$/ do
  logger.info "Print Sample"
  print_postage_modal = web_apps.mail.footer.print_sample
  @printer = print_postage_modal.printer.text_box.text
  @paper_tray = print_postage_modal.paper_tray.text_box.text
  @printing_error = print_postage_modal.print
end

Then /^Postage: Print: Close$/ do
  logger.info "Close Print Postage Print Modal"
  web_apps.mail.web_apps.mail.close
end




