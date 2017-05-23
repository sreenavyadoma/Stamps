# Membership Page validation steps

Then /^[Bb]lur_out on [Mm]embership [Pp]age$/ do
  registration.membership.header.blur_out
end

Then /^[Pp]opulate all [Mm]embership [Pp]age required fields$/ do
  step "set Membership page member address to random address between zone 1"
  step "set Membership page Phone to random value"
  step "set Membership page Cardholder's Name to random value"
  step "set Membership page Credit Card Number to default value"
  step "set Membership page Month to Dec (12)"
  step "set Membership page Year to 2026"
  step "check Membership page Terms & Conditions"
end

Then /^[Ss]et [Mm]embership [Pp]age [Mm]ember [Aa]ddress to(?: a |)(?: random address |)(?:to|in|between|) (.*)$/ do |address|
  address = helper.address_helper_zone(address) #combine this

  test_param[:first_name] = address['first_name'] #combine this in address_helper_zone
  test_param[:last_name] = address['last_name']
  test_param[:street_address] = address['street_address']
  test_param[:city] = address['city']
  test_param[:state] = address['state']
  test_param[:zip] = address['zip']
  test_param[:company] = address['company']
  test_param[:ship_to_domestic] = helper.format_address(address)
  test_param[:phone_number_format] = address['phone_number_format']

  step "set Membership page First Name to #{test_param[:first_name]}"
  step "set Membership page Last Name to #{test_param[:last_name]}"
  step "set Membership page Address to #{test_param[:street_address]}"
  step "blur_out on membership page"
  step "set Membership page City to #{test_param[:city]}"
  step "select Membership page State #{test_param[:state]}"
  step "blur_out on membership page"
  step "set Membership page Zip to #{test_param[:zip]}"
  step "set Membership page Phone to #{test_param[:phone_number_format]}"
end

Then /^[Ss]et [Mm]embership [Pp]age [Ff]irst [Nn]ame to (?:random value|(.*))$/ do |str|
  registration.membership.first_name.wait_until_present(10)
  expect(registration.membership.first_name).to be_present
  registration.membership.first_name.set(test_param[:first_name] = (str.nil?)?(helper.random_alpha_capitalize ):str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Ff]irst [Nn]ame is (?:correct|(.*))$/ do |str|
  expect(registration.membership.first_name.text).to eql((str.nil?)?test_param[:first_name]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Ll]ast [Nn]ame to (?:random value|(.*))$/ do |str|
  registration.membership.last_name.set(test_param[:last_name] = (str.nil?)?(helper.random_alpha_capitalize ):str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Ll]ast [Nn]ame is (?:correct|(.*))$/ do |str|
  expect(registration.membership.last_name.text).to eql((str.nil?)?test_param[:last_name]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Cc]ompany to (?:random value|(.*))$/ do |str|
  registration.membership.company.set(test_param[:company] = (str.nil?)?(helper.random_alpha ):str) if registration.membership.company.present?
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Cc]ompany is (?:correct|(.*))$/ do |str|
  expect(registration.membership.company.text).to eql((str.nil?)?test_param[:company]:str) if registration.membership.company.present?
end

Then /^[Ss]et [Mm]embership [Pp]age [Aa]ddress to (.*)$/ do |str|
  registration.membership.address.set(test_param[:address] = str)
  registration.membership.address.click
  registration.membership.address.double_click
  registration.membership.address.click
  step "blur_out on membership page"
  registration.membership.address.double_click
  registration.membership.address.click
  registration.membership.address.click
  step "blur_out on membership page"
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Aa]ddress is (?:correct|(.*))$/ do |str|
  expect(registration.membership.address.text).to eql((str.nil?)?test_param[:address]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Cc]ity to (.*)$/ do |str|
  registration.membership.city.set(test_param[:city] = str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Cc]ity is (?:correct|(.*))$/ do |str|
  expect(registration.membership.city.text).to eql((str.nil?)?test_param[:city]:str)
end

Then /^[Ss]elect [Mm]embership [Pp]age [Ss]tate (.*)$/ do |str|
  registration.membership.state.select(test_param[:state] = str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Ss]tate is (?:correct|(.*))$/ do |str|
  expect(registration.membership.state.text).to eql((str.nil?)?test_param[:state]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Zz]ip to (.*)$/ do |str|
  registration.membership.zip.set(test_param[:zip] = str)
  step "blur_out on membership page"
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Zz]ip is (?:correct|(.*))$/ do |str|
  expect(registration.membership.zip.text).to eql((str.nil?)?test_param[:zip]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Pp]hone to (?:random value|(.*))$/ do |str|
  test_param[:phone] = (str.nil?)?(helper.random_phone_number_format ):str
  registration.membership.phone.set(test_param[:phone])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Pp]hone is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:phone]:str
  expect(registration.membership.phone.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Cc]ardholder's [Nn]ame to (?:random value|(.*))$/ do |str|
  test_param[:card_holder_name] = (str.nil?)?(helper.random_full_name ):str
  registration.membership.cc_holder_name .set test_param[:card_holder_name]
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Cc]ardholder's [Nn]ame is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:card_holder_name]:str
  expect(registration.membership.cc_holder_name .text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Cc]redit [Cc]ard [Nn]umber to (?:default value|(.*))$/ do |str|
  test_param[:cc_number] = (str.nil?)?("4111111111111111" ):str
  registration.membership.cc_number.set test_param[:cc_number]
  step "blur_out on membership page"
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Cc]redit [Cc]ard [Nn]umber is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:cc_number]:str
  expect(registration.membership.cc_number.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Mm]onth to (.*)$/ do |str|
  test_param[:card_holder_name] = str
  registration.membership.cc_month.select(test_param[:card_holder_name])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Mm]onth is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:card_holder_name]:str
  expect(registration.membership.cc_month.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Yy]ear to (.*)$/ do |str|
  test_param[:cc_year] = str
  registration.membership.cc_year.select(test_param[:cc_year])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Yy]ear is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:cc_year]:str
  expect(registration.membership.cc_year.text).to eql(str)
