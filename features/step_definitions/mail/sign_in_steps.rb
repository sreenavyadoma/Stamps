
Then /^Mail Sign In: Set Remember Username to Checked$/ do
  logger.info "Step: Mail Sign In: Set Remember Username to Checked"
  #todo-fix username
  fix me!
  web_apps.mail.sign_in_modal.remember_username.check
end

Then /^Mail Sign In: Check Remember Username$/ do
  logger.info "Step: Mail Sign In: Check Remember Username #{ENV["USR"]}"
  step "Visit Mail sign in page"
  #todo-fix username
  fix me!
  web_apps.mail.sign_in_modal.sign_in_username_check ENV["USR"]
end

Then /^Mail Sign In: Expect Remember Username is checked$/ do
  logger.info "Mail Sign In: Expect Remember Username is checked"
  fix me!
  #todo-fix username
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Mail Sign In: Set Remember Username to Unchecked$/ do
  logger.info "Step: Mail Sign In: Set Remember Username to Unchecked"
  fix me!
  #todo-fix username
  web_apps.mail.sign_in_modal.sign_in
end

Then /^Mail Sign In: Expect Remember Username is unchecked$/ do
  logger.info "Postage Sign In: Expect Remember Username is unchecked"
  fix me
  #todo-fix username
  logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
  actual_value.should eql expectation
end

Then /^Mail Sign In: Expect WhatsNewModal to be present$/ do
  logger.info "Sign In: Expect Welcome modal"

  @whats_new.present?.should be true
end

Then /^Mail Sign In: Close WhatsNewModal$/ do
  @whats_new.close
end

Then /^Mail Sign In: Continue WhatsNewModal$/ do
  @whats_new.continue
end

