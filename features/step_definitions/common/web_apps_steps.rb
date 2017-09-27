
Given /^(?:|(?:|[Aa] )(?:[Vv]alid |))[Uu]ser is signed in to Web Apps$/ do
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
  step "pause for 40 seconds"
  step "load Web Apps Sign-in page"
  modal[:security_questions] = stamps.orders.landing_page.orders_sign_in(test_param[:username], test_param[:password])
end

Then /^[Ss]elect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Qq]uestion (.*)$/ do |str|
  modal[:security_questions].first_security_question.select(test_param[:first_security_question] = str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Qq]uetion is (?:correct|(.*))$/ do |str|
  expect(modal[:security_questions].first_security_question.text_box.text).to eql((str.nil?)?test_param[:first_security_question]:str)
end

Then /^[Ss]et [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Aa]nswer to (?:random value|(.*))$/ do |str|
  modal[:security_questions].first_security_question.first_security_answer.set(test_param[:first_security_answer] = (str.nil?)?'automation':str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Aa]nswer is (?:correct|(.*))$/ do |str|
  expect(modal[:security_questions].first_security_question.first_security_answer.text).to eql((str.nil?)?test_param[:first_security_answer]:str)
end

Then /^[Ss]elect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Qq]uestion (.*)$/ do |str|
  modal[:security_questions].second_security_question.select(test_param[:second_security_question] = str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Qq]uetion is (?:correct|(.*))$/ do |str|
  expect(modal[:security_questions].second_security_question.text_box.text).to eql((str.nil?)?test_param[:second_security_question]:str)
end

Then /^[Ss]et [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Aa]nswer to (?:random value|(.*))$/ do |str|
  modal[:security_questions].second_security_question.second_security_answer.set(test_param[:second_security_answer] = (str.nil?)?'automation':str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Aa]nswer is (?:correct|(.*))$/ do |str|
  expect(modal[:security_questions].second_security_question.second_security_question.text).to eql((str.nil?)?test_param[:first_security_answer]:str)
end

Then /^[Cc]lick [Ss]ecurity [Qq]uestions [Pp]age [Cc]ontinue button$/ do
  modal[:security_questions].continue
end

Then /^[Ee]xpect Security Questions successfully set dialog exists/ do
  expect(modal[:security_questions].window_title).to be(true), "Security Questions doesn't set up successfully"
end

Then /^[Ee]xpect Security Questions successfully set dialog contain (.*)/ do |str|
  expect(modal[:security_questions].security_que_successfully_msg.text).to eql(str)
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





