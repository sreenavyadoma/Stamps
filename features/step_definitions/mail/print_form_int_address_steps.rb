
# common Print form steps for Envelope|Label|Roll|CM

Then /^[Ss]et Print form Ship-To to international address$/ do |table|
  address = table.hashes.first
  step "set Print form Mail-To Country to #{address['country']}"
  step "set Print form Name to #{address['name']}"
  step "set Print form Company to #{address['company']}"
  step "set Print form Address 1 to #{address['street_address_1']}"
  step "set Print form Address 2 to #{address['street_address_2']}"
  step "set Print form City to #{address['city']}"
  step "set Print form Province to #{address['province']}"
  step "set Print form Postal Code to #{address['postal_code']}"
  step "set Print form Phone to #{address['phone']}"
end

Then /^[Ss]et Print form Name to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.name.send_keys(:enter) if value.nil?
  test_param[:mail_to_name] = (value.downcase == 'random')? helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.name.set(test_param[:mail_to_name])
end

Then /^[Ss]et Print form Company to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.company.send_keys(:enter) if value.nil?
  test_param[:mail_to_company] = (value.downcase == 'random')? helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.company.set(test_param[:mail_to_company])
end

Then /^[Ss]et Print form Address 1 to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.address_1.send_keys(:enter) if value.nil?
  test_param[:mail_to_street_address_1] = (value.downcase == 'random')? helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.address_1.set(test_param[:mail_to_street_address_1])
end

Then /^[Ss]et Print form Address 2 to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.address_2.send_keys(:enter) if value.nil?
  test_param[:mail_to_street_address_2] = (value.downcase == 'random')? helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.address_2.set(test_param[:mail_to_street_address_2])
end

Then /^[Ss]et Print form City to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.city.send_keys(:enter) if value.nil?
  test_param[:mail_to_city] = (value.downcase == 'random')? helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.city.set(test_param[:mail_to_city])
end

Then /^[Ss]et Print form Province to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.province.send_keys(:enter) if value.nil?
  test_param[:mail_to_province] = (value.downcase == 'random')? helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.province.set(test_param[:mail_to_province])
end

Then /^[Ss]et Print form Postal Code to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.postal_code.send_keys(:enter) if value.nil?
  test_param[:mail_to_postal_code] = (value.downcase == 'random')? helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.postal_code.set(test_param[:mail_to_postal_code])
end

Then /^[Ss]et Print form Phone to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.phone.send_keys(:enter) if value.nil?
  test_param[:mail_to_phone] = (value.downcase == 'random')? helper.random_phone : value
  stamps.mail.print_form.mail_to.address.phone.set(test_param[:mail_to_phone])
end

Then /^[Ee]xpect Print form Domestic Address Field is present$/ do
  expect(stamps.mail.print_form.mail_to.text_area).to be_present, "Print form Domestic Address Field is NOT present"
end

Then /^[Ee]xpect Print form International Name Field is present$/ do
  expect(stamps.mail.print_form.mail_to.name).to be_present, "Print form International Name Field is NOT present"
end

Then /^[Ee]xpect Print form International Company Field is present$/ do
  expect(stamps.mail.print_form.mail_to.company).to be_present, "Print form International Company Field is NOT present"
end

Then /^[Ee]xpect Print form International Address 1 Field is present$/ do
  expect(stamps.mail.print_form.mail_to.address_1).to be_present, "Print form International Address 1 Field is NOT present"
end

Then /^[Ee]xpect Print form International Address 2 Field is present$/ do
  expect(stamps.mail.print_form.mail_to.address_2).to be_present, "Print form International Address 2 Field is NOT present"
end

Then /^[Ee]xpect Print form International City Field is present$/ do
  expect(stamps.mail.print_form.mail_to.city).to be_present, "Print form International City Field is NOT present"
end

Then /^[Ee]xpect Print form International Province Field is present$/ do
  expect(stamps.mail.print_form.mail_to.province).to be_present, "Print form International Province Field is NOT present"
end

Then /^[Ee]xpect Print form International Postcode Field is present$/ do
  expect(stamps.mail.print_form.mail_to.postal_code).to be_present, "Print form International Postcode Field is NOT present"
end

Then /^[Ee]xpect Print form International Phone Field is present$/ do
  expect(stamps.mail.print_form.mail_to.phone).to be_present, "Print form International Phone Field is NOT present"
end

