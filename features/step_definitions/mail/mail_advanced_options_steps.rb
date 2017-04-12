
Then /^[Ss]how Advanced Options$/ do
  stamps.mail.print_form.advanced_options.show
  expect(stamps.mail.print_form.advanced_options).to be_present, "Print media #{param.print_media} does not have Advanced Options. Check your feature file workflow."
end

Then /^[Hh]ide Advanced Options$/ do
  stamps.mail.print_form.advanced_options.hide
end

Then /^[Ee]xpect Advanced Options responds to (.+) \((.+)\)$/ do |method_description, method|
  expect(stamps.mail.print_form.advanced_options).to respond_to(method.to_sym), "Print media: #{param.print_media}. Advanced Options does not respond to #{method_description} (#{method})"
end

Then /^[Ee]xpect Print form responds to (.+) \((.+)\)$/ do |method_description, method|
  expect(stamps.mail.print_form).to respond_to(method.to_sym), "Print media: #{param.print_media}. Print form does not respond to #{method_description} (#{method})"
end

Then /^[Ss]elect Advanced Options Extra Services$/ do
  step "Expect Advanced Options responds to Extra Services (extra_services)"
  stamps.mail.print_form.advanced_options.extra_services
end

Then /^[Ee]xpect Advanced Options Extra Services Button is visible$/ do
  step "Expect Advanced Options responds to Extra Services Button (extra_services_btn)"
  expect(stamps.mail.print_form.advanced_options.extra_services_btn).to be_visible, "Extra Services Button is NOT visible"
end

Then /^[Ss]elect Advanced Options Specify Postage Amount$/ do
  step "Expect Advanced Options responds to Specify Postage Amount (specify_postage_amount)"
  stamps.mail.print_form.advanced_options.specify_postage_amount.select
end

Then /^[Ee]xpect Advanced Options Specify Postage Amount is selected$/ do
  step "Expect Advanced Options responds to Specify Postage Amount (specify_postage_amount)"
  expect(stamps.mail.print_form.advanced_options.specify_postage_amount).to be_selected, "Specify Postage Amount was NOT selected"
end

Then /^[Ee]xpect Advanced Options Calculate Postage Amount radio button is present$/ do
  step "Expect Advanced Options responds to Calculate Postage Amount (calculate_postage_amount)"
  expect(stamps.mail.print_form.advanced_options.calculate_postage_amount).to be_present, "Stamps Calculate Postage Amount radio button is NOT present"
end

Then /^[Ee]xpect Advanced Options Specify Postage Amount radio button is present$/ do
  step "Expect Advanced Options responds to Calculate Postage Amount (calculate_postage_amount)"
  expect(stamps.mail.print_form.advanced_options.specify_postage_amount).to be_present, "Stamps Specify Postage Amount radio button is NOT present"
end

Then /^[Ss]elect Advanced Options Calculate Postage Amount$/ do
  step "Expect Advanced Options responds to Calculate Postage Amount (calculate_postage_amount)"
  stamps.mail.print_form.advanced_options.calculate_postage_amount.select
end

Then /^[Ee]xpect Advanced Options Calculate Postage Amount is selected$/ do
  step "Expect Advanced Options responds to Calculate Postage Amount (calculate_postage_amount)"
  expect(stamps.mail.print_form.advanced_options.calculate_postage_amount).to be_selected, "Calculate Postage Amount was NOT selected"
end

Then /^[Ee]xpect Advanced Options Mail Date field is present$/ do
  step "Expect Advanced Options responds to Mail Date (mail_date)"
  expect(stamps.mail.print_form.advanced_options.mail_date.text_box).to be_present, "Advanced Options Mail Date field is NOT present"
end

Then /^[Ss]et Advanced Options Mail Date to ((?:date|today plus|tomorrow|today|))? ?(.*)?$/ do |day, value|
  step "Expect Advanced Options responds to Mail Date (mail_date)"
  expect(['date', 'today plus', 'tomorrow', 'today', '']).to include(day), "day=#{day} is not a valid parameter. Check your test"
  case day
    when /date/
      valid_date = Date.strptime(value, "%m/%d/%Y") rescue nil
      expect(valid_date).not_to be_nil, "Invalid Date format. Expected date format mm/dd/YYYY (03/24/2017)  got #{value}"
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
      expect(valid_date).not_to be_nil, "Invalid Date format. Expected date format mm/dd/YYYY (03/24/2017)  got #{value}"
  end
end

Then /^[Ee]xpect Advanced Options Mail Date is (?:correct|(.*))$/ do |expectation|
  step "Expect Advanced Options responds to Mail Date (mail_date)"
  expectation = test_parameter[:mail_date] if expectation.nil?
  valid_date = Date.strptime(expectation, "%m/%d/%Y") rescue nil
  expect(valid_date).not_to be_nil, "Invalid Date format. Expected date format mm/dd/YYYY (03/24/2017)  got #{expectation}"
  expect(stamps.mail.print_form.advanced_options.mail_date.text_box.text).to eql(expectation), "Advanced Options Mail Date is not #{expectation}"
