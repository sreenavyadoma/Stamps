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

Then /^[Oo]n WebReg Profile page, continue to Membership page$/ do
  registration.profile.continue_button
end

Then /^[Ss]et WebReg Membership first name text box to (.*)$/ do |firstname|
  registration.membership.first_name.set firstname
end

Then /^[Ss]et WebReg Membership last name text box to (.*)$/ do |lastname|
  registration.membership.last_name.set lastname
end

Then /^[Ss]et WebReg Membership company text box to (.*)$/ do |company|
  registration.membership.company.set company
end

Then /^[Ss]et WebReg Membership address text box to (.*)$/ do |address|
  registration.membership.address.set address
end

Then /^[Ss]et WebReg Membership city text box to (.*)$/ do |city|
  registration.membership.city.set city
end

Then /^[Ss]et WebReg Membership state text box to (.*)$/ do |state|
  registration.membership.state.set state
end

Then /^[Ss]et WebReg Membership zip text box to (.*)$/ do |zip|
  registration.membership.zip.set zip
end

Then /^[Ss]et WebReg Membership phone text box to (.*)$/ do |phone|
  registration.membership.phone.set phone
end

Then /^[Ss]et WebReg Membership cardholders name textbox to (.*)$/ do |cardholdersname|
  registration.membership.cardholders_name.set cardholdersname
end

Then /^[Ss]et WebReg Membership credit card number textbox to (.*)$/ do |creditcardnumber|
  registration.membership.credit_card_number.set creditcardnumber
end

Then /^[Ss]et WebReg Membership month dropdown to (.*)$/ do |month|
  registration.membership.month.set month
end

Then /^[Ss]et WebReg Membership year to (.*)$/ do |year|
  registration.membership.year.set year
end

Then /^[Ss]et set WebReg Membership billing address same as mailing address$/ do
  registration.membership.billingadd_same_as_mailingadd
end

Then /^[Ss]et WebReg Membership terms and condition$/ do
  registration.membership.termsnconditions
end

Then /^[Oo]n WebReg Membership page continue to Choose Supplies page$/ do
  registration.membership.submit_button
end

Then /^[Oo]n WebReg ATG page continue to WebReg Security questions page$/ do
  registration.membership.atg_placeorderbutton
end

Then /^[Ee]xpect WebReg navigation bar Stamps logo exists$/ do
  expect(registration.navigation.stamps_logo.present?).to be (true)
end

Then /^[Ee]xpect WebReg navigation bar USPS logo exists$/ do
  expect(registration.navigation.usps_logo.present?).to be (true)
end



Then /^[Ee]xpect WebReg Membership header contain (.*)$/ do |str|
  expect(registration.membership.header).to eql(str)
end




