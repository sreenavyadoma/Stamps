Given /^Orders: Load Sign-in page$/ do
  logger.info "Orders: Load Sign-in page"
  web_apps.visit :orders
end

Given /^Orders: New User Sign-in as (.*)\/(.*)/ do |username, password|
  if username.downcase.include? "random"
    usr = @username
  else
    usr = username
    @username = username
  end
  logger.info "I am signed in to Orders as #{usr}/#{password}"
  orders.landing_page.first_time_sign_in usr, password
end

Given /^Orders: Sign-in to Orders as (.*)\/(.*)/ do |username, password|
  usr = @username if username.downcase.include? "random"
  logger.info "I am signed in to Orders as #{usr}/#{password}"
  orders.landing_page.sign_in usr, password
end

# todo refactor signin step definitions
Given /^I sign-in to Orders as (.*)\/(.*)/ do |username, password|
  logger.info "I am signed in to Orders as #{username}/#{password}"
  step "I launched the default browser"
  step "Health Check: Print - Web Batch"
  step "Orders: Load Sign-in page"
  orders.landing_page.sign_in username, password
end

Given /^I am signed in to Orders$/ do
  logger.info "I am signed in to Orders"
  step "I launched the default browser"
  step "Health Check: Print - Web Batch" if ParameterHelper.to_boolean ENV['HEALTHCHECK']
  step "Orders: Load Sign-in page"
  orders.landing_page.sign_in :default
  step "Navigation Bar: Customer Balance"
end

Given /^I am signed in to Orders as (.*)\/(.*)/ do |username, password|
  logger.info "I am signed in to Orders as #{username}/#{password}"
  step "I launched the default browser"
  step "Health Check: Print - Web Batch"
  step "Orders: Load Sign-in page"
  orders.landing_page.sign_in username, password
end

Given /^I am signed in to Orders using (.*)/ do |browser|
  logger.info "I am signed in to Orders as #{browser}"
  step "I launched the default browser #{browser}"
  step "Health Check: Print - Web Batch"
  step "Orders: Load Sign-in page"
  orders.landing_page.sign_in
end

Given /^I am signed in to Orders as (.*)\/(.*)\/(.*)/ do |browser, username, password|
  logger.info "I am signed in to Orders as #{browser}/#{username}/#{password}"
  step "I launched the default browser #{browser}"
  step "Health Check: Print - Web Batch"
  step "Orders: Load Sign-in page"
  orders.landing_page.sign_in username, password
end

Given /^I am signed in to Orders as (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  logger.info "I am signed in to Orders as #{browser}/#{url}/#{username}/#{password}"
  step "I launched the default browser #{browser}"
  step "Health Check: Print - Web Batch"
  step "Orders: Load Sign-in page #{url}"
  orders.landing_page.sign_in username, password
end

Then /^Sign out$/ do
  step "Navigation Bar: Customer Balance"
  logger.info "Sign out"
  orders.navigation_bar.username.sign_out
end
