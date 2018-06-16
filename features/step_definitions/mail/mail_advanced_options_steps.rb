

Then /^[Hh]ide Advanced Options$/ do
  stamps.mail.print_form.advanced_options.hide
end

Then /^[Ee]xpect Advanced Options responds to (.+) \((.+)\)$/ do |method_description, method|
  expect(stamps.mail.print_form.advanced_options).to respond_to(method.to_sym), "Print media error. Advanced Options does not respond to #{method_description} (#{method})"
end

Then /^select advanced options extra services$/ do
  SdcMail.print_form.extra_services.button.click
end

Then /^[Ee]xpect Advanced Options Extra Services Button is (\w+)/ do |str|
  step 'Expect Advanced Options responds to Extra Services Button (extra_services_btn)'
  case str
  when /enabled/
    expect(stamps.mail.print_form.advanced_options.extra_services_btn.stamps_disabled?).to be(false), 'Extra Services Button is NOT enabled'
  when /disabled/
    expect(stamps.mail.print_form.advanced_options.extra_services_btn.stamps_disabled?).to be(true), 'Extra Services Button is NOT disabled'
  when /visible/
    expect(stamps.mail.print_form.advanced_options.extra_services_btn).to be_visible, 'Extra Services Button is NOT visible'
  else
    raise ArgumentError, "#{str} is not implemented."
  end
end

Then /^[Ss]elect Advanced Options Specify Postage Amount$/ do
  step 'Expect Advanced Options responds to Specify Postage Amount (specify_postage_amount)'
  stamps.mail.print_form.advanced_options.specify_postage_amount.select
end

Then /^[Ee]xpect Advanced Options Specify Postage Amount is selected$/ do
  step 'Expect Advanced Options responds to Specify Postage Amount (specify_postage_amount)'
  expect(stamps.mail.print_form.advanced_options.specify_postage_amount.selected?).to be(true), 'Specify Postage Amount was NOT selected'
end

Then /^[Ee]xpect Advanced Options Calculate Postage Amount radio button is present$/ do
  step 'Expect Advanced Options responds to Calculate Postage Amount (calculate_postage_amount)'
  expect(stamps.mail.print_form.advanced_options.calculate_postage_amount).to be_present, 'Stamps Calculate Postage Amount radio button is NOT present'
end

Then /^[Ee]xpect Advanced Options Specify Postage Amount radio button is present$/ do
  step 'Expect Advanced Options responds to Calculate Postage Amount (calculate_postage_amount)'
  expect(stamps.mail.print_form.advanced_options.specify_postage_amount).to be_present, 'Stamps Specify Postage Amount radio button is NOT present'
end

Then /^[Ss]elect Advanced Options Calculate Postage Amount$/ do
  step 'Expect Advanced Options responds to Calculate Postage Amount (calculate_postage_amount)'
  stamps.mail.print_form.advanced_options.calculate_postage_amount.select
end

Then /^[Ee]xpect Advanced Options Calculate Postage Amount is selected$/ do
  step 'Expect Advanced Options responds to Calculate Postage Amount (calculate_postage_amount)'
  expect(stamps.mail.print_form.advanced_options.calculate_postage_amount.selected?).to be(true), 'Calculate Postage Amount was NOT selected'
end

Then /^[Ee]xpect Advanced Options Mail Date field is present$/ do
  step 'Expect Advanced Options responds to Mail Date (mail_date)'
  expect(stamps.mail.print_form.advanced_options.mail_date.textbox).to be_present, 'Advanced Options Mail Date field is NOT present'
end

