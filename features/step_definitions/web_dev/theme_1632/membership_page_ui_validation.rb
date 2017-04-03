Then /^[Ll]oad WebReg Profile page$/ do
  webreg.load_page
end

Then /^[Ss]et WebReg Profile email textbox to email to (.*)$/ do |email|
  registration.profile.email.set email
end

Then /^[Ss]et WebReg Profile username textbox to username to (.*)$/ do |username|
  registration.profile.username.set username
end

Then /^[Ss]et WebReg Profile password textbox to (.*)$/ do |password|
  registration.profile.password.set password
end

Then /^[Ss]et WebReg Profile retype password textbox to (.*)$/ do |password|
  registration.profile.retype_password.set password
end

Then /^[Ss]et WebReg Profile Usage Type list of values to contain (.*)$/ do |str|
  registration.profile.usage_type.set str
end

Then /^[Oo]n WebReg Profile page, continue to Membership page/ do
  registration.profile.continue_button
end

Then /^[Ee]xpect WebReg navigation bar Stamps logo exists$/ do
  expect(registration.navigation.stamps_logo.present?).to be (true)
end

Then /^[Ee]xpect WebReg navigationbar Stamps logo exists$/ do
  expect(registration.navigation.stamps_logo.present?).to be(true)
end


Then /^(?:S|s)et WebReg Profile Password to (.*)$/ do |password|
  test_parameter[:pw]=password
  webreg.profile.password.set test_parameter[:pw]
end

Then /^[Ee]xpect WebReg Profile email textbox exists$/ do
  expect(registration.profile.email.present?).to be(true), "Email textbox does not exists on profile page"
end