
Then /^[Ss]how Advanced Options$/ do
  stamps.mail.print_form.advanced_options.show
end

Then /^(?:H|h)ide Advanced Options$/ do
  stamps.mail.print_form.advanced_options.hide
end

Then /^[Ss]elect Advanced Options Extra Services$/ do
  stamps.mail.print_form.advanced_options.extra_services
end

Then /^[Ee]xpect Advanced Options Extra Services Button is visible$/ do
  expect(stamps.mail.print_form.advanced_options.extra_services_select_button.visible?).to be(true), "Extra Services Button is NOT disabled"
end

Then /^[Ss]elect Advanced Options Specify Postage Amount$/ do
  stamps.mail.print_form.advanced_options.specify_postage_amount.select
end

Then /^[Ee]xpect Advanced Options Specify Postage Amount is selected$/ do
  expect(stamps.mail.print_form.advanced_options.specify_postage_amount.selected?).to be(true), "Specify Postage Amount was NOT selected"
end

Then /^[Ee]xpect Advanced Options Calculate Postage Amount radio button is present$/ do
  expect(stamps.mail.print_form.advanced_options.calculate_postage_amount.present?).to be(true), "Stamps Calculate Postage Amount radio button is NOT present"
end

Then /^[Ee]xpect Advanced Options Specify Postage Amount radio button is present$/ do
  expect(stamps.mail.print_form.advanced_options.specify_postage_amount.present?).to be(true), "Stamps Specify Postage Amount radio button is NOT present"
end

Then /^[Ss]elect Advanced Options Calculate Postage Amount$/ do
  stamps.mail.print_form.advanced_options.calculate_postage_amount.select
end

Then /^[Ee]xpect Advanced Options Calculate Postage Amount is selected$/ do
  expect(stamps.mail.print_form.advanced_options.calculate_postage_amount.selected?).to be(true), "Calculate Postage Amount was NOT selected"
end

Then /^[Ee]xpect Advanced Options Mail Date field is present$/ do
  stamps.mail.print_form.advanced_options.mail_date.text_box.text
  stamps.mail.print_form.advanced_options.mail_date.text_box.set("03/29/2017")
  stamps.mail.print_form.advanced_options.mail_date.date_picker.today
  stamps.mail.print_form.advanced_options.mail_date.date_picker.todays_date_plus(0)
  stamps.mail.print_form.advanced_options.mail_date.date_picker.todays_date_plus(1)
  stamps.mail.print_form.advanced_options.mail_date.date_picker.todays_date_plus(2)
  stamps.mail.print_form.advanced_options.mail_date.date_picker.todays_date_plus(3)
  stamps.mail.print_form.advanced_options.mail_date.date_picker.todays_date_plus(4)
  stamps.mail.print_form.advanced_options.mail_date.date_picker.todays_date_plus(5)
end

Then /^[Ee]xpect Advanced Options Mail Date is (?:correct|((?:today|tomorrow))?|(.*))$/ do |today, expectation|
  logger.info "today is #{today}"
  logger.info "expectation is #{expectation}"


  #expectation = test_parameter[:reference_number] if expectation.nil?


  #expect(stamps.mail.print_form.advanced_options.reference_number.text).to eql(expectation), "Advanced Options Reference Number is incorrect"
end







Then /^[Ss]et Advanced Options Reference Number to (?:(?:a |some |)random string|(.*))$/ do |str|
  test_parameter[:reference_number] = (str.nil?)?ParameterHelper.random_string : str
  stamps.mail.print_form.advanced_options.reference_number.set(test_parameter[:reference_number])
end

Then /^[Ee]xpect Advanced Options Reference Number field is present$/ do
  expect(stamps.mail.print_form.advanced_options.reference_number.present?).to be(true), "Reference Number field is NOT present"
end

Then /^[Ee]xpect Advanced Options Reference Number is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:reference_number] if expectation.nil?
  expect(stamps.mail.print_form.advanced_options.reference_number.text).to eql(expectation), "Advanced Options Reference Number is incorrect"
end

Then /^[Ee]xpect Advanced Options Cost Code Field is present$/ do
  expect(stamps.mail.print_form.advanced_options.cost_code.text_box.present?).to be(true), "Print form Cost Code Field is NOT present"
end

Then /^[Ss]et Advanced Options Cost Code to (.*)$/ do |str|
  stamps.mail.print_form.advanced_options.cost_code.select(str)
end

Then /^[Ee]xpect Advanced Options Cost Code is (.*)$/ do |expectation|
  expect(stamps.mail.print_form.advanced_options.cost_code.text_box.text).to eql(expectation)
end







Then /^Mail Stamps: Set Print All to Checked$/ do
  stamps.mail.netstamps.form_view.print_all.check # todo rework
end

Then /^Mail Stamps: Set Print All to Unchecked$/ do
  stamps.mail.netstamps.form_view.print_all.uncheck # todo rework
end



