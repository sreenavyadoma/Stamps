Then /^Generate Username$/ do
  ENV['WEB_REG_USR'] = ParameterHelper.rand_username
  logger.message "Generate Username: #{ENV['WEB_REG_USR']}"
  logger.message "Generate Username: #{ENV['WEB_REG_USR']}"
  logger.message "Generate Username: #{ENV['WEB_REG_USR']}"
  logger.message "Generate Username: #{ENV['WEB_REG_USR']}"
  logger.message "Generate Username: #{ENV['WEB_REG_USR']}"
end

Then /^Output Username$/ do
  logger.message "Output Username: #{ENV['WEB_REG_USR']}"
  logger.message "Output Username: #{ENV['WEB_REG_USR']}"
  logger.message "Output Username: #{ENV['WEB_REG_USR']}"
  logger.message "Output Username: #{ENV['WEB_REG_USR']}"
  logger.message "Output Username: #{ENV['WEB_REG_USR']}"
end

Then /^WebReg Profile: Load Registration Page$/ do
  logger.step "WebReg Profile: Load Registration Page"
  status = webreg.visit
  status.should eql "Success"
end

Then /^WebReg Profile:  Continue to Mailing Information Page$/ do
  logger.step "WebReg Profile:  Continue to Mailing Information Page"
  webreg.profile.continue_to_mailing_info
end

Then /^WebReg Profile: Set User ID and Email from Jenkins$/ do
  if ENV['USERNAME'].nil? || ENV['USERNAME'].size==0
    raise "No username specified when test was ran.  Don't forget to assign a value to USERNAME."
  else
    @username = ENV['USERNAME']
  end
  logger.step "WebReg Profile: Set User ID and Email to #{@username}"
  step "WebReg Profile: Set Email to #{@username}@mailinator.com"
  step "WebReg Profile: Set User ID to #{@username}"
end

Then /^WebReg Profile: Set User ID and Email to (.*)$/ do |usr|
  if usr.downcase.include? "random"
    @username = ParameterHelper.rand_username
  else
    @username = usr
  end
  logger.step "WebReg Profile: Set User ID and Email to #{@username}"
  step "WebReg Profile: Set Email to #{@username}@mailinator.com"
  step "WebReg Profile: Set User ID to #{@username}"
end

Then /^WebReg Profile: Set Email to (.*)$/ do |email|
  logger.step "WebReg Profile: Set Email to #{email}"
  webreg.profile.email.wait_until_present.set email
end

Then /^WebReg Profile: Set User ID to (.*)$/ do |user_id|
  logger.step "WebReg Profile: Set User ID to #{user_id}"
  webreg.profile.user_id.set user_id
end

Then /^WebReg Profile: Set Password to (.*)$/ do |password|
  logger.step "WebReg Profile: Set Password to #{password}"
  @password=password
  webreg.profile.password.set password
end

Then /^WebReg Profile: Set Re-Type password to (.*)$/ do |password|
  logger.step "WebReg Profile: Set Re-Type password to #{password}"
  @password=password
  webreg.profile.retype_password.set password
end

