

Then /^What's New: Expect modal is present$/ do
  expect(stamps.mail.sign_in_modal.whats_new_modal.window_title.text).to eql "What’s new in Stamps.com Online"
end

Then /^What's New: Click Continue button$/ do
  stamps.mail.sign_in_modal.whats_new_modal.continue
end

Then /^What's new: Click More Info$/ do
  @more_info_page = stamps.mail.sign_in_modal.whats_new_modal.more_info
end

Then /^More Info: Expect More Info page is present$/ do
  #config.logger.step "More Info: Expect More Info page is present"
  expectation = "A second browser window was opened"
  expectation = "A second browser window did not open." unless @more_info_page.present?
  expect(expectation).to eql "A second browser window was opened"
end

Then /^More Info: Close More Info page$/ do
  #config.logger.step "More Info: Close More Info page"
  config.logger.step @more_info_page.title
  config.logger.step @more_info_page.title
  config.logger.step @more_info_page.title
  config.logger.step @more_info_page.title
  config.logger.step @more_info_page.title
  sleep(2)
  @more_info_page.close
  sleep(3)
end

Then /^Mail Sign In: Set Remember Username to Checked$/ do
  #todo-fix username
  fix me!
  stamps.mail.sign_in_modal.remember_username.check
end

Then /^Mail Sign In: Check Remember Username$/ do
  step "load Web Apps Sign-in page"
  #todo-fix username
  fix me!
  stamps.mail.sign_in_modal.sign_in_username_check ENV["USR"]
end

Then /^Mail Sign In: Expect Remember Username is checked$/ do
  fix me!
  #todo-fix username
  expect(actual_value).to eql expectation
end

Then /^Mail Sign In: Set Remember Username to Unchecked$/ do
  fix me!
  #todo-fix username
  stamps.mail.sign_in_modal.sign_in
end

Then /^Mail Sign In: Expect Remember Username is unchecked$/ do
  fix me
  #todo-fix username
  expect(actual_value).to eql expectation
end

Then /^Mail Sign In: Expect WhatsNewModal is present$/ do
  expect(@whats_new.present?).to be(true)
end

Then /^Mail Sign In: Close WhatsNewModal$/ do
  @whats_new.close
end

Then /^Mail Sign In: Continue WhatsNewModal$/ do
  @whats_new.continue
end

