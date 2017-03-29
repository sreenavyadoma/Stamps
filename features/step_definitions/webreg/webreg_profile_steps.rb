
Then /^Visit WebReg Registration Page$/ do
  #logger.step "Visit WebReg Registration Page"
  webreg.visit
  expect(browser).to be_truthy
end

Then /^(?:O|o)n WebReg Profile page, Continue to Mailing Information page$/ do
  #logger.step "On WebReg Profile page, Continue to Mailing Information page"
  webreg.profile.continue_to_mailing_info
end

Then /^[Ss]et WebReg Profile User ID and Email to (.*)$/ do |usr|
  if usr.downcase.include? 'random'
    test_parameter[:usr] = ParameterHelper.rand_username
  else
    test_parameter[:usr] = usr
  end
  #logger.step "set WebReg Profile User ID and Email to #{ test_data[:usr]}"
  step "set WebReg Profile Email to #{ test_parameter[:usr]}@mailinator.com"
  step "set WebReg Profile User ID to #{ test_parameter[:usr]}"
end

Then /^[Ss]et WebReg Profile Email to (.*)$/ do |email|
  #logger.step "set WebReg Profile Email to #{email}"
  webreg.profile.email.wait_until_present.set email
end

Then /^[Ss]et WebReg Profile User ID to (.*)$/ do |user_id|
  #logger.step "set WebReg Profile User ID to #{user_id}"
  test_parameter[:usr] = user_id
  webreg.profile.user_id.set user_id
end

Then /^[Ss]et WebReg Profile Password to (.*)$/ do |password|
  test_parameter[:pw]=password
  webreg.profile.password.set test_parameter[:pw]
end

Then /^[Ss]et WebReg Profile Re-Type password to (.*)$/ do |password|
  webreg.profile.retype_password.set password
end

Then /^[Ss]et WebReg Profile Referrer Name to Web Banner$/ do
  referrer_name = webreg.profile.referrer_name
  referrer_name.web_banner if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Radio Podcast Streaming Audio$/ do
  referrer_name = webreg.profile.referrer_name
  referrer_name.streaming_audio if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Television Commercial$/ do
  referrer_name = webreg.profile.referrer_name
  referrer_name.television_commercial if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Telephone Call$/ do
  referrer_name = webreg.profile.referrer_name
  referrer_name.telephone_call if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Other$/ do
  referrer_name = webreg.profile.referrer_name
  referrer_name.other if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Recommended by Friend$/ do
  referrer_name = webreg.profile.referrer_name
  referrer_name.recommended_by_friend if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Recommended by USPS$/ do
  referrer_name = webreg.profile.referrer_name
  referrer_name.recommended_by_usps if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Newspaper Ad$/ do
  referrer_name = webreg.profile.referrer_name
  webreg.profile.referrer_name.newspapaer_ad if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Magazine Ad$/ do
  referrer_name = webreg.profile.referrer_name
  referrer_name.magazine_ad if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Received Mailer$/ do
  referrer_name = webreg.profile.referrer_name
  webreg.profile.referrer_name.received_mailer if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Already used in office$/ do
  referrer_name = webreg.profile.referrer_name
  referrer_name.already_used_in_office if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Trade show convention$/ do
  referrer_name = webreg.profile.referrer_name
  webreg.profile.referrer_name.trade_show if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Web Search$/ do
  referrer_name = webreg.profile.referrer_name
  referrer_name.web_search if referrer_name.present?
end

Then /^[Ss]et WebReg Profile Referrer Name to Email from Stamps$/ do
  referrer_name = webreg.profile.referrer_name
  referrer_name.email_from_stamps if referrer_name.present?
end

Then /^[Ss]et WebReg Profile How did you hear about us to Web Banner$/ do
  webreg.profile.email.set email
end

Then /^[Ss]et WebReg Profile How will you use Stamps.com to Mostly Mailing$/ do
  webreg.profile.usage_type.mostly_mailing
end

Then /^[Ss]et WebReg Profile How will you use Stamps.com to Mostly Shipping$/ do
  webreg.profile.usage_type.mostly_shipping
end

