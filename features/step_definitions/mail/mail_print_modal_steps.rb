

Then /^(?:S|s)et Mail Print modal Printer to (.*)$/ do |printer|
  @print_window.printer.select printer
end

When /^Mail: Print International Postage$/ do
  stamps.mail.mail_footer.print_international
end

When /^(?:C|c)lick Print button on Mail Print modal$/ do
  print_postage_modal = stamps.mail.mail_footer.print
  @printer = print_postage_modal.printer.text_box.text
  @paper_tray = print_postage_modal.paper_tray.text_box.text
  @printing_error = print_postage_modal.print
end

When /^(?:C|c)lick Print button on Mail Print modal Sample$/ do
  print_postage_modal = stamps.mail.mail_footer.print_sample
  @printer = print_postage_modal.printer.text_box.text
  @paper_tray = print_postage_modal.paper_tray.text_box.text
  @printing_error = print_postage_modal.print
end

Then /^Mail: in Print modal, Close$/ do
  stamps.mail.stamps.mail.close
end




