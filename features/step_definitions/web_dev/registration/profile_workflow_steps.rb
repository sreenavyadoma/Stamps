
Then /^[Bb]lur out on [Pp]rofile [Pp]age$/ do
  registration.profile.header.blur_out
end

Then /^[Ss]et [Pp]rofile [Pp]age [Ee]mail to (?:random value|(.*))$/ do |str|
  test_param[:email] = (str.nil?)?(helper.random_email):str
  registration.profile.email.wait_until_present(10)
  registration.profile.email.set(test_param[:email])
  step "blur out on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Ee]mail is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:email]:str
  expect(registration.profile.email.text).to eql(str)
end

Then /^[Ss]et [Pp]rofile [Pp]age [Uu]sername to (?:random value|(.*))$/ do |str|
  test_param[:username] = (str.nil?)?(helper.random_alpha_numeric):str
  registration.profile.account_info.account_username.set(test_param[:username])
  step "blur out on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Uu]sername is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:username]:str
  expect(registration.profile.account_info.account_username.text).to eql(str)
end

Then /^[Ss]et [Pp]rofile [Pp]age [Pp]assword to (?:random value|(.*))$/ do |str|
  test_param[:password] = (str.nil?)?(helper.random_password):str
  registration.profile.account_info.account_password.set(test_param[:password])
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Pp]assword is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:password]:str
  expect(registration.profile.account_info.account_password.text).to eql(str)
end

Then /^[Ss]et [Pp]rofile [Pp]age [Rr]e-[Tt]ype [Pp]assword to (?:random value|(.*))$/ do |str|
  registration.profile.account_info.retype_password.set((str.nil?)?(test_param[:password]):str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Rr]e-[Tt]ype [Pp]assword is (?:correct|(.*))$/ do |str|
  expect(registration.profile.account_info.retype_password.text).to eql(test_param[:password])
end

# Business Use - Mostly mailing (letters/postcards/flats)
# Business/Ecommerce Use - Mostly shipping packages
# Business Use - Both mailing and shipping
# Individual/Home Office
Then /^[Ss]et [Pp]rofile [Pp]age [Ss]urvey [Qq]uestion to (.*)$/ do |str|
  test_param[:survey_question] = str
  test_param[:survey_question_selected] = registration.profile.survey_question.select(test_param[:survey_question])
end

#Magazine Ad
#Radio/Podcast/Streaming Audio
#Television Commercial
#Telephone Call
#Web Search
#Web Banner
#Trade show/convention
#Recommended by USPS
#Recommended by Friend
#Other
#Newspaper Ad
#Received Mailer
#Received Mailer
#Email from Stamps.com
# Already used in office
Then /^[Ss]et [Pp]rofile [Pp]age Referer Name to (.*)$/ do |str|
  test_param[:referer_name] = str
  test_param[:survey_question_selected] = registration.profile.referer_name.select(test_param[:referer_name])
end

Then /^[Ss]et [Pp]rofile [Pp]age [Pp]romo [Cc]ode to (.*)$/ do |str|
  test_param[:promo_code] = str
  registration.profile.promo_code.show_promo_code.set(test_param[:promo_code])
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Pp]romo [Cc]ode is (?:correct|(.*))$/ do |str|
  str = (str.nil?)?test_param[:promo_code]:str
  expect(registration.profile.promo_code.show_promo_code.text).to eql(str)
end

Then /^check [Pp]rofile [Pp]age [Mm]oney-saving offers and new products$/ do
  registration.profile.side_content.money_saving_offers.checkbox.check
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Mm]oney-saving offers and new products is checked$/ do
  expect(registration.profile.side_content.money_saving_offers.checkbox).to be_checked, "Profile Money-saving offers and new products is not checked. Got checked"
end

Then /^uncheck [Pp]rofile [Pp]age [Mm]oney-saving offers and new products$/ do
  registration.profile.side_content.money_saving_offers.checkbox.uncheck
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Mm]oney-saving offers and new products is unchecked$/ do
  expect(registration.profile.side_content.money_saving_offers.checkbox).not_to be_checked, "Expected Profile Money-saving offers and new products is checked. Got unchecked"
end

Then /^[Cc]ontinue to [Mm]embership page$/ do
  registration.profile.continue
end

