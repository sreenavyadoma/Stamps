Given /^I launch browser (\w+)$/ do |browser|
  log.info "Step: I launch browser #{browser}"
  @browser = Stamps::Test.setup browser
end

Given /^I launch default browser$/ do
  log.info "Step: I launch default browser"
  @browser = Stamps::Test.setup
end

Given /^I visit url for (\w+)$/ do |url_prefix|
  log.info "Step: I visit url for #{url_prefix}"
  batch.sign_in_page.visit url_prefix
end

Given /^I visit default url$/ do
  log.info "Step: I visit default url"
  batch.sign_in_page.visit
end

Given /^I am signed in as a batch shipper$/ do
  log.info "Step: I am signed in as a batch shipper"
  step "I launch default browser"
  step "I visit default url"
  batch.sign_in_page.sign_in
end

Given /^I am signed in as a batch shipper (.*)\/(.*)/ do |username, password|
  log.info "Step: I am signed in as a batch shipper #{username}/#{password}"
  step "I launch default browser"
  step "I visit default url"
  batch.sign_in_page.sign_in username, password
end

Given /^I am signed in as a batch shipper (.*)/ do |browser|
  log.info "Step: I am signed in as a batch shipper #{broswer}"
  step "I launch browser #{browser}"
  step "I visit default url"
  batch.sign_in_page.sign_in
end

Given /^I am signed in as a batch shipper (.*)\/(.*)\/(.*)/ do |browser, username, password|
  log.info "Step: I am signed in as a batch shipper #{browser}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "I visit default url"
  batch.sign_in_page.sign_in username, password
end

Given /^I am signed in as a batch shipper (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  log.info "Step: I am signed in as a batch shipper #{browser}/#{url}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "I visit url for #{url}"
  batch.sign_in_page.sign_in username, password
end

Then /^Sign out$/ do
  log.info "Step: Sign out"
  #batch.navigation.sign_out
end