end

Then /^[Ss]et Advanced Options Reference Number to (?:(?:a |some |)random string|(.*))$/ do |str|
  step "Expect Advanced Options responds to Reference Number (reference_number)"
  test_parameter[:reference_number] = (str.nil?)?ParameterHelper.random_string : str
  stamps.mail.print_form.advanced_options.reference_number.set(test_parameter[:reference_number])
end

Then /^[Ee]xpect Advanced Options Reference Number field is present$/ do
  step "Expect Advanced Options responds to Reference Number (reference_number)"
  expect(stamps.mail.print_form.advanced_options.reference_number).to be_present, "Reference Number field is NOT present"
end

Then /^[Ee]xpect Advanced Options Reference Number is (?:correct|(.*))$/ do |expectation|
  step "Expect Advanced Options responds to Reference Number (reference_number)"
  expectation = test_parameter[:reference_number] if expectation.nil?
  expect(stamps.mail.print_form.advanced_options.reference_number.text).to eql(expectation), "Advanced Options Reference Number is incorrect"
end

Then /^[Ee]xpect Advanced Options Cost Code Field is present$/ do
  step "Expect Advanced Options responds to Cost Code (cost_code)"
  expect(stamps.mail.print_form.advanced_options.cost_code.text_box).to be_present, "Print form Cost Code Field is NOT present"
end

Then /^[Ss]et Advanced Options Cost Code to (.*)$/ do |str|
  step "Expect Advanced Options responds to Cost Code (cost_code)"
  stamps.mail.print_form.advanced_options.cost_code.select(str)
end

Then /^[Ee]xpect Advanced Options Cost Code is (.*)$/ do |expectation|
  step "Expect Advanced Options responds to Cost Code (cost_code)"
  expect(stamps.mail.print_form.advanced_options.cost_code.text_box.text).to eql(expectation)
end

# Certified Mail
Then /^[Ee]xpect Advanced Options Restricted Delivery is present$/ do
  step "Expect Advanced Options responds to Restricted Delivery (restricted_delivery)"
  expect(stamps.mail.print_form.advanced_options.restricted_delivery).to be_present, "Advanced Options include Restricted Delivery is NOT present"
end

Then /^[Cc]heck Advanced Options Restricted Delivery$/ do
  step "Expect Advanced Options responds to Restricted Delivery (restricted_delivery)"
  stamps.mail.print_form.advanced_options.restricted_delivery.check
end

Then /^[Ee]xpect Advanced Options Restricted Delivery is checked$/ do
  step "Expect Advanced Options responds to Restricted Delivery (restricted_delivery)"
  expect(stamps.mail.print_form.advanced_options.restricted_delivery).to be_checked, "Advanced Options include Restricted Delivery is NOT checked"
end

Then /^[Uu]ncheck Advanced Options Restricted Delivery$/ do
  step "Expect Advanced Options responds to Restricted Delivery (restricted_delivery)"
  stamps.mail.print_form.advanced_options.restricted_delivery.uncheck
end

Then /^[Ee]xpect Advanced Options Restricted Delivery is unchecked$/ do
  step "Expect Advanced Options responds to Restricted Delivery (restricted_delivery)"
  expect(stamps.mail.print_form.advanced_options.restricted_delivery).not_to be_checked, "Advanced Options include Restricted Delivery is NOT unchecked"
end

Then /^[Ee]xpect Print Form Electronic Return Receipt is present$/ do
  step "Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)"
  expect(stamps.mail.print_form.electronic_return_receipt).to be_present, "Print form include Electronic Return Receipt is NOT present"
end

Then /^[Cc]heck Print Form Electronic Return Receipt$/ do
  step "Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)"
  stamps.mail.print_form.electronic_return_receipt.check
end

Then /^[Ee]xpect Print Form Electronic Return Receipt is checked$/ do
  step "Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)"
  expect(stamps.mail.print_form.electronic_return_receipt).to be_checked, "Print form include Electronic Return Receipt is NOT checked"
end

Then /^[Uu]ncheck Print Form Electronic Return Receipt$/ do
  step "Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)"
  stamps.mail.print_form.electronic_return_receipt.uncheck
end

Then /^[Ee]xpect Print Form Electronic Return Receipt is unchecked$/ do
  step "Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)"
  expect(stamps.mail.print_form.electronic_return_receipt).not_to be_checked, "Print form include Electronic Return Receipt is NOT unchecked"
end

Then /^[Ee]xpect Print Form Return Receipt is present$/ do
  step "Expect Print form responds to Return Receipt (return_receipt)"
  expect(stamps.mail.print_form.return_receipt).to be_present, "Print form include Return Receipt is NOT present"
