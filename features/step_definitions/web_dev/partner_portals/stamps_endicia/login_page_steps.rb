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
 expect(StampsEndicia.login_page.log_in).to be_present
end

Then /^[Pp]P: [Uu]ser clicks Log In$/ do
  StampsEndicia.login_page.log_in.safe_click

end

Then /^[Pp]P: expect login page [Ff]orgot [Pp]assword link exist$/ do
  expect(StampsEndicia.login_page.forgot_pw).to be_present
end

Then /^[Pp]P: [Ee]xpect login page header Welcome to the Stamps.com endicia Partner Portal exist$/ do

end

Then /^[Pp]P: [Ee]xpect login page [Ee]mail field to exist$/do
  expect(StampsEndicia.login_page.email).to be_present

end

Then /^[Pp]P: [Ee]xpect login page [Ee]mail field shows placeholder (.*)$/ do |str|
  StampsEndicia.login_page.email_label.safe_wait_while_present
  expect(StampsEndicia.login_page.email_label.text_value).to eql(str)

  StampsEndicia.login_page.email.set "Name"
  StampsEndicia.login_page.email.send_keys :enter
  TestData.store[:email]=StampsEndicia.login_page.email_tooltip.text_value.split("\n")
  expect(TestData.store[:email][0]).to eql("5 character minimum")

end


Then /^[Pp]P: set login page email field to (.*)$/do
  expect(StampsEndicia.login_page.email).to be_present

end

Then /^[Pp]P: [Uu]ser blur off Email$/do
  expect(StampsEndicia.login_page.email).to be_present

end

Then /^[Pp]P: [Ee]xpect login page email tooltip count is (.*)$/ do |count|

end

Then /^[Pp]P: [Ee]xpect login page email tooltip index (.*) to be (.*)$/ do |index, str|

end

Then /^[Pp]P: [Ee]xpect login page Password field to exist$/ do

end

Then /^[Pp]P: set login page password to (.*)$/ do

end


Then /^[Pp]P: [Ee]xpect login page [Pp]assword field shows placeholder (.*)$/ do |str|
  StampsEndicia.login_page.password.send_keys :enter
  #StampsEndicia.login_page.password_label.safe_wait_while_present
  expect(StampsEndicia.login_page.password_label.text_value).to eql(str)

end

Then /^[Pp]P: [Ee]xpect login page password tooltip count is (.*)$/ do |count|

end

Then /^[Pp]P: [Ee]xpect login page Password tooltip index (.*) to be (.*)$/ do |index, str|

end














Then /^PP: set profile page survey question to (.*)$/ do |str|
  StampsEndicia.login_page.dd_survey.safe_click
  StampsEndicia.login_page.survey.safe_click
end

Then /^PP: check Profile page Money-saving offers and new products$/ do
  StampsEndicia.login_page.checkbox.click
  StampsEndicia.login_page.checkbox_header.text_value



end