Given /^Visit Mail sign in page$/ do
  logger.info "I visit mail sign-in page"
  web_apps.param.app = :mail
  web_apps.visit :print_postage
end

Given /^I am signed in as Mail shipper$/ do
  logger.info "I am signed in as a mail shipper"
  step "Launch default browser"
  step "Visit Mail sign in page"
  web_apps.mail.landing_page.sign_in
end

Given /^I am signed in as Mail shipper (.*)\/(.*)/ do |username, password|
  logger.info "I am signed in as mail shipper #{username}/#{password}"
  step "I launched default browser"
  step "Visit Mail sign in page"
  web_apps.mail.landing_page.sign_in username, password
end

Then /^I am signed in as Mail shipper for the first time(?:| with credentials (.*)\/(.*))$/ do |username, password|
  logger.info "I am signed in as Mail shipper for the first time #{username}/#{password}"
  logger.info "I am signed in as Mail shipper for the first time #{@username}/#{@password}"
  @username = username unless username.nil?
  @password = password unless password.nil?
  logger.info "I am signed in as Mail shipper for the first time #{@username}/#{@password}"
  @whats_new_modal = web_apps.mail.landing_page.sign_in_first_time username, password
end

Then /^What's New: Expect modal to be present$/ do
  expectation = "What's new modal is present"
  expectation = "What's new modal is NOT present" unless web_apps.mail.landing_page.sign_in_modal.whats_new_modal.present?
  expectation.should eql "What's new modal is present"
end

Then /^What's New: Click Continue button$/ do
  web_apps.mail.landing_page.sign_in_modal.whats_new_modal.continue
end

Then /^What's new: Click More Info$/ do
  @more_info_page = web_apps.mail.landing_page.sign_in_modal.whats_new_modal.more_info
end

Then /^More Info: Expect More Info page is present$/ do
  logger.info "More Info: Expect More Info page is present"
  expectation = "A second browser window was opened"
  expectation = "A second browser window did not open." unless @more_info_page.present?
  expectation.should eql "A second browser window was opened"
end

Then /^More Info: Close More Info page$/ do
  logger.info "More Info: Close More Info page"
  logger.info @more_info_page.title
  logger.info @more_info_page.title
  logger.info @more_info_page.title
  logger.info @more_info_page.title
  logger.info @more_info_page.title
  sleep 2
  @more_info_page.close
  sleep 3
end

=begin


Given /^I am signed in as Mail shipper (.*)/ do |browser|
  logger.info "I am signed in as mail shipper #{browser}"
  step "I launch browser #{browser}"
  step "Visit Mail sign in page"
  web_apps.mail.landing_page.sign_in
end

Given /^I am signed in as Mail shipper (.*)\/(.*)\/(.*)/ do |browser, username, password|
  logger.info "I am signed in as mail shipper #{browser}/#{username}/#{password}"
  step "I launched default browser #{browser}"
  step "Visit Mail sign in page"
  web_apps.mail.landing_page.sign_in username, password
end

Given /^I am signed in as Mail shipper (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  logger.info "I am signed in as mail shipper #{browser}/#{url}/#{username}/#{password}"
  step "I launched default browser #{browser}"
  step "I visit mail #{url}"
  web_apps.mail.landing_page.sign_in username, password
end

Then /^Expect Invalid Message to be "Your username or password is invalid." for (.*)\/(.*)/ do |username, password|
  logger.info "Expect Invalid Message"
  step "Visit Mail sign in page"
  web_apps.mail.landing_page.sign_in username, password
  invalid_username_password = $invalid_message
  logger.info "Expect Invalid Message to be: #{invalid_username_password}"
end



=end