end

Then /^[Ee]xpect Print Form Return Receipt is not visible$/ do
  expect{stamps.mail.print_form.return_receipt.present?}.to raise_exception(NoMethodError)
end

Then /^[Cc]heck Print Form Return Receipt$/ do
  step "Expect Print form responds to Return Receipt (return_receipt)"
  stamps.mail.print_form.return_receipt.check
end

Then /^[Ee]xpect Print Form Return Receipt is checked$/ do
  step "Expect Print form responds to Return Receipt (return_receipt)"
  expect(stamps.mail.print_form.return_receipt).to be_checked, "Print form include Return Receipt is NOT checked"
end

Then /^[Uu]ncheck Print Form Return Receipt$/ do
  step "Expect Print form responds to Return Receipt (return_receipt)"
  stamps.mail.print_form.return_receipt.uncheck
end

Then /^[Ee]xpect Print Form Return Receipt is unchecked$/ do
  step "Expect Print form responds to Return Receipt (return_receipt)"
  expect(stamps.mail.print_form.return_receipt).not_to be_checked, "Print form include Return Receipt is NOT unchecked"
end

Then /^[Ee]xpect Print Form Certified Mail is checked$/ do
  step "Expect Print form responds to Certified Mail (certified_mail)"
  expect(stamps.mail.print_form.certified_mail).to be_checked, "Print form include Return Receipt is NOT checked"
end

Then /^[Ee]xpect Print Form Certified Mail is present$/ do
  step "Expect Print form responds to Certified Mail (certified_mail)"
  expect(stamps.mail.print_form.certified_mail).to be_present, "Print form include Return Receipt is NOT present"
end

Then /^[Ee]xpect Advanced Options include Return Address is present$/ do
  step "Expect Advanced Options responds to Return Address (return_address)"
  expect(stamps.mail.print_form.advanced_options.return_address).to be_present, "Advanced Options include Return Address is NOT present"
end

Then /^[Cc]heck Advanced Options include Return Address$/ do
  step "Expect Advanced Options responds to Return Address (return_address)"
  stamps.mail.print_form.advanced_options.return_address.check
end

Then /^[Ee]xpect Advanced Options include Return Address is checked$/ do
  step "Expect Advanced Options responds to Return Address (return_address)"
  expect(stamps.mail.print_form.advanced_options.return_address).to be_checked, "Advanced Options include Return Address is NOT checked"
end

Then /^[Uu]ncheck Advanced Options include Return Address$/ do
  step "Expect Advanced Options responds to Return Address (return_address)"
  stamps.mail.print_form.advanced_options.return_address.uncheck
end

Then /^[Ee]xpect Advanced Options include Return Address is unchecked$/ do
  step "Expect Advanced Options responds to Return Address (return_address)"
  expect(stamps.mail.print_form.advanced_options.return_address).not_to be_checked, "Advanced Options include Return Address is NOT unchecked"
end

Then /^[Ee]xpect Advanced Options include Delivery Address is present$/ do
  step "Expect Advanced Options responds to Return Address (return_address)"
  expect(stamps.mail.print_form.advanced_options.delivery_address).to be_present, "Advanced Options include Delivery Address is NOT present"
end

Then /^[Cc]heck Advanced Options include Delivery Address$/ do
  step "Expect Advanced Options responds to Delivery Address (delivery_address)"
  stamps.mail.print_form.advanced_options.delivery_address.check
end

Then /^[Ee]xpect Advanced Options include Delivery Address is checked$/ do
  step "Expect Advanced Options responds to Delivery Address (delivery_address)"
  expect(stamps.mail.print_form.advanced_options.delivery_address).to be_checked, "Advanced Options include Delivery Address is NOT checked"
end

Then /^[Uu]ncheck Advanced Options include Delivery Address$/ do
  step "Expect Advanced Options responds to Delivery Address (delivery_address)"
  stamps.mail.print_form.advanced_options.delivery_address.uncheck
end

Then /^[Ee]xpect Advanced Options include Delivery Address is unchecked$/ do
  step "Expect Advanced Options responds to Delivery Address (delivery_address)"
  expect(stamps.mail.print_form.advanced_options.delivery_address).not_to be_checked, "Advanced Options include Delivery Address is NOT unchecked"
end

Then /^[Ee]xpect Advanced Options include Postage is present$/ do
  step "Expect Advanced Options responds to Postage (postage)"
  expect(stamps.mail.print_form.advanced_options.postage).to be_present, "Advanced Options include Postage is NOT present"
end

Then /^[Cc]heck Advanced Options include Postage$/ do
  step "Expect Advanced Options responds to Postage (postage)"
  stamps.mail.print_form.advanced_options.postage.check
end

