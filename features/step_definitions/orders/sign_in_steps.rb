Given /^I visit Orders sign-in page (\w+)$/ do |url_prefix|
  log.info "Step: I visit Orders sign-in page #{url_prefix}"
  orders.sign_in_page.visit url_prefix
end

Given /^I visit Orders sign-in page$/ do
  log.info "Step: I visit Orders sign-in page"
  orders.sign_in_page.visit
end


Given /^I sign-in to Orders as (.*)\/(.*)/ do |username, password|
  log.info "Step: I am signed in to Orders as #{username}/#{password}"
  step "I launch default browser"
  step "I visit Orders sign-in page"
  orders.sign_in_page.sign_in_with_credentials username, password
end

Given /^I am signed in to Orders$/ do
  log.info "Step: I am signed in to Orders"
  step "I launch default browser"
  step "I visit Orders sign-in page"
  orders.sign_in_page.sign_in_with_credentials
end

Given /^I am signed in to Orders as (.*)\/(.*)/ do |username, password|
  log.info "Step: I am signed in to Orders as #{username}/#{password}"
  step "I launch default browser"
  step "I visit Orders sign-in page"
  orders.sign_in_page.sign_in_with_credentials username, password
end

Given /^I am signed in to Orders using (.*)/ do |browser|
  log.info "Step: I am signed in to Orders as #{browser}"
  step "I launch browser #{browser}"
  step "I visit Orders sign-in page"
  orders.sign_in_page.sign_in_with_credentials
end

Given /^I am signed in to Orders as (.*)\/(.*)\/(.*)/ do |browser, username, password|
  log.info "Step: I am signed in to Orders as #{browser}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "I visit Orders sign-in page"
  orders.sign_in_page.sign_in_with_credentials username, password
end

Given /^I am signed in to Orders as (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  log.info "Step: I am signed in to Orders as #{browser}/#{url}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "I visit Orders sign-in page #{url}"
  orders.sign_in_page.sign_in_with_credentials username, password
end

Then /^Sign out$/ do
  log.info "Step: Sign out"
  orders.navigation_bar.username.sign_out
end
