# Profile Page Validation Steps

Then /^[Ee]xpect [Pp]rofile [Pp]age header contain (.*)$/ do |str|
  registration.profile.header.wait_until_present(7)
  expect(registration.profile.header.text).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age email exists$/ do
  expect(registration.profile.email).to be_present, "Email textbox DOES NOT exists on profile page"
  registration.profile.email.present?
end

Then /^[Ee]xpect [Pp]rofile [Pp]age username exists$/ do
  expect(registration.profile.account_username).to be_present, "Username textbox DOES NOT exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age password exists$/ do
  expect(registration.profile.account_password).to be_present, "Password textbox DOES NOT exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age retype password exists$/ do
  expect(registration.profile.retype_password).to be_present, "Retype password textbox DOES NOT exist on profile page"
end



Then /^[Ee]xpect [Pp]rofile [Pp]age promo code textbox exists$/ do
  expect(registration.profile.promo_code).to be_present, "Profile promo code textbox DOES NOT exist"
end


Then /^[Ee]xpect Profile page SideContent Side Account header is \"(.*)\"$/ do |str|
  registration.profile.side_account_header.wait_until_present(7)
  expect(registration.profile.side_account_header.text).to eql(str)
end

Then /^[Ee]xpect Profile page SideContent Side Account paragraph is (.*)$/ do |str|
  expect(registration.profile.side_account_paragraph.text).to eql(str)
end


Then /^[Ee]xpect Profile page Money-saving offers and new products header is \"(.*)\"$/ do |str|
  expect(registration.profile.money_saving_offers_header.text).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age content under Money-saving offers and new products$/ do |str|
  expect(registration.profile_content_money_saving_offers).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age CONTINUE button exists$/ do
  expect(registration.profile.continue_btn).to be_present
end

