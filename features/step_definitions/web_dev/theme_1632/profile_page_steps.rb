Then /^[Ll]oad WebReg Profile page$/ do
  registration.load_page
end


Then /^Visit WebReg Registration Page$/ do
  #logger.step "Visit WebReg Registration Page"
  registration.visit
  expect(browser).to be_truthy
end

Then /^[Oo]n WebReg Profile page, Continue to Mailing Information page$/ do
  #logger.step "On WebReg Profile page, Continue to Mailing Information page"
  registration.profile.continue_to_mailing_info
end

Then /^[Ss]et WebReg Profile User ID and Email to (.*)$/ do |usr|
  if usr.downcase.include? 'random'
    test_parameter[:usr] = ParameterHelper.rand_username
  else
    test_parameter[:usr] = usr
  end
  step "set WebReg Profile Email to #{ test_parameter[:usr]}@mailinator.com"
  step "set WebReg Profile User ID to #{ test_parameter[:usr]}"
end

Then /^[Ss]et WebReg Profile Email to (.*)$/ do |email|
  registration.profile.email.set email
end

Then /^[Ss]et WebReg Profile User ID to (.*)$/ do |user_id|
  #logger.step "set WebReg Profile User ID to #{user_id}"
  test_parameter[:usr] = user_id
  registration.profile.user_id.set user_id
end

Then /^[Ss]et WebReg Profile Password to (.*)$/ do |password|
  test_parameter[:pw]=password
  registration.profile.password.set test_parameter[:pw]
end

Then /^[Ss]et WebReg Profile Re-Type password to (.*)$/ do |password|
  registration.profile.retype_password.set password
end

Then /^[Ss]et WebReg Profile Referrer Name to Web Banner$/ do
  referrer_name = registration.profile.referrer_name
  referrer_name.web_banner if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Radio Podcast Streaming Audio$/ do
  referrer_name = registration.profile.referrer_name
  referrer_name.streaming_audio if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Television Commercial$/ do
  referrer_name = registration.profile.referrer_name
  referrer_name.television_commercial if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Telephone Call$/ do
  referrer_name = registration.profile.referrer_name
  referrer_name.telephone_call if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Other$/ do
  referrer_name = registration.profile.referrer_name
  referrer_name.other if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Recommended by Friend$/ do
  referrer_name = registration.profile.referrer_name
  referrer_name.recommended_by_friend if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Recommended by USPS$/ do
  referrer_name = registration.profile.referrer_name
  referrer_name.recommended_by_usps if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Newspaper Ad$/ do
  referrer_name = registration.profile.referrer_name
  registration.profile.referrer_name.newspapaer_ad if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Magazine Ad$/ do
  referrer_name = registration.profile.referrer_name
  referrer_name.magazine_ad if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Received Mailer$/ do
  referrer_name = registration.profile.referrer_name
  registration.profile.referrer_name.received_mailer if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Already used in office$/ do
  referrer_name = registration.profile.referrer_name
  referrer_name.already_used_in_office if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Trade show convention$/ do
  referrer_name = registration.profile.referrer_name
  registration.profile.referrer_name.trade_show if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Web Search$/ do
  referrer_name = registration.profile.referrer_name
  referrer_name.web_search if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Email from Stamps$/ do
  referrer_name = registration.profile.referrer_name
  referrer_name.email_from_stamps if referrer_name.present?
end

Then /^[Ss]et WebReg Profile How did you hear about us to Web Banner$/ do
  registration.profile.email.set email
end

Then /^[Ss]et WebReg Profile How will you use Stamps.com to Mostly Mailing$/ do
  registration.profile.usage_type.mostly_mailing
end

Then /^[Ss]et WebReg Profile How will you use Stamps.com to Mostly Shipping$/ do
  registration.profile.usage_type.mostly_shipping
end

Then /^[Ss]et WebReg Profile How will you use Stamps.com to Both Mailing and Shipping$/ do
  registration.profile.usage_type.mailing_and_shipping
end

Then /^[Ss]et WebReg Profile How will you use Stamps.com to Home Office$/ do
  registration.profile.usage_type.individual
end

Then /^[Ss]et WebReg Profile 1st Answer to (.*)$/ do |answer|
  test_parameter[:answer] = answer
  registration.profile.first_answer.set test_parameter[:answer]
end

Then /^[Ss]et WebReg Profile 2nd Answer to (.*)$/ do |answer|
  test_parameter[:answer_2] = answer
  registration.profile.second_answer.set test_parameter[:answer_2]
end

Then /^[Ss]et WebReg Profile Send me special money-saving offers to checked$/ do
  registration.profile.send_promo.click
end

Then /^[Ss]et WebReg Profile Send me special money-saving offers to unchecked$/ do
  registration.profile.send_promo.click
end

Then /^[Ss]et WebReg Profile 1st Question to What is your mother's maiden name$/ do
  registration.profile.first_question.mothers_maiden_name
end

