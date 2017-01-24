
Then /^Visit WebReg Registration Page$/ do
  #logger.step "Visit WebReg Registration Page"
  webreg.visit
  browser.should be_truthy
end

Then /^On WebReg Profile page,  Continue to Mailing Information page$/ do
  #logger.step "On WebReg Profile page,  Continue to Mailing Information page"
  webreg.profile.continue_to_mailing_info
end

Then /^On WebReg Profile page, set User ID and Email to (.*)$/ do |usr|
  if usr.downcase.include? "random"
    @webreg_data[:usr] = ParameterHelper.rand_username
  else
    @webreg_data[:usr] = usr
  end
  #logger.step "On WebReg Profile page, set User ID and Email to #{ @webreg_data[:usr]}"
  step "On WebReg Profile page, set Email to #{ @webreg_data[:usr]}@mailinator.com"
  step "On WebReg Profile page, set User ID to #{ @webreg_data[:usr]}"
end

Then /^On WebReg Profile page, set Email to (.*)$/ do |email|
  #logger.step "On WebReg Profile page, set Email to #{email}"
  webreg.profile.email.wait_until_present.set email
end

Then /^On WebReg Profile page, set User ID to (.*)$/ do |user_id|
  #logger.step "On WebReg Profile page, set User ID to #{user_id}"
  @webreg_data[:usr] = user_id
  webreg.profile.user_id.set user_id
end

Then /^On WebReg Profile page, set Password to (.*)$/ do |password|
  #logger.step "On WebReg Profile page, set Password to #{password}"
  @webreg_data[:pw]=password
  webreg.profile.password.set @webreg_data[:pw]
end

Then /^On WebReg Profile page, set Re-Type password to (.*)$/ do |password|
  #logger.step "On WebReg Profile page, set Re-Type password to #{password}"
  webreg.profile.retype_password.set password
end

Then /^On WebReg Profile page, set Referrer Name to Web Banner$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Web Banner"
  referrer_name = webreg.profile.referrer_name
  referrer_name.web_banner if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Radio Podcast Streaming Audio$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Radio/Podcast/Streaming Audio"
  referrer_name = webreg.profile.referrer_name
  referrer_name.streaming_audio if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Television Commercial$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Television Commercial"
  referrer_name = webreg.profile.referrer_name
  referrer_name.television_commercial if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Telephone Call$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Telephone Call"
  referrer_name = webreg.profile.referrer_name
  referrer_name.telephone_call if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Other$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Other"
  referrer_name = webreg.profile.referrer_name
  referrer_name.other if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Recommended by Friend$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Recommended by Friend"
  referrer_name = webreg.profile.referrer_name
  referrer_name.recommended_by_friend if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Recommended by USPS$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Recommended by USPS"
  referrer_name = webreg.profile.referrer_name
  referrer_name.recommended_by_usps if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Newspaper Ad$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Newspaper Ad"
  referrer_name = webreg.profile.referrer_name
  webreg.profile.referrer_name.newspapaer_ad if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Magazine Ad$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Magazine Ad"
  referrer_name = webreg.profile.referrer_name
  referrer_name.magazine_ad if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Received Mailer$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Received Mailer"
  referrer_name = webreg.profile.referrer_name
  webreg.profile.referrer_name.received_mailer if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Already used in office$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Already used in office"
  referrer_name = webreg.profile.referrer_name
  referrer_name.already_used_in_office if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Trade show convention$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Trade show/convention"
  referrer_name = webreg.profile.referrer_name
  webreg.profile.referrer_name.trade_show if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Web Search$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Web Search"
  referrer_name = webreg.profile.referrer_name
  referrer_name.web_search if referrer_name.present?
end

Then /^On WebReg Profile page, set Referrer Name to Email from Stamps$/ do
  #logger.step "On WebReg Profile page, set Referrer Name to Email from Stamps.com"
  referrer_name = webreg.profile.referrer_name
  referrer_name.email_from_stamps if referrer_name.present?
