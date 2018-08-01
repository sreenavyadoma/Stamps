
Then /^WL: set profile page email to (?:random value|(.*))$/ do |str|
  email = WhiteLabel.profile_page.email
  email.wait_until_present(timeout: 30)
  if SdcEnv.usr
    sleep 1
    email.set(TestData.hash[:email]=(str.nil?)?(SdcEnv.usr) : str)
  else
    sleep 1
    email.set(TestData.hash[:email]=(str.nil?)?(TestHelper.rand_email) : str)
  end

  SdcLogger.info "Email = #{TestData.hash[:email]}"

  TestData.hash[:atg_promotion] =  WhiteLabel.choose_supplies.atg_promotion
end

Then /^WL: set profile page username to (?:random value|(.*))$/ do |str|
  str ||= TestHelper.rand_usr
  profile_page = WhiteLabel.profile_page

  profile_page.username.set(str)
  step 'WL: blur_out on membership page'
  SdcLogger.info "Username = #{str}"

  TestData.hash[:username_taken] = WhiteLabel.common_page.username_query(str)
  TestData.hash[:username] = str
end

Then /^WL: set pp username to an existing username from db$/ do
   existing_usr = WhiteLabel.common_page.existing_username_query
   step "WL: set profile page username to #{existing_usr}"
end

Then /^WL: set profile page password to (?:random value|(.*))$/ do |str|
  if SdcEnv.pw
    WhiteLabel.profile_page.password.set (TestData.hash[:account_password]=(str.nil?) ? SdcEnv.pw : str)
  else
    str ||= '1' + TestHelper.rand_alpha_numeric(min:6, max:10)
    WhiteLabel.profile_page.password.set (TestData.hash[:account_password] = str)
  end

  SdcLogger.info "Password = #{TestData.hash[:account_password]}"
end

Then /^WL: set profile page re-type password to (?:same as previous password|(.*))$/ do |str|
  str ||= TestData.hash[:account_password]
  WhiteLabel.profile_page.confirm_password.set(str)
  TestData.hash[:retype_password] = str
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
  if profile_page.referrer_name.present?
  profile_page.referrer_name.click
  profile_page.referrer_name_selection(str)
  profile_page.referrer_name_element.safe_wait_until_present(timeout: 2)
  profile_page.referrer_name_element.click
  expect(profile_page.referrer_name.attribute_value('title').strip).to eql str
  else
    #ignore
  end

end

Then /^WL: expect profile page promo code to equal source id promo code$/ do
  step 'WL: show profile page promo code textbox'
  profile_page = WhiteLabel.profile_page
  expect(profile_page.promo_code_textbox.text_value.strip).to eql(TestData.hash[:promo_code])
end

Then /^WL: set profile page promo code to (?:an empty string|(.*))$/ do |str|
  step 'WL: show profile page promo code textbox'
  profile_page  = WhiteLabel.profile_page
  profile_page.promo_code_textbox.set(TestData.hash[:promo_code]=(str.nil?)? '' : str)
end

Then /^WL: show profile page promo code textbox$/ do
  WhiteLabel.profile_page.promo_code_link.click if  WhiteLabel.profile_page.promo_code_link.present?
  expect(WhiteLabel.profile_page.promo_code_textbox).to be_present
end

Then /^WL: click profile page continue button$/ do
    WhiteLabel.profile_page.continue.click
    step 'pause for 1 second'
end

Then /^WL: set profile page default values$/ do
  step 'WL: navigates to default registration page for stamps with the following source id 100-TES-WB001'
  step 'WL: set profile page email to random value'
  step 'WL: set profile page username to random value'
  step 'WL: set profile page password to random value'
  step 'WL: set profile page re-type password to same as previous password'
  step 'WL: set profile page survey question to Business Use - Both mailing and shipping'
  step 'WL: set profile page how did you hear about us? to Received Mailer'
  step 'WL: set profile page promo code to PR33-NH77'
end