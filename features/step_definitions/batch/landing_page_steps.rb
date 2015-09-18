Given /^I launch browser (\w+)$/ do |browser|
  @browser = Stamps.setup(browser)
end

Given /^I launch default browser$/ do
  @browser = Stamps.setup
end

Given /^I visit url for (\w+)$/ do |url_prefix|
  batch.visit url_prefix
end

Given /^I visit default url$/ do
  batch.visit
end

Given /^I am signed in as a batch shipper$/ do
  step "I launch default browser"
  step "I visit default url"
  batch.sign_in
end

Given /^I am signed in as a batch shipper (.*)\/(.*)/ do |username, password|
  step "I launch default browser"
  step "I visit default url"
  batch.sign_in username, password
end

Given /^I am signed in as a batch shipper (.*)/ do |browser|
  step "I launch browser #{browser}"
  step "I visit default url"
  batch.sign_in
end

Given /^I am signed in as a batch shipper (.*)\/(.*)\/(.*)/ do |browser, username, password|
  step "I launch browser #{browser}"
  step "I visit default url"
  batch.sign_in username, password
end

Given /^I am signed in as a batch shipper (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  step "I launch browser #{browser}"
  step "I visit url for #{url}"
  batch.sign_in username, password
end

Then /^Sign out$/ do
  #batch.navigation_bar.sign_out
end