Then /^WebReg Profile: Set Referrer Name to Web Banner$/ do
  logger.step "WebReg Profile: Set Referrer Name to Web Banner"
  referrer_name = webreg.profile.referrer_name
  referrer_name.web_banner if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Radio Podcast Streaming Audio$/ do
  logger.step "WebReg Profile: Set Referrer Name to Radio/Podcast/Streaming Audio"
  referrer_name = webreg.profile.referrer_name
  referrer_name.streaming_audio if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Television Commercial$/ do
  logger.step "WebReg Profile: Set Referrer Name to Television Commercial"
  referrer_name = webreg.profile.referrer_name
  referrer_name.television_commercial if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Telephone Call$/ do
  logger.step "WebReg Profile: Set Referrer Name to Telephone Call"
  referrer_name = webreg.profile.referrer_name
  referrer_name.telephone_call if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Other$/ do
  logger.step "WebReg Profile: Set Referrer Name to Other"
  referrer_name = webreg.profile.referrer_name
  referrer_name.other if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Recommended by Friend$/ do
  logger.step "WebReg Profile: Set Referrer Name to Recommended by Friend"
  referrer_name = webreg.profile.referrer_name
  referrer_name.recommended_by_friend if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Recommended by USPS$/ do
  logger.step "WebReg Profile: Set Referrer Name to Recommended by USPS"
  referrer_name = webreg.profile.referrer_name
  referrer_name.recommended_by_usps if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Newspaper Ad$/ do
  logger.step "WebReg Profile: Set Referrer Name to Newspaper Ad"
  referrer_name = webreg.profile.referrer_name
  webreg.profile.referrer_name.newspapaer_ad if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Magazine Ad$/ do
  logger.step "WebReg Profile: Set Referrer Name to Magazine Ad"
  referrer_name = webreg.profile.referrer_name
  referrer_name.magazine_ad if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Received Mailer$/ do
  logger.step "WebReg Profile: Set Referrer Name to Received Mailer"
  referrer_name = webreg.profile.referrer_name
  webreg.profile.referrer_name.received_mailer if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Already used in office$/ do
  logger.step "WebReg Profile: Set Referrer Name to Already used in office"
  referrer_name = webreg.profile.referrer_name
  referrer_name.already_used_in_office if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Trade show convention$/ do
  logger.step "WebReg Profile: Set Referrer Name to Trade show/convention"
  referrer_name = webreg.profile.referrer_name
  webreg.profile.referrer_name.trade_show if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Web Search$/ do
  logger.step "WebReg Profile: Set Referrer Name to Web Search"
  referrer_name = webreg.profile.referrer_name
  referrer_name.web_search if referrer_name.present?
end

Then /^WebReg Profile: Set Referrer Name to Email from Stamps$/ do
  logger.step "WebReg Profile: Set Referrer Name to Email from Stamps.com"
  referrer_name = webreg.profile.referrer_name
  referrer_name.email_from_stamps if referrer_name.present?
end

Then /^WebReg Profile: Set How did you hear about us to Web Banner$/ do |how|
  logger.step "WebReg Profile: Set Email to #{email}"
  webreg.profile.email.set email
end

Then /^WebReg Profile: Set How will you use Stamps.com to Mostly Mailing$/ do
  logger.step "WebReg Profile: Set How will you use Stamps.com to Mostly Mailing"
  webreg.profile.usage_type.mostly_mailing
end

Then /^WebReg Profile: Set How will you use Stamps.com to Mostly Shipping$/ do
  logger.step "WebReg Profile: Set How will you use Stamps.com to Mostly Shipping"
  webreg.profile.usage_type.mostly_shipping
end

Then /^WebReg Profile: Set How will you use Stamps.com to Both Mailing and Shipping$/ do
  logger.step "WebReg Profile: Set How will you use Stamps.com to Both Mailing and Shipping"
  webreg.profile.usage_type.mailing_and_shipping
end

Then /^WebReg Profile: Set How will you use Stamps.com to Home Office$/ do
  logger.step "WebReg Profile: Set How will you use Stamps.com to Home Office"
  webreg.profile.usage_type.individual
end

Then /^WebReg Profile: Set 1st Answer to (.*)$/ do |answer|
  logger.step "WebReg Profile: Set 1st Answer to #{answer}"
  webreg.profile.first_answer.set answer
end

Then /^WebReg Profile: Set 2nd Answer to (.*)$/ do |answer|
  logger.step "WebReg Profile: Set 2nd Answer to #{answer}"
  webreg.profile.second_answer.set answer
end

Then /^WebReg Profile: Set Send me special money-saving offers to checked$/ do
  logger.step "WebReg Profile: Set Send me special money-saving offers to checked"
  webreg.profile.send_promo.click
end

Then /^WebReg Profile: Set Send me special money-saving offers to unchecked$/ do
  logger.step "WebReg Profile: Set Send me special money-saving offers to unchecked"
  webreg.profile.send_promo.click
end