Then /^[Ss]et Advanced Options Mail Date to ((?:date|today plus|tomorrow|today|))? ?(.*)?$/ do |time_str, value|
  raise ''
  step 'Expect Advanced Options responds to Mail Date (mail_date)'
  TestData.hash[:mail_date] = case time_str
                              when /date/
                                value
                              when /today plus/
                                (Date.today + value.to_i).strftime('%m/%d/%Y')
                              when /today/
                                Date.today.strftime('%m/%d/%Y')
                              when /tomorrow/
                                (Date.today + 1).strftime('%m/%d/%Y')
                              else
                                Date.today.strftime('%m/%d/%Y')
                              end
  expect(stamps.mail.print_form.advanced_options.mail_date.textbox).to be_present
  stamps.mail.print_form.advanced_options.mail_date.textbox.set(TestData.hash[:mail_date])
  expect(stamps.mail.print_form.advanced_options.mail_date.textbox.text).to eql(TestData.hash[:mail_date])
end

Then /^open mail ship date picker$/ do
  mail_date = SdcMail.print_form.mail_date
  picker = mail_date.picker
  mail_date.picker_button.click unless picker.today.present?
  picker.today.wait_until_present(timeout: 3)
end

Then /^hide mail ship date picker$/ do
  mail_date = SdcMail.print_form.mail_date
  picker = mail_date.picker
  mail_date.picker_button.click if picker.today.present?
end

Then /^click today on mail ship date picker$/ do
  step 'open mail ship date picker'
  SdcMail.print_form.mail_date.picker.today.click
  step 'expect mail ship date is correct'
end

Then /^click mail ship date picker today plus (\d+)$/ do |day|
  step 'open mail ship date picker'
  TestData.hash[:mail_date] = TestHelper.mail_date_text_field_format(day)

  picker = SdcMail.print_form.mail_date.picker
  title = picker.today_element.attribute_value('title')
  expect(title).to eql 'Today'

  picker_day = TestHelper.shipdate_today_plus(day, format: '%-d')
  picker.date_elements(:todays_date_elements, picker_day)
  picker.todays_date_elements.each do |element|
    unless element.parent.attribute_value('class').include?('disabled')
      element.click
      break
    end
  end
  step 'expect mail ship date is correct'
end

Then /^expect mail ship date is (?:correct|(.*))/ do |day|
  if day.nil? && TestData.hash[:mail_date].nil?
    day = "#{'%02i' % Date.today.month}/#{Date.today.day}/#{Date.today.year}"
  elsif day.nil?
    day = TestData.hash[:mail_date]
  end
  expect(SdcMail.print_form.mail_date.text_field.text_value).to eql day
end

Then /^set mail ship date to (.+)$/ do |str|
  SdcMail.print_form.mail_date.text_field.set_attribute(:value, str)
  step "expect mail ship date is #{str}"
end

Then /^[Ee]xpect Advanced Options Mail Date is (?:correct|(.*))$/ do |expectation|
  step 'Expect Advanced Options responds to Mail Date (mail_date)'
  expectation = TestData.hash[:mail_date] if expectation.nil?
  valid_date = Date.strptime(expectation, '%m/%d/%Y')
  expect(valid_date).not_to be_nil, "Invalid Date format. Expected date format mm/dd/YYYY (03/24/2017)  got #{expectation}"
  expect(stamps.mail.print_form.advanced_options.mail_date.textbox.text).to eql(expectation), "Advanced Options Mail Date is not #{expectation}"
end

Then /^[Ss]et Advanced Options Reference Number to (?:(?:a |some |)random string|(.*))$/ do |str|
  step 'Expect Advanced Options responds to Reference Number (reference_number)'
  TestData.hash[:reference_number] = str.nil? ? TestHelper.rand_alpha_numeric : str
  stamps.mail.print_form.advanced_options.reference_number.set(TestData.hash[:reference_number])
end

Then /^[Ee]xpect Advanced Options Reference Number field is present$/ do
  step 'Expect Advanced Options responds to Reference Number (reference_number)'
  expect(stamps.mail.print_form.advanced_options.reference_number.present?).to be(true), 'Reference Number field is NOT present'
end

