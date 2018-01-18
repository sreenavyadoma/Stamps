
# common Print form steps for Envelope|Label|Roll|CM

Then /^[Ss]et Print form Ship-To to international address$/ do |table|
  test_param[:address_hash] = table.hashes.first
  step "set Print form Mail-To Country to #{test_param[:address_hash]['country']}"
  step "set Print form Name to #{test_param[:address_hash]['name']}"
  step "set Print form Company to #{test_param[:address_hash]['company']}"
  step "set Print form Address 1 to #{test_param[:address_hash]['street_address_1']}"
  step "set Print form Address 2 to #{test_param[:address_hash]['street_address_2']}"
  step "set Print form Province to #{test_param[:address_hash]['province']}"
  step "set Print form City to #{test_param[:address_hash]['city']}"
  step "set Print form Postal Code to #{test_param[:address_hash]['postal_code']}"
  step "set Print form Phone to #{test_param[:address_hash][:phone]}"
end

Then /^[Ss]et Print Form Ship-To Country to a random country in PMEI price group (.*)$/ do |group|
  country_list = data_for(:country_groups_PMEI, {})["group" + group].values
  country_array = (country_list[rand(country_list.size)]).split("|")
  country_name = country_array[0]
  country_pounds = country_array[1].to_i
  100.times do
    unless test_param[:pounds].nil?
      if test_param[:pounds] > country_pounds
        country_array = country_list[rand(country_list.size)].split("|")
        country_name = country_array[0]
        country_pounds = country_array[1].to_i
      else
        break
      end
    end
  end
  step "set Print form Mail-To Country to #{test_param[:country] = country_name}"
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
  100.times do
    unless test_param[:pounds].nil?
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

#todo-Rob start here for international
Then /^[Ss]et Print form Name to (?:tab|enter|(.*))$/ do |str|
  stamps.mail.print_form.mail_to.mail_address.name.click
  stamps.mail.print_form.mail_to.mail_address.name.set(test_param[:mail_to_name] = (str.downcase == 'random') ? StampsTest.rand_full_name : str) unless str.nil?
end

Then /^[Ss]et Print form Company to (?:tab|enter|(.*))$/ do |str|
  stamps.mail.print_form.mail_to.mail_address.company.click
  stamps.mail.print_form.mail_to.mail_address.company.set(test_param[:mail_to_company] = (str.downcase == 'random') ? StampsTest.rand_full_name : str) unless str.nil?
end

Then /^[Ss]et Print form Address 1 to (?:tab|enter|(.*))$/ do |str|
  stamps.mail.print_form.mail_to.mail_address.address_1.click
  stamps.mail.print_form.mail_to.mail_address.address_1.set(test_param[:mail_to_street_address_1] = (str.downcase == 'random') ? StampsTest.rand_full_name : str) unless str.nil?
end

Then /^[Ss]et Print form Address 2 to (?:tab|enter|(.*))$/ do |str|
  stamps.mail.print_form.mail_to.mail_address.address_2.click
  stamps.mail.print_form.mail_to.mail_address.address_2.set(test_param[:mail_to_street_address_2] = (str.downcase == 'random') ? StampsTest.rand_full_name : str) unless str.nil?
end

Then /^[Ss]et Print form City to (?:tab|enter|(.*))$/ do |str|
  stamps.mail.print_form.mail_to.mail_address.city.click
  stamps.mail.print_form.mail_to.mail_address.city.set(test_param[:mail_to_city] = (str.downcase == 'random') ? StampsTest.rand_full_name : str) unless str.nil?
end

Then /^[Ss]et Print form Province to (?:tab|enter|(.*))$/ do |str|
  stamps.mail.print_form.mail_to.mail_address.province.click
  stamps.mail.print_form.mail_to.mail_address.province.set(test_param[:mail_to_province] = (str.downcase == 'random') ? StampsTest.rand_full_name : str) unless str.nil?
end

Then /^[Ss]et Print form Postal Code to (?:tab|enter|(.*))$/ do |str|
  stamps.mail.print_form.mail_to.mail_address.postal_code.click
  stamps.mail.print_form.mail_to.mail_address.postal_code.set(test_param[:mail_to_postal_code] = (str.downcase == 'random') ? StampsTest.rand_full_name : str) unless str.nil?
end

Then /^[Ss]et Print form Phone to (?:tab|enter|(.*))$/ do |str|
  stamps.mail.print_form.mail_to.mail_address.phone.click
  stamps.mail.print_form.mail_to.mail_address.phone.set(test_param[:mail_to_phone] = (str.downcase == 'random') ? StampsTest.rand_phone : str) unless str.nil?
end

Then /^[Ee]xpect Print form Domestic Address Field is present$/ do
  expect(stamps.mail.print_form.mail_to.mail_address.textarea).to be_present, "Print form Domestic Address Field is NOT present"
end

Then /^[Ee]xpect Print form International Name Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.name).to be_present, "Print form International Name Field is NOT present"
end

Then /^[Ee]xpect Print form International Company Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.company).to be_present, "Print form International Company Field is NOT present"
end

Then /^[Ee]xpect Print form International Address 1 Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.address_1).to be_present, "Print form International Address 1 Field is NOT present"
end

Then /^[Ee]xpect Print form International Address 2 Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.address_2).to be_present, "Print form International Address 2 Field is NOT present"
end

Then /^[Ee]xpect Print form International City Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.city).to be_present, "Print form International City Field is NOT present"
end

Then /^[Ee]xpect Print form International Province Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.province).to be_present, "Print form International Province Field is NOT present"
end

Then /^[Ee]xpect Print form International Postcode Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.postal_code).to be_present, "Print form International Postcode Field is NOT present"
end

Then /^[Ee]xpect Print form International Phone Field is present$/ do
  expect(stamps.mail.print_form.mail_to.int_mail_address.phone).to be_present, "Print form International Phone Field is NOT present"
end

