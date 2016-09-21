
Then /^Mail Sign In: Set Remember Username to Checked$/ do
  logger.info "Step: Mail Sign In: Set Remember Username to Checked"
  $remember_username_status="checked"
  web_apps.mail.landing_page.sign_in
end

Then /^Mail Sign In: Check Remember Username$/ do
  logger.info "Step: Mail Sign In: Check Remember Username #{ENV["USR"]}"
  step "Visit Mail sign in page"
  web_apps.mail.landing_page.sign_in_username_check ENV["USR"]
end

Then /^Mail Sign In: Expect Remember Username is checked$/ do
  logger.info "Mail Sign In: Expect Remember Username is checked"
  logger.info "Remembered username status is #{$remember_username_status}"
  expectation = "checked"
  is_checked = $remember_username_status
  if is_checked
    actual_value = "checked"
  else
    actual_value = "unchecked"
  end
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Mail Sign In: Set Remember Username to Unchecked$/ do
  logger.info "Step: Mail Sign In: Set Remember Username to Unchecked"
  $remember_username_status="unchecked"
  web_apps.mail.landing_page.sign_in
end

Then /^Mail Sign In: Expect Remember Username is unchecked$/ do
  logger.info "Postage Sign In: Expect Remember Username is unchecked"
  logger.info "Remembered username status is #{$remember_username_status}"
  expectation = "unchecked"
  is_unchecked = $remember_username_status
  if is_unchecked
    actual_value = "unchecked"
  else
    actual_value = "checked"
  end
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Mail Sign In: Expect WhatsNewModal to be present$/ do
  logger.info "Sign In: Expect Welcome modal"
  @whats_new.present?

  @whats_new.present?.should be true

  #logger.info "Welcome message status is #{$welcome_message}"
  #expectation = true
  #actual_value = $welcome_message
  #expectation.should eql actual_value
end

Then /^Mail Sign In: Close WhatsNewModal$/ do
  @whats_new.close
end

Then /^Mail Sign In: Continue WhatsNewModal$/ do
  @whats_new.continue
end