Then /^[Ee]xpect Advanced Options Reference Number is (?:correct|(.*))$/ do |expectation|
  step 'Expect Advanced Options responds to Reference Number (reference_number)'
  expectation = TestData.hash[:reference_number] if expectation.nil?
  expectation = '' if expectation.nil?
  expect(stamps.mail.print_form.advanced_options.reference_number.text).to eql(expectation), 'Advanced Options Reference Number is incorrect'
end

# this step confirms that there is no text in the Reference Number field
Then /^[Ee]xpect Advanced Options Reference Number is blank$/ do
  step 'Expect Advanced Options responds to Reference Number (reference_number)'
  expect(stamps.mail.print_form.advanced_options.reference_number.text).to eql(''), 'Advanced Options Reference Number is incorrect'
end

Then /^[Ee]xpect Advanced Options Cost Code Field is present$/ do
  step 'Expect Advanced Options responds to Cost Code (cost_code)'
  expect(stamps.mail.print_form.advanced_options.cost_code.textbox).to be_present, 'Print form Cost Code Field is NOT present'
end

Then /^[Ss]et Advanced Options Cost Code to (.*)$/ do |str|
  step 'Expect Advanced Options responds to Cost Code (cost_code)'
  stamps.mail.print_form.advanced_options.cost_code.select(str)
end

Then /^[Ee]xpect Advanced Options Cost Code is (.*)$/ do |expectation|
  step 'Expect Advanced Options responds to Cost Code (cost_code)'
  expect(stamps.mail.print_form.advanced_options.cost_code.textbox.text).to eql(expectation)
end

# Certified Mail
Then /^[Ee]xpect Advanced Options Restricted Delivery is present$/ do
  step 'Expect Advanced Options responds to Restricted Delivery (restricted_delivery)'
  expect(stamps.mail.print_form.advanced_options.restricted_delivery).to be_present, 'Advanced Options include Restricted Delivery is NOT present'
end

Then /^[Cc]heck Advanced Options Restricted Delivery$/ do
  step 'Expect Advanced Options responds to Restricted Delivery (restricted_delivery)'
  stamps.mail.print_form.advanced_options.restricted_delivery.check
end

Then /^[Ee]xpect Advanced Options Restricted Delivery is checked$/ do
  step 'Expect Advanced Options responds to Restricted Delivery (restricted_delivery)'
  expect(stamps.mail.print_form.advanced_options.restricted_delivery.checked?).to be(true), 'Advanced Options include Restricted Delivery is NOT checked'
end

Then /^[Uu]ncheck Advanced Options Restricted Delivery$/ do
  step 'Expect Advanced Options responds to Restricted Delivery (restricted_delivery)'
  stamps.mail.print_form.advanced_options.restricted_delivery.uncheck
end

Then /^[Ee]xpect Advanced Options Restricted Delivery is unchecked$/ do
  step 'Expect Advanced Options responds to Restricted Delivery (restricted_delivery)'
  expect(stamps.mail.print_form.advanced_options.restricted_delivery.checked?).not_to be(true), 'Advanced Options include Restricted Delivery is NOT unchecked'
end

Then /^[Ee]xpect Print Form Electronic Return Receipt is present$/ do
  step 'Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)'
  expect(stamps.mail.print_form.electronic_return_receipt).to be_present, 'Print form include Electronic Return Receipt is NOT present'
end

Then /^[Ee]xpect Print form responds to (.+) \((.+)\)$/ do |method_description, method|
  expect(stamps.mail.print_form).to respond_to(method.to_sym), "Print media error. Print form does not respond to #{method_description} (#{method})"
end

Then /^[Cc]heck Print Form Electronic Return Receipt$/ do
  step 'Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)'
  stamps.mail.print_form.electronic_return_receipt.check
end

Then /^[Ee]xpect Print Form Electronic Return Receipt is checked$/ do
  step 'Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)'
  expect(stamps.mail.print_form.electronic_return_receipt.checked?).to be(true), 'Print form include Electronic Return Receipt is NOT checked'
end

