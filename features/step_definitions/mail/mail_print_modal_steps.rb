Then /^Print (?:Postage|Label|Stamps|Envelope)$/ do
  stamps.mail.mail_toolbar.print_postage
end

When /^[Cc]lick [Mm]ail [Pp]rint modal Print button$/ do
  stamps.mail.mail_toolbar.print_postage.print
end

Then /^[Ss]et [Mm]ail [Pp]rint modal Printer to (.*)$/ do |printer|
  test_param[:printer] = printer
  step "expect mail print modal is present"
  expect(stamps.mail.mail_toolbar.print_postage.mail_printer.present?).to be(true), "Unable to print on printer #{test_param[:printer]}. Check that StampsConnect is pointing to #{modal_param.test_env} on this PC."
  expect(stamps.mail.mail_toolbar.print_postage.mail_printer).to be_present
  stamps.mail.mail_toolbar.print_postage.mail_printer.select_printer(test_param[:printer])
end

Then /^[Ee]xpect [Mm]ail [Pp]rint modal is present$/ do
  stamps.mail.mail_toolbar.print_postage.wait_until_present(5)
  expect(stamps.mail.mail_toolbar.print_postage.present?).to be(true), "Mail Print modal is NOT present"
end

When /^Mail: Print International Postage$/ do
  stamps.mail.mail_toolbar.print_international
end

When /^[Cc]lick Print button on [Mm]ail [Pp]rint modal Sample$/ do
  mail_print_modal = stamps.mail.mail_toolbar.print_sample
  @printer = mail_print_modal.printer.textbox.text
  @paper_tray = mail_print_modal.paper_tray.textbox.text
  @printing_error = mail_print_modal.print
end

Then /^Mail: in Print modal, Close$/ do
  stamps.mail.stamps.mail.close
end





