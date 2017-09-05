
# common Print form steps for Envelope|Label|Roll|CM

Then /^[Ss]et Print form Ship-To to international address$/ do |table|
  address = table.hashes.first
  step "set Print form Mail-To Country to #{address['country']}"
  step "set Print form Name to #{address['name']}"
  step "set Print form Company to #{address['company']}"
  step "set Print form Address 1 to #{address['street_address_1']}"
  step "set Print form Address 2 to #{address['street_address_2']}"
  step "set Print form Province to #{address['province']}"
  step "set Print form City to #{address['city']}"
  step "set Print form Postal Code to #{address['postal_code']}"
  step "set Print form Phone to #{address['phone']}"
end

Then /^[Ss]et Print Form Ship-To Country to a random country in PMEI price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI, {})["group" + group].values
  country_array = (country_list[rand(country_list.size)]).split("|")
  country_name = country_array[0]
  country_pounds = country_array[1].to_i
  200.times do
    if !test_param[:pounds].nil?
      if test_param[:pounds] > country_pounds
        country_array = country_list[rand(country_list.size)].split("|")
        country_name = country_array[0]
        country_pounds = country_array[1].to_i
      else
        break
      end
    end
  end
  test_param[:country] = country_name
  step "set Print form Mail-To Country to #{test_param[:country]}"
end

Then /^[Ss]et Print Form Ship-To Country to a random country in PMEI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI_flat_rate, {})["group" + group].values
  test_param[:country] = country_list[rand(country_list.size)]
  step "set Print form Mail-To Country to #{test_param[:country]}"
end

Then /^[Ss]et Print Form Ship-To Country to a random country in PMI price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMI, {})["group" + group].values
  country_array = (country_list[rand(country_list.size)]).split("|")
  country_name = country_array[0]
  country_pounds = country_array[1].to_i
  200.times do
    if !test_param[:pounds].nil?
      if test_param[:pounds] > country_pounds
        country_array = country_list[rand(country_list.size)].split("|")
        country_name = country_array[0]
        country_pounds = country_array[1].to_i
      else
        break
      end
    end
  end
  test_param[:country] = country_name
  step "set Print form Mail-To Country to #{test_param[:country]}"
end

Then /^[Ss]et Print Form Ship-To Country to a random country in PMI Flat Rate price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMI_flat_rate, {})["group" + group].values
  test_param[:country] = country_list[rand(country_list.size)]
  step "set Print form Mail-To Country to #{test_param[:country]}"
end

Then /^[Ss]et Print form Name to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.name.click if value.nil?
  test_param[:mail_to_name] = (value.downcase == 'random')? test_helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.name.set(test_param[:mail_to_name])
end

Then /^[Ss]et Print form Company to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.company.click if value.nil?
  test_param[:mail_to_company] = (value.downcase == 'random')? test_helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.company.set(test_param[:mail_to_company])
end

Then /^[Ss]et Print form Address 1 to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.address_1.click if value.nil?
  test_param[:mail_to_street_address_1] = (value.downcase == 'random')? test_helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.address_1.set(test_param[:mail_to_street_address_1])
end

Then /^[Ss]et Print form Address 2 to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.address_2.click if value.nil?
  test_param[:mail_to_street_address_2] = (value.downcase == 'random')? test_helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.address_2.set(test_param[:mail_to_street_address_2])
end

Then /^[Ss]et Print form City to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.city.click if value.nil?
  test_param[:mail_to_city] = (value.downcase == 'random')? test_helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.city.set(test_param[:mail_to_city])
  step "blur out on print form"
end

Then /^[Ss]et Print form Province to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.province.click if value.nil?
  test_param[:mail_to_province] = (value.downcase == 'random')? test_helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.province.set(test_param[:mail_to_province])
  step "blur out on print form"
end

Then /^[Ss]et Print form Postal Code to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.postal_code.click if value.nil?
  test_param[:mail_to_postal_code] = (value.downcase == 'random')? test_helper.random_full_name : value
  stamps.mail.print_form.mail_to.address.postal_code.set(test_param[:mail_to_postal_code])
  step "blur out on print form"
end

Then /^[Ss]et Print form Phone to (?:tab|enter|(.*))$/ do |value|
  stamps.mail.print_form.mail_to.address.phone.click if value.nil?
  test_param[:mail_to_phone] = (value.downcase == 'random')? test_helper.random_phone_number : value
  stamps.mail.print_form.mail_to.address.phone.set(test_param[:mail_to_phone])
end

Then /^[Ee]xpect Print form Domestic Address Field is present$/ do
  expect(stamps.mail.print_form.mail_to.textarea.present?).to be(true), "Print form Domestic Address Field is NOT present"
end

Then /^[Ee]xpect Print form International Name Field is present$/ do
  expect(stamps.mail.print_form.mail_to.name.present?).to be(true), "Print form International Name Field is NOT present"
end

Then /^[Ee]xpect Print form International Company Field is present$/ do
  expect(stamps.mail.print_form.mail_to.company.present?).to be(true), "Print form International Company Field is NOT present"
end

Then /^[Ee]xpect Print form International Address 1 Field is present$/ do
  expect(stamps.mail.print_form.mail_to.address_1.present?).to be(true), "Print form International Address 1 Field is NOT present"
end

Then /^[Ee]xpect Print form International Address 2 Field is present$/ do
  expect(stamps.mail.print_form.mail_to.address_2.present?).to be(true), "Print form International Address 2 Field is NOT present"
end

Then /^[Ee]xpect Print form International City Field is present$/ do
  expect(stamps.mail.print_form.mail_to.city.present?).to be(true), "Print form International City Field is NOT present"
end

Then /^[Ee]xpect Print form International Province Field is present$/ do
  expect(stamps.mail.print_form.mail_to.province.present?).to be(true), "Print form International Province Field is NOT present"
end

Then /^[Ee]xpect Print form International Postcode Field is present$/ do
  expect(stamps.mail.print_form.mail_to.postal_code.present?).to be(true), "Print form International Postcode Field is NOT present"
end

Then /^[Ee]xpect Print form International Phone Field is present$/ do
  expect(stamps.mail.print_form.mail_to.phone.present?).to be(true), "Print form International Phone Field is NOT present"
end

