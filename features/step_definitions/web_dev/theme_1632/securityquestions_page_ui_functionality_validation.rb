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







