
Given /^(?:|(?:A|a) )(?:(?:v|V)alid |)(?:U|u)ser is signed in to Web Apps$/ do
  step "I launch default browser"
  if param.health_check
    step "Health Check: Print - Web Batch"
    step "Health Check: Print - Address Book"
  end
  if param.web_app == :orders
    step "Visit Orders Sign-in page"
    test_data[:username] = stamps.orders.landing_page.sign_in(:default)
    step "Navigation Bar: Customer Balance"
  end
end

Given /^(?:V|v)isit Orders Sign-in page$/ do
  stamps.load_page
  browser.url.should include "stamps.com"
end

Then /^(?:S|s)ign out$/ do
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

Given /^Orders: Sign-in as new user (.*)\/(.*)/ do |username, password|
  if username.downcase.include? "random"
    usr = @username
  else
    usr = username
    @username = username
  end
  @market_place_modal = stamps.orders.landing_page.first_time_sign_in usr, password
end