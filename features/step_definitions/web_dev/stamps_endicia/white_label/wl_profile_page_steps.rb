
Then /^WL: [Ee]xpect [Pp]rofile [Pp]age email exists$/ do
  expect(WhiteLabel.profile_page.email).to be_present, "Email textbox DOES NOT exists on profile page"
end

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

  print "Email = #{TestData.hash[:email]}\n"
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age username exists$/ do
  expect(WhiteLabel.profile_page.username).to be_present, "Username textbox DOES NOT exist on profile page"
end

Then /^WL: set profile page username to (?:random value|(.*))$/ do |str|
  WhiteLabel.profile_page.username.set ((TestData.hash[:username]=(str.nil?)?(TestHelper.rand_usr) : str))
  print "UserName = #{TestData.hash[:username]}\n"
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age password exists$/ do
  expect(WhiteLabel.profile_page.password).to be_present, "Password textbox DOES NOT exist on profile page"
end

Then /^WL: set profile page password to (?:random value|(.*))$/ do |str|
  if SdcEnv.pw
    WhiteLabel.profile_page.password.set (TestData.hash[:account_password]=(str.nil?) ? SdcEnv.pw : str)
  else
    WhiteLabel.profile_page.password.set (TestData.hash[:account_password]=(str.nil?) ? '1' + TestHelper.rand_alpha_numeric(min:6, max:10) : str)
  end
  print "Password = #{TestData.hash[:account_password]}\n"
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age retype password exists$/ do
  expect(WhiteLabel.profile_page.confirm_password).to be_present, "Retype password textbox DOES NOT exist on profile page"
end

Then /^WL: set profile page re-type password to (?:same as previous password|(.*))$/ do |str|
  WhiteLabel.profile_page.confirm_password.set(TestData.hash[:retype_password]=(str.nil?)?(TestData.hash[:account_password]) : str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Ss]urvey [Qq]uestion exists$/ do
  expect(WhiteLabel.profile_page.survey).to be_present, "Survey Question DOES NOT exist on profile page"
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

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age promo code link exists$/ do
  expect(WhiteLabel.profile_page.promo_code_link).to be_present, "Promo code link DOES NOT exist on profile page"
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age promo code exists$/ do
  expect(WhiteLabel.profile_page.promo_code).to be_present, "Profile promo code textbox DOES NOT exist"
end

Then /^WL: expect profile page promo code to equal source id promo code$/ do
  step 'WL: show profile page promo code'
  profile_page = WhiteLabel.profile_page
  expect(profile_page.promo_code.text_value.strip).to eql(TestData.hash[:promo_code])
end

Then /^WL: set profile page promo code to (?:an empty string|(.*))$/ do |str|
  step 'WL: show profile page promo code'
  profile_page  = WhiteLabel.profile_page
  profile_page.promo_code.set(TestData.hash[:promo_code]=(str.nil?)? '' : str)
end

Then /^WL: show profile page promo code$/ do
  WhiteLabel.profile_page.promo_code_link.click if  WhiteLabel.profile_page.promo_code_link.present?
  expect(WhiteLabel.profile_page.promo_code).to be_present, 'Unable to show Promo Code textbox upon clicking Show Promo Code link.'
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age CONTINUE button exists$/ do
  expect(WhiteLabel.profile_page.continue).to be_present, "CONTINUE button doesn't exists on Profile Page"
end

Then /^WL: click profile page continue button$/ do
  WhiteLabel.profile_page.continue.click
end


##---------UI Validation------##

Then /^WL: [Ee]xpect [Rr]egistration navigation bar Stamps logo exists$/ do
  stamps_logo = WhiteLabel.profile_page.stamps_logo
  stamps_logo.wait_until_present(timeout: 60)
  expect(WhiteLabel.profile_page.stamps_logo).to be_present, "Stamps logo doesn't exists on navigation bar"
end

Then /^WL: [Ee]xpect [Rr]egistration navigation bar USPS logo exists$/ do
  expect(WhiteLabel.profile_page.usps_logo).to be_present, "USPS logo doesn't exists on navigation bar"
end

