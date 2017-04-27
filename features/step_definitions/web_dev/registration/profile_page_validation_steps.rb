# Profile Page Validation Steps

Then /^[Ee]xpect [Pp]rofile header contain (.*)$/ do |str|
  expect(registration.profile.header).to eql(str), "Profile header #{str} does not exist "
end

Then /^[Ee]xpect [Pp]rofile email exists$/ do
  expect(registration.profile.account_info.email.present?).to be(true), "Email textbox does not exists on profile page"
  registration.profile.email.present?
end

Then /^[Ee]xpect [Pp]rofile username exists$/ do
  expect(registration.profile.account_info.account_username.present?).to be (true), "Username textbox does not exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile password exists$/ do
  expect(registration.profile.account_info.account_password.present?).to be (true), "Password textbox does not exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile retype password exists$/ do
  expect(registration.profile.account_info.retype_password.present?).to be (true), "Retype password textbox does not exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile promo code textbox exists$/ do
  expect(registration.profile.promocode.present?).to be (true)
end

Then /^[Ee]xpect [Pp]rofile CONTINUE button exists$/ do
  expect(registration.profile_continue_button.present?).to be (true)
end

Then /^[Ee]xpect [Pp]rofile content under Why do I need to create an account$/ do |str|
  expect(registration.profile_content_createanaccount).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile content under Money-saving offers and new products$/ do |str|
  expect(registration.profile_content_money_saving_offers).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile Money-saving offers and new products checkbox exist$/ do
  expect(registration.profile_moneysavingoffers_checkbox.present?).to be (true)
end