
Then /^SDCWR: navigates to default registration page$/ do
  SDCWWebsite.visit
  get_started = WhiteLabel.common_page.get_started
  get_started.wait_until_present(timeout: 5)
  get_started.click!
end

Then /^SDCWR: set profile page email to (.*)$/ do |str|
  email = WhiteLabel.profile_page.email
  email.wait_until_present(timeout: 5)
  email.set str
end

Then /^SDCWR: set Profile page Survey Question to (.*)$/ do |str|
  profile_page = WhiteLabel.profile_page
  profile_page.survey.click
  profile_page.survey_selection(str)
  profile_page.survey_element.safe_wait_until_present(timeout: 2)
  profile_page.survey_element.click
  expect(profile_page.survey.attribute_value('title').trim).to eql str
end