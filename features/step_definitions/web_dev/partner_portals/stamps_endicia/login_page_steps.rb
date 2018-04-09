Then /^PP: A user navigates to the login page$/ do
 Portals::StampsEndicia::SdcEndiciaPP.visit
end



Then /^PP: email field shows placeholder (.*)$/ do |str|
  @login = Portals::StampsEndicia::SdcEndiciaPP.new.login_page
  TestData.store[:email]
  expect(login.email_label.text_value).to eql(str)
end