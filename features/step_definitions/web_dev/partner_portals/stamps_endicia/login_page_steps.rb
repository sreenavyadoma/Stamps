Given /^[Pp]P: [Pp]artner user's (.*) Status is (.*)$/ do

end

Given /^[Pp]P: [Pp]artner user's (.*) partner account Status is (.*)$/ do

end

Given /^[Pp]P: [Pp]artner user's (.*) partner contract Status is (.*)$/ do

end

Then /^[Pp]P: [Aa] user navigates to the login page$/ do
  StampsEndicia.visit
end

Then /^[Pp]P: expect login page Log In button to exist$/do
 expect(StampsEndicia.login_page.log_in).to be_present, "Log In button DOES NOT exist on login page"
end

Then /^[Pp]P: [Uu]ser clicks Log In$/ do
  StampsEndicia.login_page.log_in.safe_click

end

Then /^[Pp]P: expect login page [Ff]orgot [Pp]assword link exist$/ do
  expect(StampsEndicia.login_page.forgot_pw).to be_present, "Forgot Password? link DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page header Welcome to the Stamps.com endicia Partner Portal exist$/ do
  expect(StampsEndicia.login_page.header).to be_present, "Header DOES NOT exist on login page"
end

Then /^[Pp]P: [Bb]lure out on [Ll]ogin [Pp]age$/do
  StampsEndicia.login_page.header.blur_out
end

Then /^[Pp]P: [Ee]xpect login page [Ee]mail field to exist$/do
  expect(StampsEndicia.login_page.email).to be_present, "Email textbox DOES NOT exist on login page"
end

Then /^[Pp]P: [Ee]xpect login page [Ee]mail field shows placeholder (.*)$/ do |str|
  expect(StampsEndicia.login_page.email_label.text_value).to eql(str)

end


Then /^[Pp]P: set login page email to (.*)$/do |str|
  StampsEndicia.login_page.email.safe_wait_while_present
  expect(StampsEndicia.login_page.email).to be_present, "Log In page did not load properly, check your test."
  StampsEndicia.login_page.email.set(TestData.store[:email]=(str.nil?))
  step "PP: Blure out on Login Page"
end



Then /^[Pp]P: [Ee]xpect login page email tooltip count is (.*)$/ do |count|
  TestData.store[:email_tooltip] = StampsEndicia.login_page.email_tooltip.text_value.split("\n")
  expect(TestData.store[:email_tooltip].size).to eql(count.to_i)
end

Then /^[Pp]P: [Ee]xpect login page email tooltip index (.*) to be (.*)$/ do |index, str|
  expect(TestData.store[:email_tooltip][index.to_i - 1]).to eql(str)
end

Then /^[Pp]P: [Ee]xpect login page Password field to exist$/ do
  expect(StampsEndicia.login_page.password).to be_present, "Password textbox DOES NOT exist on login page"
end

Then /^[Pp]P: set login page password to (.*)$/ do |str|
  StampsEndicia.login_page.password.safe_wait_while_present
  expect(StampsEndicia.login_page.password).to be_present, "Log In page did not load properly, check your test."
  StampsEndicia.login_page.password.set(TestData.store[:password]=(str.nil?))
  step "PP: Blure out on Login Page"
end


Then /^[Pp]P: [Ee]xpect login page [Pp]assword field shows placeholder (.*)$/ do |str|
  expect(StampsEndicia.login_page.password_label.text_value).to eql(str)

end

Then /^[Pp]P: [Ee]xpect login page password tooltip count is (.*)$/ do |count|
  TestData.store[:password_tooltip] = StampsEndicia.login_page.email_tooltip.text_value.split("\n")
  expect(TestData.store[:password_tooltip].size).to eql(count.to_i)
end

Then /^[Pp]P: [Ee]xpect login page Password tooltip index (.*) to be (.*)$/ do |index, str|
  expect(TestData.store[:password_tooltip][index.to_i - 1]).to eql(str)
end



Then /^PP: expect website redirects user to Dashboard Page$/ do
  StampsEndicia.dashboard_page.header.safe_wait_while_present
  expect(StampsEndicia.dashboard_page.header). to be_present, "Dashboard header DOES NOT exist on dashboard page"
end


Then /^PP: expect website records login event in Audit Records$/ do

end