Then /^[Uu]ncheck Print Form Electronic Return Receipt$/ do
  step 'Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)'
  stamps.mail.print_form.electronic_return_receipt.uncheck
end

Then /^[Ee]xpect Print Form Electronic Return Receipt is unchecked$/ do
  step 'Expect Print form responds to Electronic Return Receipt (electronic_return_receipt)'
  expect(stamps.mail.print_form.electronic_return_receipt.checked?).not_to be(true), 'Print form include Electronic Return Receipt is NOT unchecked'
end

Then /^[Ee]xpect Print Form Return Receipt is present$/ do
  step 'Expect Print form responds to Return Receipt (return_receipt)'
  expect(stamps.mail.print_form.return_receipt).to be_present, 'Print form include Return Receipt is NOT present'
end

Then /^[Ee]xpect Print Form Return Receipt is visible$/ do
  step 'Expect Print form responds to Return Receipt (return_receipt)'
  expect(stamps.mail.print_form.return_receipt.visible?).to be(true), 'Print form include Return Receipt is NOT visible'
end

Then /^[Ee]xpect Print Form Return Receipt is disabled$/ do
  step 'Expect Print form responds to Return Receipt (return_receipt)'
  # expect(stamps.mail.print_form.return_receipt.enabled?).to be(false), "Print form include Return Receipt is enabled"
  expect(stamps.mail.print_form.return_receipt.stamps_disabled?).to be(true), 'Print form include Return Receipt is enabled'
end

Then /^[Ee]xpect Print Form Return Receipt is not visible$/ do
  # expect(stamps.mail.print_form.return_receipt.present?).to raise_exception(NoMethodError)
  expect(stamps.mail.print_form.return_receipt.present?).to be(false), 'Print Form Return Receipt is visible'
end

Then /^[Cc]heck Print Form Return Receipt$/ do
  step 'Expect Print form responds to Return Receipt (return_receipt)'
  stamps.mail.print_form.return_receipt.check
end

Then /^[Ee]xpect Print Form Return Receipt is checked$/ do
  step 'Expect Print form responds to Return Receipt (return_receipt)'
  expect(stamps.mail.print_form.return_receipt.checked?).to be(true), 'Print form include Return Receipt is NOT checked'
end

Then /^[Uu]ncheck Print Form Return Receipt$/ do
  step 'Expect Print form responds to Return Receipt (return_receipt)'
  stamps.mail.print_form.return_receipt.uncheck
end

Then /^[Ee]xpect Print Form Return Receipt is unchecked$/ do
  step 'Expect Print form responds to Return Receipt (return_receipt)'
  expect(stamps.mail.print_form.return_receipt.checked?).not_to be(true), 'Print form include Return Receipt is NOT unchecked'
end

Then /^[Ee]xpect Print Form Certified Mail is checked$/ do
  step 'Expect Print form responds to Certified Mail (certified_mail)'
  expect(stamps.mail.print_form.certified_mail.checked?).to be(true), 'Print form include Certified Mail is NOT checked'
end

Then /^[Ee]xpect Print Form Certified Mail is visible$/ do
  step 'Expect Print form responds to Certified Mail (certified_mail)'
  expect(stamps.mail.print_form.certified_mail.visible?).to be(true), 'Print form include Certified Mail is NOT visible'
end

Then /^[Ee]xpect Print Form Certified Mail is disabled$/ do
  step 'Expect Print form responds to Certified Mail (certified_mail)'
  # expect(stamps.mail.print_form.certified_mail.enabled?).to be(false), "Print form include Certified Mail is enabled"
  expect(stamps.mail.print_form.certified_mail.disabled?).to be(true), 'Print form include Certified Mail is enabled'
end

Then /^[Ee]xpect Advanced Options include Return Address is present$/ do
  step 'Expect Advanced Options responds to Return Address (return_address)'
  expect(stamps.mail.print_form.advanced_options.return_address).to be_present, 'Advanced Options include Return Address is NOT present'
