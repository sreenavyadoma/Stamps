# Profile Page Validation Steps

Then /^[Ee]xpect [Pp]rofile [Pp]age header contain (.*)$/ do |str|
  registration.profile.header.wait_until_present(7)
  expect(registration.profile.header.text).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age email exists$/ do
  expect(registration.profile.account_info.email).to be_present, "Email textbox does not exists on profile page"
  registration.profile.email.present?
end

Then /^[Ee]xpect [Pp]rofile [Pp]age username exists$/ do
  expect(registration.profile.account_info.account_username).to be_present, "Username textbox does not exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age password exists$/ do
  expect(registration.profile.account_info.account_password).to be_present, "Password textbox does not exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age retype password exists$/ do
  expect(registration.profile.account_info.retype_password).to be_present, "Retype password textbox does not exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age promo code textbox exists$/ do
  expect(registration.profile.promocode).to be_present, "expect Profile promo code textbox does not exist"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age CONTINUE button exists$/ do
  expect(registration.profile_continue_button).to be_present
end

Then /^[Ee]xpect [Pp]rofile [Pp]age content under Why do I need to create an account$/ do |str|
  expect(registration.profile_content_createanaccount).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age content under Money-saving offers and new products$/ do |str|
  expect(registration.profile_content_money_saving_offers).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age Money-saving offers and new products checkbox exist$/ do
  expect(registration.profile_moneysavingoffers_checkbox).to be_present
end