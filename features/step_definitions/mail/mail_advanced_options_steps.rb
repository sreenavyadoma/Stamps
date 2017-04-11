
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
  expect(stamps.mail.print_form.advanced_options.extra_services_btn.visible?).to be(true), "Extra Services Button is NOT visible"
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
  expect(stamps.mail.print_form.advanced_options.mail_date.text_box.present?).to be(true), "Advanced Options Mail Date field is NOT present"
end

Then /^[Ss]et Advanced Options Mail Date to ((?:date|today plus|tomorrow|today|))? ?(.*)?$/ do |day, value|
  expect(['date', 'today plus', 'tomorrow', 'today', '']).to include(day), "day=#{day} is not a valid parameter. Check your test"
  case day
    when /date/
      valid_date = Date.strptime(value, "%m/%d/%Y") rescue nil
      expect(valid_date).to_not be_nil, "Invalid Date format. Expected date format mm/dd/YYYY (03/24/2017)  got #{value}"
      test_parameter[:mail_date] = value
      test_parameter[:mail_date] = stamps.mail.print_form.advanced_options.mail_date.text_box.set(test_parameter[:mail_date])
    when /today plus/
      test_parameter[:mail_date] = stamps.mail.print_form.advanced_options.mail_date.date_picker.todays_date_plus(value)
    when /today/
      test_parameter[:mail_date] = stamps.mail.print_form.advanced_options.mail_date.date_picker.today
    when /tomorrow/
      test_parameter[:mail_date] = stamps.mail.print_form.advanced_options.mail_date.date_picker.todays_date_plus(value)
    else
      valid_date = Date.strptime(value, "%m/%d/%Y") rescue nil
      expect(valid_date).to_not be_nil, "Invalid Date format. Expected date format mm/dd/YYYY (03/24/2017)  got #{value}"
  end
end

Then /^[Ee]xpect Advanced Options Mail Date is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:mail_date] if expectation.nil?
  valid_date = Date.strptime(expectation, "%m/%d/%Y") rescue nil
  expect(valid_date).to_not be_nil, "Invalid Date format. Expected date format mm/dd/YYYY (03/24/2017)  got #{expectation}"
  expect(stamps.mail.print_form.advanced_options.mail_date.text_box.text).to eql(expectation), "Advanced Options Mail Date is not #{expectation}"
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

# Certified Mail
Then /^[Ee]xpect Advanced Options Restricted Delivery is present$/ do
  expect(stamps.mail.print_form.advanced_options.restricted_delivery.present?).to be(true), "Advanced Options include Restricted Delivery is NOT present"
end

Then /^[Cc]heck Advanced Options Restricted Delivery$/ do
  stamps.mail.print_form.advanced_options.restricted_delivery.check
end

Then /^[Ee]xpect Advanced Options Restricted Delivery is checked$/ do
  expect(stamps.mail.print_form.advanced_options.restricted_delivery.checked?).to be(true), "Advanced Options include Restricted Delivery is NOT checked"
end

Then /^[Uu]ncheck Advanced Options Restricted Delivery$/ do
  stamps.mail.print_form.advanced_options.restricted_delivery.uncheck
end

Then /^[Ee]xpect Advanced Options Restricted Delivery is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.restricted_delivery.checked?).to be(false), "Advanced Options include Restricted Delivery is NOT unchecked"
end

Then /^[Ee]xpect Print Form Electronic Return Receipt is present$/ do
  expect(stamps.mail.print_form.electronic_return_receipt.present?).to be(true), "Print form include Electronic Return Receipt is NOT present"
end

Then /^[Cc]heck Print Form Electronic Return Receipt$/ do
  stamps.mail.print_form.electronic_return_receipt.check
end

Then /^[Ee]xpect Print Form Electronic Return Receipt is checked$/ do
  expect(stamps.mail.print_form.electronic_return_receipt.checked?).to be(true), "Print form include Electronic Return Receipt is NOT checked"
end

Then /^[Uu]ncheck Print Form Electronic Return Receipt$/ do
  stamps.mail.print_form.electronic_return_receipt.uncheck
end

Then /^[Ee]xpect Print Form Electronic Return Receipt is unchecked$/ do
  expect(stamps.mail.print_form.electronic_return_receipt.checked?).to be(false), "Print form include Electronic Return Receipt is NOT unchecked"
end

Then /^[Ee]xpect Print Form Return Receipt is present$/ do
  expect(stamps.mail.print_form.return_receipt.present?).to be(true), "Print form include Return Receipt is NOT present"
end

Then /^[Ee]xpect Print Form Return Receipt is not visible$/ do
  expect{stamps.mail.print_form.return_receipt.present?}.to raise_exception(NoMethodError)
end

Then /^[Cc]heck Print Form Return Receipt$/ do
  stamps.mail.print_form.return_receipt.check
end

Then /^[Ee]xpect Print Form Return Receipt is checked$/ do
  expect(stamps.mail.print_form.return_receipt.checked?).to be(true), "Print form include Return Receipt is NOT checked"
end

Then /^[Uu]ncheck Print Form Return Receipt$/ do
  stamps.mail.print_form.return_receipt.uncheck
end

Then /^[Ee]xpect Print Form Return Receipt is unchecked$/ do
  expect(stamps.mail.print_form.return_receipt.checked?).to be(false), "Print form include Return Receipt is NOT unchecked"
end

Then /^[Ee]xpect Print Form Certified Mail is checked$/ do
  expect(stamps.mail.print_form.certified_mail.checked?).to be(true), "Print form include Return Receipt is NOT checked"
end

Then /^[Ee]xpect Print Form Certified Mail is present$/ do
  expect(stamps.mail.print_form.certified_mail.present?).to be(true), "Print form include Return Receipt is NOT present"
end

