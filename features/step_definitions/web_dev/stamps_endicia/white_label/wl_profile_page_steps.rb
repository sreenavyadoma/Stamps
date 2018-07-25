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

Then /^WL: [Ss]et [Pp]rofile [Pp]age [Ee]mail to (?:random value|(.*))$/ do |str|
  email = WhiteLabel.profile_page.email
  email.wait_until_present(timeout: 30)
  email.clear
  while email.text_value.strip == ''
    str ||=  TestHelper.rand_email.capitalize
    email.set(str)
  end
  TestData.hash[:atg_promotion] =  WhiteLabel.choose_supplies.atg_promotion
  if SdcEnv.usr
    sleep 1
    email.set(TestData.hash[:email]=(str.nil?)?(SdcEnv.usr) : str)
  else
    sleep 1
    email.set(TestData.hash[:email]=(str.nil?)?(TestHelper.rand_email) : str)
  end

  print "Email = #{TestData.hash[:email]}\n"
  TestData.hash[:email] = str
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

Then /^WL: [Ss]et [Pp]rofile [Pp]age [Uu]sername to (?:random value|(.*))$/ do |str|
  username = WhiteLabel.profile_page.username
  username.wait_until_present(timeout: 10)
  username.clear
  while username.text_value.strip == ''
    str ||=  TestHelper.rand_alpha_str.capitalize
    username.set(str)
  end
  username.set ((TestData.hash[:username_taken]=(str.nil?)?(TestHelper.rand_usr) : str))
  print "UserName = #{TestData.hash[:username_taken]}\n"
  TestData.hash[:username_taken] = WhiteLabel.common_page.username_query(TestData.hash[:username_taken])
  TestData.hash[:username_taken] = str
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

Then /^WL: [Ss]et [Pp]rofile [Pp]age [Pp]assword to (?:random value|(.*))$/ do |str|
  password = WhiteLabel.profile_page.password
  password.wait_until_present(timeout: 10)
  password.clear
  while password.text_value.strip == ''
    str ||=  '1' + TestHelper.rand_alpha_numeric(min:6, max:10)
    password.set(str)
  end

  if SdcEnv.pw
    password.set (TestData.hash[:account_password]=(str.nil?) ? SdcEnv.pw : str)
  else
    password.set (TestData.hash[:account_password]=(str.nil?) ? '1' + TestHelper.rand_alpha_numeric(min:6, max:10) : str)
  end
  print "Password = #{TestData.hash[:account_password]}\n"
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

#.......re-type Password......#

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Rr]e-[Tt]ype [Pp]assword exists$/ do
  expect(WhiteLabel.profile_page.confirm_password).to be_present
end

Then /^WL: [Ss]et [Pp]rofile [Pp]age [Rr]e-type [Pp]assword to (?:same as previous password|(.*))$/ do |str|
  confirm_password = WhiteLabel.profile_page.confirm_password
  confirm_password.wait_until_present(timeout: 10)
  confirm_password.clear
  while confirm_password.text_value.strip == ''
    str ||=  TestData.hash[:account_password]
    confirm_password.set(str)
  end

  confirm_password.set(TestData.hash[:retype_password]=(str.nil?)?(TestData.hash[:account_password]) : str)
  TestData.hash[:retype_password] = str
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
  while promo_code.text_value.strip == ''
    str ||=  TestHelper.rand_alpha_str.capitalize
    promo_code.set(str)
  end
  promo_code.set(TestData.hash[:promo_code]=(str.nil?)? '' : str)
  TestData.hash[:promo_code] = str
end

Then /^WL: [Ss]how [Pp]rofile [Pp]age [Pp]romo [Cc]ode$/ do
  WhiteLabel.profile_page.promo_code_link.click if  WhiteLabel.profile_page.promo_code_link.present?
  expect(WhiteLabel.profile_page.promo_code).to be_present, 'Unable to show Promo Code textbox upon clicking Show Promo Code link.'
end

#.......survey quetion......#

Then /^WL: [Ss]et [Pp]rofile [Pp]age [Ss]urvey [Qq]uestion to (.*)$/ do |str|
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
  expect(survey.text_value.strip).to eql(str)
  TestData.hash[:survey] = str
end

Then /^WL: [Ss]et [Pp]rofile [Pp]age [Hh]ow [Dd]id [Yy]ou [Hh]ear [Aa]bout [Uu]s\? to (.*)$/ do |str|
  profile_page = WhiteLabel.profile_page
  profile_page.referrer_name.click
  profile_page.referrer_name_selection(str)
  profile_page.referrer_name_element.safe_wait_until_present(timeout: 2)
  profile_page.referrer_name_element.click
  expect(profile_page.referrer_name.attribute_value('title').strip).to eql str
  TestData.hash[:referrer_name] = str
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age how did you hear about us option is (?:correct|(.*))$/ do |str|
  referrer_name = WhiteLabel.profile_page.referrer_name
  str ||= TestData.hash[:referrer_name]
  expect(referrer_name.text_value.strip).to eql(str)
  TestData.hash[:referrer_name] = str
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age CONTINUE button exists$/ do
  expect(WhiteLabel.profile_page.continue).to be_present
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
  expect(WhiteLabel.profile_page.profile_bread_crumb.text).to eql(str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age header contain (.*)$/ do |str|
  expect(WhiteLabel.profile_page.header.text).to eql(str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age paragraph contain$/ do |str|
  expect(WhiteLabel.profile_page.side_acct_text.text_value.strip).to eql(str)
end

Then /^WL: [Ee]xpect Profile page SideContent Side Account header is (.*)$/ do |str|
  expect(WhiteLabel.profile_page.side_acct_header.text).to eql(str)
end

Then /^WL: [Ee]xpect Profile page Money-saving offers and new products header is \"(.*)\"$/ do |str|
  expect(WhiteLabel.profile_page.side_opt_in_header.text).to eql(str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age content under Money-saving offers and new products$/ do |str|
  expect(WhiteLabel.profile_page.side_opt_in_text.text_value.strip).to eql(str)
end

Then /^WL: [Cc]heck [Pp]rofile [Pp]age [Mm]oney-saving offers and new products$/ do
  WhiteLabel.profile_page.money_saving_offers_checkbox.check unless WhiteLabel.profile_page.money_saving_offers_checkbox.checked?
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