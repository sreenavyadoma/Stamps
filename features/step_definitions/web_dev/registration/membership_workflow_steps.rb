# Membership Page validation steps

Then /^[Bb]lur_out on [Mm]embership [Pp]age$/ do
  registration.profile.membership.header.blur_out
end

Then /^[Ss]et [Mm]embership [Pp]age [Ff]irst [Nn]ame to (?:random value|(.*))$/ do |str|
  registration.profile.membership.personal_info.first_name.set(test_param[:first_name] = (str.nil?)?(helper.random_alpha_capitalize ):str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Ff]irst [Nn]ame is (?:correct|(.*))$/ do |str|
  expect(registration.profile.membership.personal_info.first_name.text).to eql((str.nil?)?test_param[:first_name]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Ll]ast [Nn]ame to (?:random value|(.*))$/ do |str|
  registration.profile.membership.personal_info.last_name.set(test_param[:last_name] = (str.nil?)?(helper.random_alpha_capitalize ):str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Ll]ast [Nn]ame is (?:correct|(.*))$/ do |str|
  expect(registration.profile.membership.personal_info.last_name.text).to eql((str.nil?)?test_param[:last_name]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Cc]ompany to (?:random value|(.*))$/ do |str|
  registration.profile.membership.personal_info.company.set(test_param[:company] = (str.nil?)?(helper.random_alpha ):str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Cc]ompany is (?:correct|(.*))$/ do |str|
  expect(registration.profile.membership.personal_info.company.text).to eql((str.nil?)?test_param[:company]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Aa]ddress to (.*)$/ do |str|
  registration.profile.membership.personal_info.address.set(test_param[:address] = str)
  step "blur_out on membership page"
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Aa]ddress is (?:correct|(.*))$/ do |str|
  expect(registration.profile.membership.personal_info.address.text).to eql((str.nil?)?test_param[:address]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Cc]ity to (.*)$/ do |str|
  registration.profile.membership.personal_info.city.set(test_param[:city] = str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Cc]ity is (?:correct|(.*))$/ do |str|
  expect(registration.profile.membership.personal_info.city.text).to eql((str.nil?)?test_param[:city]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Ss]tate to (.*)$/ do |str|
  registration.profile.membership.personal_info.state.select(test_param[:state] = str)
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Ss]tate is (?:correct|(.*))$/ do |str|
  expect(registration.profile.membership.personal_info.state.text).to eql((str.nil?)?test_param[:state]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Zz]ip to (.*)$/ do |str|
  registration.profile.membership.personal_info.zip.set(test_param[:zip] = str)
  step "blur_out on membership page"
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Zz]ip is (?:correct|(.*))$/ do |str|
  expect(registration.profile.membership.personal_info.zip.text).to eql((str.nil?)?test_param[:zip]:str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Pp]hone to (?:random value|(.*))$/ do |str|
  test_param[:phone] = (str.nil?)?(helper.random_phone_number_format ):str
  registration.profile.membership.personal_info.phone.set(test_param[:phone])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Pp]hone is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:phone]:str
  expect(registration.profile.membership.personal_info.phone.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Cc]ardholder's [Nn]ame to (?:random value|(.*))$/ do |str|
  test_param[:card_holder_name] = (str.nil?)?(helper.random_full_name ):str
  registration.profile.membership.credit_card.cc_holder_name .set test_param[:card_holder_name]
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Cc]ardholder's [Nn]ame is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:card_holder_name]:str
  expect(registration.profile.membership.credit_card.cc_holder_name .text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Cc]redit [Cc]ard [Nn]umber to (?:default value|(.*))$/ do |str|
  test_param[:cc_number] = (str.nil?)?("4111111111111111" ):str
  registration.profile.membership.credit_card.cc_number.set test_param[:cc_number]
  step "blur_out on membership page"
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Cc]redit [Cc]ard [Nn]umber is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:cc_number]:str
  expect(registration.profile.membership.credit_card.cc_number.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Mm]onth to (.*)$/ do |str|
  test_param[:card_holder_name] = str
  registration.profile.membership.credit_card.cc_month.select(test_param[:card_holder_name])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Mm]onth is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:card_holder_name]:str
  expect(registration.profile.membership.credit_card.cc_month.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Yy]ear to (.*)$/ do |str|
  test_param[:cc_year] = str
  registration.profile.membership.credit_card.cc_year.select(test_param[:cc_year])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Yy]ear is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:cc_year]:str
  expect(registration.profile.membership.credit_card.cc_year.text).to eql(str)