Then /^[Ss]et WebReg Profile How will you use Stamps.com to Both Mailing and Shipping$/ do
  webreg.profile.usage_type.mailing_and_shipping
end

Then /^[Ss]et WebReg Profile How will you use Stamps.com to Home Office$/ do
  webreg.profile.usage_type.individual
end

Then /^[Ss]et WebReg Profile 1st Answer to (.*)$/ do |answer|
  test_parameter[:answer] = answer
  webreg.profile.first_answer.set test_parameter[:answer]
end

Then /^[Ss]et WebReg Profile 2nd Answer to (.*)$/ do |answer|
  test_parameter[:answer_2] = answer
  webreg.profile.second_answer.set test_parameter[:answer_2]
end

Then /^[Ss]et WebReg Profile Send me special money-saving offers to checked$/ do
  webreg.profile.send_promo.click
end

Then /^[Ss]et WebReg Profile Send me special money-saving offers to unchecked$/ do
  webreg.profile.send_promo.click
end

Then /^[Ss]et WebReg Profile 1st Question to What is your mother's maiden name$/ do
  webreg.profile.first_question.mothers_maiden_name
end

Then /^[Ss]et WebReg Profile 1st Question to What is your pet's name$/ do
  webreg.profile.first_question.pets_name
end

Then /^[Ss]et WebReg Profile 1st Question to What is your city of birth$/ do
  webreg.profile.first_question.birth_city
end

Then /^[Ss]et WebReg Profile 1st Question to What is your father's birthplace$/ do
  #logger.step "set WebReg Profile 1st Question to What is your father's birthplace"
  webreg.profile.first_question.fathers_birth_place
end

Then /^[Ss]et WebReg Profile 1st Question to What street did you grow up on$/ do
  #logger.step "set WebReg Profile 1st Question to What street did you grow up on"
  webreg.profile.first_question.mothers_maiden_name
end

Then /^[Ss]et WebReg Profile 1st Question to What is the name of your first school$/ do
  #logger.step "set WebReg Profile 1st Question to What is the name of your first school"
  webreg.profile.first_question.street_name
end

Then /^[Ss]et WebReg Profile 1st Question to What is the make and model of your first car$/ do
  #logger.step "set WebReg Profile 1st Question to What is the make and model of your first car"
  webreg.profile.first_question.first_cars_make_model
end

Then /^[Ss]et WebReg Profile 2nd Question to What is your mother's maiden name$/ do
  #logger.step "set WebReg Profile 1st Question to What is your mother's maiden name?"
  webreg.profile.second_question.mothers_maiden_name
end

Then /^[Ss]et WebReg Profile 2nd Question to What is your pet's name$/ do
  #logger.step "set WebReg Profile 1st Question to What is your pet's name?"
  webreg.profile.second_question.pets_name
end

Then /^[Ss]et WebReg Profile 2nd Question to What is your city of birth$/ do
  #logger.step "set WebReg Profile 1st Question to What is your city of birth"
  webreg.profile.second_question.birth_city
end

Then /^[Ss]et WebReg Profile 2nd Question to What is your father's birthplace$/ do
  #logger.step "set WebReg Profile 1st Question to What is your father's birthplace"
  webreg.profile.second_question.fathers_birth_place
end

Then /^[Ss]et WebReg Profile 2nd Question to What street did you grow up on$/ do
  #logger.step "set WebReg Profile 1st Question to What street did you grow up on"
  webreg.profile.second_question.street_name
end

Then /^[Ss]et WebReg Profile 2nd Question to What is the name of your first school$/ do
  #logger.step "set WebReg Profile 1st Question to What is the name of your first school"
  webreg.profile.second_question.street_name
end

Then /^[Ss]et WebReg Profile 2nd Question to What is the make and model of your first car$/ do
  #logger.step "set WebReg Profile 1st Question to What is the make and model of your first car"
  webreg.profile.second_question.first_cars_make_model
end

Then /^[Ss]et WebReg Profile 2nd Question to What was your high school mascot$/ do
  #logger.step "set WebReg Profile 1st Question to What was your high school mascot"
  webreg.profile.second_question.high_school_mascot
end

