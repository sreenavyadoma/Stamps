
Then /^WL: set profile page email to (?:random value|(.*))$/ do |str|
  email = WhiteLabel.profile_page.email
  email.wait_until_present(timeout: 30)
  TestData.hash[:atg_promotion] =  WhiteLabel.choose_supplies.atg_promotion
  if SdcEnv.usr
    sleep 1
    email.set(TestData.hash[:email]=(str.nil?)?(SdcEnv.usr) : str)
  else
    sleep 1
    email.set(TestData.hash[:email]=(str.nil?)?(TestHelper.rand_email) : str)
  end
end

Then /^WL: set profile page username to (?:random value|(.*))$/ do |str|
  WhiteLabel.profile_page.username.set ((TestData.hash[:username]=(str.nil?)?(TestHelper.rand_usr) : str))
  print TestData.hash[:username]
end

Then /^WL: set profile page password to (?:random value|(.*))$/ do |str|
  if SdcEnv.pw
    WhiteLabel.profile_page.password.set (TestData.hash[:account_password]=(str.nil?) ? SdcEnv.pw : str)
  else
    WhiteLabel.profile_page.password.set (TestData.hash[:account_password]=(str.nil?) ? '1' + TestHelper.rand_alpha_numeric(min:6, max:10) : str)
  end
  print TestData.hash[:account_password]
end

Then /^WL: set profile page re-type password to (?:same as previous password|(.*))$/ do |str|
  WhiteLabel.profile_page.confirm_password.set(TestData.hash[:retype_password]=(str.nil?)?(TestData.hash[:account_password]) : str)
end

Then /^WL: set profile page survey question to (.*)$/ do |str|
  profile_page = WhiteLabel.profile_page
  profile_page.survey.click
  profile_page.survey_selection(str)
  profile_page.survey_element.safe_wait_until_present(timeout: 2)
  profile_page.survey_element.click
  expect(profile_page.survey.attribute_value('title').strip).to eql str
end

Then /^WL: set profile page how did you hear about us\? to (.*)$/ do |str|
  profile_page = WhiteLabel.profile_page
  profile_page.referrer_name.click
  profile_page.referrer_name_selection(str)
  profile_page.referrer_name_element.safe_wait_until_present(timeout: 2)
  profile_page.referrer_name_element.click
  expect(profile_page.referrer_name.attribute_value('title').strip).to eql str
end

Then /^WL: set profile page promo code to (?:source id promo code|(.*))$/ do |str|
  step 'WL: show profile page promo code textbox'
  profile_page  = WhiteLabel.profile_page
  profile_page.promo_code_textbox.set(TestData.hash[:promo_code]=(str.nil?)? profile_page.promo_code_textbox.text_value : str)
end

Then /^WL: show profile page promo code textbox$/ do
  WhiteLabel.profile_page.promo_code_link.click if  WhiteLabel.profile_page.promo_code_link.present?
  expect(WhiteLabel.profile_page.promo_code_textbox).to be_present, 'Unable to show Promo Code textbox upon clicking Show Promo Code link.'
end

Then /^WL: click profile page continue button$/ do
  WhiteLabel.profile_page.continue.click
end
