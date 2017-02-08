
Given /^(?:|(?:|(?:A|a) )(?:(?:v|V)alid |))(?:U|u)ser is signed in to Web Apps$/ do
  step "I launch default browser"
  step "Health Check: Print - Web Batch" if param.health_check
  step "Health Check: Print - Address Book" if param.health_check
  step "load Sign-in page"
  test_data[:username] = stamps.orders.landing_page.orders_sign_in(:default) if param.web_app == :orders
  test_data[:username] = stamps.mail.sign_in_modal.mail_sign_in(:default) if param.web_app == :mail
  step "Navigation Bar: Customer Balance"
end

Given /^(?:L|l)oad Sign-in page$/ do
  stamps.load_sign_in_page
end

Then /^(?:S|s)ign out$/ do
  begin
    step "Navigation Bar: Customer Balance"
    stamps.navigation_bar.username.sign_out
  rescue
    #ignore
  end
end

Given /^Orders: Sign-in as new user (.*)\/(.*)/ do |username, password|
  if username.downcase.include? 'random'
    usr = @username
  else
    usr = username
    @username = username
  end
  @market_place_modal = stamps.orders.landing_page.first_time_sign_in usr, password
end