Then /^[Ee]xpect Advanced Options include Postage is checked$/ do
  step "Expect Advanced Options responds to Postage (postage)"
  expect(stamps.mail.print_form.advanced_options.postage).to be_checked, "Advanced Options include Postage is NOT checked"
end

Then /^[Uu]ncheck Advanced Options include Postage$/ do
  step "Expect Advanced Options responds to Postage (postage)"
  stamps.mail.print_form.advanced_options.postage.uncheck
end

Then /^[Ee]xpect Advanced Options include Postage is unchecked$/ do
  step "Expect Advanced Options responds to Postage (postage)"
  expect(stamps.mail.print_form.advanced_options.postage).not_to be_checked, "Advanced Options include Postage is NOT unchecked"
end

Then /^[Ee]xpect Advanced Options Hide Label Value is present$/ do
  step "Expect Advanced Options responds to Hide Label (hide_label_value)"
  expect(stamps.mail.print_form.advanced_options.hide_label_value).to be_present, "Advanced Options Hide Label Value is NOT present"
end

Then /^[Cc]heck Advanced Options Hide Label Value$/ do
  step "Expect Advanced Options responds to Hide Label (hide_label_value)"
  stamps.mail.print_form.advanced_options.hide_label_value.check
end

Then /^[Ee]xpect Advanced Options Hide Label Value is checked$/ do
  step "Expect Advanced Options responds to Hide Label (hide_label_value)"
  expect(stamps.mail.print_form.advanced_options.hide_label_value).to be_checked, "Advanced Options Hide Label Value is NOT checked"
end

Then /^[Uu]ncheck Advanced Options Hide Label Value$/ do
  step "Expect Advanced Options responds to Hide Label (hide_label_value)"
  stamps.mail.print_form.advanced_options.hide_label_value.uncheck
end

Then /^[Ee]xpect Advanced Options Hide Label Value is unchecked$/ do
  step "Expect Advanced Options responds to Hide Label (hide_label_value)"
  expect(stamps.mail.print_form.advanced_options.hide_label_value).not_to be_checked, "Advanced Options Hide Label Value is NOT unchecked"
end

Then /^[Ee]xpect Advanced Options Print Receipt is present$/ do
  step "Expect Advanced Options responds to Print Receip (print_receipt)"
  expect(stamps.mail.print_form.advanced_options.print_receipt).to be_present, "Advanced Options Print Receipt is NOT present"
end

Then /^[Cc]heck Advanced Options Print Receipt$/ do
  step "Expect Advanced Options responds to Print Receip (print_receipt)"
  stamps.mail.print_form.advanced_options.print_receipt.check
end

Then /^[Ee]xpect Advanced Options Print Receipt is checked$/ do
  step "Expect Advanced Options responds to Print Receip (print_receipt)"
  expect(stamps.mail.print_form.advanced_options.print_receipt).to be_checked, "Advanced Options Print Receipt is NOT checked"
end

Then /^[Uu]ncheck Advanced Options Print Receipt$/ do
  step "Expect Advanced Options responds to Print Receip (print_receipt)"
  stamps.mail.print_form.advanced_options.print_receipt.uncheck
end

Then /^[Ee]xpect Advanced Options Print Receipt is unchecked$/ do
  step "Expect Advanced Options responds to Print Receip (print_receipt)"
  expect(stamps.mail.print_form.advanced_options.print_receipt).not_to be_checked, "Advanced Options Print Receipt is NOT unchecked"
end

Then /^[Ee]xpect Advanced Options Print Reference # is present$/ do
  step "Expect Advanced Options responds to Print Reference (print_reference_number)"
  expect(stamps.mail.print_form.advanced_options.print_reference_number).to be_present, "Advanced Options Print Reference # is NOT present"
end

Then /^[Cc]heck Advanced Options Print Reference \#$/ do
  step "Expect Advanced Options responds to Print Reference (print_reference_number)"
  stamps.mail.print_form.advanced_options.print_reference_number.check
end

Then /^[Ee]xpect Advanced Options Print Reference # is checked$/ do
  step "Expect Advanced Options responds to Print Reference (print_reference_number)"
  expect(stamps.mail.print_form.advanced_options.print_reference_number).to be_checked, "Advanced Options Print Reference # is NOT checked"
end

Then /^[Uu]ncheck Advanced Options Print Reference \#$/ do
  step "Expect Advanced Options responds to Print Reference (print_reference_number)"
  stamps.mail.print_form.advanced_options.print_reference_number.uncheck
end

Then /^[Ee]xpect Advanced Options Print Reference # is unchecked$/ do
  step "Expect Advanced Options responds to Print Reference (print_reference_number)"
  expect(stamps.mail.print_form.advanced_options.print_reference_number).not_to be_checked, "Advanced Options Print Reference # is NOT unchecked"
end