Then /^(?:O|o)n WebReg Profile page, Continue$/ do
  #logger.step "On WebReg Profile page, Continue"
  webreg.profile.continue.click
end

Then /^(?:O|o)n WebReg Profile page, continue to Mailing Information page$/ do
  #logger.step "On WebReg Profile page, continue to Mailing Information page"
  10.times do
    webreg.profile.continue.click
    sleep(0.35)
    break if webreg.profile.membership.present?
  end
  expect("Unable to continue....").to eql "Mailing Information page Did not load." unless webreg.profile.membership.present?
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

Then(/^(?:O|o)n WebReg Profile page, expect Email Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect Email Help Block is #{expectation}"
  help_text = webreg.profile.email.help_text
  expect(help_text).to eql expectation
end

Then(/^(?:O|o)n WebReg Profile page, expect User ID Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect User ID Help Block is #{expectation}"
  help_text = webreg.profile.user_id.help_text
  expect(help_text).to eql expectation
end

Then(/^(?:O|o)n WebReg Profile page, expect Password Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect Password Help Block is #{expectation}"
  help_text = webreg.profile.password.help_text
  expect(help_text).to eql expectation
end

Then(/^(?:O|o)n WebReg Profile page, expect Re\-Type Password Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect Re-Type Help Block is #{expectation}"
  help_text = webreg.profile.password.help_text
  expect(help_text).to eql expectation
end

Then(/^(?:O|o)n WebReg Profile page, expect How will you use Stamps\.com Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect How will you use Stamps.com Help Block is #{expectation}"
  help_text = webreg.profile.usage_type.help_text
  expect(help_text).to eql expectation
end

Then(/^(?:O|o)n WebReg Profile page, expect How did you hear about us\? Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, How did you hear about us? Help Block is #{expectation}"
  referrer_name = webreg.profile.referrer_name
  help_text = webreg.profile.referrer_name.help_text if referrer_name.present?
  expect(help_text).to eql expectation if referrer_name.present?
end

Then(/^(?:O|o)n WebReg Profile page, expect 1st Question Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect 1st Question Help Block is #{expectation}"
  help_text = webreg.profile.first_question.help_text
  expect(help_text).to eql expectation
end

Then(/^(?:O|o)n WebReg Profile page, expect 1st Answer Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect 1st Answer Help Block is #{expectation}"
  help_text = webreg.profile.first_answer.help_text
  expect(help_text).to eql expectation
end

Then(/^(?:O|o)n WebReg Profile page, expect 2nd Question Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect 2n Question Help Block is #{expectation}"
  help_text = webreg.profile.second_question.help_text
  expect(help_text).to eql expectation
end

Then(/^^(?:O|o)n WebReg Profile page, expect 2nd Answer Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect 2nd Answer Help Block is #{expectation}"
  help_text = webreg.profile.second_answer.help_text
  expect(help_text).to eql expectation
end

Then(/^(?:O|o)n WebReg Profile page, Tab from Email$/) do
  #logger.step "On WebReg Profile page, Tab from Email"
  browser.send_keys([:tab])
end

Then(/^(?:O|o)n WebReg Profile page, Tab$/) do
  #logger.step "On WebReg Profile page, Tab"
  webreg.profile.tab
end

Then(/^Clear Email Field$/) do
  #logger.step "Clear Email Field"
  webreg.profile.email.clear
end

Then(/^Clear User ID Field$/) do
  #logger.step "Clear User ID Field"
  webreg.profile.user_id.clear
end

Then(/^Clear How will you use Stamps\.com\?$/) do
  #logger.step "Clear How will you use Stamps.com?"
  webreg.profile.usage_type.clear
end

Then(/^Clear How did you hear about us\?/) do
  #logger.step "Clear How did you hear about us?"
  webreg.profile.referrer_name.clear if webreg.profile.referrer_name.present?
end

Then(/^Clear 1st Question$/) do
  #logger.step "Clear 1st Question Selection"
  webreg.profile.first_question.clear
end

Then(/^Clear 2nd Question$/) do
  #logger.step "Clear 1st Question Selection"
  webreg.profile.second_question.clear
end


