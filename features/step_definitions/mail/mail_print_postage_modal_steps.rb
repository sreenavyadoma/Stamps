
When /^Mail: Print International Postage$/ do
  logger.step "Print International Postage"
  stamps.mail.footer.print_international
end

When /^Mail: Open Print Modal$/ do
  logger.step "Mail: Open Print Modal"
  @print_window = stamps.mail.footer.print
end

When /^Mail: Open Print Sample Modal$/ do
  logger.step "Mail: Open Print Sample Modal"
  @print_window = stamps.mail.footer.print_sample
end

Then /^Mail Print Modal: Select Printer \"(.*)\"$/ do |printer|
  logger.step "Select Printer #{printer}"
  @print_window.printer.select printer
end

When /^Mail Print Modal: Print$/ do
  logger.step "Print"
  print_postage_modal = stamps.mail.footer.print
  @printer = print_postage_modal.printer.text_box.text
  @paper_tray = print_postage_modal.paper_tray.text_box.text
  @printing_error = print_postage_modal.print
end

When /^Mail Print Modal: Print Sample$/ do
  logger.step "Print Sample"
  print_postage_modal = stamps.mail.footer.print_sample
  @printer = print_postage_modal.printer.text_box.text
  @paper_tray = print_postage_modal.paper_tray.text_box.text
  @printing_error = print_postage_modal.print
end

Then /^Mail: Print Modal: Close$/ do
  logger.step "Close Print Mail Print Modal"
  stamps.mail.stamps.mail.close
end




