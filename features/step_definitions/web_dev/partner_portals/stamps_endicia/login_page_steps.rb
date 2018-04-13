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
  StampsEndicia.visit
end

Then /^[Pp]P: [Ee]xpect login page welcome content is (.*)$/ do |str|
  #StampsEndicia.login_page.welcome_content.safe_wait_while_present
 #expect(StampsEndicia.login_page.welcome_content.text_value).to eql(str), "Welcome to the content DOES NOT exist on login page"

  #StampsEndicia.login_page.welcome_content.wait_while_present
  expect(StampsEndicia.login_page.welcome_content.text).to eql(str), "Welcome to the content DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page Stamps.com endicia content is (.*)$/ do |str|
  expect(StampsEndicia.login_page.sdc_endicia_content.attribute_value 'alt').to eql(str)
end

Then /^[Pp]P: [Ee]xpect login page USPS Portal content is (.*)$/ do |str|
  expect(StampsEndicia.login_page.usps_portal_content.text_value).to eql(str), "USPS Portal content DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page Log In button to exist$/ do
  expect(StampsEndicia.login_page.log_in).to be_present, "Log In button DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page Log In button text is (.*)$/ do |str|
 expect(StampsEndicia.login_page.login_label.text_value).to eql(str)
end

Then /^[Pp]P: [Uu]ser clicks Log In$/ do
  StampsEndicia.login_page.log_in.safe_click
end

Then /^[Pp]P: expect login page [Ff]orgot [Pp]assword link exist$/ do
  expect(StampsEndicia.login_page.forgot_pw).to be_present, "Forgot Password? link DOES NOT exist on login page"
end

Then /^[Pp]P: [Uu]ser clicks [Ff]orgot [Pp]assword link$/ do
  StampsEndicia.login_page.forgot_pw.safe_click
end

Then /^[Pp]P: [Bb]lur out on [Ll]ogin [Pp]age$/ do
  StampsEndicia.login_page.usps_portal_content.blur_out
end


Then /^[Pp]P: [Ee]xpect login page [Ee]mail field to exist$/ do
  expect(StampsEndicia.login_page.email).to be_present, "Email textbox DOES NOT exist on login page"
end


Then /^[Pp]P: [Ee]xpect login page [Ee]mail field shows placeholder (.*)$/ do |str|
  expect(StampsEndicia.login_page.email_placeholder.attribute_value 'PLACEHOLDER').to eql(str)

end


Then /^[Pp]P: set login page email to (.*)$/ do |str|
  StampsEndicia.login_page.email.set(TestData.store[:email]=str)
end



Then /^[Pp]P: [Ee]xpect login page email tooltip count is (.*)$/ do |count|
  TestData.store[:email_tooltip] = StampsEndicia.login_page.email_tooltip.text_value.split("\n")
  expect(TestData.store[:email_tooltip].size).to eql(count.to_i)
end

Then /^[Pp]P: [Ee]xpect login page email tooltip index (.*) to be (.*)$/ do |index, str|
  TestData.store[:email_tooltip] = StampsEndicia.login_page.email_tooltip.text_value.split("\n")
  expect(TestData.store[:email_tooltip][index.to_i - 1]).to eql(str)
end

Then /^[Pp]P: [Ee]xpect login page Password field to exist$/ do
  expect(StampsEndicia.login_page.password).to be_present, "Password textbox DOES NOT exist on login page"
end

Then /^[Pp]P: set login page password to (.*)$/ do |str|
  StampsEndicia.login_page.password.set(TestData.store[:password]=str)
end


Then /^[Pp]P: [Ee]xpect login page [Pp]assword field shows placeholder (.*)$/ do |str|
  expect(StampsEndicia.login_page.password_placeholder.attribute_value 'PLACEHOLDER').to eql(str)

end

Then /^[Pp]P: [Ee]xpect login page password tooltip count is (.*)$/ do |count|
  TestData.store[:password_tooltip] = StampsEndicia.login_page.password_tooltip.text_value.split("\n")
  expect(TestData.store[:password_tooltip].size).to eql(count.to_i)
end

Then /^[Pp]P: [Ee]xpect login page Password tooltip index (.*) to be (.*)$/ do |index, str|
  TestData.store[:password_tooltip] = StampsEndicia.login_page.password_tooltip.text_value.split("\n")
  expect(TestData.store[:password_tooltip][index.to_i - 1]).to eql(str)
end

Then /^[Pp]P: [Ee]xpect login page error message to be$/ do |str|
  expect(StampsEndicia.login_page.error_message.text).to eql(str)
end



#
# Then /^PP: expect website records login event in Audit Records$/ do
#
# end

Given /^[Pp]P: [Aa] valid user is signed into the Partner Portal$/ do
  step "Start test driver"
  step "PP: A user navigates to the login page"
  step "PP: Partner user's xyz partner account Status is Active"
  step "PP: Partner user's xyz partner contract Status is Active"
  step "PP: set login page email to automation@stamps.com"
  step "PP: set login page password to pass1234"
  step "PP: User clicks Log In"
end