
Then /^[Ss]elect Print On (.+)$/ do |str|
  if SdcEnv.new_framework
    SdcMail.print_media = TestData.hash[str]
    print_on = SdcMail.print_on
    print_on.selection(name: :selection_element, lov: str)
    print_on.drop_down.wait_until_present(timeout: 3)
    print_on.text_field.wait_until_present(timeout: 3)
    print_on.drop_down.click
    print_on.selection_element.wait_until_present(timeout: 3)
    print_on.drop_down.click unless print_on.selection_element.present?
    print_on.selection_element.click
    print_on.text_field.wait_until_present(timeout: 3)
    expect(print_on.text_field.text_value).to eql str
  else
    stamps.mail.print_on(str)
  end
  TestData.hash[:print_on] = str
end

Then /^[Ss]how Advanced Options$/ do
  stamps.mail.print_form.advanced_options.show
  expect(stamps.mail.print_form.advanced_options).to be_present, "Print Media error in Advanced Options. Check your feature file workflow."
end
