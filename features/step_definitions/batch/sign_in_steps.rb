Given /^I visit batch sign-in page (\w+)$/ do |url_prefix|
  log.info "Step: I visit batch sign-in page #{url_prefix}"
  batch.sign_in_page.visit url_prefix
end

Given /^I visit batch sign-in page$/ do
  log.info "Step: I visit batch sign-in page"
  batch.sign_in_page.visit
end

Given /^I am signed in as a batch shipper$/ do
  log.info "Step: I am signed in as a batch shipper"
  step "I launch default browser"
  step "I visit batch sign-in page"
  batch.sign_in_page.sign_in_with_credentials
end

Given /^I am signed in as batch shipper (.*)\/(.*)/ do |username, password|
  log.info "Step: I am signed in as batch shipper #{username}/#{password}"
  step "I launch default browser"
  step "I visit batch sign-in page"
  batch.sign_in_page.sign_in_with_credentials username, password
end

Given /^I am signed in as batch shipper (.*)/ do |browser|
  log.info "Step: I am signed in as batch shipper #{browser}"
  step "I launch browser #{browser}"
  step "I visit batch sign-in page"
  batch.sign_in_page.sign_in_with_credentials
end

Given /^I am signed in as batch shipper (.*)\/(.*)\/(.*)/ do |browser, username, password|
  log.info "Step: I am signed in as batch shipper #{browser}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "I visit batch sign-in page"
  batch.sign_in_page.sign_in_with_credentials username, password
end

Given /^I am signed in as batch shipper (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  log.info "Step: I am signed in as batch shipper #{browser}/#{url}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "I visit batch sign-in page #{url}"
  batch.sign_in_page.sign_in_with_credentials username, password
end

Then /^Sign out$/ do
  log.info "Step: Sign out"
  #batch.navigation.sign_out
end
