# Profile Page Validation Steps

Then /^[Ee]xpect [Pp]rofile [Pp]age header contain (.*)$/ do |str|
  registration.profile.header.wait_until_present(7)
  expect(registration.profile.header.text).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age paragraph contain (.*)$/ do |str|
  expect(registration.profile.side_account_paragraph.text).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age email exists$/ do
  expect(registration.profile.email.present?).to be(true), "Email textbox DOES NOT exists on profile page"
end

Then /^[Ee]xpect Profile page Password tooltip count is (.*)$/ do |count|
  expect(registration.profile.account_password.help_block.size).to eql(count)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age username exists$/ do
  expect(registration.profile.account_username.present?).to be(true), "Username textbox DOES NOT exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age password exists$/ do
  expect(registration.profile.account_password.present?).to be(true), "Password textbox DOES NOT exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age retype password exists$/ do
  expect(registration.profile.retype_password.present?).to be(true), "Retype password textbox DOES NOT exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Ss]urvey [Qq]uestion exists$/ do
  expect(registration.profile.survey_question.present?).to be(true), "Survey Question DOES NOT exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age promo code link exists$/ do
  expect(registration.profile.promo_code_link.present?).to be(true), "Promo code link DOES NOT exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age promo code textbox exists$/ do
  expect(registration.profile.promo_code.present?).to be(true), "Profile promo code textbox DOES NOT exist"
end


Then /^[Ee]xpect Profile page SideContent Side Account header is (.*)$/ do |str|
  registration.profile.side_account_header.wait_until_present(7)
  expect(registration.profile.side_account_header.text).to eql(str)
end

Then /^[Ee]xpect Profile page SideContent Side Account paragraph is (.*)$/ do |str|
  expect(registration.profile.side_account_paragraph.text).to eql(str)
end

Then /^[Ee]xpect Profile page Money-saving offers and new products header is \"(.*)\"$/ do |str|
  expect(registration.profile.money_saving_offers_header.text).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age content under Money-saving offers and new products (.*)$/ do |str|
  expect(registration.profile.money_saving_offers_paragraph.text).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age CONTINUE button exists$/ do
  expect(registration.profile.continue_btn.present?).to be(true)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Ee]mail is (?:correct|(.*))$/ do |str|
  expect(registration.profile.email.text).to eql((str.nil?)?test_param[:email]:str)
end

Then /^[Ee]xpect Profile page Email tooltip (\d+) to be (.*)$/ do |tooltip_index, str|
  expect(registration.profile.email.help_block.tooltip(tooltip_index)).to eql(str)
end

Then /^[Ee]xpect Profile page Username tooltip to be (.*)$/ do |str|
  expect(registration.profile.user_tooltip.text).to eql(str)
end

Then /^[Ee]xpect Profile page Password tooltip (\d+) to be (.*)$/ do |tooltip_index, str|
  expect(registration.profile.account_password.help_block.tooltip(tooltip_index)).to eql(str)
end

Then /^[Ee]xpect Profile page Re-Password tooltip to be (.*)$/ do |str|
  expect(registration.profile.retype_password.text).to eql(str)
end