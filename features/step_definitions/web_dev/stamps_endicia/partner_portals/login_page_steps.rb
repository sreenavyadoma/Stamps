# Then /^[Ee]stablish db connection$/ do
#   sql_server.connect.db_name
# end
#
# Then /^[Cc]lose db connection$/ do
#   sql_server.close
# end

# Then /^[Pp]P: [Pp]artner user's (.*) Status is (.*)$/ do |user, status|
#   step "Establish db connection"
#   result = sql_server.db_name.query("xxx")
#   expect(result).to eql(status)
# end
#
# Then /^[Pp]P: [Pp]artner user's (.*) partner account Status is (.*)$/ do |partner, status|
#   result = sql_server.db_name.query("xxx")
#   expect(result).to eql(status)
# end
#
# Then /^[Pp]P: [Pp]artner user's (.*) partner contract Status is (.*)$/ do |partner, status|
#   result = sql_server.db_name.query("xxx")
#   expect(result).to eql(status)
# end

Then /^[Pp]P: [Aa] user navigates to the login page$/ do
  PartnerPortal::PPLoginPage.visit
end

Then /^[Pp]P: [Ee]xpect login page "Welcome to the" content to exist$/ do
  expect(PartnerPortal.login_page.welcome_content).to be_present, "'Welcome to the content' DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page "stamps.com endicia" logo to exist$/ do
  expect(PartnerPortal.login_page.sdc_endicia_logo).to be_present, "'stamps.com endicia' content DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page "USPS Portal" content to exist$/ do
  expect(PartnerPortal.login_page.usps_portal_content).to be_present, "'USPS Portal' content DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page Log In button to exist$/ do
  expect(PartnerPortal.login_page.log_in).to be_present, "Log In button DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page Log In button text is (.*)$/ do |str|
 expect(PartnerPortal.login_page.login_label.text_value).to eql(str)
end

Then /^[Pp]P: [Uu]ser clicks Log In$/ do
  PartnerPortal.login_page.log_in.click
end

Then /^[Pp]P: expect login page [Ff]orgot [Pp]assword link exist$/ do
  expect(PartnerPortal.login_page.forgot_pw).to be_present, "Forgot Password? link DOES NOT exist on login page"
end

Then /^[Pp]P: [Uu]ser clicks [Ff]orgot [Pp]assword link$/ do
  PartnerPortal.login_page.forgot_pw.click
end

Then /^[Pp]P: [Bb]lur out on [Ll]ogin [Pp]age$/ do
  PartnerPortal.login_page.usps_portal_content.blur_out
end


Then /^[Pp]P: [Ee]xpect login page [Ee]mail field to exist$/ do
  expect(PartnerPortal.login_page.email).to be_present, "Email textbox DOES NOT exist on login page"
end


Then /^[Pp]P: [Ee]xpect login page [Ee]mail field shows placeholder (.*)$/ do |str|
  expect(PartnerPortal.login_page.email_placeholder.attribute_value 'PLACEHOLDER').to eql(str)

end


Then /^[Pp]P: set login page email to (.*)$/ do |str|
  PartnerPortal.login_page.email.set(TestData.store[:email]=str)
end



Then /^[Pp]P: [Ee]xpect login page email tooltip count is (.*)$/ do |count|
  TestData.store[:email_tooltip] = PartnerPortal.login_page.email_tooltip.text_value.split("\n")
  expect(TestData.store[:email_tooltip].size).to eql(count.to_i)
end

Then /^[Pp]P: [Ee]xpect login page email tooltip index (\d+) to be (.*)$/ do |index, str|
  TestData.store[:email_tooltip] = PartnerPortal.login_page.email_tooltip.text_value.split("\n")
  expect(TestData.store[:email_tooltip][index.to_i - 1]).to eql(str)
end

Then /^[Pp]P: [Ee]xpect login page Password field to exist$/ do
  expect(PartnerPortal.login_page.password).to be_present, "Password textbox DOES NOT exist on login page"
end

Then /^[Pp]P: set login page password to (.*)$/ do |str|
  PartnerPortal.login_page.password.set(TestData.store[:password]=str)
end


Then /^[Pp]P: [Ee]xpect login page [Pp]assword field shows placeholder (.*)$/ do |str|
  expect(PartnerPortal.login_page.password_placeholder.attribute_value 'PLACEHOLDER').to eql(str)

end

Then /^[Pp]P: [Ee]xpect login page [Pp]assword tooltip count is (.*)$/ do |count|
  TestData.store[:password_tooltip] = PartnerPortal.login_page.password_tooltip.text_value.split("\n")
  expect(TestData.store[:password_tooltip].size).to eql(count.to_i)
end

Then /^[Pp]P: [Ee]xpect login page [Pp]assword tooltip index (\d+) to be (.*)$/ do |index, str|
  TestData.store[:password_tooltip] = PartnerPortal.login_page.password_tooltip.text_value.split("\n")
  expect(TestData.store[:password_tooltip][index.to_i - 1]).to eql(str)
end

Then /^[Pp]P: [Ee]xpect login page error message to be$/ do |str|
  PartnerPortal.login_page.error_message.safe_wait_while_present
  expect(PartnerPortal.login_page.error_message.text.strip).to eql(str)
end



#
# Then /^PP: expect website records login event in Audit Records$/ do
#
# end

Given /^[Pp]P: [Aa] valid user is signed into the Partner Portal$/ do
  step "Start test driver"
  step "PP: A user navigates to the login page"
  # step "PP: Partner user's xyz Status is Active"
  # step "PP: Partner user's xyz partner account Status is Active"
  # step "PP: Partner user's xyz partner contract Status is Active"
  step "PP: set login page email to wteam@stamps.com"
  step "PP: set login page password to password1"
  step "PP: User clicks Log In"
end