Then /^WebReg Profile: Set 1st Question to What is your mother's maiden name$/ do
  logger.step "WebReg Profile: Set 1st Question to What is your mother's maiden name?"
  webreg.profile.first_question.mothers_maiden_name
end

Then /^WebReg Profile: Set 1st Question to What is your pet's name$/ do
  logger.step "WebReg Profile: Set 1st Question to What is your pet's name?"
  webreg.profile.first_question.pets_name
end

Then /^WebReg Profile: Set 1st Question to What is your city of birth$/ do
  logger.step "WebReg Profile: Set 1st Question to What is your city of birth"
  webreg.profile.first_question.birth_city
end

Then /^WebReg Profile: Set 1st Question to What is your father's birthplace$/ do
  logger.step "WebReg Profile: Set 1st Question to What is your father's birthplace"
  webreg.profile.first_question.fathers_birth_place
end

Then /^WebReg Profile: Set 1st Question to What street did you grow up on$/ do
  logger.step "WebReg Profile: Set 1st Question to What street did you grow up on"
  webreg.profile.first_question.mothers_maiden_name
end

Then /^WebReg Profile: Set 1st Question to What is the name of your first school$/ do
  logger.step "WebReg Profile: Set 1st Question to What is the name of your first school"
  webreg.profile.first_question.street_name
end

Then /^WebReg Profile: Set 1st Question to What is the make and model of your first car$/ do
  logger.step "WebReg Profile: Set 1st Question to What is the make and model of your first car"
  webreg.profile.first_question.first_cars_make_model
end

Then /^WebReg Profile: Set 2nd Question to What is your mother's maiden name$/ do
  logger.step "WebReg Profile: Set 1st Question to What is your mother's maiden name?"
  webreg.profile.second_question.mothers_maiden_name
end

Then /^WebReg Profile: Set 2nd Question to What is your pet's name$/ do
  logger.step "WebReg Profile: Set 1st Question to What is your pet's name?"
  webreg.profile.second_question.pets_name
end

Then /^WebReg Profile: Set 2nd Question to What is your city of birth$/ do
  logger.step "WebReg Profile: Set 1st Question to What is your city of birth"
  webreg.profile.second_question.birth_city
end

Then /^WebReg Profile: Set 2nd Question to What is your father's birthplace$/ do
  logger.step "WebReg Profile: Set 1st Question to What is your father's birthplace"
  webreg.profile.second_question.fathers_birth_place
end

Then /^WebReg Profile: Set 2nd Question to What street did you grow up on$/ do
  logger.step "WebReg Profile: Set 1st Question to What street did you grow up on"
  webreg.profile.second_question.street_name
end

Then /^WebReg Profile: Set 2nd Question to What is the name of your first school$/ do
  logger.step "WebReg Profile: Set 1st Question to What is the name of your first school"
  webreg.profile.second_question.street_name
end

Then /^WebReg Profile: Set 2nd Question to What is the make and model of your first car$/ do
  logger.step "WebReg Profile: Set 1st Question to What is the make and model of your first car"
  webreg.profile.second_question.first_cars_make_model
end

Then /^WebReg Profile: Set 2nd Question to What was your high school mascot$/ do
  logger.step "WebReg Profile: Set 1st Question to What was your high school mascot"
  webreg.profile.second_question.high_school_mascot
end

Then /^WebReg Profile: Continue$/ do
  logger.step "WebReg Profile: Continue"
  webreg.profile.continue.click
end

Then /^WebReg Profile: Continue to Mailing Information Page$/ do
  logger.step "WebReg Profile: Continue to Mailing Information Page"
  10.times do
    webreg.profile.continue.click
    sleep 1
    break if webreg.profile.membership.present?
  end
  "Unable to continue....".should eql "Mailing Information Page Did not load." unless webreg.profile.membership.present?
end

Then /^Registration Choose Supplies: Place Order$/ do
  @webreg_result.should be_truthy
  case @webreg_result
    when WebReg::UserIdTaken
      message = @webreg_result.message
      logger.step "USER ID IS TAKEN!  #{message}"
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

