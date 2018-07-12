Then /^WL: navigates to default registration page for stamps$/ do
  SDCWWebsite.visit
  stamps_logo = WhiteLabel.common_page.stamps_logo
  stamps_logo.wait_until_present(timeout: 10)
  get_started = WhiteLabel.common_page.get_started
  get_started.click!
end

Then /^WL: select security questions first security question (.*)$/ do |str|
  common_page = WhiteLabel.common_page
  common_page.first_security_question.wait_until_present(timeout: 30)
  common_page.first_security_question.click
  common_page.dropdown_selection(str, 0)
  common_page.dropdown_element.safe_wait_until_present(timeout: 2)
  common_page.dropdown_element.click
  expect(common_page.first_security_question.attribute_value('title').strip).to eql str
end

Then /^WL: set security questions first security answer to (?:random value|(.*))$/ do |str|
  WhiteLabel.common_page.first_secret_answer.set(TestData.hash[:first_security_answer] = (str.nil?) ? TestHelper.rand_alpha_numeric(min:6, max:10) : str)
end

Then /^WL: select security questions second security question (.*)$/ do |str|
  common_page = WhiteLabel.common_page
  common_page.second_security_question.click
  common_page.dropdown_selection(str, 1)
  common_page.dropdown_element.safe_wait_until_present(timeout: 2)
  common_page.dropdown_element.click
  expect(common_page.second_security_question.attribute_value('title').strip).to eql str
end

Then /^WL: set security questions second security answer to (?:random value|(.*))$/ do |str|
  WhiteLabel.common_page.second_secret_answer.set(TestData.hash[:second_security_answer] = (str.nil?) ? TestHelper.rand_alpha_numeric(min:6, max:10) : str)
end

Then /^WL: click security questions get stared button$/ do
  WhiteLabel.common_page.sq_get_started.click
end

Then /^WL: expect user is singed in to print$/ do
  signed_in_user =  SdcWebsite.navigation.user_drop_down.signed_in_user
  signed_in_user.wait_until_present(timeout: 60)
  expect(signed_in_user.text_value).to include(TestData.hash[:username])
end

