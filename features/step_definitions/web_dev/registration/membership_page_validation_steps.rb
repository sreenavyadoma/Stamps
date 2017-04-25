# Membership Page validation steps

Then /^[Ss]et [Rr]egistration [Mm]embership page State to (.*)$/ do |str|
  registration.profile.membership.state.select(str)
end

Then /^[Ss]et [Rr]egistration [Mm]embership page First Name to (.*)$/ do |var|
  test_parameter[:first_name] = (var.downcase.include? 'random') ? helper.random_string : var
  registration.profile.membership.first_name.set test_parameter[:first_name]
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Last Name to (.*)$/ do |var|
  test_parameter[:last_name] = (var.downcase.include? 'random') ? helper.random_string : var
  registration.profile.membership.last_name.set test_parameter[:last_name]
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Company to (.*)$/ do |var|
  test_parameter[:company] = (var.downcase.include? 'random') ? helper.random_string : var
  registration.profile.membership.company.set test_parameter[:company]
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Address to (.*)$/ do |var|
  test_parameter[:company] = (var.downcase.include? 'random') ? helper.random_string : var
  registration.profile.membership.address.set test_parameter[:company]
end

Then /^[Ss]et [Rr]egistration [Mm]embership page City to (.*)$/ do |var|
  test_parameter[:membership] = var
  registration.profile.membership.city.set test_parameter[:membership]
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Zip Code to (.*)$/ do |var|
  test_parameter[:zip] = var
  registration.profile.membership.zip.set test_parameter[:zip]
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Phone to (.*)$/ do |var|
  test_parameter[:phone] = (var.downcase.include? 'random') ? helper.random_phone : var
  phone = registration.profile.membership.phone
  6.times do
    phone.send_keys test_parameter[:phone]
    sleep(0.35)
    ui_phone = phone.text
    sleep(0.35)
    break if ui_phone.include? '-' and (test_parameter[:phone][-4, 4] == ui_phone[-4, 4])
  end
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Extenion to (.*)$/ do |var|
  test_parameter[:ext] = (var.downcase.include? 'random') ? helper.random_phone_extension : var
  registration.profile.membership.ext.set test_parameter[:ext]
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Cardholder name to (.*)$/ do |var|
  test_parameter[:card_holder_name] = (var.downcase.include? 'random') ? helper.random_full_name : var
  registration.profile.membership.card_holder_name.set test_parameter[:card_holder_name]
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Card number to (.*)$/ do |var|
  test_parameter[:card_number] = var
  registration.profile.membership.card_number.set test_parameter[:card_number]
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Month to January/ do
  registration.profile.membership.expiration_month.jan
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Month to February$/ do
  registration.profile.membership.expiration_month.feb
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Month to March$/ do
  registration.profile.membership.expiration_month.mar
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Month to April$/ do
  registration.profile.membership.expiration_month.apr
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Month to May$/ do
  registration.profile.membership.expiration_month.may
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Month to June$/ do
  registration.profile.membership.expiration_month.jun
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Month to July$/ do
  registration.profile.membership.expiration_month.jul
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Month to August$/ do
  registration.profile.membership.expiration_month.aug
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Month to September$/ do
  registration.profile.membership.expiration_month.sep
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Month to October$/ do
  registration.profile.membership.expiration_month.oct
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Month to November$/ do
  registration.profile.membership.expiration_month.nov
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Month to December$/ do
  registration.profile.membership.expiration_month.dec
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Expiration Year to (\d+)$/ do |var|
  test_parameter[:expiration_year] = var
  registration.profile.membership.expiration_year.select test_parameter[:expiration_year]
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Billing address same as mailing address to Checked$/ do
  registration.profile.membership.billing_same_as_mailing.check
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Billing address same as mailing address to Unchecked$/ do
  registration.profile.membership.billing_same_as_mailing.uncheck
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Terms & Conditions to Checked$/ do
  registration.profile.membership.terms_and_conditions.check
end

Then /^[Ss]et [Rr]egistration [Mm]embership page Terms & Conditions to Unchecked$/ do
  registration.profile.membership.terms_and_conditions.uncheck
end

Then /^[Oo]n [Rr]egistration [Mm]embership page, click Back Button$/ do
  expect("").to eql "Step Definition not yet implemented! - On Registration Membership page, click Back Button"
end

Then /^[Oo]n [Rr]egistration [Mm]embership page, click Submit$/ do
  begin
    registration.profile.membership.submit_correct_errors test_parameter
  rescue Exception => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
  end
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect First Name Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.first_name.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect Last Name Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.last_name.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect Address Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.address.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect City Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.city.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect State Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.state.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect Phone Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.phone.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect Cardhoder name Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.card_holder_name.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect Card number Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.card_number.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, Expires Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.expiration_month.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect Billing Address Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.billing_address.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect Billing City Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.billing_city.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect Billing State Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.billing_state.help_text
  expect(help_text).to eql expectation
end


Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect Billing Zip Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.billing_zip.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, expect Terms & Conditions Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.terms_and_conditions.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n [Rr]egistration [Mm]embership page, Tab$/) do
  registration.profile.membership.tab
end