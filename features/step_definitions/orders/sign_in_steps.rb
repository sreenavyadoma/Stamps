Given /^Orders: Load Sign-in page (\w+)$/ do |url_prefix|
  log.info "Step: Orders: Load Sign-in page #{url_prefix}"
  orders.sign_in_page.visit url_prefix
end

Given /^Orders: Load Sign-in page$/ do
  log.info "Step: Orders: Load Sign-in page"
  orders.sign_in_page.visit
end

Given /^Orders: First Time Sign-in to Orders as (.*)\/(.*)/ do |username, password|
  if username.downcase.include? "random"
    usr = @username
  else
    usr = username
    @username = username
  end
  log.info "Step: I am signed in to Orders as #{usr}/#{password}"
  orders.sign_in_page.first_time_sign_in usr, password
end

Given /^Orders: Sign-in to Orders as (.*)\/(.*)/ do |username, password|
  usr = @username if username.downcase.include? "random"
  log.info "Step: I am signed in to Orders as #{usr}/#{password}"
  orders.sign_in_page.sign_in_with_credentials usr, password
end

Given /^I sign-in to Orders as (.*)\/(.*)/ do |username, password|
  log.info "Step: I am signed in to Orders as #{username}/#{password}"
  step "I launch browser default"
  step "Orders: Load Sign-in page"
  orders.sign_in_page.sign_in_with_credentials username, password
end

Given /^I am signed in to Orders$/ do
  log.info "Step: I am signed in to Orders"
  step "I launch browser default"
  step "Orders: Load Sign-in page"
  orders.sign_in_page.sign_in_with_credentials
end

Given /^I am signed in to Orders as (.*)\/(.*)/ do |username, password|
  log.info "Step: I am signed in to Orders as #{username}/#{password}"
  step "I launch browser default"
  step "Orders: Load Sign-in page"
  orders.sign_in_page.sign_in_with_credentials username, password
end

Given /^I am signed in to Orders using (.*)/ do |browser|
  log.info "Step: I am signed in to Orders as #{browser}"
  step "I launch browser #{browser}"
  step "Orders: Load Sign-in page"
  orders.sign_in_page.sign_in_with_credentials
end

Given /^I am signed in to Orders as (.*)\/(.*)\/(.*)/ do |browser, username, password|
  log.info "Step: I am signed in to Orders as #{browser}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "Orders: Load Sign-in page"
  orders.sign_in_page.sign_in_with_credentials username, password
end

Given /^I am signed in to Orders as (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  log.info "Step: I am signed in to Orders as #{browser}/#{url}/#{username}/#{password}"
  step "I launch browser #{browser}"
  step "Orders: Load Sign-in page #{url}"
  orders.sign_in_page.sign_in_with_credentials username, password
end

Then /^Sign out$/ do
  log.info "Step: Sign out"
  orders.navigation_bar.username.sign_out
end
