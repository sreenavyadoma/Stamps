Then /^navigate to WebReg page$/ do
  webreg.load_page
end

Then /^verify Stamps logo exists in navigation bar$/ do
   registration.profile_ui_stampslogo
end

Then /^verify USPS logo exists on navigation bar$/
  registration.profile_ui_uspslogo
end

Then /^verify progress bar exists on the page$/
  registration.profile_ui_progressbar
end

Then/^verify header on the Page$/
  registration.profile_ui_header
end

Then/^verify email textbox exists on the page$/
  registration.profile_ui_email
end

Then /^verify username textbox exists on the page$/
  registration.profile_ui_username
end

Then /^verify PASSWORD textbox exists on the page$/
  registration.profile_ui_password
end

Then/^verify RE-TYPE PASSWORD exists on the page$/
  registration.profile_ui_retypepassword
end

Then/^verify values in dropdown HOW WILL YOU USE STAMPS\.COM$/
   registration.profile_dropdown
end

Then/^verify PROMO CODE field textbox exists on the page$/
  registration.profile_ui_promocodefield
end

Then/^verify CONTINUE button exists on the page$/
  registration.profile_continuebutton
end

Then/^verify content under Why do I need to create an account? exists on the page$/
    registration.profile_content_createanaccount
end

Then/^verify content under Money-saving offers and new products$/
  registration.profile_content_moneysavingoffers
end

Then/^verify Money-saving offers and new products checkbox is checkmarked on the page$/
  registration.profile_moneysavingoffers_checkbox
end

Then/verify Privacy Policy link exists on the page and is clickable$/
  registration.profile_privacypolicylink
end

Then/^verify copyright link exists on the page and is clickable$/
  registration.profile_copyrightlink
end

Then/^verify Norton logo exists on the page$/
  registration.profile_nortonlogo
end

Then/^verify TRUSTe logo exists on the page$/
  registration.profile_trustelogo
end

Then/^verify LIVE chat button exists on the page$/
  registration.profile_livechatbutton
end





