Then /^[Nn]avigate to WebReg page$/ do
  webreg.load_page
end

Then /^[Vv]erify Stamps logo exists in navigation bar$/ do
   expect(registration.navigation.stamps_logo.present?).to be(true)
end

Then /^[Vv]erify USPS logo exists on navigation bar$/ do
  expect(registration.navigation.usps_logo.present?).to be(true)
end

#begin
Then /^[Vv]erify progress bar exists on the page$/ do
  registration.profile_ui_progressbar
end
#end

Then /^[Vv]erify bread crumb should contain (.*)$/ do |str|
  expect(registration.bread_crumbs).to include("Profile","Membership","Choose Supplies"), "Bread crumb #{str} does not exist "
end

Then /^[Vv]erify Profile page header is (.*)$/ do |str|
  expect(registration.profile.header).to eql(str), "Profile page header is not #{str}"
end

Then /^[Vv]erify Email textbox exists on profile page$/ do
  expect(registration.profile.email.present?).to be(true), "Email textbox does not exists on profile page"
end

Then /^[Vv]erify username textbox exists on the page$/ do
  expect(registration.profile.username.present?).to be (true), "Username textbox does not exist on profile page"
  registration.profile.username.set "myusername"
  registration.profile.username.text
  registration.profile.username.enabled?
  registration.profile.username.disabled?
  registration.profile.username.place_holder
  registration.profile.username.visible?
  registration.profile.username.data_qtip
end

Then /^[Vv]erify PASSWORD textbox exists on the page$/ do
  expect(registration.profile.password.present?).to be (true), "Password textbox does not exist on profile page"
end

Then /^[Vv]erify RE-TYPE PASSWORD exists on the page$/ do
  expect(registration.profile.retype_password.present?).to be (true), "Retype password textbox does not exist on profile page"
end

Then /^[Hh]ow will you use Stamps.com drop-down includes (.*)$/ do |str|
  expect(registration.profile.dropdown).to eql(str)
end

Then /^[Vv]erify PROMO CODE field textbox exists on the page$/ do
  expect(registration.profile.promocode.present?).to be (true)
end

  Then /^[Vv]erify CONTINUE button exists on the page$/ do
  expect(registration.profile_continue_button.present?).to be (true)
end

Then /^[Vv]erify content under Why do I need to create an account\? includes (.*)$/ do |str|
    expect(registration.profile_content_createanaccount).to eql(str)
end

Then /^[Vv]erify content under Money-saving offers and new products includes (.*)$/ do |str|
  excpect(registration.profile_content_money_saving_offers).to eql(str)
end

Then /^[Vv]erify Money-saving offers and new products checkbox is checkmarked on the page$/ do
  expect(registration.profile_moneysavingoffers_checkbox.present?).to be (true)
end

Then /^[Vv]erify Privacy Policy link exists on the page and is clickable$/ do
  expect(registration.profile_privacypolicylink.present?).to be (true)
end

Then /^[Vv]erify copyright link exists on the page and is clickable$/ do
  expect(registration.profile_copyrightlink.present?).to be (true)
end

Then /^[Vv]erify Norton logo exists on the page$/ do
  expect(registration.profile_nortonlogo.present?).to be (true)
end

Then /^[Vv]erify TRUSTe logo exists on the page$/ do
  expect(registration.profile_trustelogo.present?).to be (true)
end

Then /^[Vv]erify LIVE chat button exists on the page$/ do
  expect(registration.profile_livechatbutton.present?).to be (true)
end