end

Then /^[Cc]heck [Mm]embership [Pp]age [Bb]illing [Aa]ddress same as [Mm]ailing [Aa]ddress$/ do
  registration.profile.membership.credit_card.billing_address_same_as_mailing.check
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Bb]illing [Aa]ddress same as [Mm]ailing [Aa]ddress is checked$/ do
  expect(registration.profile.membership.credit_card.billing_address_same_as_mailing).to be_checked, "Membership page Billing address same as mailing address is UNCHECKED and it should be CHECKED."
end

Then /^[Uu]ncheck [Mm]embership [Pp]age [Bb]illing [Aa]ddress same as [Mm]ailing [Aa]ddress$/ do
  registration.profile.membership.credit_card.billing_address_same_as_mailing.uncheck
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Bb]illing [Aa]ddress same as [Mm]ailing [Aa]ddress is unchecked$/ do
  expect(registration.profile.membership.credit_card.billing_address_same_as_mailing).not_to be_checked, "Membership page Billing address same as mailing address is CHECKED and it should be UNCHECKED"
end

Then /^[Ee]xpect Billing Address form is present$/ do
  expect(registration.profile.membership.credit_card.billing_address).to be_present, "Billing Address form is NOT present but it should be PRESENT"
end

Then /^[Ee]xpect Billing Address form is not present$/ do
  expect(registration.profile.membership.credit_card.billing_address).not_to be_present, "Billing Address form is PRESENT and it should NOT be PRESENT"
end

Then /^[Ss]et [Mm]embership [Pp]age [Bb]illing [Aa]ddress to (.*)$/ do |str|
  test_param[:billing_address] = (str.nil?)?(helper.random_alpha_capitalize ):str
  registration.profile.membership.credit_card.billing_address.billing_address.set(test_param[:billing_address])
  step "blur_out on membership page"
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Bb]illing [Aa]ddress is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:billing_address]:str
  expect(registration.profile.membership.credit_card.billing_address.billing_address.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Bb]illing [Cc]ity to (.*)$/ do |str|
  test_param[:billing_city] = (str.nil?)?(helper.random_alpha_capitalize ):str
  registration.profile.membership.credit_card.billing_address.billing_city.set(test_param[:billing_city])
  step "blur_out on membership page"
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Bb]illing [Cc]ity is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:billing_city]:str
  expect(registration.profile.membership.credit_card.billing_address.billing_city.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Bb]illing [Ss]tate to (.*)$/ do |str|
  test_param[:billing_state] = str
  registration.profile.membership.credit_card.billing_address.billing_state.select(test_param[:billing_state])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Bb]illing [Ss]tate is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:billing_state]:str
  expect(registration.profile.membership.credit_card.billing_address.billing_state.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Bb]illing [Zz]ip to (.*)$/ do |str|
  test_param[:billing_zip] = (str.nil?)?(helper.random_alpha_capitalize ):str
  registration.profile.membership.credit_card.billing_address.billing_zip.set(test_param[:billing_zip])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Bb]illing [Zz]ip is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:billing_zip]:str
  expect(registration.profile.membership.credit_card.billing_address.billing_zip.text).to eql(str)
end

Then /^[Cc]heck [Mm]embership [Pp]age Terms & Conditions$/ do
  registration.profile.membership.terms_and_conditions.i_agree.check
end

Then /^[Ee]xpect [Mm]embership [Pp]age Terms & Conditions is checked$/ do
  expect(registration.profile.membership.terms_and_conditions.i_agree).to be_checked, "Membership page Billing address same as mailing address is UNCHECKED and it should be CHECKED."
end

Then /^[Uu]ncheck [Mm]embership [Pp]age Terms & Conditions$/ do
  registration.profile.membership.terms_and_conditions.i_agree.uncheck
end

Then /^[Ee]xpect [Mm]embership [Pp]age Terms & Conditions is unchecked$/ do
  expect(registration.profile.membership.terms_and_conditions.i_agree).not_to be_checked, "Membership page Billing address same as mailing address is CHECKED and it should be UNCHECKED"
end

Then /^[Ss]ubmit [Mm]embership [Pp]age$/ do
  registration.profile.membership.pagination.submit
end


