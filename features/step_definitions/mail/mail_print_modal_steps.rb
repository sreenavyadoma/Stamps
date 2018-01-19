Then /^Print (?:[Pp]ostage|[Ll]abel|[Ss]tamps|[Ee]nvelope)$/ do
  stamps.mail.mail_toolbar.print_postage
end

Then /^Print (?:[Pp]ostage|[Ll]abel|[Ss]tamps|[Ee]nvelope) using [Ss]plit [Bb]utton$/ do
  stamps.mail.toolbar_menu.print_button.click
end

Then /^[Ee]xpect [Pp]rint [Ff]orm [Ii]ncomplete [Ff]ields [Dd]ialog is [Pp]resent$/ do
  expect(stamps.mail.mail_toolbar.print_postage_expecting_error).to eql('Incomplete Fields')
end


Then /^[Ee]xpect [Pp]rint [Ff]orm [Ww]arning [Mm]essage is (.*)/ do |str|
  step "expect Print form Incomplete Fields dialog is present"
  expect(stamps.mail.mail_modals.incomplete_fields.warning_message.text).to include(str)
end

When /^[Cc]lick [Mm]ail [Pp]rint modal Print [Bb]utton$/ do
  stamps.mail.mail_toolbar.print_postage.print
end

Then /^[Ss]et [Mm]ail [Pp]rint modal Printer ?(?:|(.*))$/ do |printer|
  test_param[:printer]=(printer.nil?)? modal_param.printer : printer
  expect(test_param[:printer]).to match(/\\.+\.*/) if test_param[:printer].include?('\\') #validate printer format
  step "expect mail print modal is present"
  expect(stamps.mail.mail_toolbar.print_postage.mail_printer).to be_present, "Unable to print on printer #{test_param[:printer]}. Check that StampsConnect is pointing to #{modal_param.test_env} on this PC."
  expect(stamps.mail.mail_toolbar.print_postage.mail_printer.select_printer(test_param[:printer])).to_not be(false), "Unable to select printer #{printer}. The printer does not exist in Printer drop-down list of values."
end

Then /^[Cc]lose [Mm]ail [Pp]rint [Mm]odal$/ do
  stamps.mail.mail_toolbar.mail_print_modal.x_button.click #todo-Rob refactor Print Modal to stamps.mail.modals.mail_print_modal
end

Then /^[Ee]xpect [Mm]ail [Pp]rint modal is present$/ do
  stamps.mail.mail_toolbar.print_postage.wait_until_present(5)
  expect(stamps.mail.mail_toolbar.print_postage).to be_present, "Mail Print modal is NOT present"
end

When /^Mail: Print International Postage$/ do
  stamps.mail.mail_toolbar.print_international
end

#todo-Rob fix code smells
When /^[Cc]lick Print button on [Mm]ail [Pp]rint modal Sample$/ do
  mail_print_modal=stamps.mail.mail_toolbar.print_sample
  @printer=mail_print_modal.printer.textbox.text
  @paper_tray=mail_print_modal.paper_tray.textbox.text
  @printing_error=mail_print_modal.print
end

#todo-Rob change sentence structure and make print modal float (stamps.mail.mail_print_modal)
Then /^Mail: in Print modal, Close$/ do
  stamps.mail.mail_toolbar.mail_print_modal.x_button.click
end