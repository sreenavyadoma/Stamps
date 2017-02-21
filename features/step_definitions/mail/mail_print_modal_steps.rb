
When /^(?:C|c)lick Mail Print modal Print button$/ do
  stamps.mail.mail_toolbar.mail_print_modal.print
end

Then /^(?:S|s)et Mail Print modal Printer to (.*)$/ do |printer|
  stamps.mail.mail_toolbar.mail_print_modal.printer.select(printer)
end

When /^Mail: Print International Postage$/ do
  stamps.mail.mail_toolbar.print_international
end

When /^(?:C|c)lick Print button on Mail Print modal Sample$/ do
  mail_print_modal = stamps.mail.mail_toolbar.print_sample
  @printer = mail_print_modal.printer.text_box.text
  @paper_tray = mail_print_modal.paper_tray.text_box.text
  @printing_error = mail_print_modal.print
end

Then /^Mail: in Print modal, Close$/ do
  stamps.mail.stamps.mail.close
end