Then(/^WebReg Profile: Expect Email Help Block is (.*)$/) do |expectation|
  logger.step "WebReg Profile: Expect Email Help Block is #{expectation}"
  help_text = webreg.profile.email.help_block
  help_text.should eql expectation
end

Then(/^WebReg Profile: Expect User ID Help Block is (.*)$/) do |expectation|
  logger.step "WebReg Profile: Expect User ID Help Block is #{expectation}"
  help_text = webreg.profile.user_id.help_block
  help_text.should eql expectation
end

Then(/^WebReg Profile: Expect Password Help Block is (.*)$/) do |expectation|
  logger.step "WebReg Profile: Expect Password Help Block is #{expectation}"
  help_text = webreg.profile.password.help_block
  help_text.should eql expectation
end

Then(/^WebReg Profile: Expect Re\-Type Password Help Block is (.*)$/) do |expectation|
  logger.step "WebReg Profile: Expect Re-Type Help Block is #{expectation}"
  help_text = webreg.profile.password.help_block
  help_text.should eql expectation
end

Then(/^WebReg Profile: Expect How will you use Stamps\.com Help Block is (.*)$/) do |expectation|
  logger.step "WebReg Profile: Expect How will you use Stamps.com Help Block is #{expectation}"
  help_text = webreg.profile.usage_type.help_block
  help_text.should eql expectation
end

Then(/^WebReg Profile: Expect How did you hear about us\? Help Block is (.*)$/) do |expectation|
  logger.step "WebReg Profile: How did you hear about us? Help Block is #{expectation}"
  referrer_name = webreg.profile.referrer_name
  help_text = webreg.profile.referrer_name.help_block if referrer_name.present?
  help_text.should eql expectation if referrer_name.present?
end

Then(/^WebReg Profile: Expect 1st Question Help Block is (.*)$/) do |expectation|
  logger.step "WebReg Profile: Expect 1st Question Help Block is #{expectation}"
  help_text = webreg.profile.first_question.help_block
  help_text.should eql expectation
end

Then(/^WebReg Profile: Expect 1st Answer Help Block is (.*)$/) do |expectation|
  logger.step "WebReg Profile: Expect 1st Answer Help Block is #{expectation}"
  help_text = webreg.profile.first_answer.help_block
  help_text.should eql expectation
end

Then(/^WebReg Profile: Expect 2nd Question Help Block is (.*)$/) do |expectation|
  logger.step "WebReg Profile: Expect 2n Question Help Block is #{expectation}"
  help_text = webreg.profile.second_question.help_block
  help_text.should eql expectation
end

Then(/^^WebReg Profile: Expect 2nd Answer Help Block is (.*)$/) do |expectation|
  logger.step "WebReg Profile: Expect 2nd Answer Help Block is #{expectation}"
  help_text = webreg.profile.second_answer.help_block
  help_text.should eql expectation
end

Then(/^WebReg Profile: Tab from Email$/) do
  logger.step "WebReg Profile: Tab from Email"
  browser.send_keys([:tab])
end

Then(/^WebReg Profile: Tab$/) do
  logger.step "WebReg Profile: Tab"
  webreg.profile.tab
end

Then(/^Clear Email Field$/) do
  logger.step "Clear Email Field"
  webreg.profile.email.clear
end

Then(/^Clear User ID Field$/) do
  logger.step "Clear User ID Field"
  webreg.profile.user_id.clear
end

Then(/^Clear How will you use Stamps\.com\?$/) do
  logger.step "Clear How will you use Stamps.com?"
  webreg.profile.usage_type.clear
end

Then(/^Clear How did you hear about us\?/) do
  logger.step "Clear How did you hear about us?"
  webreg.profile.referrer_name.clear if webreg.profile.referrer_name.present?
end

Then(/^Clear 1st Question$/) do
  logger.step "Clear 1st Question Selection"
  webreg.profile.first_question.clear
end

Then(/^Clear 2nd Question$/) do
  logger.step "Clear 1st Question Selection"
  webreg.profile.second_question.clear
end


