Given /^I visit postage sign-in page$/ do
  #step "I launched the default browser"
  logger.info "I visit postage sign-in page"
  web_apps.param.app = :mail
  web_apps.visit :print_postage
end

Given /^Mail: New User Sign-in as (.*)\/(.*)/ do |username, password|
  if username.downcase.include? "random"
    usr = @username
  else
    usr = username
    @username = username
  end
  logger.info "I am signed in to Mail as #{usr}/#{password}"
  @whats_new = mail.landing_page.first_time_sign_in usr, password
end

Given /^I visit mail default sign-in page$/ do
  #step "I launched the default browser"
  logger.info "I visit mail default sign-in page"
  web_apps_default.visit :print_postage
end

Given /^I am signed in as a postage shipper$/ do
  logger.info "I am signed in as a mail shipper"
  step "I launched the default browser"
  step "I visit postage sign-in page"
  web_apps.mail.landing_page.sign_in
end

Given /^I am signed in as postage shipper (.*)\/(.*)/ do |username, password|
  logger.info "I am signed in as mail shipper #{username}/#{password}"
  step "I launched the default browser"
  step "I visit postage sign-in page"
  web_apps.mail.landing_page.sign_in username, password
end

Given /^I am signed in as postage shipper (.*)/ do |browser|
  logger.info "I am signed in as mail shipper #{browser}"
  step "I launched the default browser #{browser}"
  step "I visit postage sign-in page"
  web_apps.mail.landing_page.sign_in
end

Given /^I am signed in as postage shipper (.*)\/(.*)\/(.*)/ do |browser, username, password|
  logger.info "I am signed in as mail shipper #{browser}/#{username}/#{password}"
  step "I launched the default browser #{browser}"
  step "I visit postage sign-in page"
  web_apps.mail.landing_page.sign_in username, password
end

Given /^I am signed in as postage shipper (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  logger.info "I am signed in as mail shipper #{browser}/#{url}/#{username}/#{password}"
  step "I launched the default browser #{browser}"
  step "I visit mail #{url}"
  web_apps.mail.landing_page.sign_in username, password
end

Then /^Expect Invalid Message to be "Your username or password is invalid." for (.*)\/(.*)/ do |username, password|
  logger.info "Expect Invalid Message"
  step "I visit postage sign-in page"
  web_apps.mail.landing_page.sign_in username, password
  invalid_username_password = $invalid_message
  logger.info "Expect Invalid Message to be: #{invalid_username_password}"
end

Then /^Mail Sign In: Set Remember Username to Checked$/ do
  logger.info "Step: Mail Sign In: Set Remember Username to Checked"
  $remember_username_status="checked"
  web_apps.mail.landing_page.sign_in
end

Then /^Mail Sign In: Check Remember Username$/ do
  logger.info "Step: Mail Sign In: Check Remember Username #{ENV["USR"]}"
  step "I visit postage sign-in page"
  web_apps.mail.landing_page.sign_in_menu ENV["USR"]
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

Then /^Postage Sign In: Expect Remember Username is unchecked$/ do
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

Then /^Postage Sign In: Expect WhatsNewModal to be present$/ do
  logger.info "Sign In: Expect Welcome modal"
  @whats_new.present?

  @whats_new.present?.should be true

  #logger.info "Welcome message status is #{$welcome_message}"
  #expectation = true
  #actual_value = $welcome_message
  #expectation.should eql actual_value
end

Then /^Postage Sign In: Close WhatsNewModal$/ do
  @whats_new.close
end

Then /^Postage Sign In: Continue WhatsNewModal$/ do
  @whats_new.continue
end

