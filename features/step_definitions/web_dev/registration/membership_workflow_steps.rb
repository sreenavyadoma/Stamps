# Membership Page validation steps

Then /^[Ss]et [Mm]embership [Pp]age First Name to (?:random value|(.*))$/ do |str|
  test_param[:first_name] = (str.nil?)?(helper.random_email):str
  registration.profile.membership.personal_info.first_name.set(test_param[:first_name])
end

Then /^[Ee]xpect [Mm]embership [Pp]age First Name is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:first_name]:str
  expect(registration.profile.membership.personal_info.first_name.text).to eql(test_param[:first_name])
end

Then /^[Ss]et [Mm]embership [Pp]age Last Name to (.*)$/ do |str|
  test_param[:last_name] = (str.downcase.include? 'random') ? helper.random_alpha : str
  registration.profile.membership.personal_info.last_name.set(test_param[:last_name])
end

Then /^[Ss]et [Mm]embership [Pp]age Company to (.*)$/ do |str|
  test_param[:company] = (str.downcase.include? 'random') ? helper.random_alpha_numeric : str
  registration.profile.membership.personal_info.company.set(test_param[:company])
end

Then /^[Ss]et [Mm]embership [Pp]age Address to (.*)$/ do |str|
  test_param[:company] = (str.downcase.include? 'random') ? helper.random_alpha_numeric : str
  registration.profile.membership.personal_info.address.set(test_param[:company])
end

Then /^[Ss]et [Mm]embership [Pp]age City to (.*)$/ do |str|
  test_param[:membership] = str
  registration.profile.membership.personal_info.city.set(test_param[:membership])
end

Then /^[Ss]et [Mm]embership [Pp]age State to (.*)$/ do |str|
  test_param[:state] = str
  registration.profile.membership.personal_info.state.select(test_param[:state])
end

Then /^[Ss]et [Mm]embership [Pp]age Zip to (.*)$/ do |str|
  test_param[:zip] = str
  registration.profile.membership.personal_info.zip.set(test_param[:zip])
end

Then /^[Ss]et [Mm]embership [Pp]age Phone to (.*)$/ do |str|
  test_param[:phone] = (str.downcase.include? 'random') ? helper.random_phone : str

end

Then /^[Ss]et [Mm]embership [Pp]age Extenion to (.*)$/ do |str|
  test_param[:ext] = (str.downcase.include? 'random') ? helper.random_phone_extension : str
  registration.profile.membership.ext.set test_param[:ext]
end

Then /^[Ss]et [Mm]embership [Pp]age Cardholder name to (.*)$/ do |str|
  test_param[:card_holder_name] = (str.downcase.include? 'random') ? helper.random_full_name : str
  registration.profile.membership.card_holder_name.set test_param[:card_holder_name]
end

Then /^[Ss]et [Mm]embership [Pp]age Card number to (.*)$/ do |str|
  test_param[:card_number] = str
  registration.profile.membership.card_number.set test_param[:card_number]
end

Then /^[Ss]et [Mm]embership [Pp]age Expiration Year to (\d+)$/ do |str|
  test_param[:expiration_year] = str
  registration.profile.membership.expiration_year.select test_param[:expiration_year]
end

Then /^[Ss]et [Mm]embership [Pp]age Billing address same as mailing address to Checked$/ do
  registration.profile.membership.billing_same_as_mailing.check
end

Then /^[Ss]et [Mm]embership [Pp]age Billing address same as mailing address to Unchecked$/ do
  registration.profile.membership.billing_same_as_mailing.uncheck
end

Then /^[Ss]et [Mm]embership [Pp]age Terms & Conditions to Checked$/ do
  registration.profile.membership.terms_and_conditions.check
end

Then /^[Ss]et [Mm]embership [Pp]age Terms & Conditions to Unchecked$/ do
  registration.profile.membership.terms_and_conditions.uncheck
end

Then /^[Oo]n [Mm]embership [Pp]age, click Back Button$/ do
  expect("").to eql "Step Definition not yet implemented! - On Registration Membership page, click Back Button"
end

Then /^[Oo]n [Mm]embership [Pp]age, click Submit$/ do
  begin
    registration.profile.membership.submit_correct_errors test_param
  rescue Exception => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
  end
end

Then(/^[Oo]n [Mm]embership [Pp]age, expect First Name Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.first_name.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, expect Last Name Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.last_name.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, expect Address Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.address.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, expect City Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.city.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, expect State Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.state.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, expect Phone Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.phone.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, expect Cardhoder name Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.card_holder_name.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, expect Card number Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.card_number.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, Expires Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.expiration_month.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, expect Billing Address Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.billing_address.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, expect Billing City Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.billing_city.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, expect Billing State Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.billing_state.help_text
  expect(help_text).to eql expectation
end


Then(/^[Oo]n [Mm]embership [Pp]age, expect Billing Zip Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.billing_zip.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, expect Terms & Conditions Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.terms_and_conditions.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Mm]embership [Pp]age, Tab$/) do
  registration.profile.membership.tab
end