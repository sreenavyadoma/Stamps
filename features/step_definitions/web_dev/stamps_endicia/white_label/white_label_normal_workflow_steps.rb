
Then /^WL: set profile page email to (?:random value|(.*))$/ do |str|
  email = WhiteLabel.profile_page.email
  email.wait_until_present(timeout: 10)
  email.set(TestData.store[:email]=(str.nil?)?(TestHelper.rand_email):str)
end

Then /^WL: set profile page username to (?:random value|(.*))$/ do |str|
  WhiteLabel.profile_page.username.set ((TestData.store[:username]=(str.nil?)?(TestHelper.rand_usr):str))
end

Then /^WL: set profile page password to (?:random value|(.*))$/ do |str|
  WhiteLabel.profile_page.password.set (TestData.store[:account_password]=(str.nil?)?TestHelper.rand_alpha_numeric:str)
end

Then /^WL: set profile page re-type password to (?:same as previous password|(.*))$/ do |str|
  WhiteLabel.profile_page.confirm_password.set(TestData.store[:retype_password]=(str.nil?)?(TestData.store[:account_password]):str)
end





Then /^WL: set profile page survey question to (.*)$/ do |str|
  profile_page = WhiteLabel.profile_page
  profile_page.survey.click
  profile_page.survey_selection(str)
  profile_page.survey_element.safe_wait_until_present(timeout: 2)
  profile_page.survey_element.click
  expect(profile_page.survey.attribute_value('title').strip).to eql str
end