Then /^[Ss]et WebReg Profile 1st Question to What is your pet's name$/ do
  registration.profile.first_question.pets_name
end

Then /^[Ss]et WebReg Profile 1st Question to What is your city of birth$/ do
  registration.profile.first_question.birth_city
end

Then /^[Ss]et WebReg Profile 1st Question to What is your father's birthplace$/ do
  #logger.step "set WebReg Profile 1st Question to What is your father's birthplace"
  registration.profile.first_question.fathers_birth_place
end

Then /^[Ss]et WebReg Profile 1st Question to What street did you grow up on$/ do
  #logger.step "set WebReg Profile 1st Question to What street did you grow up on"
  registration.profile.first_question.mothers_maiden_name
end

Then /^[Ss]et WebReg Profile 1st Question to What is the name of your first school$/ do
  #logger.step "set WebReg Profile 1st Question to What is the name of your first school"
  registration.profile.first_question.street_name
end

Then /^[Ss]et WebReg Profile 1st Question to What is the make and model of your first car$/ do
  #logger.step "set WebReg Profile 1st Question to What is the make and model of your first car"
  registration.profile.first_question.first_cars_make_model
end

Then /^[Ss]et WebReg Profile 2nd Question to What is your mother's maiden name$/ do
  #logger.step "set WebReg Profile 1st Question to What is your mother's maiden name?"
  registration.profile.second_question.mothers_maiden_name
end

Then /^[Ss]et WebReg Profile 2nd Question to What is your pet's name$/ do
  #logger.step "set WebReg Profile 1st Question to What is your pet's name?"
  registration.profile.second_question.pets_name
end

Then /^[Ss]et WebReg Profile 2nd Question to What is your city of birth$/ do
  #logger.step "set WebReg Profile 1st Question to What is your city of birth"
  registration.profile.second_question.birth_city
end

Then /^[Ss]et WebReg Profile 2nd Question to What is your father's birthplace$/ do
  #logger.step "set WebReg Profile 1st Question to What is your father's birthplace"
  registration.profile.second_question.fathers_birth_place
end

Then /^[Ss]et WebReg Profile 2nd Question to What street did you grow up on$/ do
  #logger.step "set WebReg Profile 1st Question to What street did you grow up on"
  registration.profile.second_question.street_name
end

Then /^[Ss]et WebReg Profile 2nd Question to What is the name of your first school$/ do
  #logger.step "set WebReg Profile 1st Question to What is the name of your first school"
  registration.profile.second_question.street_name
end

Then /^[Ss]et WebReg Profile 2nd Question to What is the make and model of your first car$/ do
  #logger.step "set WebReg Profile 1st Question to What is the make and model of your first car"
  registration.profile.second_question.first_cars_make_model
end

Then /^[Ss]et WebReg Profile 2nd Question to What was your high school mascot$/ do
  #logger.step "set WebReg Profile 1st Question to What was your high school mascot"
  registration.profile.second_question.high_school_mascot
end

Then /^[Oo]n WebReg Profile page, Continue$/ do
  #logger.step "On WebReg Profile page, Continue"
  registration.profile.continue.click
end

Then /^[Oo]n WebReg Profile page, continue to Mailing Information page$/ do
  #logger.step "On WebReg Profile page, continue to Mailing Information page"
  10.times do
    registration.profile.continue.click
    sleep(0.35)
    break if registration.profile.membership.present?
  end
  expect("Unable to continue....").to eql "Mailing Information page Did not load." unless registration.profile.membership.present?
end

Then /^Registration Choose Supplies: Place Order$/ do
  expect(@webreg_result).to be_truthy
  case @webreg_result
    when WebReg::UserIdTaken
      message = @webreg_result.message
      #logger.step "USER ID IS TAKEN!  #{message}"
      raise "USER ID IS TAKEN!  #{message}"
    when WebReg::ChooseSupplies
      if @webreg_result.present?
        @web_mail = @webreg_result.place_order
      end
    else
      raise "Unable to Place Order. Supplies page did not load"
  end
end

Then /^Registration Result: Wait for Download Page or Webpostage page to load$/ do
  case @webreg_result_page
    when MailLandingPage
      @webreg_result_page.wait_until_url_loads
    when WebReg::DownloadPage
      @web_mail.landing_page.wait_until_present 10
    else
      #do nothing
  end
end

