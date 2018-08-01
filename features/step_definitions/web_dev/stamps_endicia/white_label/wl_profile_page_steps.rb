#.......Email......#

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age email exists$/ do
  expect(WhiteLabel.profile_page.email).to be_present
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Ee]mail is (?:correct|(.*))$/ do |str|
  email = WhiteLabel.profile_page.email
  str ||= TestData.hash[:email]
  expect(email.text_value.strip).to eql(str)
  TestData.hash[:email] = str
end

Then /^WL: set profile page email to (?:random value|(.*))$/ do |str|
  email = WhiteLabel.profile_page.email
  email.wait_until_present(timeout: 30)
  email.clear
  str ||= TestHelper.rand_email.capitalize
  while email.text_value.strip == ''
    email.set(str)
  end
  TestData.hash[:atg_promotion] = WhiteLabel.choose_supplies.atg_promotion
  TestData.hash[:email] = str

  SdcLogger.info "Email = #{TestData.hash[:email]}\n"
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Ee]mail tooltip [Cc]ount is (.*)$/ do |count|
  email_tooltip_count = WhiteLabel.profile_page.email_tooltip
  email_tooltip_count.wait_until_present(timeout: 5)
  TestData.hash[:email_tooltip_count] = email_tooltip_count.text_value.split("\n")
  expect(TestData.hash[:email_tooltip_count].size).to eql(count.to_i)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Ee]mail tooltip [Ii]ndex (\d+) to be (.*)$/ do |index, str|
  email_tooltip = WhiteLabel.profile_page.email_tooltip
  email_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:email_tooltip] = email_tooltip.text_value.split("\n")
  expect(TestData.hash[:email_tooltip][index.to_i - 1]).to eql(str)
end

#.......Username......#

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Uu]sername exists$/ do
  expect(WhiteLabel.profile_page.username).to be_present
end

Then /^WL: set profile page username to (?:random value|(.*))$/ do |str|
  username = WhiteLabel.profile_page.username
  username.wait_until_present(timeout: 10)
  username.clear
  str ||= TestHelper.rand_alpha_str.capitalize
  if SdcEnv.usr
    7.times do
      username.set(str)
      break if username.text_value.strip == ''
    end
  else
  username.set ((TestData.hash[:username_taken]=(str.nil?)?(TestHelper.rand_usr) : str))
  SdcLogger.info "UserName = #{TestData.hash[:username_taken]}"
  TestData.hash[:username_taken] = WhiteLabel.common_page.username_query(TestData.hash[:username_taken])
  TestData.hash[:username_taken] = str
  end
end

Then /^WL: set pp username to an existing username from db$/ do
  existing_usr = WhiteLabel.common_page.existing_username_query
  step "WL: set profile page username to #{existing_usr}"
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Uu]sername is (?:correct|(.*))$/ do |str|
  username = WhiteLabel.profile_page.username
  str ||= TestData.hash[:username_taken]
  expect(username.text_value.strip).to eql(str)
  TestData.hash[:username_taken] = str
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Uu]sername tooltip count is (.*)$/ do |count|
  username_tooltip_count = WhiteLabel.profile_page.username_tooltip
  username_tooltip_count.wait_until_present(timeout: 5)
  TestData.hash[:username_tooltip_count] = username_tooltip_count.text_value.split("\n")
  expect(TestData.hash[:username_tooltip_count].size).to eql(count.to_i)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Uu]sername tooltip index (\d+) to be (.*)$/ do |index, str|
  username_tooltip = WhiteLabel.profile_page.username_tooltip
  username_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:username_tooltip] = username_tooltip.text_value.split("\n")
  expect(TestData.hash[:username_tooltip][index.to_i - 1]).to eql(str)
end

#.......Password......#

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Pp]assword exists$/ do
  expect(WhiteLabel.profile_page.password).to be_present
end