Then /^WL: [Ee]xpect [Pp]rofile bread crumbs is (.*)$/ do |str|
  expect(WhiteLabel.profile_page.profile_bread_crumb.text).to eql(str), "Profile Bread crumb does not exist "
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age header contain (.*)$/ do |str|
  expect(WhiteLabel.profile_page.header.text).to eql(str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age paragraph contain (.*)$/ do |str|
  expect(WhiteLabel.profile_page.side_acct_text.text).to eql(str)
end

Then /^WL: [Ee]xpect Profile page SideContent Side Account header is (.*)$/ do |str|
  expect(WhiteLabel.profile_page.side_acct_header.text).to eql(str)
end

Then /^WL: [Ee]xpect Profile page Money-saving offers and new products header is \"(.*)\"$/ do |str|
  expect(WhiteLabel.profile_page.side_opt_in_header.text).to eql(str)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age content under Money-saving offers and new products (.*)$/ do |str|
  expect(WhiteLabel.profile_page.side_opt_in_text.text).to eql(str)
end

Then /^WL: [Cc]heck [Pp]rofile [Pp]age [Mm]oney-saving offers and new products$/ do
  WhiteLabel.profile_page.money_saving_offers_checkbox.click! unless WhiteLabel.profile_page.money_saving_offers_checkbox.checked?
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Mm]oney-saving offers and new products is checked$/ do
  expect(WhiteLabel.profile_page.money_saving_offers_checkbox.checked?).to be(true), "Profile Money-saving offers and new products is not checked. Got checked"
end

Then /^WL: uncheck [Pp]rofile [Pp]age [Mm]oney-saving offers and new products$/ do
  WhiteLabel.profile_page.money_saving_offers_checkbox.fire_event(:click)
end

Then /^WL: [Ee]xpect [Pp]rofile [Pp]age [Mm]oney-saving offers and new products is unchecked$/ do
  expect(WhiteLabel.profile_page.money_saving_offers_checkbox.checked?).not_to be(true), "Expected Profile Money-saving offers and new products is checked. Got unchecked"
end

Then /^WL: [Ee]xpect Profile page Email tooltip count is (.*)$/ do |count|
  email_tooltip_count = WhiteLabel.profile_page.email_tooltip
  email_tooltip_count.wait_until_present(timeout: 5)
  TestData.hash[:email_tooltip_count] = email_tooltip_count.text_value.split("\n")
  expect(TestData.hash[:email_tooltip_count].size).to eql(count.to_i)
end

Then /^WL: [Ee]xpect Profile page Email tooltip index (\d+) to be (.*)$/ do |index, str|
  email_tooltip = WhiteLabel.profile_page.email_tooltip
  email_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:email_tooltip] = email_tooltip.text_value.split("\n")
  expect(TestData.hash[:email_tooltip][index.to_i - 1]).to eql(str)
end

Then /^WL: [Ee]xpect Profile page [Uu]sername tooltip count is (.*)$/ do |count|
  username_tooltip_count = WhiteLabel.profile_page.username_tooltip
  username_tooltip_count.wait_until_present(timeout: 5)
  TestData.hash[:username_tooltip_count] = username_tooltip_count.text_value.split("\n")
  expect(TestData.hash[:username_tooltip_count].size).to eql(count.to_i)
end

Then /^WL: [Ee]xpect Profile page [Uu]sername tooltip index (\d+) to be (.*)$/ do |index, str|
  username_tooltip = WhiteLabel.profile_page.username_tooltip
  username_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:username_tooltip] = username_tooltip.text_value.split("\n")
  expect(TestData.hash[:username_tooltip][index.to_i - 1]).to eql(str)
end

Then /^WL: [Ee]xpect Profile page Password tooltip count is (.*)$/ do |count|
  password_tooltip_count = WhiteLabel.profile_page.password_tooltip
  password_tooltip_count.wait_until_present(timeout: 5)
  TestData.hash[:password_tooltip_count] = password_tooltip_count.text_value.split("\n")
  expect(TestData.hash[:password_tooltip_count].size).to eql(count.to_i)
end

Then /^WL: [Ee]xpect Profile page [Pp]assword tooltip index (\d+) to be (.*)$/ do |index, str|
  password_tooltip = WhiteLabel.profile_page.password_tooltip
  password_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:password_tooltip] = password_tooltip.text_value.split("\n")
  expect(TestData.hash[:password_tooltip][index.to_i - 1]).to eql(str)
end

Then /^WL: [Ee]xpect Profile page Re-Password tooltip index (\d+) to be (.*)$/ do |index, str|
  confirm_password_tooltip = WhiteLabel.profile_page.confirm_password_tooltip
  confirm_password_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:confirm_password_tooltip] = confirm_password_tooltip.text_value.split("\n")
  expect(TestData.hash[:confirm_password_tooltip][index.to_i - 1]).to eql(str)
end

Then /^WL: [Ee]xpect Profile page [Pp]romo [Cc]ode tooltip (\d+) to be (.*)$/ do |index, str|
  promo_code_tooltip = WhiteLabel.profile_page.promo_code_tooltip
  promo_code_tooltip.wait_until_present(timeout: 5)
  TestData.hash[:promo_code_tooltip] = promo_code_tooltip.text_value.split("\n")
  expect(TestData.hash[:promo_code_tooltip][index.to_i - 1]).to eql(str)
end