Then /^[Ll]oad WebReg Profile page$/ do
  webreg.load_page
end

Then /^[Ee]xpect WebReg navigationbar Stamps logo exists$/ do
   expect(registration.navigation.stamps_logo.present?).to be(true)
end

Then /^[Ee]xpect WebReg navigation bar USPS logo exists$/ do
  expect(registration.navigation.usps_logo.present?).to be(true)
end

Then /^[Ee]xpect WebReg Profile bread crumbs to contain (.*)$/ do |str|
  expect(registration.bread_crumbs).to eql(str), "Bread crumb #{str} does not exist "
end

Then /^[Ee]xpect WebReg Profile header contain (.*)$/ do |str|
  expect(registration.profile.header).to eql(str), "Profile header #{str} does not exist "
end

Then /^[Ee]xpect WebReg Profile email textbox exists$/ do
  expect(registration.profile.email.present?).to be(true), "Email textbox does not exists on profile page"
end

Then /^[Ee]xpect WebReg Profile username textbox exists$/ do
  expect(registration.profile.username.present?).to be (true), "Username textbox does not exist on profile page"
end

Then /^[Ee]xpect WebReg Profile password textbox exists$/ do
  expect(registration.profile.password.present?).to be (true), "Password textbox does not exist on profile page"
end

Then /^[Ee]xpect WebReg Profile retype password textbox exists$/ do
  expect(registration.profile.retype_password.present?).to be (true), "Retype password textbox does not exist on profile page"
end

Then /^[Ee]xpect WebReg Profile Usage Type list of values to contain (.*)$/ do |str|
  expect(registration.profile.dropdown).to eql(str)
end

Then /^[Ee]xpect WebReg Profile promo code textbox exists$/ do
  expect(registration.profile.promocode.present?).to be (true)
end

  Then /^[Ee]xpect WebReg Profile CONTINUE button exists$/ do
  expect(registration.profile_continue_button.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile content under Why do I need to create an account should contain (.*)$/ do |str|
    expect(registration.profile_content_createanaccount).to eql(str)
end

Then /^[Ee]xpect WebReg Profile content under Money-saving offers and new products should contain (.*)$/ do |str|
  expect(registration.profile_content_money_saving_offers).to eql(str)
end

Then /^[Ee]xpect WebReg Profile Money-saving offers and new products checkbox exist$/ do
  expect(registration.profile_moneysavingoffers_checkbox.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile Privacy Policy link exists$/ do
  expect(registration.profile_privacy_policy.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile copyright link exists$/ do
  expect(registration.profile_copyrightlink.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile Norton logo exists$/ do
  expect(registration.profile_nortonlogo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile TRUSTe logo exists$/ do
  expect(registration.profile_trustelogo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile LIVE chat button exists$/ do
  expect(registration.profile_livechatbutton.present?).to be (true)
end