Then /^WL: set profile page password to (?:random value|(.*))$/ do |str|
  password = WhiteLabel.profile_page.password
  password.wait_until_present(timeout: 10)
  password.clear

  str ||= '1' + TestHelper.rand_alpha_numeric(min:6, max:10)
  if SdcEnv.pw
    password.set(SdcEnv.pw)
  else
  7.times do
    password.set(str)
    break if password.text_value.strip == ''
  end
 end
  expect(password.text_value.strip).not_to eql('')

  SdcLogger.info "Password = #{TestData.hash[:account_password]}\n"
  TestData.hash[:account_password] = str
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Pp]assword is (?:correct|(.*))$/ do |str|
  account_password = WhiteLabel.profile_page.password
  str ||= TestData.hash[:account_password]
  expect(account_password.text_value.strip).to eql(str)
  TestData.hash[:account_password] = str
  expect(TestData.hash[:account_password]).to eql((str.nil?) ? TestData.hash[:account_password] : str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Pp]assword tooltip count is (.*)$/ do |count|
  password_tooltip_count = WhiteLabel.profile_page.password_tooltip
  password_tooltip_count.wait_until_present(timeout: 5)
  TestData.hash[:password_tooltip_count] = password_tooltip_count.text_value.split("\n")
  expect(TestData.hash[:password_tooltip_count].size).to eql(count.to_i)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Pp]assword tooltip index (\d+) to be (.*)$/ do |index, str|
  password_tooltip = WhiteLabel.profile_page.password_tooltip
  password_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:password_tooltip] = password_tooltip.text_value.split("\n")
  expect(TestData.hash[:password_tooltip][index.to_i - 1]).to eql(str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Rr]e-[Tt]ype [Pp]assword exists$/ do
  expect(WhiteLabel.profile_page.confirm_password).to be_present
end

Then /^WL: [Ss]et [Pp]rofile [Pp]age [Rr]e-type [Pp]assword to (?:same as previous password|(.*))$/ do |str|
  confirm_password = WhiteLabel.profile_page.confirm_password
  confirm_password.wait_until_present(timeout: 10)
  confirm_password.clear

  str ||= TestData.hash[:account_password]
  7.times do
    confirm_password.set(str)
    break unless confirm_password.text_value.strip == ''
  end
  expect(confirm_password.text_value.strip).not_to eql('')

  confirm_password.set(str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Rr]e-[Tt]ype [Pp]assword is (?:correct|(.*))$/ do |str|
  retype_password = WhiteLabel.profile_page.confirm_password
  str ||= TestData.hash[:retype_password]
  expect(retype_password.text_value.strip).to eql(str)
  TestData.hash[:retype_password] = str
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Rr]e-[Tt]ype [Pp]assword tooltip index (\d+) to be (.*)$/ do |index, str|
  confirm_password_tooltip = WhiteLabel.profile_page.confirm_password_tooltip
  confirm_password_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:confirm_password_tooltip] = confirm_password_tooltip.text_value.split("\n")
  expect(TestData.hash[:confirm_password_tooltip][index.to_i - 1]).to eql(str)
end

#.......promo code......#

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Pp]romo [Cc]ode tooltip (\d+) to be (.*)$/ do |index, str|
  promo_code_tooltip = WhiteLabel.profile_page.promo_code_tooltip
  promo_code_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:promo_code_tooltip] = promo_code_tooltip.text_value.split("\n")
  expect(TestData.hash[:promo_code_tooltip][index.to_i - 1]).to eql(str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Ss]urvey [Qq]uestion exists$/ do
  expect(WhiteLabel.profile_page.survey).to be_present
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Pp]romo [Cc]ode link exists$/ do
  expect(WhiteLabel.profile_page.promo_code_link).to be_present
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Pp]romo [Cc]ode exists$/ do
  expect(WhiteLabel.profile_page.promo_code).to be_present
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Pp]romo [Cc]ode to equal source id [Pp]romo [Cc]ode$/ do
  step 'WL: show profile page promo code'
  profile_page = WhiteLabel.profile_page
  expect(profile_page.promo_code.text_value.strip).to eql(TestData.hash[:promo_code])
end

Then /^WL: [Ss]et [Pp]rofile [Pp]age [Pp]romo [Cc]ode to (?:an empty string|(.*))$/ do |str|
  step 'WL: show profile page promo code'
  promo_code = WhiteLabel.profile_page.promo_code
  promo_code.wait_until_present(timeout: 10)
  promo_code.clear

  str ||= TestHelper.rand_alpha_str.capitalize
  5.times do
    promo_code.set(str)
    break unless promo_code.text_value.strip == ''
  end
  expect(promo_code.text_value.strip).not_to eql('')

  str ||= TestData.hash[:promo_code]
  #todo-code review str will never get assigned TestData.hash[:promo_code] since it will never be null at this point
  # if str gets a value from line 218, then it will never be null at line 225
  promo_code.set(str)
end

Then /^WL: set profile page re-type password to (?:same as previous password|(.*))$/ do |str|
  str ||= TestData.hash[:account_password]
  WhiteLabel.profile_page.confirm_password.set(str)
  TestData.hash[:retype_password] = str
