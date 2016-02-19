Given /^I visit postage sign-in page (\w+)$/ do |url_prefix|
  log.info "Step: I visit postage sign-in page #{url_prefix}"
  postage.sign_in_page.visit url_prefix
end

Given /^I visit postage sign-in page$/ do
  log.info "Step: I visit postage sign-in page"
  postage.sign_in_page.visit
end

Given /^I am signed in as a postage shipper$/ do
  log.info "Step: I am signed in as a postage shipper"
  step "I launch browser default"
  step "I visit postage sign-in page"
  postage.sign_in_page.sign_in_with_credentials
end

Given /^I am signed in as postage shipper (.*)\/(.*)/ do |username, password|
  log.info "Step: I am signed in as postage shipper #{username}/#{password}"
  step "I launch browser default"
  step "I visit postage sign-in page"
  postage.sign_in_page.sign_in_with_credentials username, password
end

Given /^I am signed in as postage shipper (.*)/ do |browser|
  log.info "Step: I am signed in as postage shipper #{broswer}"
  step "I launch browser #{browser}"
  step "I visit postage sign-in page"
  postage.sign_in_page.sign_in_with_credentials
end

Given /^I am signed in as postage shipper (.*)\/(.*)\/(.*)/ do |browser, username, password|
  log.info "Step: I am signed in as postage shipper #{browser}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "I visit postage sign-in page"
  postage.sign_in_page.sign_in_with_credentials username, password
end

Given /^I am signed in as postage shipper (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  log.info "Step: I am signed in as postage shipper #{browser}/#{url}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "I visit postage #{url}"
  postage.sign_in_page.sign_in_with_credentials username, password
end
