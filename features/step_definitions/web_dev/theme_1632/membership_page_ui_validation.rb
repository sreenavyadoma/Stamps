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

Then /^[Ee]xpect WebReg navigation bar USPS logo exists$/ do
  expect(registration.navigation.usps_logo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership bread crumbs to contain (.*)$/ do |str|
expect(registration.bread_crumbs).to eql(str), "Bread crumb #{str} does not exist"
end

Then /^[Ee]xpect WebReg Membership header contain (.*)$/ do |str|
  expect(registration.membership.header).to eql(str)
end

Then /^[Ee]xpect WebReg Membership first name textbox exists$/ do
  expect(registration.membership.first_name.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership last name textbox exists$/ do
  expect(registration.membership.last_name.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership company textbox exists$/ do
  expect(registration.membership.company.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership address textbox exists$/ do
  expect(registration.membership.address.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership city textbox exists$/ do
  expect(registration.membership.city.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership state dropdown exists$/ do
  expect(registration.membership.city.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership zip textbox exists$/ do
  expect(registration.membership.zip.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership phone textbox exists$/ do
  expect(registration.membership.phone.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership stamps logo exists$/ do
  expect(registration.membership.stamps_logo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership usps logo exists$/ do
  expect(registration.membership.usps_logo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership paragraph to contain (.*)$/ do |str|
  expect(registration.membership.paragraph).to eql(str)
end

Then /^[Ee]xpect WebReg Membership cardholders name textbox exists$/ do
  expect(registration.membership.cardholders_name.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership credit card number textbox exists$/ do
  expect(registration.membership.credit_card_number.present?). to be (true)
end

Then /^[Ee]xpect WebReg Membership month dropdown exists$/ do
  expect(registration.membership.month_dropdown.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership year dropdown exists$/ do
  expect(registration.membership.month_dropdown.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership Billing address same as mailing address checkbox exists$/ do
  expect(registration.membership.billingaddress_sameas_mailing address.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership I agree to the Terms and conditions and Pricing details checkbox exists$/ do
  expect(registration.membership.pricingandTnC.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership back button exists$/ do
  expect(registration.membership.back_button.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership submit button exists$/ do
  expect(registration.membership.submit_button.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership why do you need my mailing information to contain: (.*)$/ do |str|
  expect(registration.membership.why_do_you_need_mailingaddress).to eql(str)
end

Then /^[Ee]xpect WebReg Membership Can I use my Stamps.com account outside my office to contain: (.*)$/ do |str|
  expect(registration.membership.can_I_use_stamps_outside_office).to eql(str)
end

Then /^[Ee]xpect WebReg Membership Is my credit card information safe to contain: (.*)$/ do |str|
  expect(registration.membership.is_my_cc_info_safe).to eql(str)
end

Then /^[Ee]xpect WebReg Membership Pricing and billing details to contain: (.*)$/ do |str|
  expect(registration.membership.pricingnbilling).to eql(str)
end

Then /^[Ee]xpect WebReg Membership Cancel anytime to contain: (.*)$/ do |str|
  expect(registration.membership.membership_cancel_anytime).to eql(str)
end

Then /^[Ee]xpect WebReg Membership Cancel anytime to contain: (.*)$/ do |str|
  expect(registration.membership.membership_cancel_anytime).to eql(str)
end

Then /^[Ee]xpect WebReg Membership Bonus Offer Details link exists$/ do
  expect(registration.membership.offer_details_link.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership Privacy Policy link exists$/ do
  expect(registration.membership.privacy_policy_link.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership Privacy Policy link exists$/ do
  expect(registration.membership.privacy_policy_link.present?).to be (true)
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