end

Then /^[Cc]heck [Mm]embership [Pp]age [Bb]illing [Aa]ddress same as [Mm]ailing [Aa]ddress$/ do
  registration.membership.use_mailing_for_billing.check
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Bb]illing [Aa]ddress same as [Mm]ailing [Aa]ddress is checked$/ do
  expect(registration.membership.use_mailing_for_billing).to be_checked, "Membership page Billing address same as mailing address is UNCHECKED and it should be CHECKED."
end

Then /^[Uu]ncheck [Mm]embership [Pp]age [Bb]illing [Aa]ddress same as [Mm]ailing [Aa]ddress$/ do
  registration.membership.use_mailing_for_billing.uncheck
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Bb]illing [Aa]ddress same as [Mm]ailing [Aa]ddress is unchecked$/ do
  expect(registration.membership.use_mailing_for_billing).not_to be_checked, "Membership page Billing address same as mailing address is CHECKED and it should be UNCHECKED"
end

Then /^[Ee]xpect Billing Address form is present$/ do
  expect(registration.membership.billing_address).to be_present, "Billing Address form is NOT present but it should be PRESENT"
end

Then /^[Ee]xpect Billing Address form is not present$/ do
  expect(registration.membership.billing_address).not_to be_present, "Billing Address form is PRESENT and it should NOT be PRESENT"
end

Then /^[Ss]et [Mm]embership [Pp]age [Mm]ember [Bb]illing [Aa]ddress to(?: a |)(?: random address |)(?:to|in|between|) (.*)$/ do |address|
  address = helper.address_helper_zone(address) #combine this

  test_param[:street_address] = address['street_address']
  test_param[:city] = address['city']
  test_param[:state] = address['state']
  test_param[:zip] = address['zip']
  test_param[:phone_number_format] = address['phone_number_format']

  step "set Membership page Billing Address to #{test_param[:street_address]}"
  step "set Membership page Billing City to #{test_param[:city]}"
  step "select Membership page Billing State #{test_param[:state]}"
  step "set Membership page Billing Zip to #{test_param[:zip]}"
  step "set Membership page Phone to #{test_param[:phone_number_format]}"
end

Then /^[Ss]et [Mm]embership [Pp]age [Bb]illing [Aa]ddress to (.*)$/ do |str|
  registration.membership.billing_address.set(test_param[:billing_address] = (str.nil?)?(helper.random_alpha_capitalize ):str)
  step "blur_out on membership page"
  registration.membership.billing_address.click
  step "blur_out on membership page"
  registration.membership.billing_address.double_click
  registration.membership.billing_address.click
  step "blur_out on membership page"
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Bb]illing [Aa]ddress is (?:correct|(.*))$/ do |str|
  expect(registration.membership.billing_address.text).to eql((str.nil?)?test_param[:billing_address]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Bb]illing [Cc]ity to (.*)$/ do |str|
  registration.membership.billing_city.set(test_param[:billing_city] = (str.nil?)?(helper.random_alpha_capitalize ):str)
  step "blur_out on membership page"
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Bb]illing [Cc]ity is (?:correct|(.*))$/ do |str|
  expect(registration.membership.billing_city.text).to eql((str.nil?)?test_param[:billing_city]:str)
end

Then /^[Ss]elect [Mm]embership [Pp]age [Bb]illing [Ss]tate (.*)$/ do |str|
  registration.membership.billing_state.select(test_param[:billing_state] = str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Bb]illing [Ss]tate is (?:correct|(.*))$/ do |str|
  expect(registration.membership.billing_state.text).to eql((str.nil?)?test_param[:billing_state]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Bb]illing [Zz]ip to (.*)$/ do |str|
  registration.membership.billing_zip.set(test_param[:billing_zip] = (str.nil?)?(helper.random_alpha_capitalize ):str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Bb]illing [Zz]ip is (?:correct|(.*))$/ do |str|
  expect(registration.membership.billing_zip.text).to eql((str.nil?)?test_param[:billing_zip]:str)
end

Then /^[Cc]heck [Mm]embership [Pp]age Terms & Conditions$/ do
  registration.membership.agree_to_terms.check
end

Then /^[Ee]xpect [Mm]embership [Pp]age Terms & Conditions is checked$/ do
  expect(registration.membership.agree_to_terms).to be_checked, "Membership page Billing address same as mailing address is UNCHECKED and it should be CHECKED."
end

Then /^[Uu]ncheck [Mm]embership [Pp]age Terms & Conditions$/ do
  registration.membership.agree_to_terms.uncheck
end

Then /^[Ee]xpect [Mm]embership [Pp]age Terms & Conditions is unchecked$/ do
  expect(registration.membership.agree_to_terms).not_to be_checked, "Membership page Billing address same as mailing address is CHECKED and it should be UNCHECKED"
end

Then /^[Cc]lick [Mm]embership [Pp]age [Cc]ontinue button$/ do
  registration.membership.continue_to_next_page
end


