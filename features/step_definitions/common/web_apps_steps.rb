
Then /^visit Sdc Website$/ do
  Orders::LandingPage.visit
end

Then /^[Ss]ign-in to SDC Website$/ do
  if SdcEnv.usr.nil? || SdcEnv.usr.downcase == 'default' || SdcEnv.usr.downcase == 'mysql'
    credentials = user_credentials.fetch(SdcTest.scenario.tags[0].name)
    usr = credentials[:username]
    pw = credentials[:password]
  else
    usr = SdcEnv.usr
    pw = SdcEnv.pw
  end
  expect(usr).to be_truthy
  expect(pw).to be_truthy
  step "sign-in to Orders as #{usr}, #{pw}" if SdcEnv.sdc_app == :orders
  step "sign-in to Mail as #{usr}, #{pw}" if SdcEnv.sdc_app == :mail
end

Then /^sign-out of SDC Website$/ do
  sleep(2)
  SdcWebsite.navigation.user_drop_down.sign_out if SdcEnv.browser
  SdcWebsite.landing_page.username.safe_wait_until_present if SdcEnv.browser
end

Then /^sign-in to Orders as (.+), (.+)$/ do |usr, pw|
  SdcWebsite.landing_page.sign_in_with(TestData.store[:username] = usr, TestData.store[:password] = pw)
  SdcWebsite.orders.loading_orders.safe_wait_until_present if SdcEnv.browser
  SdcWebsite.orders.loading_orders.safe_wait_while_present if SdcEnv.browser
  SdcWebsite.navigation.user_drop_down.signed_in_user.safe_wait_until_present(timeout: 5) if SdcEnv.browser
  expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text).to include(TestData.store[:username])
end

Then /^sign-in to Mail as (.+), (.+)$/ do |usr, pw|
  stamps.mail.sign_in_modal.mail_sign_in(TestData.store[:username] = usr, TestData.store[:password] = pw)
end

Given /^(?:|(?:|[Aa] )(?:[Vv]alid |))[Uu]ser is signed in to Web Apps$/ do
  step "I launched the browser"
  step "Health Check: Print - Web Batch" if SdcEnv.health_check
  step "Health Check: Print - Address Book" if SdcEnv.health_check
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps as #{TestData.store[:username]}, #{TestData.store[:password]}"
  step "Navigation Bar: Customer Balance"
end

Given /^[Ll]oad [Ww]eb [Aa]pps [Ss]ign-in page$/ do
  stamps.orders.landing_page.load_sign_in_page
end

Then /^[Ll]oad [Ww]eb [Aa]pps [Oo]rders (?:and|then) sign-in$/ do
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps as #{TestData.store[:username]}, #{TestData.store[:password]}"
end

Then /^[Ll]oad [Ww]eb [Aa]pps [Oo]rders (?:and|then) sign-in expecting Security Questions$/ do
  step "pause for 40 seconds"
  step "load Web Apps Sign-in page"
  TestData.store[:security_questions] = stamps.orders.landing_page.orders_sign_in(TestData.store[:username], TestData.store[:password])
end

Then /^[Ss]elect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Qq]uestion (.*)$/ do |str|
  TestData.store[:security_questions].first_security_question.select(TestData.store[:first_security_question] = str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Qq]uetion is (?:correct|(.*))$/ do |str|
  expect(TestData.store[:security_questions].first_security_question.text_box.text).to eql((str.nil?) ? TestData.store[:first_security_question] : str)
end

Then /^[Ss]et [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Aa]nswer to (?:random value|(.*))$/ do |str|
  TestData.store[:security_questions].first_security_question.first_security_answer.set(TestData.store[:first_security_answer] = (str.nil?) ? 'automation' : str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Aa]nswer is (?:correct|(.*))$/ do |str|
  expect(TestData.store[:security_questions].first_security_question.first_security_answer.text).to eql((str.nil?) ? TestData.store[:first_security_answer] : str)
end

Then /^[Ss]elect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Qq]uestion (.*)$/ do |str|
  TestData.store[:security_questions].second_security_question.select(TestData.store[:second_security_question] = str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Qq]uetion is (?:correct|(.*))$/ do |str|
  expect(TestData.store[:security_questions].second_security_question.text_box.text).to eql((str.nil?) ? TestData.store[:second_security_question] : str)
end

Then /^[Ss]et [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Aa]nswer to (?:random value|(.*))$/ do |str|
  TestData.store[:security_questions].second_security_question.second_security_answer.set(TestData.store[:second_security_answer] = (str.nil?) ? 'automation' : str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Aa]nswer is (?:correct|(.*))$/ do |str|
  expect(TestData.store[:security_questions].second_security_question.second_security_question.text).to eql((str.nil?) ? TestData.store[:first_security_answer] : str)
end

Then /^[Cc]lick [Ss]ecurity [Qq]uestions [Pp]age [Cc]ontinue [Bb]utton$/ do
  TestData.store[:security_questions].cont_btn.click
end

Then /^[Ee]xpect Security Questions successfully set dialog exists/ do
  expect(TestData.store[:security_questions].window_title).to be_present, "Security Questions doesn't set up successfully"
end

Then /^[Ee]xpect Security Questions successfully set dialog contain (.*)/ do |str|
  expect(TestData.store[:security_questions].security_que_successfully_msg.text).to eql(str)
end

Then /^[Ll]oad [Ww]eb [Aa]pps [Mm]ail (?:and|then) sign-in$/ do
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps as #{SdcEnv.usr}, #{SdcEnv.pw}"
end

Then /^[Ss]ign-in to [Ww]eb [Aa]pps as (.*), (.*)$/ do |username, password|
  if username.nil? || username.downcase == 'default' || username.downcase == 'mysql'
    credentials = user_credentials.fetch(SdcTest.scenario.tags[0].name)
    TestData.store[:username] = username = credentials[:username]
    TestData.store[:password] = password = credentials[:password]
  end
  expect(TestData.store[:username] = username).to be_truthy
  expect(TestData.store[:password] = password).to be_truthy
  expect(stamps.orders.landing_page.orders_sign_in(username, password)).to eql(username) if SdcEnv.sdc_app == :orders
  expect(stamps.mail.sign_in_modal.mail_sign_in(username, password)).to eql(username) if SdcEnv.sdc_app == :mail
end

Then /^[Ss]ign out$/ do
  begin
    step "Navigation Bar: Customer Balance"
    stamps.navigation_bar.username.sign_out
  rescue
    # ignore
  end
end

Given /^Orders: Sign-in as new user (.*)\/(.*)$/ do |username, password|
  if username.downcase.include? 'random'
    usr = @username
  else
    usr = username
    @username = username
  end
  @marketplace_modal = stamps.orders.landing_page.first_time_sign_in(usr, password)
end


Given /^[Ll]ogin and add order domestic$/ do
  step "a valid user is signed in to Web Apps"
  step "add new order"
  step "set Order Details Ship-From to default"
  step "set Order Details Domestic Ship-To Country to United States"
end