end

Then /^[Cc]heck Advanced Options include Return Address$/ do
  step 'Expect Advanced Options responds to Return Address (return_address)'
  stamps.mail.print_form.advanced_options.return_address.check
end

Then /^[Ee]xpect Advanced Options include Return Address is checked$/ do
  step 'Expect Advanced Options responds to Return Address (return_address)'
  expect(stamps.mail.print_form.advanced_options.return_address.checked?).to be(true), 'Advanced Options include Return Address is NOT checked'
end

Then /^[Uu]ncheck Advanced Options include Return Address$/ do
  step 'Expect Advanced Options responds to Return Address (return_address)'
  stamps.mail.print_form.advanced_options.return_address.uncheck
end

Then /^[Ee]xpect Advanced Options include Return Address is unchecked$/ do
  step 'Expect Advanced Options responds to Return Address (return_address)'
  expect(stamps.mail.print_form.advanced_options.return_address.checked?).not_to be(true), 'Advanced Options include Return Address is NOT unchecked'
end

Then /^[Ee]xpect Advanced Options include Delivery Address is present$/ do
  step 'Expect Advanced Options responds to Return Address (return_address)'
  expect(stamps.mail.print_form.advanced_options.delivery_address).to be_present, 'Advanced Options include Delivery Address is NOT present'
end

Then /^[Cc]heck Advanced Options include Delivery Address$/ do
  step 'Expect Advanced Options responds to Delivery Address (delivery_address)'
  stamps.mail.print_form.advanced_options.delivery_address.check
end

Then /^[Ee]xpect Advanced Options include Delivery Address is checked$/ do
  step 'Expect Advanced Options responds to Delivery Address (delivery_address)'
  expect(stamps.mail.print_form.advanced_options.delivery_address.checked?).to be(true), 'Advanced Options include Delivery Address is NOT checked'
end

Then /^[Uu]ncheck Advanced Options include Delivery Address$/ do
  step 'Expect Advanced Options responds to Delivery Address (delivery_address)'
  stamps.mail.print_form.advanced_options.delivery_address.uncheck
end

Then /^[Ee]xpect Advanced Options include Delivery Address is unchecked$/ do
  step 'Expect Advanced Options responds to Delivery Address (delivery_address)'
  expect(stamps.mail.print_form.advanced_options.delivery_address.checked?).not_to be(true), 'Advanced Options include Delivery Address is NOT unchecked'
end

Then /^[Ee]xpect Advanced Options include Postage is present$/ do
  step 'Expect Advanced Options responds to Postage (postage)'
  expect(stamps.mail.print_form.advanced_options.postage).to be_present, 'Advanced Options include Postage is NOT present'
end

Then /^[Cc]heck Advanced Options include Postage$/ do
  step 'Expect Advanced Options responds to Postage (postage)'
  stamps.mail.print_form.advanced_options.postage.check
end

Then /^[Ee]xpect Advanced Options include Postage is checked$/ do
  step 'Expect Advanced Options responds to Postage (postage)'
  expect(stamps.mail.print_form.advanced_options.postage.checked?).to be(true), 'Advanced Options include Postage is NOT checked'
end

Then /^[Uu]ncheck Advanced Options include Postage$/ do
  step 'Expect Advanced Options responds to Postage (postage)'
  stamps.mail.print_form.advanced_options.postage.uncheck
end

Then /^[Ee]xpect Advanced Options include Postage is unchecked$/ do
  step 'Expect Advanced Options responds to Postage (postage)'
  expect(stamps.mail.print_form.advanced_options.postage.checked?).not_to be(true), 'Advanced Options include Postage is NOT unchecked'
end

Then /^[Ee]xpect Advanced Options Hide Label Value is present$/ do
  step 'Expect Advanced Options responds to Hide Label (hide_label_value)'
  expect(stamps.mail.print_form.advanced_options.hide_label_value).to be_present, 'Advanced Options Hide Label Value is NOT present'
