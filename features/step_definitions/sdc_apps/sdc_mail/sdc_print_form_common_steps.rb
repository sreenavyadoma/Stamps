
Then /^[Ss]elect Print On (.+)$/ do |str|
  if SdcEnv.new_framework
    SdcMail.print_media = TestData.hash[str]
    print_on = SdcMail.print_on
    print_on.selection(:selection_element, str)
    print_on.drop_down.click
    print_on.drop_down.click unless print_on.selection_element.present?
    print_on.selection_element.click
    expect(print_on.text_field.text_value).to include str
  else
    stamps.mail.print_on(str)
  end
  TestData.hash[:print_on] = str
end

Then /^[Ss]how Advanced Options$/ do
  stamps.mail.print_form.advanced_options.show
  expect(stamps.mail.print_form.advanced_options).to be_present, "Print Media error in Advanced Options. Check your feature file workflow."
end