Then /^[Ee]xpect Advanced Options include Return Address is present$/ do
  expect(stamps.mail.print_form.advanced_options.return_address.present?).to be(true), "Advanced Options include Return Address is NOT present"
end

Then /^[Cc]heck Advanced Options include Return Address$/ do
  stamps.mail.print_form.advanced_options.return_address.check
end

Then /^[Ee]xpect Advanced Options include Return Address is checked$/ do
  expect(stamps.mail.print_form.advanced_options.return_address.checked?).to be(true), "Advanced Options include Return Address is NOT checked"
end

Then /^[Uu]ncheck Advanced Options include Return Address$/ do
  stamps.mail.print_form.advanced_options.return_address.uncheck
end

Then /^[Ee]xpect Advanced Options include Return Address is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.return_address.checked?).to be(false), "Advanced Options include Return Address is NOT unchecked"
end

Then /^[Ee]xpect Advanced Options include Delivery Address is present$/ do
  expect(stamps.mail.print_form.advanced_options.delivery_address.present?).to be(true), "Advanced Options include Delivery Address is NOT present"
end

Then /^[Cc]heck Advanced Options include Delivery Address$/ do
  stamps.mail.print_form.advanced_options.delivery_address.check
end

Then /^[Ee]xpect Advanced Options include Delivery Address is checked$/ do
  expect(stamps.mail.print_form.advanced_options.delivery_address.checked?).to be(true), "Advanced Options include Delivery Address is NOT checked"
end

Then /^[Uu]ncheck Advanced Options include Delivery Address$/ do
  stamps.mail.print_form.advanced_options.delivery_address.uncheck
end

Then /^[Ee]xpect Advanced Options include Delivery Address is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.delivery_address.checked?).to be(false), "Advanced Options include Delivery Address is NOT unchecked"
end

Then /^[Ee]xpect Advanced Options include Postage is present$/ do
  expect(stamps.mail.print_form.advanced_options.postage.present?).to be(true), "Advanced Options include Postage is NOT present"
end

Then /^[Cc]heck Advanced Options include Postage$/ do
  stamps.mail.print_form.advanced_options.postage.check
end

Then /^[Ee]xpect Advanced Options include Postage is checked$/ do
  expect(stamps.mail.print_form.advanced_options.postage.checked?).to be(true), "Advanced Options include Postage is NOT checked"
end

Then /^[Uu]ncheck Advanced Options include Postage$/ do
  stamps.mail.print_form.advanced_options.postage.uncheck
end

Then /^[Ee]xpect Advanced Options include Postage is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.postage.checked?).to be(false), "Advanced Options include Postage is NOT unchecked"
end

Then /^[Ee]xpect Advanced Options Hide Label Value is present$/ do
  expect(stamps.mail.print_form.advanced_options.hide_label_value.present?).to be(true), "Advanced Options Hide Label Value is NOT present"
end

Then /^[Cc]heck Advanced Options Hide Label Value$/ do
  stamps.mail.print_form.advanced_options.hide_label_value.check
end

Then /^[Ee]xpect Advanced Options Hide Label Value is checked$/ do
  expect(stamps.mail.print_form.advanced_options.hide_label_value.checked?).to be(true), "Advanced Options Hide Label Value is NOT checked"
end

Then /^[Uu]ncheck Advanced Options Hide Label Value$/ do
  stamps.mail.print_form.advanced_options.hide_label_value.uncheck
end

Then /^[Ee]xpect Advanced Options Hide Label Value is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.hide_label_value.checked?).to be(false), "Advanced Options Hide Label Value is NOT unchecked"
end

Then /^[Ee]xpect Advanced Options Print Receipt is present$/ do
  expect(stamps.mail.print_form.advanced_options.print_receipt.present?).to be(true), "Advanced Options Print Receipt is NOT present"
end

Then /^[Cc]heck Advanced Options Print Receipt$/ do
  stamps.mail.print_form.advanced_options.print_receipt.check
end

Then /^[Ee]xpect Advanced Options Print Receipt is checked$/ do
  expect(stamps.mail.print_form.advanced_options.print_receipt.checked?).to be(true), "Advanced Options Print Receipt is NOT checked"
end

Then /^[Uu]ncheck Advanced Options Print Receipt$/ do
  stamps.mail.print_form.advanced_options.print_receipt.uncheck
end

Then /^[Ee]xpect Advanced Options Print Receipt is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.print_receipt.checked?).to be(false), "Advanced Options Print Receipt is NOT unchecked"
end

Then /^[Ee]xpect Advanced Options Print Reference # is present$/ do
  expect(stamps.mail.print_form.advanced_options.print_reference_number.present?).to be(true), "Advanced Options Print Reference # is NOT present"
end

Then /^[Cc]heck Advanced Options Print Reference \#$/ do
  stamps.mail.print_form.advanced_options.print_reference_number.check
end

Then /^[Ee]xpect Advanced Options Print Reference # is checked$/ do
  expect(stamps.mail.print_form.advanced_options.print_reference_number.checked?).to be(true), "Advanced Options Print Reference # is NOT checked"
end

Then /^[Uu]ncheck Advanced Options Print Reference \#$/ do
  stamps.mail.print_form.advanced_options.print_reference_number.uncheck
end

Then /^[Ee]xpect Advanced Options Print Reference # is unchecked$/ do
  expect(stamps.mail.print_form.advanced_options.print_reference_number.checked?).to be(false), "Advanced Options Print Reference # is NOT unchecked"
end


=begin
Then /^Mail Stamps: Set Print All to Checked$/ do
  stamps.mail.netstamps.form_view.print_all.check # todo rework
end

Then /^Mail Stamps: Set Print All to Unchecked$/ do
  stamps.mail.netstamps.form_view.print_all.uncheck # todo rework
end
=end