end

Then /^[Cc]heck Advanced Options Hide Label Value$/ do
  step 'Expect Advanced Options responds to Hide Label (hide_label_value)'
  stamps.mail.print_form.advanced_options.hide_label_value.check
end

Then /^[Ee]xpect Advanced Options Hide Label Value is checked$/ do
  step 'Expect Advanced Options responds to Hide Label (hide_label_value)'
  expect(stamps.mail.print_form.advanced_options.hide_label_value.checked?).to be(true), 'Advanced Options Hide Label Value is NOT checked'
end

Then /^[Uu]ncheck Advanced Options Hide Label Value$/ do
  step 'Expect Advanced Options responds to Hide Label (hide_label_value)'
  stamps.mail.print_form.advanced_options.hide_label_value.uncheck
end

Then /^[Ee]xpect Advanced Options Hide Label Value is unchecked$/ do
  step 'Expect Advanced Options responds to Hide Label (hide_label_value)'
  expect(stamps.mail.print_form.advanced_options.hide_label_value.checked?).not_to be(true), 'Advanced Options Hide Label Value is NOT unchecked'
end

Then /^[Ee]xpect Advanced Options Print Receipt is present$/ do
  step 'Expect Advanced Options responds to Print Receip (print_receipt)'
  expect(stamps.mail.print_form.advanced_options.print_receipt).to be_present, 'Advanced Options Print Receipt is NOT present'
end

Then /^[Cc]heck Advanced Options Print Receipt$/ do
  step 'Expect Advanced Options responds to Print Receip (print_receipt)'
  stamps.mail.print_form.advanced_options.print_receipt.check
end

Then /^[Ee]xpect Advanced Options Print Receipt is checked$/ do
  step 'Expect Advanced Options responds to Print Receip (print_receipt)'
  expect(stamps.mail.print_form.advanced_options.print_receipt.checked?).to be(true), 'Advanced Options Print Receipt is NOT checked'
end

Then /^[Uu]ncheck Advanced Options Print Receipt$/ do
  step 'Expect Advanced Options responds to Print Receip (print_receipt)'
  stamps.mail.print_form.advanced_options.print_receipt.uncheck
end

Then /^[Ee]xpect Advanced Options Print Receipt is unchecked$/ do
  step 'Expect Advanced Options responds to Print Receip (print_receipt)'
  expect(stamps.mail.print_form.advanced_options.print_receipt.checked?).not_to be(true), 'Advanced Options Print Receipt is NOT unchecked'
end

Then /^[Ee]xpect Advanced Options Print Reference # is present$/ do
  step 'Expect Advanced Options responds to Print Reference (print_reference_number)'
  expect(stamps.mail.print_form.advanced_options.print_reference_number).to be_present, 'Advanced Options Print Reference # is NOT present'
end

Then /^[Cc]heck Advanced Options Print Reference \#$/ do
  step 'Expect Advanced Options responds to Print Reference (print_reference_number)'
  stamps.mail.print_form.advanced_options.print_reference_number.check
end

Then /^[Ee]xpect Advanced Options Print Reference # is checked$/ do
  step 'Expect Advanced Options responds to Print Reference (print_reference_number)'
  expect(stamps.mail.print_form.advanced_options.print_reference_number.checked?).to be(true), 'Advanced Options Print Reference # is NOT checked'
end

Then /^[Uu]ncheck Advanced Options Print Reference \#$/ do
  step 'Expect Advanced Options responds to Print Reference (print_reference_number)'
  stamps.mail.print_form.advanced_options.print_reference_number.uncheck
end

Then /^[Ee]xpect Advanced Options Print Reference # is unchecked$/ do
  step 'Expect Advanced Options responds to Print Reference (print_reference_number)'
  expect(stamps.mail.print_form.advanced_options.print_reference_number.checked?).not_to be(true), 'Advanced Options Print Reference # is NOT unchecked'
end
