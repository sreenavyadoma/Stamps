Given /^Orders: Visit Sign-in page$/ do
  logger.info "Orders: Visit Sign-in page"
  web_apps.visit :orders
end

Given /^Orders: Sign-in as new user (.*)\/(.*)/ do |username, password|
  if username.downcase.include? "random"
    usr = @username
  else
    usr = username
    @username = username
  end
  logger.info "I am signed in to Orders as #{usr}/#{password}"
  @market_place_modal = web_apps.orders.landing_page.first_time_sign_in usr, password
end

Then /^Orders: Expect Marketplace modal is present$/ do
  window_title = @market_place_modal.window_title
  window_title.should eql 'Add your Store or Marketplace'
end

Then /^Orders: Close Marketplace modal$/ do
  @market_place_modal.close
end

Given /^I am signed in to Orders$/ do
  logger.info "I am signed in to Orders"
  step "I launched the default browser"
  if ParameterHelper.to_boolean ENV['HEALTHCHECK']
    step "Health Check: Print - Web Batch"
    step "Health Check: Print - Address Book"
  end
  step "Orders: Visit Sign-in page"
  web_apps.orders.landing_page.sign_in :default
  step "Navigation Bar: Customer Balance"
end

Given /^I am signed in to Orders as (.*)\/(.*)/ do |username, password|
  logger.info "I am signed in to Orders as #{username}/#{password}"
  step "I launched the default browser"
  if ParameterHelper.to_boolean ENV['HEALTHCHECK']
    step "Health Check: Print - Web Batch"
    step "Health Check: Print - Address Book"
  end
  step "Orders: Visit Sign-in page"
  web_apps.orders.landing_page.sign_in username, password
  step "Navigation Bar: Customer Balance"
end

#todo Refactor SIGN-IN step definition into one step
Given /^I am signed in to Orders as (.*)\/(.*)\/(.*)/ do |browser, username, password|
  logger.info "I am signed in to Orders as #{browser}/#{username}/#{password}"
  step "I launched browser #{browser}"
  if ParameterHelper.to_boolean ENV['HEALTHCHECK']
    step "Health Check: Print - Web Batch"
    step "Health Check: Print - Address Book"
  end
  step "Orders: Visit Sign-in page"
  web_apps.orders.landing_page.sign_in username, password
  step "Navigation Bar: Customer Balance"
end

Given /^I am signed in to Orders as (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  logger.info "I am signed in to Orders as #{browser}/#{url}/#{username}/#{password}"
  step "I launched browser #{browser}"
  if ParameterHelper.to_boolean ENV['HEALTHCHECK']
    step "Health Check: Print - Web Batch"
    step "Health Check: Print - Address Book"
  end
  step "Orders: Visit Sign-in page #{url}"
  web_apps.orders.landing_page.sign_in username, password
  step "Navigation Bar: Customer Balance"
end

Then /^Sign out$/ do
  logger.info "Sign out"
  web_apps.navigation_bar.username.sign_out
end
