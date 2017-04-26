# Profile Page Validation Steps


Then /^[Ee]xpect [Rr]egistration bread crumbs is Profile$/ do
  expect(registration.bread_crumbs.breadcrumb_profile).to eql('Profile'), "Bread crumb #{str} does not exist "
end

Then /^[Ee]xpect Registration bread crumbs is Membership$/
  expect(registration.bread_crumbs.breadcrumb_membership).to eql('Membership'), "Profile header 'Membership' does not exist "
end

Then /^[Ee]xpect Registration bread crumbs is Choose Supplies$/
expect(registration.bread_crumbs.breadcrumb_Choosesupplies).to eql('Choose Supplies'), "Profile header #{str} does not exist "
end

Then /^[Ee]xpect Profile header is Sign up for a new account(.*)$/ do
  expect(registration.profile.profile_header).to eql('Sign up and avoid trips to the Post Office')
end


Then /^[Ee]xpect [Pp]rofile email exists$/ do
  expect(registration.profile.email.present?).to be(true), "Email textbox does not exists on profile page"
  registration.profile.email.present?
end

Then /^[Ee]xpect [Pp]rofile username exists$/ do
  expect(registration.profile.username.present?).to be (true), "Username textbox does not exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile password exists$/ do
  expect(registration.profile.password.present?).to be (true), "Password textbox does not exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile retype password exists$/ do
  expect(registration.profile.retype_password.present?).to be (true), "Retype password textbox does not exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile Usage Type list of values to contain (.*)$/ do |str|
  expect(registration.profile.dropdown).to eql(str)
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