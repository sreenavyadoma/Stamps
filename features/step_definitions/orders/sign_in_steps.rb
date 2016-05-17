Given /^Orders: Load Sign-in page$/ do
  log.info "Orders: Load Sign-in page"
  orders.sign_in.visit :orders
end

Given /^Orders: First Time Sign-in to Orders as (.*)\/(.*)/ do |username, password|
  if username.downcase.include? "random"
    usr = @username
  else
    usr = username
    @username = username
  end
  log.info "I am signed in to Orders as #{usr}/#{password}"
  orders.sign_in.first_time_sign_in usr, password
end

Given /^Orders: Sign-in to Orders as (.*)\/(.*)/ do |username, password|
  usr = @username if username.downcase.include? "random"
  log.info "I am signed in to Orders as #{usr}/#{password}"
  orders.sign_in.sign_in usr, password
end

Given /^I sign-in to Orders as (.*)\/(.*)/ do |username, password|
  log.info "I am signed in to Orders as #{username}/#{password}"
  step "I launch browser default"
  step "Health Check: Verify Server Health"
  step "Orders: Load Sign-in page"
  orders.sign_in.sign_in username, password
end

Given /^I am signed in to Orders$/ do
  log.info "I am signed in to Orders"
  step "I launch browser default"
  step "Health Check: Verify Server Health" if test_helper.to_boolean ENV['HEALTHCHECK']
  step "Orders: Load Sign-in page"
  orders.sign_in.sign_in
  step "Navigation Bar: Customer Balance"
end

Given /^I am signed in to Orders as (.*)\/(.*)/ do |username, password|
  log.info "I am signed in to Orders as #{username}/#{password}"
  step "I launch browser default"
  step "Health Check: Verify Server Health"
  step "Orders: Load Sign-in page"
  orders.sign_in.sign_in username, password
end

Given /^I am signed in to Orders using (.*)/ do |browser|
  log.info "I am signed in to Orders as #{browser}"
  step "I launch browser #{browser}"
  step "Health Check: Verify Server Health"
  step "Orders: Load Sign-in page"
  orders.sign_in.sign_in
end

Given /^I am signed in to Orders as (.*)\/(.*)\/(.*)/ do |browser, username, password|
  log.info "I am signed in to Orders as #{browser}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "Health Check: Verify Server Health"
  step "Orders: Load Sign-in page"
  orders.sign_in.sign_in username, password
end

Given /^I am signed in to Orders as (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  log.info "I am signed in to Orders as #{browser}/#{url}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "Health Check: Verify Server Health"
  step "Orders: Load Sign-in page #{url}"
  orders.sign_in.sign_in username, password
end

Then /^Sign out$/ do
  step "Navigation Bar: Customer Balance"
  log.info "Sign out"
  orders.navigation_bar.username.sign_out
end
