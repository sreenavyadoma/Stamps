Given /^Orders: Visit Sign-in page$/ do
  logger.step "Orders: Visit Sign-in page"
  stamps.web_app = :orders
  #stamps.test_env = ENV['URL']
  stamps.load_page
  browser.url.should include "stamps.com"
end

Given /^Orders: Sign-in as new user (.*)\/(.*)/ do |username, password|
  if username.downcase.include? "random"
    usr = @username
  else
    usr = username
    @username = username
  end
  logger.step "I am signed in to Orders as #{usr}/#{password}"
  @market_place_modal = stamps.orders.landing_page.first_time_sign_in usr, password
end

Then /^Orders: Expect Marketplace modal is present$/ do
  window_title = @market_place_modal.window_title.text
  window_title.should eql 'Add your Store or Marketplace'
end

Then /^Orders: Close Marketplace modal$/ do
  @market_place_modal.close
end

Given /^I am signed in to Orders$/ do
  logger.step "I am signed in to Orders"
  step "I launched default browser"
  if ParameterHelper.to_bool ENV['HEALTHCHECK']
    step "Health Check: Print - Web Batch"
    step "Health Check: Print - Address Book"
  end
  step "Orders: Visit Sign-in page"
  username = stamps.orders.landing_page.sign_in :default
  test_data[:username] = username
  step "Navigation Bar: Customer Balance"
end

Given /^I am signed in to Orders as (.*)\/(.*)/ do |username, password|
  logger.step "I am signed in to Orders as #{username}/#{password}"
  step "I launched default browser"
  if ParameterHelper.to_bool ENV['HEALTHCHECK']
    step "Health Check: Print - Web Batch"
    step "Health Check: Print - Address Book"
  end
  step "Orders: Visit Sign-in page"
  stamps.orders.landing_page.sign_in username, password
  step "Navigation Bar: Customer Balance"
end

#todo Refactor SIGN-IN step definition into one step
Given /^I am signed in to Orders as (.*)\/(.*)\/(.*)/ do |browser, username, password|
  logger.step "I am signed in to Orders as #{browser}/#{username}/#{password}"
  step "I launched browser #{browser}"
  if ParameterHelper.to_bool ENV['HEALTHCHECK']
    step "Health Check: Print - Web Batch"
    step "Health Check: Print - Address Book"
  end
  step "Orders: Visit Sign-in page"
  stamps.orders.landing_page.sign_in username, password
  step "Navigation Bar: Customer Balance"
end

Given /^I am signed in to Orders as (.*)\/(.*)\/(.*)\/(.*)/ do |browser, url, username, password|
  logger.step "I am signed in to Orders as #{browser}/#{url}/#{username}/#{password}"
  step "I launched browser #{browser}"
  if ParameterHelper.to_bool ENV['HEALTHCHECK']
    step "Health Check: Print - Web Batch"
    step "Health Check: Print - Address Book"
  end
  step "Orders: Visit Sign-in page #{url}"
  stamps.orders.landing_page.sign_in username, password
  step "Navigation Bar: Customer Balance"
end

Then /^Orders: Sign in$/ do
  logger.step "Orders: Sign in"
  stamps.orders.landing_page.sign_in :default
end

Then /^Sign out$/ do
  logger.step "Sign out"
  begin
    step "Navigation Bar: Customer Balance"
  rescue
    #ignore
  end
  begin
    stamps.navigation_bar.username.sign_out
  rescue
    #do nothing
  end
end
