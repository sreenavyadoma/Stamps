# Membership Page validation steps

Then /^[Ss]et [Mm]embership [Pp]age [Ff]irst [Nn]ame to (?:random value|(.*))$/ do |str|
  test_param[:first_name] = (str.nil?)?(helper.random_alpha_capitalize ):str
  registration.profile.membership.personal_info.first_name.set(test_param[:first_name])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Ff]irst [Nn]ame is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:first_name]:str
  expect(registration.profile.membership.personal_info.first_name.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Ll]ast [Nn]ame to (?:random value|(.*))$/ do |str|
  test_param[:last_name] = (str.nil?)?(helper.random_alpha_capitalize ):str
  registration.profile.membership.personal_info.last_name.set(test_param[:last_name])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Ll]ast [Nn]ame is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:last_name]:str
  expect(registration.profile.membership.personal_info.last_name.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Cc]ompany to (?:random value|(.*))$/ do |str|
  test_param[:company] = (str.nil?)?(helper.random_alpha ):str
  registration.profile.membership.personal_info.company.set(test_param[:company])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Cc]ompany is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:company]:str
  expect(registration.profile.membership.personal_info.company.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Aa]ddress to (.*)$/ do |str|
  test_param[:address] = str
  registration.profile.membership.personal_info.address.set(test_param[:address])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Aa]ddress is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:address]:str
  expect(registration.profile.membership.personal_info.address.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Cc]ity to (.*)$/ do |str|
  test_param[:city] = str
  registration.profile.membership.personal_info.city.set(test_param[:city])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Cc]ity is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:city]:str
  expect(registration.profile.membership.personal_info.city.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Ss]tate to (.*)$/ do |str|
  test_param[:state] = str
  registration.profile.membership.personal_info.state.select(test_param[:state])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Ss]tate is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:state]:str
  expect(registration.profile.membership.personal_info.state.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Zz]ip to (.*)$/ do |str|
  test_param[:zip] = str
  registration.profile.membership.personal_info.zip.set(test_param[:zip])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Zz]ip is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:zip]:str
  expect(registration.profile.membership.personal_info.zip.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Pp]hone to (?:random value|(.*))$/ do |str|
  test_param[:phone] = (str.nil?)?(helper.random_phone ):str
  registration.profile.membership.personal_info.phone.set(test_param[:zip])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Pp]hone is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:phone]:str
  expect(registration.profile.membership.personal_info.phone.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Cc]ardholder's name to (?:random value|(.*))$/ do |str|
  test_param[:card_holder_name] = (str.nil?)?(helper.random_full_name ):str
  registration.profile.membership.credit_card.card_holder_name.set test_param[:card_holder_name]
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Cc]ardholder's name is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:card_holder_name]:str
  expect(registration.profile.membership.credit_card.card_holder_name.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Cc]redit [Cc]ard [Nn]umber to (?:default value|(.*))$/ do |str|
  test_param[:cc_number] = (str.nil?)?("4111111111111111" ):str
  registration.profile.membership.credit_card.cc_number.set test_param[:card_holder_name]
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Cc]redit [Cc]ard [Nn]umber is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:cc_number]:str
  expect(registration.profile.membership.credit_card.cc_number.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Mm]onth to (.*)$/ do |str|
  test_param[:card_holder_name] = str
  registration.profile.membership.credit_card.cc_month.set(test_param[:card_holder_name])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Mm]onth is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:card_holder_name]:str
  expect(registration.profile.membership.credit_card.cc_month.text).to eql(str)
end

Then /^[Ss]et [Mm]embership [Pp]age [Yy]ear to (.*)$/ do |str|
  test_param[:cc_month] = str
  registration.profile.membership.credit_card.cc_year.set(test_param[:card_holder_name])
end

Then /^[Ee]xpect [Mm]embership [Pp]age [Yy]ear is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:cc_month]:str
  expect(registration.profile.membership.credit_card.cc_year.text).to eql(str)
end





