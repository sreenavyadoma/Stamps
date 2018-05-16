
Then /^[Ss]elect Print On (.+)$/ do |str|
  if SdcEnv.new_framework
    print_on = SdcMail.print_on
    print_on.selection(:selection_element, str)
    print_on.drop_down.wait_until_present(timeout: 3)
    print_on.text_field.wait_until_present(timeout: 3)
    print_on.drop_down.safe_click
    print_on.selection_element.wait_until_present(timeout: 3)
    print_on.drop_down.click unless print_on.selection_element.present?
    print_on.selection_element.click
    print_on.text_field.wait_until_present(timeout: 3)
    expect(print_on.text_field.text_value).to eql(str) unless str.include? 'Manage'
  else
    stamps.mail.print_on(str)
  end
#  SdcMail.print_media = SdcPrintMediaHelper.to_sym(str)
  TestData.hash[:print_media] = str
end

Then /^select all options in manage printing options/ do
  step "select Print On Manage Printing Options..."
  step "expect manage print options modal is present"
  step "check Stamps in manage print options"
  step "check Shipping Label - 8 ½\" x 11\" Paper in manage print options"
  step "check Shipping Label - SDC-1200, 4 ¼\" x 6 ¾\" in manage print options"
  step "check Shipping Label - 5 ½\" x 8 ½\" in manage print options"
  step "check Envelope - #10, 4 ⅛\" x 9 ½\" in manage print options"
  step "check Envelope - #9, 3 ⅞\" x 8 ⅞\" in manage print options"
  step "check Envelope - #A9, 5 ¾\" x 8 ¾\" in manage print options"
  step "check Envelope - #6, 3 ⅝\" x 6 ½\" in manage print options"
  step "check Envelope - #A2, 4 ⅜\" x 5 ¾\" in manage print options"
  step "check Envelope - #7, 3 ⅞\" x 7 ½\" in manage print options"
  step "check Envelope - #11, 4 ½\" x 10 ⅜\" in manage print options"
  step "check Envelope - #12, 4 ¾\" x 11\" in manage print options"
  step "check Certified Mail Label - SDC-3610 in manage print options"
  step "check Certified Mail Label - SDC-3710 in manage print options"
  step "check Certified Mail Label - SDC-3910 in manage print options"
  step "check Certified Mail Label - SDC-3930 in manage print options"
  step "check Certified Mail #11 Envelope - SDC-3810 in manage print options"
  step "check Certified Mail #11 Envelope - SDC-3830 in manage print options"
  step "check Roll - 4\" x 6\" Shipping Label in manage print options"
  step "check Roll - 4 ⅛\" x 6 ¼\" Shipping Label in manage print options"
  step "click save in manage print options"
end

Then /^check (.+) in manage print options$/ do |str|
  step "search for #{str} in manage print options"
  manage_print_options = SdcMail.modals.manage_print_options
  manage_print_options.print_option_checkbox.check
end

Then /^expect manage print options modal is present$/ do
  expect(SdcMail.modals.manage_print_options.search.present?).to eql(true)
end

Then /^uncheck (.+) in manage print options$/ do |str|
  step "search for #{str} in manage print options"
  SdcMail.modals.manage_print_options.print_option_checkbox.uncheck
end

Then /^search for (.+) in manage print options$/ do |str|
  manage_print_options = SdcMail.modals.manage_print_options
  manage_print_options.search.set str
  manage_print_options.search.send_keys(:enter)
  manage_print_options.search_button.click
end

Then /^click save in manage print options$/ do
  SdcMail.modals.manage_print_options.save.click
end

Then /^[Ss]how Advanced Options$/ do
  if SdcEnv.new_framework
    SdcMail.print_form.show_advanced_options
    expect(SdcMail.print_form.extra_services.text_value).to eql 'Select...'
  else
    stamps.mail.print_form.advanced_options.show
    expect(stamps.mail.print_form.advanced_options).to be_present, 'Print Media error in Advanced Options. Check your feature file workflow.'
  end
end
