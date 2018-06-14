

Then /^sign-in to mail as (.+), (.+)$/ do |usr, pw|
  stamps.mail.sign_in_modal.mail_sign_in(TestData.hash[:username] = usr, TestData.hash[:password] = pw)
end

Given /^(?:|(?:|[Aa] )(?:[Vv]alid |))[Uu]ser is signed in to Web Apps$/ do
  step "I launched the browser"
  if SdcEnv.health_check
    step "Verify Health Check for Orders"
    step "Verify Health Check for Address Book"
  end
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps as #{TestData.hash[:username]}, #{TestData.hash[:password]}"
  step "Navigation Bar: Customer Balance"
end

Given /^[Ll]oad [Ww]eb [Aa]pps [Ss]ign-in page$/ do
  step 'initialize test parameters'
  stamps.orders.landing_page.load_sign_in_page
end

Then /^[Ll]oad [Ww]eb [Aa]pps [Oo]rders (?:and|then) sign-in$/ do
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps as #{TestData.hash[:username]}, #{TestData.hash[:password]}"
end

Then /^[Ll]oad [Ww]eb [Aa]pps [Oo]rders (?:and|then) sign-in expecting Security Questions$/ do
  step "pause for 40 seconds"
  step "load Web Apps Sign-in page"
  TestData.hash[:security_questions] = stamps.orders.landing_page.orders_sign_in(TestData.hash[:username], TestData.hash[:password])
end

Then /^[Ss]elect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Qq]uestion (.*)$/ do |str|
  TestData.hash[:security_questions].first_security_question.select(TestData.hash[:first_security_question] = str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Qq]uetion is (?:correct|(.*))$/ do |str|
  expect(TestData.hash[:security_questions].first_security_question.text_box.text).to eql((str.nil?) ? TestData.hash[:first_security_question] : str)
end

Then /^[Ss]et [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Aa]nswer to (?:random value|(.*))$/ do |str|
  TestData.hash[:security_questions].first_security_question.first_security_answer.set(TestData.hash[:first_security_answer] = (str.nil?) ? 'automation' : str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 1st [Ss]ecurity [Aa]nswer is (?:correct|(.*))$/ do |str|
  expect(TestData.hash[:security_questions].first_security_question.first_security_answer.text).to eql((str.nil?) ? TestData.hash[:first_security_answer] : str)
end

Then /^[Ss]elect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Qq]uestion (.*)$/ do |str|
  TestData.hash[:security_questions].second_security_question.select(TestData.hash[:second_security_question] = str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Qq]uetion is (?:correct|(.*))$/ do |str|
  expect(TestData.hash[:security_questions].second_security_question.text_box.text).to eql((str.nil?) ? TestData.hash[:second_security_question] : str)
end

Then /^[Ss]et [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Aa]nswer to (?:random value|(.*))$/ do |str|
  TestData.hash[:security_questions].second_security_question.second_security_answer.set(TestData.hash[:second_security_answer] = (str.nil?) ? 'automation' : str)
end

Then /^[Ee]xpect [Ss]ecurity [Qa]uestions 2nd [Ss]ecurity [Aa]nswer is (?:correct|(.*))$/ do |str|
  expect(TestData.hash[:security_questions].second_security_question.second_security_question.text).to eql((str.nil?) ? TestData.hash[:first_security_answer] : str)
end

Then /^[Cc]lick [Ss]ecurity [Qq]uestions [Pp]age [Cc]ontinue [Bb]utton$/ do
  TestData.hash[:security_questions].cont_btn.click
end

Then /^[Ee]xpect Security Questions successfully set dialog exists/ do
  expect(TestData.hash[:security_questions].window_title).to be_present, "Security Questions doesn't set up successfully"
end

Then /^[Ee]xpect Security Questions successfully set dialog contain (.*)/ do |str|
  expect(TestData.hash[:security_questions].security_que_successfully_msg.text).to eql(str)
end

Then /^[Ll]oad [Ww]eb [Aa]pps [Mm]ail (?:and|then) sign-in$/ do
  step "load Web Apps Sign-in page"
  step "sign-in to Web Apps as #{SdcEnv.usr}, #{SdcEnv.pw}"
end

Then /^[Ss]ign-in to [Ww]eb [Aa]pps as (.*), (.*)$/ do |username, password|
  if username.nil? || username.downcase == 'default' || username.downcase == 'mysql'
    credentials = SdcUserCredentials.fetch(SdcEnv.scenario.tags[0].name)
    TestData.hash[:username] = username = credentials[:username]
    TestData.hash[:password] = password = credentials[:password]
  end
  expect(TestData.hash[:username] = username).to be_truthy
  expect(TestData.hash[:password] = password).to be_truthy
  expect(stamps.orders.landing_page.orders_sign_in(username, password)).to eql(username) if SdcEnv.sdc_app == :orders
  expect(stamps.mail.sign_in_modal.mail_sign_in(username, password)).to eql(username) if SdcEnv.sdc_app == :mail
end

Then /^sign out$/ do
  if SdcEnv.new_framework
    #skip for now
  else
    begin
      step "Navigation Bar: Customer Balance"
      stamps.navigation_bar.username.sign_out
    rescue
      # ignore
    end
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
  step "set order details ship-from to default"
  step "set Order Details Domestic Ship-To Country to United States"
end

Then /^wait for js to stop$/ do
  SdcPage.browser.wait_while { |b| b.execute_script("return Ext.Ajax.isLoading();") }
end






