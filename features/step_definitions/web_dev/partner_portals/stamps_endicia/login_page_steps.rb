Then /^PP: [Aa] user navigates to the login page$/ do
  StampsEndicia.visit
end



Then /^PP: [Ee]mail field shows placeholder (.*)$/ do |str|
  StampsEndicia.login_page.email_label.safe_wait_while_present
  expect(StampsEndicia.login_page.email_label.text_value).to eql(str)

  StampsEndicia.login_page.email.set "Name"


end

Then /^PP: [Pp]assword field shows placeholder (.*)$/ do |str|
 # StampsEndicia.login_page.password_label.safe_click
 #(StampsEndicia.login_page.password_label.present?).to eql("true")
  expect(StampsEndicia.login_page.password_label.text_value).to eql(str)


end

Then /^PP: user clicks Log In$/ do |str|
  # StampsEndicia.login_page.password_label.safe_click
  #(StampsEndicia.login_page.password_label.present?).to eql("true")
  expect(StampsEndicia.login_page.password_label.text_value).to eql(str)


end