Then(/^[Oo]n WebReg Profile page, expect Email Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect Email Help Block is #{expectation}"
  help_text = registration.profile.email.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Profile page, expect User ID Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect User ID Help Block is #{expectation}"
  help_text = registration.profile.user_id.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Profile page, expect Password Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect Password Help Block is #{expectation}"
  help_text = registration.profile.password.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Profile page, expect Re\-Type Password Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect Re-Type Help Block is #{expectation}"
  help_text = registration.profile.password.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Profile page, expect How will you use Stamps\.com Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect How will you use Stamps.com Help Block is #{expectation}"
  help_text = registration.profile.usage_type.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Profile page, expect How did you hear about us\? Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, How did you hear about us? Help Block is #{expectation}"
  referrer_name = registration.profile.referrer_name
  help_text = registration.profile.referrer_name.help_text if referrer_name.present?
  expect(help_text).to eql expectation if referrer_name.present?
end

Then(/^[Oo]n WebReg Profile page, expect 1st Question Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect 1st Question Help Block is #{expectation}"
  help_text = registration.profile.first_question.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Profile page, expect 1st Answer Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect 1st Answer Help Block is #{expectation}"
  help_text = registration.profile.first_answer.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Profile page, expect 2nd Question Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect 2n Question Help Block is #{expectation}"
  help_text = registration.profile.second_question.help_text
  expect(help_text).to eql expectation
end

Then(/^^[Oo]n WebReg Profile page, expect 2nd Answer Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect 2nd Answer Help Block is #{expectation}"
  help_text = registration.profile.second_answer.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Profile page, Tab from Email$/) do
  #logger.step "On WebReg Profile page, Tab from Email"
  browser.send_keys([:tab])
end

Then(/^[Oo]n WebReg Profile page, Tab$/) do
  #logger.step "On WebReg Profile page, Tab"
  registration.profile.tab
end

Then(/^Clear Email Field$/) do
  #logger.step "Clear Email Field"
  registration.profile.email.clear
end

Then(/^Clear User ID Field$/) do
  #logger.step "Clear User ID Field"
  registration.profile.user_id.clear
end

Then(/^Clear How will you use Stamps\.com\?$/) do
  #logger.step "Clear How will you use Stamps.com?"
  registration.profile.usage_type.clear
end

Then(/^Clear How did you hear about us\?/) do
  #logger.step "Clear How did you hear about us?"
  registration.profile.referrer_name.clear if registration.profile.referrer_name.present?
end

Then(/^Clear 1st Question$/) do
  #logger.step "Clear 1st Question Selection"
  registration.profile.first_question.clear
end

Then(/^Clear 2nd Question$/) do
  #logger.step "Clear 1st Question Selection"
  registration.profile.second_question.clear
end



Then /^[Ee]xpect WebReg navigation bar Stamps logo exists$/ do
   expect(registration.navigation.stamps_logo.present?).to be(true)
end

Then /^[Ee]xpect WebReg navigation bar USPS logo exists$/ do
  expect(registration.navigation.usps_logo.present?).to be(true)
end

Then /^[Ee]xpect WebReg Profile bread crumbs to contain (.*)$/ do |str|
  expect(registration.bread_crumbs).to eql(str), "Bread crumb #{str} does not exist "
end

Then /^[Ee]xpect WebReg Profile header contain (.*)$/ do |str|
  expect(registration.profile.header).to eql(str), "Profile header #{str} does not exist "
end

Then /^[Ee]xpect WebReg Profile email textbox exists$/ do
  expect(registration.profile.email.present?).to be(true), "Email textbox does not exists on profile page"
  registration.profile.email.present?
end

Then /^[Ee]xpect WebReg Profile username textbox exists$/ do
  expect(registration.profile.username.present?).to be (true), "Username textbox does not exist on profile page"
end

Then /^[Ee]xpect WebReg Profile password textbox exists$/ do
  expect(registration.profile.password.present?).to be (true), "Password textbox does not exist on profile page"
end

Then /^[Ee]xpect WebReg Profile retype password textbox exists$/ do
  expect(registration.profile.retype_password.present?).to be (true), "Retype password textbox does not exist on profile page"
end

Then /^[Ee]xpect WebReg Profile Usage Type list of values to contain (.*)$/ do |str|
  expect(registration.profile.dropdown).to eql(str)
end

Then /^[Ee]xpect WebReg Profile promo code textbox exists$/ do
  expect(registration.profile.promocode.present?).to be (true)
end

  Then /^[Ee]xpect WebReg Profile CONTINUE button exists$/ do
  expect(registration.profile_continue_button.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile content under Why do I need to create an account should contain (.*)$/ do |str|
    expect(registration.profile_content_createanaccount).to eql(str)
end

Then /^[Ee]xpect WebReg Profile content under Money-saving offers and new products should contain (.*)$/ do |str|
  expect(registration.profile_content_money_saving_offers).to eql(str)
end

Then /^[Ee]xpect WebReg Profile Money-saving offers and new products checkbox exist$/ do
  expect(registration.profile_moneysavingoffers_checkbox.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile Privacy Policy link exists$/ do
  expect(registration.profile_privacy_policy.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile copyright link exists$/ do
  expect(registration.profile_copyrightlink.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile Norton logo exists$/ do
  expect(registration.profile_nortonlogo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile TRUSTe logo exists$/ do
  expect(registration.profile_trustelogo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile LIVE chat button exists$/ do
  expect(registration.profile_livechatbutton.present?).to be (true)
end