end

Then /^On WebReg Profile page, set How did you hear about us to Web Banner$/ do |how|
  #logger.step "On WebReg Profile page, set Email to #{email}"
  webreg.profile.email.set email
end

Then /^On WebReg Profile page, set How will you use Stamps.com to Mostly Mailing$/ do
  #logger.step "On WebReg Profile page, set How will you use Stamps.com to Mostly Mailing"
  webreg.profile.usage_type.mostly_mailing
end

Then /^On WebReg Profile page, set How will you use Stamps.com to Mostly Shipping$/ do
  #logger.step "On WebReg Profile page, set How will you use Stamps.com to Mostly Shipping"
  webreg.profile.usage_type.mostly_shipping
end

Then /^On WebReg Profile page, set How will you use Stamps.com to Both Mailing and Shipping$/ do
  #logger.step "On WebReg Profile page, set How will you use Stamps.com to Both Mailing and Shipping"
  webreg.profile.usage_type.mailing_and_shipping
end

Then /^On WebReg Profile page, set How will you use Stamps.com to Home Office$/ do
  #logger.step "On WebReg Profile page, set How will you use Stamps.com to Home Office"
  webreg.profile.usage_type.individual
end

Then /^On WebReg Profile page, set 1st Answer to (.*)$/ do |answer|
  #logger.step "On WebReg Profile page, set 1st Answer to #{answer}"
  @webreg_data[:answer] = answer
  webreg.profile.first_answer.set @webreg_data[:answer]
end

Then /^On WebReg Profile page, set 2nd Answer to (.*)$/ do |answer|
  #logger.step "On WebReg Profile page, set 2nd Answer to #{answer}"
  @webreg_data[:answer_2] = answer
  webreg.profile.second_answer.set @webreg_data[:answer_2]
end

Then /^On WebReg Profile page, set Send me special money-saving offers to checked$/ do
  #logger.step "On WebReg Profile page, set Send me special money-saving offers to checked"
  webreg.profile.send_promo.click
end

Then /^On WebReg Profile page, set Send me special money-saving offers to unchecked$/ do
  #logger.step "On WebReg Profile page, set Send me special money-saving offers to unchecked"
  webreg.profile.send_promo.click
end

Then /^On WebReg Profile page, set 1st Question to What is your mother's maiden name$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What is your mother's maiden name?"
  webreg.profile.first_question.mothers_maiden_name
end

Then /^On WebReg Profile page, set 1st Question to What is your pet's name$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What is your pet's name?"
  webreg.profile.first_question.pets_name
end

Then /^On WebReg Profile page, set 1st Question to What is your city of birth$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What is your city of birth"
  webreg.profile.first_question.birth_city
end

Then /^On WebReg Profile page, set 1st Question to What is your father's birthplace$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What is your father's birthplace"
  webreg.profile.first_question.fathers_birth_place
end

Then /^On WebReg Profile page, set 1st Question to What street did you grow up on$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What street did you grow up on"
  webreg.profile.first_question.mothers_maiden_name
end

Then /^On WebReg Profile page, set 1st Question to What is the name of your first school$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What is the name of your first school"
  webreg.profile.first_question.street_name
end

Then /^On WebReg Profile page, set 1st Question to What is the make and model of your first car$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What is the make and model of your first car"
  webreg.profile.first_question.first_cars_make_model
end

Then /^On WebReg Profile page, set 2nd Question to What is your mother's maiden name$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What is your mother's maiden name?"
  webreg.profile.second_question.mothers_maiden_name
end

Then /^On WebReg Profile page, set 2nd Question to What is your pet's name$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What is your pet's name?"
  webreg.profile.second_question.pets_name
end

Then /^On WebReg Profile page, set 2nd Question to What is your city of birth$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What is your city of birth"
  webreg.profile.second_question.birth_city
