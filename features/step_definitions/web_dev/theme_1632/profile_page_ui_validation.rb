Then /^navigate to WebReg page$/ do
  webreg.load_page
end

Then /^[Vv]erify Stamps logo exists in navigation bar$/ do
   expect(registration.navigation.stamps_logo.present?).to be(true)
end

Then /^verify USPS logo exists on navigation bar$/ do
  expect(registration.navigation.usps_logo.present?).to be(true)
end

Then /^verify progress bar exists on the page$/ do
  registration.profile_ui_progressbar
end

Then /^[Vv]erify bread crumb exist (.*)$/ do |str|
  expect(registration.bread_crumbs).to include(str), "Bread crumb #{str} does not exist "
end

Then /^[Vv]erify Profile page header is (.*)$/ do |str|
  expect(registration.profile.header).to eql(str), "Profile page header is not #{str}"
end

Then /^verify Email textbox exists on profile page$/ do
  expect(registration.profile.email.present?).to be(true), "Email textbox does not exists on profile page"
end

Then /^verify username textbox exists on the page$/ do
  registration.profile_ui_username
end

Then /^verify PASSWORD textbox exists on the page$/ do
  registration.profile_ui_password
end

Then /^verify RE-TYPE PASSWORD exists on the page$/ do
  registration.profile_ui_retypepassword
end

Then /^How will you use Stamps.com drop-down includes (.*)$/ do |str|

end

Then /^verify values in dropdown HOW WILL YOU USE STAMPS\.COM$/ do
   registration.profile_dropdown
end

Then /^verify PROMO CODE field textbox exists on the page$/ do
  registration.profile_ui_promocodefield
end

Then /^verify CONTINUE button exists on the page$/ do
  registration.profile_continuebutton
end

Then /^verify content under Why do I need to create an account? exists on the page$/ do
    registration.profile_content_createanaccount
end

Then /^verify content under Money-saving offers and new products$/ do
  registration.profile_content_moneysavingoffers
end

Then /^verify Money-saving offers and new products checkbox is checkmarked on the page$/ do
  registration.profile_moneysavingoffers_checkbox
end

Then /^verify Privacy Policy link exists on the page and is clickable$/ do
  registration.profile_privacypolicylink
end

Then /^verify copyright link exists on the page and is clickable$/ do
  registration.profile_copyrightlink
end

Then /^verify Norton logo exists on the page$/ do
  registration.profile_nortonlogo
end

Then /^verify TRUSTe logo exists on the page$/ do
  registration.profile_trustelogo
end

Then /^verify LIVE chat button exists on the page$/ do
  registration.profile_livechatbutton
end


