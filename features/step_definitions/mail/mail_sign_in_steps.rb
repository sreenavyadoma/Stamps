
Given /^Visit Mail sign in page$/ do
  logger.step "I visit mail sign-in page"
  stamps.web_app = :mail
  stamps.load_page
  browser.url.downcase.should include "webpostage"
end

Given /^I am signed in as Mail shipper$/ do
  logger.step "I am signed in as a mail shipper"
  step "Launch default browser"
  if ParameterHelper.to_bool ENV['HEALTHCHECK']
    step "Health Check: Print - Web Batch"
    step "Health Check: Print - Address Book"
  end
  step "Visit Mail sign in page"
  stamps.mail.sign_in_modal.sign_in
  step "Navigation Bar: Customer Balance"
end

Given /^I am signed in as Mail shipper (.*)\/(.*)/ do |username, password|
  logger.step "I am signed in as mail shipper #{username}/#{password}"
  step "I launched default browser"
  step "Visit Mail sign in page"
  stamps.mail.sign_in_modal.sign_in username, password
end

Then /^I am signed in as Mail shipper for the first time(?:| with credentials (.*)\/(.*))$/ do |username, password|
  logger.step "I am signed in as Mail shipper for the first time #{username}/#{password}"
  logger.step "I am signed in as Mail shipper for the first time #{@username}/#{@password}"
  @username = username unless username.nil?
  @password = password unless password.nil?
  logger.step "I am signed in as Mail shipper for the first time #{@username}/#{@password}"
  @whats_new_modal = stamps.mail.sign_in_modal.sign_in_first_time username, password
end

Then /^What's New: Expect modal is present$/ do
  stamps.mail.sign_in_modal.whats_new_modal.window_title.text.should eql "What’s new in Stamps.com Online"
end

Then /^What's New: Click Continue button$/ do
  stamps.mail.sign_in_modal.whats_new_modal.continue
end

Then /^What's new: Click More Info$/ do
  @more_info_page = stamps.mail.sign_in_modal.whats_new_modal.more_info
end

Then /^More Info: Expect More Info page is present$/ do
  logger.step "More Info: Expect More Info page is present"
  expectation = "A second browser window was opened"
  expectation = "A second browser window did not open." unless @more_info_page.present?
  expectation.should eql "A second browser window was opened"
end

Then /^More Info: Close More Info page$/ do
  logger.step "More Info: Close More Info page"
  logger.step @more_info_page.title
  logger.step @more_info_page.title
  logger.step @more_info_page.title
  logger.step @more_info_page.title
  logger.step @more_info_page.title
  sleep 2
  @more_info_page.close
  sleep 3
end

Then /^Mail Sign In: Set Remember Username to Checked$/ do
  logger.step "Step: Mail Sign In: Set Remember Username to Checked"
  #todo-fix username
  fix me!
  stamps.mail.sign_in_modal.remember_username.check
end

Then /^Mail Sign In: Check Remember Username$/ do
  logger.step "Step: Mail Sign In: Check Remember Username #{ENV["USR"]}"
  step "Visit Mail sign in page"
  #todo-fix username
  fix me!
  stamps.mail.sign_in_modal.sign_in_username_check ENV["USR"]
end

Then /^Mail Sign In: Expect Remember Username is checked$/ do
  logger.step "Mail Sign In: Expect Remember Username is checked"
  fix me!
  #todo-fix username
  actual_value.should eql expectation
end

Then /^Mail Sign In: Set Remember Username to Unchecked$/ do
  logger.step "Step: Mail Sign In: Set Remember Username to Unchecked"
  fix me!
  #todo-fix username
  stamps.mail.sign_in_modal.sign_in
end

Then /^Mail Sign In: Expect Remember Username is unchecked$/ do
  logger.step "Postage Sign In: Expect Remember Username is unchecked"
  fix me
  #todo-fix username
  actual_value.should eql expectation
end

Then /^Mail Sign In: Expect WhatsNewModal is present$/ do
  logger.step "Sign In: Expect Welcome modal"

  @whats_new.present?.should be true
end

Then /^Mail Sign In: Close WhatsNewModal$/ do
  @whats_new.close
end

Then /^Mail Sign In: Continue WhatsNewModal$/ do
  @whats_new.continue
end

