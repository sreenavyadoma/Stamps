
Given /^(?:|(?:|[Aa] )(?:[Vv]alid |))[Uu]ser is signed in to Web Apps$/ do
  step "I launch default browser"
  step "Health Check: Print - Web Batch" if modal_param.health_check
  step "Health Check: Print - Address Book" if modal_param.health_check
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps"
  step "Navigation Bar: Customer Balance"
end

Then /^[Ll]oad [Ww]eb [Aa]pps [Oo]rders (?:and|then) sign-in$/ do
  modal_param.web_app = :orders
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps"
end

Then /^[Ll]oad [Ww]eb [Aa]pps [Mm]ail (?:and|then) sign-in$/ do
  modal_param.web_app = :mail
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps"
end

Given /^[Ll]oad [Ww]eb [Aa]pps [Ss]ign-in page$/ do
  stamps.load_sign_in_page
end

Given /^[Ss]ign-in to [Ww]eb [Aa]pps/ do
  test_param[:username] = stamps.orders.landing_page.orders_sign_in(:default) if modal_param.web_app == :orders
  test_param[:username] = stamps.mail.sign_in_modal.mail_sign_in(:default) if modal_param.web_app == :mail
end

Then /^[Ss]ign out$/ do
  begin
    step "Navigation Bar: Customer Balance"
    stamps.navigation_bar.username.sign_out
  rescue
    #ignore
  end
end

Given /^Orders: Sign-in as new user (.*)\/(.*)$/ do |username, password|
  if username.downcase.include? 'random'
    usr = @username
  else
    usr = username
    @username = username
  end
  @market_place_modal = stamps.orders.landing_page.first_time_sign_in(usr, password)
end

