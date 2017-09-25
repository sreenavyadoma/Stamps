
Given /^(?:|(?:|[Aa] )(?:[Vv]alid |))[Uu]ser is signed in to Web Apps$/ do
  step "I launch default browser"
  step "Health Check: Print - Web Batch" if modal_param.health_check
  step "Health Check: Print - Address Book" if modal_param.health_check
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps as #{test_param[:username]}, #{test_param[:password]}"
  step "Navigation Bar: Customer Balance"
end

Then /^new [Uu]ser signed in to Web Apps first time$/ do
  step "I launch default browser"
  step "Health Check: Print - Web Batch" if modal_param.health_check
  step "Health Check: Print - Address Book" if modal_param.health_check
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps as #{test_param[:username]}, #{test_param[:password]}"
  step "Navigation Bar: Customer Balance"
end

Then /^[Ll]oad [Ww]eb [Aa]pps [Oo]rders (?:and|then) sign-in$/ do
  modal_param.web_app = :orders
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps as #{test_param[:username]}, #{test_param[:password]}"
end

Then /^[Ll]oad [Ww]eb [Aa]pps [Oo]rders (?:and|then) sign-in expecting Security Questions$/ do
  modal_param.web_app = :orders
  step "load Web Apps Sign-in page"
  modal[:security_quesstions] = stamps.orders.landing_page.orders_sign_in(test_param[:username], test_param[:password])
end

Then /^[Ss]elect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Qq]uestion (.*)$/ do |str|
  modal[:security_quesstions].first_security_question.select(str)
end

Then /^[Ss]et [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Aa]nswer to (?:random value|(.*))$/ do |str|
  modal[:security_quesstions].first_security_answer.set(test_param[:first_security_answer] = (str.nil?)?'automation':str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Aa]nswer is (?:correct|(.*))$/ do |str|
  expect(modal[:security_quesstions].first_security_answer.text).to eql((str.nil?)?test_param[:first_security_answer]:str)
end

Then /^[Ss]elect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Qq]uestion (.*)$/ do |str|
  modal[:security_quesstions].second_security_question.select(str)
end

Then /^[Ss]et [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Aa]nswer to (?:random value|(.*))$/ do |str|
  modal[:security_quesstions].second_security_question.set(test_param[:first_security_answer] = (str.nil?)?'automation':str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Aa]nswer is (?:correct|(.*))$/ do |str|
  expect(modal[:security_quesstions].second_security_question.text).to eql((str.nil?)?test_param[:first_security_answer]:str)
end

Then /^[Ll]oad [Ww]eb [Aa]pps [Mm]ail (?:and|then) sign-in$/ do
  modal_param.web_app = :mail
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps as #{modal_param.usr}, #{modal_param.pw}"
end

Given /^[Ll]oad [Ww]eb [Aa]pps [Ss]ign-in page$/ do
  stamps.load_sign_in_page
end

Given /^[Ss]ign-in to [Ww]eb [Aa]pps as (.*), (.*)$/ do |username, password|
  stamps.orders.landing_page.orders_sign_in(username, password) if modal_param.web_app == :orders
  stamps.mail.sign_in_modal.mail_sign_in(username, password) if modal_param.web_app == :mail
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





