Then /^WL: navigates to default registration page for stamps$/ do
  SDCWWebsite.visit
  stamps_logo = WhiteLabel.common_page.stamps_logo
  stamps_logo.wait_until_present(timeout: 10)
  get_started = WhiteLabel.common_page.get_started
  get_started.click!
end

Then /^WL: select Security Questions 1st security question (.)$/ do |str|
  common_page = WhiteLabel.common_page
  common_page.first_security_question.click
  common_page.dropdown_selection(str)
  common_page.dropdown_element.safe_wait_until_present(timeout: 2)
  common_page.dropdown_element.click
  expect(common_page.first_security_question.attribute_value('title').strip).to eql str
end

#expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text_value).to include(TestData.hash[:username])