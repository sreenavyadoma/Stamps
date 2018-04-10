Then /^PP: [Aa] user navigates to the login page$/ do
  StampsEndicia.visit
end



Then /^PP: [Ee]mail field shows placeholder (.*)$/ do |str|
  StampsEndicia.login_page.email_label.safe_wait_while_present
  expect(StampsEndicia.login_page.email_label.text_value).to eql(str)

  StampsEndicia.login_page.email.set "Name"

  TestData.store[:email]=StampsEndicia.login_page.email_tooltip.text_value.split("\n")
  expect(TestData.store[:email][0]).to eql("5 character minimum")

end

Then /^PP: [Pp]assword field shows placeholder (.*)$/ do |str|
  StampsEndicia.login_page.password.send_keys :enter
  #StampsEndicia.login_page.password_label.safe_wait_while_present
  expect(StampsEndicia.login_page.password_label.text_value).to eql(str)


end

Then /^PP: user clicks Log In$/ do
  StampsEndicia.login_page.log_in.safe_click
end

Then /^PP: set profile page survey question to (.*)$/ do |str|
  StampsEndicia.login_page.dd_survey.safe_click
  StampsEndicia.login_page.survey.safe_click
end

Then /^PP: check Profile page Money-saving offers and new products$/ do
  StampsEndicia.login_page.checkbox.safe_click
  StampsEndicia.login_page.checkbox_header.text_value



end