end

Then /^WL: [Ss]how [Pp]rofile [Pp]age [Pp]romo [Cc]ode$/ do
  WhiteLabel.profile_page.promo_code_link.click if WhiteLabel.profile_page.promo_code_link.present?
  expect(WhiteLabel.profile_page.promo_code).to be_present
end

Then /^WL: set profile page survey question to (.*)$/ do |str|
  profile_page = WhiteLabel.profile_page
  profile_page.survey.click
  profile_page.survey_selection(str)
  profile_page.survey_element.safe_wait_until_present(timeout: 2)
  profile_page.survey_element.click
  expect(profile_page.survey.attribute_value('title').strip).to eql str
  TestData.hash[:survey] = str
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Ss]urvey [Qq]uestion is (?:correct|(.*))$/ do |str|
  survey = WhiteLabel.profile_page.survey
  str ||= TestData.hash[:survey]
  expect(survey.title).to eql(str)
  TestData.hash[:survey] = str
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

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age how did you hear about us option is (?:correct|(.*))$/ do |str|
  referrer_name = WhiteLabel.profile_page.referrer_name
  str ||= TestData.hash[:referrer_name]

  if referrer_name.present?
    expect(referrer_name.title).to eql(str)
    TestData.hash[:referrer_name] = str
  else
    #ignore
  end
end

Then /^WL: show profile page promo code textbox$/ do
  profile_page = WhiteLabel.profile_page

  profile_page.promo_code_link.click if profile_page.promo_code_link.present?
#  expect(profile_page.promo_code_textbox).to be_present
end

Then /^WL: [Cc]lick [Pp]rofile [Pp]age CONTINUE button$/ do
  WhiteLabel.profile_page.continue.click
end

##---------UI Validation------##

Then /^WL: [Ee]xpect [Rr]egistration navigation bar [Ss]tamps [Ll]ogo exists$/ do
  stamps_logo = WhiteLabel.profile_page.stamps_logo
  stamps_logo.wait_until_present(timeout: 60)
  expect(WhiteLabel.profile_page.stamps_logo).to be_present
end

Then /^WL: [Ee]xpect [Rr]egistration navigation bar USPS [Ll]ogo exists$/ do
  expect(WhiteLabel.profile_page.usps_logo).to be_present
end

Then /^WL: [Ee]xpect [Pp]rofile bread crumbs is (.*)$/ do |str|
  expect(WhiteLabel.profile_page.profile_bread_crumb.text_value.strip).to eql(str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age header contain (.*)$/ do |str|
  expect(WhiteLabel.profile_page.header.text).to eql(str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age paragraph contain$/ do |str|
  expect(WhiteLabel.profile_page.side_acct_text.text_value.strip).to eql(str)
end

Then /^WL: [Ee]xpect Profile page SideContent Side Account header is (.*)$/ do |str|
  expect(WhiteLabel.profile_page.side_acct_header.text_value.strip).to eql(str)
end

Then /^WL: [Ee]xpect Profile page Money-saving offers and new products header is \"(.*)\"$/ do |str|
  expect(WhiteLabel.profile_page.side_opt_in_header.text_value.strip).to eql(str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age content under Money-saving offers and new products$/ do |str|
  expect(WhiteLabel.profile_page.side_opt_in_text.text_value.strip).to eql(str)
end

Then /^WL: [Cc]heck [Pp]rofile [Pp]age [Mm]oney-saving offers and new products$/ do
  WhiteLabel.profile_page.money_saving_offers_checkbox.check
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Mm]oney-saving offers and new products is checked$/ do
  expect(WhiteLabel.profile_page.money_saving_offers_checkbox.checked?).not_to be(true)
end

Then /^WL: uncheck [Pp]rofile [Pp]age [Mm]oney-saving offers and new products$/ do
  WhiteLabel.profile_page.money_saving_offers_checkbox.check
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Mm]oney-saving offers and new products is unchecked$/ do
  expect(WhiteLabel.profile_page.money_saving_offers_checkbox.checked?).to be(false)
end

Then /^WL: set profile page default values$/ do
  step 'WL: set profile page email to random value'
  step 'WL: set profile page username to random value'
  step 'WL: set profile page password to random value'
  step 'WL: set profile page re-type password to same as previous password'
  step 'WL: set profile page survey question to Business Use - Both mailing and shipping'
  step 'WL: set profile page how did you hear about us? to Received Mailer'
end