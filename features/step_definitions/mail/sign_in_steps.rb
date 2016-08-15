Given /^I visit postage sign-in page$/ do
  #step "I launched the default browser"
  logger.info "I visit mail sign-in page"
  web_apps.visit :print_postage
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


