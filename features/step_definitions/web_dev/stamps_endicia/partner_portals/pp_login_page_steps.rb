Then /^[Ee]stablish [Pp]artner [Pp]ortal db connection$/ do
  PartnerPortal.db_connection
end

Then /^[Cc]lose [Pp]artner [Pp]ortal db connection$/ do
  PartnerPortal.db_connection.close
end

Then /^[Pp]P: [Aa] user navigates to the login page$/ do
  PartnerPortal::PPLoginPage.visit
end

Then /^[Pp]P: [Ee]xpect login page "Welcome to the" content to exist$/ do
  expect(PartnerPortal.login_page.welcome_content).to be_present, "'Welcome to the content' DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page "stamps.com endicia" logo to exist$/ do
  expect(PartnerPortal.login_page.sdc_endicia_logo).to be_present, "'stamps.com endicia' content DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page "Partner Portal" content to exist$/ do
  expect(PartnerPortal.login_page.partner_portal_content).to be_present, "'USPS Portal' content DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page Log In button to exist$/ do
  expect(PartnerPortal.login_page.log_in).to be_present, "Log In button DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page Log In button text is (.*)$/ do |str|
 expect(PartnerPortal.login_page.login_label.text_value).to eql(str)
end

Then /^[Pp]P: [Uu]ser clicks Log In$/ do
  log_in = PartnerPortal.login_page.log_in
  log_in.wait_until_present(timeout: 5)
  log_in.send_keys(:enter)
end

Then /^[Pp]P: expect login page [Ff]orgot [Pp]assword link exist$/ do
  expect(PartnerPortal.login_page.forgot_pw).to be_present, "Forgot Password? link DOES NOT exist on login page"
end

Then /^[Pp]P: [Uu]ser clicks [Ff]orgot [Pp]assword link$/ do
  PartnerPortal.login_page.forgot_pw.send_keys(:enter)
end

Then /^[Pp]P: [Bb]lur out on [Ll]ogin [Pp]age$/ do
  PartnerPortal.login_page.partner_portal_content.blur_out
end


Then /^[Pp]P: [Ee]xpect login page [Ee]mail field to exist$/ do
  expect(PartnerPortal.login_page.email).to be_present, "Email textbox DOES NOT exist on login page"
end


Then /^[Pp]P: [Ee]xpect login page [Ee]mail field shows placeholder (.*)$/ do |str|
  expect(PartnerPortal.login_page.email_placeholder.attribute_value 'PLACEHOLDER').to eql(str)

end


Then /^[Pp]P: set login page email to (?:env value|(.*))$/ do |str|
  email =  PartnerPortal.login_page.email
  email.wait_until_present(timeout: 5)
  email.set(TestData.hash[:email]=(str.nil?)?(SdcEnv.usr):str)
end


Then /^[Pp]P: [Ee]xpect login page email tooltip count is (.*)$/ do |count|
  email_tooltip_count = PartnerPortal.login_page.email_tooltip
  email_tooltip_count.wait_until_present(timeout: 5)
  TestData.hash[:email_tooltip_count] = email_tooltip_count.text_value.split("\n")
  expect(TestData.hash[:email_tooltip_count].size).to eql(count.to_i)
end

Then /^[Pp]P: [Ee]xpect login page email tooltip index (\d+) to be (.*)$/ do |index, str|
  email_tooltip = PartnerPortal.login_page.email_tooltip
  email_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:email_tooltip] = email_tooltip.text_value.split("\n")
  expect(TestData.hash[:email_tooltip][index.to_i - 1]).to eql(str)
end

Then /^[Pp]P: [Ee]xpect login page Password field to exist$/ do
  expect(PartnerPortal.login_page.password).to be_present, "Password textbox DOES NOT exist on login page"
end

Then /^[Pp]P: set login page password to (?:env value|(.*))$/ do |str|
  password =  PartnerPortal.login_page.password
  password.wait_until_present(timeout: 5)
  password.set(TestData.hash[:password]=(str.nil?)?(SdcEnv.pw):str)

end


Then /^[Pp]P: [Ee]xpect login page [Pp]assword field shows placeholder (.*)$/ do |str|
  expect(PartnerPortal.login_page.password_placeholder.attribute_value 'PLACEHOLDER').to eql(str)

end

Then /^[Pp]P: [Ee]xpect login page [Pp]assword tooltip count is (.*)$/ do |count|
  password_tooltip_count = PartnerPortal.login_page.password_tooltip
  password_tooltip_count.wait_until_present(timeout: 5)
  TestData.hash[:password_tooltip_count] = password_tooltip_count.text_value.split("\n")
  expect(TestData.hash[:password_tooltip_count].size).to eql(count.to_i)
end

Then /^[Pp]P: [Ee]xpect login page [Pp]assword tooltip index (\d+) to be (.*)$/ do |index, str|
  password_tooltip = PartnerPortal.login_page.password_tooltip
  password_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:password_tooltip] = password_tooltip.text_value.split("\n")
  expect(TestData.hash[:password_tooltip][index.to_i - 1]).to eql(str)
end

Then /^[Pp]P: [Ee]xpect login page error message to be$/ do |str|
  error_message = PartnerPortal.login_page.error_message
  error_message.wait_until_present(timeout: 10)
  #expect(error_message.attribute_value('innerText').strip).to eql(str)
  expect(error_message.text_value.strip).to eql(str)
end


Then /^[Pp]P: [Ee]xpect website records login event in Audit Records to be (.*)$/ do |str|
  step "Establish Partner Portal db connection"

 result = PartnerPortal.db_connection.execute(
    "select RecordId, PartnerUserId, LogInfo, DateCreated
    from [dbo].[sdct_PartnerPortal_Log]
    where DateCreated = (
    Select MAX(DateCreated) from [dbo].[sdct_PartnerPortal_Log] where PartnerUserId = 1001)"
  )
  result.each do |log_info|
    TestData.hash[:login_status]= log_info['LogInfo']
  end
  expect(TestData.hash[:login_status]).to eql(str)

  step "Close partner portal db connection"

end

Given /^[Pp]P: [Aa] valid user is signed into the Partner Portal$/ do
  step "Start test driver"
  step "PP: A user navigates to the login page"
  step "PP: set login page email to env value"
  step "PP: set login page password to env value"
  step "PP: User clicks Log In"
end