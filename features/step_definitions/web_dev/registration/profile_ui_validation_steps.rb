# Profile Page Validation Steps

Then /^[Ee]xpect [Pp]rofile [Pp]age header contain (.*)$/ do |str|
  registration.profile.header.wait_until_present(7)
  expect(registration.profile.header.text).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age paragraph contain (.*)$/ do |str|
  expect(registration.profile.side_account_paragraph.text).to eql(str)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age email exists$/ do
  expect(registration.profile.email.textbox).to be_present, "Email textbox DOES NOT exists on profile page"
end

Then /^[Ee]xpect Profile page Email tooltip count is (.*)$/ do |count|
  expect(registration.profile.email.tooltip.count).to eql(count.to_i)
end

Then /^[Ee]xpect Profile page Password tooltip count is (.*)$/ do |count|
  expect(registration.profile.account_password.tooltip.count).to eql(count.to_i)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age username exists$/ do
  expect(registration.profile.account_username.textbox).to be_present, "Username textbox DOES NOT exist on profile page"
end

Then /^[Ee]xpect Profile page [Uu]sername tooltip count is (.*)$/ do |count|
  expect(registration.profile.account_username.tooltip.count).to eql(count.to_i)
end

Then /^[Ee]xpect [Pp]rofile [Pp]age password exists$/ do
  expect(registration.profile.account_password.textbox).to be_present, "Password textbox DOES NOT exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age retype password exists$/ do
  expect(registration.profile.retype_password.textbox).to be_present, "Retype password textbox DOES NOT exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Ss]urvey [Qq]uestion exists$/ do
  expect(registration.profile.survey_question.survey_question_dropdown).to be_present, "Survey Question DOES NOT exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age promo code link exists$/ do
  expect(registration.profile.promo_code.link).to be_present, "Promo code link DOES NOT exist on profile page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age promo code textbox exists$/ do
  expect(registration.profile.promo_code.textbox).to be_present, "Profile promo code textbox DOES NOT exist"
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
  expect(registration.profile.continue_btn).to be_present, "CONTINUE button doesn't exists on Profile Page"
end

Then /^[Ee]xpect [Pp]rofile [Pp]age [Ee]mail is (?:correct|(.*))$/ do |str|
  expect(registration.profile.email.textbox.text).to eql((str.nil?)?TestData.store[:email]:str)
end

Then /^[Ee]xpect Profile page Email tooltip index (\d+) to be (.*)$/ do |index, str|
   expect(registration.profile.email.tooltip.text(index.to_i - 1)).to eql(str)
end

Then /^[Ee]xpect Profile page [Uu]sername tooltip index (\d+) to be (.*)$/ do |index, str|
  expect(registration.profile.account_username.tooltip.text(index.to_i - 1)).to eql(str)
end

Then /^[Ee]xpect Profile page [Pp]assword tooltip index (\d+) to be (.*)$/ do |index, str|
  expect(registration.profile.account_password.tooltip.text(index.to_i - 1)).to eql(str)
end

Then /^[Ee]xpect Profile page Re-Password tooltip index (\d+) to be (.*)$/ do |index, str|
   expect(registration.profile.retype_password.tooltip.text(index.to_i - 1)).to eql(str)
end

Then /^[Ee]xpect Profile page Survey Question tooltip to be (.*)$/ do |str|
  expect(registration.profile.survey_question.tooltip).to eql(str)
end


