Given /^I visit postage sign-in page$/ do
  #step "I launch browser default"
  log.info "Step: I visit print sign-in page"
  postage.sign_in.visit :print_postage
end

Given /^I am signed in as a postage shipper$/ do
  log.info "Step: I am signed in as a print shipper"
  step "I launch browser default"
  step "I visit postage sign-in page"
  postage.sign_in.sign_in
end

Given /^I am signed in as postage shipper (.*)\/(.*)/ do |username, password|
  log.info "Step: I am signed in as print shipper #{username}/#{password}"
  step "I launch browser default"
  step "I visit postage sign-in page"
  postage.sign_in.sign_in username, password
end

Given /^I am signed in as postage shipper (.*)/ do |browser|
  log.info "Step: I am signed in as print shipper #{browser}"
  step "I launch browser #{browser}"
  step "I visit postage sign-in page"
  postage.sign_in.sign_in
end

Given /^I am signed in as postage shipper (.*)\/(.*)\/(.*)/ do |browser, username, password|
  log.info "Step: I am signed in as print shipper #{browser}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "I visit postage sign-in page"
  postage.sign_in.sign_in username, password
end

Given /^I am signed in as postage shipper (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  log.info "Step: I am signed in as print shipper #{browser}/#{url}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "I visit print #{url}"
  postage.sign_in.sign_in username, password
end

Then /^Expect Invalid Message to be "Your username or password is invalid." for (.*)\/(.*)/ do |username, password|
  log.info "Step: Expect Invalid Message"
  step "I visit postage sign-in page"
  postage.sign_in.sign_in username, password
  invalid_username_password = $invalid_message
  log.info "Expect Invalid Message to be: #{invalid_username_password}"
end


