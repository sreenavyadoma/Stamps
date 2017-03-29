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

Then /^[Vv]erify bread crumb exist (.*)$/ do |str|
  expect(registration.bread_crumbs).to include(str), "Bread crumb #{str} does not exist "
end

Then /^[Vv]erify Profile page header is (.*)$/ do |str|
  expect(registration.profile.header).to eql(str), "Profile page header is not #{str}"
end

Then /^[Vv]erify Email textbox exists on profile page$/ do
  expect(registration.profile.email.present?).to be(true), "Email textbox does not exists on profile page"
end

Then /^[Vv]erify username textbox exists on the page$/ do
  expect(registration.profile_ui_username.present?).to be (true)
end

Then /^[Vv]erify PASSWORD textbox exists on the page$/ do
  expect(registration.profile_ui_password.present?).to be (true)
end

Then /^[Vv]erify RE-TYPE PASSWORD exists on the page$/ do
  registration.profile_ui_retypepassword
end

Then /^[Hh]ow will you use Stamps.com drop-down includes (.*)$/ do |str|

end

Then /^[Vv]erify values in dropdown HOW WILL YOU USE STAMPS\.COM$/ do
   registration.profile_dropdown
end

Then /^[Vv]erify PROMO CODE field textbox exists on the page$/ do
  registration.profile_ui_promocodefield
end

Then /^[Vv]erify CONTINUE button exists on the page$/ do
  registration.profile_continuebutton
end

Then /^[Vv]erify content under Why do I need to create an account? exists on the page$/ do
    registration.profile_content_createanaccount
end

Then /^[Vv]erify content under Money-saving offers and new products$/ do
  registration.profile_content_moneysavingoffers
end

Then /^[Vv]erify Money-saving offers and new products checkbox is checkmarked on the page$/ do
  registration.profile_moneysavingoffers_checkbox
end

Then /^[Vv]erify Privacy Policy link exists on the page and is clickable$/ do
  registration.profile_privacypolicylink
end

Then /^[Vv]erify copyright link exists on the page and is clickable$/ do
  registration.profile_copyrightlink
end

Then /^[Vv]erify Norton logo exists on the page$/ do
  registration.profile_nortonlogo
end

Then /^[Vv]erify TRUSTe logo exists on the page$/ do
  registration.profile_trustelogo
end

Then /^[Vv]erify LIVE chat button exists on the page$/ do
  registration.profile_livechatbutton
end