end

Then /^On WebReg Profile page, set 2nd Question to What is your father's birthplace$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What is your father's birthplace"
  webreg.profile.second_question.fathers_birth_place
end

Then /^On WebReg Profile page, set 2nd Question to What street did you grow up on$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What street did you grow up on"
  webreg.profile.second_question.street_name
end

Then /^On WebReg Profile page, set 2nd Question to What is the name of your first school$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What is the name of your first school"
  webreg.profile.second_question.street_name
end

Then /^On WebReg Profile page, set 2nd Question to What is the make and model of your first car$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What is the make and model of your first car"
  webreg.profile.second_question.first_cars_make_model
end

Then /^On WebReg Profile page, set 2nd Question to What was your high school mascot$/ do
  #logger.step "On WebReg Profile page, set 1st Question to What was your high school mascot"
  webreg.profile.second_question.high_school_mascot
end

Then /^On WebReg Profile page, Continue$/ do
  #logger.step "On WebReg Profile page, Continue"
  webreg.profile.continue.click
end

Then /^On WebReg Profile page, continue to Mailing Information page$/ do
  #logger.step "On WebReg Profile page, continue to Mailing Information page"
  10.times do
    webreg.profile.continue.click
    sleep 1
    break if webreg.profile.membership.present?
  end
  "Unable to continue....".should eql "Mailing Information page Did not load." unless webreg.profile.membership.present?
end

Then /^Registration Choose Supplies: Place Order$/ do
  @webreg_result.should be_truthy
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

Then(/^On WebReg Profile page, expect Email Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect Email Help Block is #{expectation}"
  help_text = webreg.profile.email.help_text
  help_text.should eql expectation
end

Then(/^On WebReg Profile page, expect User ID Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect User ID Help Block is #{expectation}"
  help_text = webreg.profile.user_id.help_text
  help_text.should eql expectation
end

Then(/^On WebReg Profile page, expect Password Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect Password Help Block is #{expectation}"
  help_text = webreg.profile.password.help_text
  help_text.should eql expectation
end

Then(/^On WebReg Profile page, expect Re\-Type Password Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect Re-Type Help Block is #{expectation}"
  help_text = webreg.profile.password.help_text
  help_text.should eql expectation
end

Then(/^On WebReg Profile page, expect How will you use Stamps\.com Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect How will you use Stamps.com Help Block is #{expectation}"
  help_text = webreg.profile.usage_type.help_text
  help_text.should eql expectation
end

Then(/^On WebReg Profile page, expect How did you hear about us\? Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, How did you hear about us? Help Block is #{expectation}"
  referrer_name = webreg.profile.referrer_name
  help_text = webreg.profile.referrer_name.help_text if referrer_name.present?
  help_text.should eql expectation if referrer_name.present?
end

Then(/^On WebReg Profile page, expect 1st Question Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect 1st Question Help Block is #{expectation}"
  help_text = webreg.profile.first_question.help_text
  help_text.should eql expectation
end

Then(/^On WebReg Profile page, expect 1st Answer Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect 1st Answer Help Block is #{expectation}"
  help_text = webreg.profile.first_answer.help_text
  help_text.should eql expectation
end

Then(/^On WebReg Profile page, expect 2nd Question Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect 2n Question Help Block is #{expectation}"
  help_text = webreg.profile.second_question.help_text
  help_text.should eql expectation
end

Then(/^^On WebReg Profile page, expect 2nd Answer Help Block is (.*)$/) do |expectation|
  #logger.step "On WebReg Profile page, expect 2nd Answer Help Block is #{expectation}"
  help_text = webreg.profile.second_answer.help_text
  help_text.should eql expectation
end

Then(/^On WebReg Profile page, Tab from Email$/) do
  #logger.step "On WebReg Profile page, Tab from Email"
  browser.send_keys([:tab])
end

Then(/^On WebReg Profile page, Tab$/) do
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


