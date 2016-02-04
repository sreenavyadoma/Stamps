Then /^Registration page is loaded$/ do
  step "I launch default browser"
  log.info "Registration page is loaded"
  registration.visit :qa
end

Then /^Registration:  Continue to Mailing Information Page$/ do
  log.info "Registration:  Continue to Mailing Information Page"
  @profile = registration.profile if @profile.nil?
  @profile.continue_to_mailing_info
end

Then /^Registration: Set email to (.*)$/ do |email|
  log.info "Registration: Set email to #{email}"
  @profile = registration.profile if @profile.nil?
  email_field = @profile.email
  email_field.wait_until_present
  sleep 1
  email_field.set_until email
  email_field.set_until email
end

Then /^Registration: Set User ID to (.*)$/ do |user_id|
  log.info "Registration: Set User ID to #{user_id}"
  @profile = registration.profile if @profile.nil?
  @profile.user_id.set_until user_id
end

Then /^Registration: Set Password to (.*)$/ do |password|
  log.info "Registration: Set Password to #{password}"
  @profile = registration.profile if @profile.nil?
  @profile.password.set_until password
end

Then /^Registration: Set Re-Type password to (.*)$/ do |password|
  log.info "Registration: Set Re-Type password to #{password}"
  @profile = registration.profile if @profile.nil?
  @profile.retype_password.set_until password
end

Then /^Registration: Set Referrer Name to Web Banner$/ do
  log.info "Registration: Set Referrer Name to Web Banner"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.web_banner
end

Then /^Registration: Set Referrer Name to Radio Podcast Streaming Audio$/ do
  log.info "Registration: Set Referrer Name to Radio/Podcast/Streaming Audio"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.streaming_audio
end

Then /^Registration: Set Referrer Name to Television Commercial$/ do
  log.info "Registration: Set Referrer Name to Television Commercial"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.television_commercial
end

Then /^Registration: Set Referrer Name to Telephone Call$/ do
  log.info "Registration: Set Referrer Name to Telephone Call"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.telephone_call
end

Then /^Registration: Set Referrer Name to Other$/ do
  log.info "Registration: Set Referrer Name to Other"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.other
end

Then /^Registration: Set Referrer Name to Recommended by Friend$/ do
  log.info "Registration: Set Referrer Name to Recommended by Friend"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.recommended_by_friend
end

Then /^Registration: Set Referrer Name to Recommended by USPS$/ do
  log.info "Registration: Set Referrer Name to Recommended by USPS"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.recommended_by_usps
end

Then /^Registration: Set Referrer Name to Newspaper Ad$/ do
  log.info "Registration: Set Referrer Name to Newspaper Ad"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.newspapaer_ad
end

Then /^Registration: Set Referrer Name to Magazine Ad$/ do
  log.info "Registration: Set Referrer Name to Magazine Ad"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.magazine_ad
end

Then /^Registration: Set Referrer Name to Received Mailer$/ do
  log.info "Registration: Set Referrer Name to Received Mailer"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.received_mailer
end

Then /^Registration: Set Referrer Name to Already used in office$/ do
  log.info "Registration: Set Referrer Name to Already used in office"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.already_used_in_office
end

Then /^Registration: Set Referrer Name to Trade show convention$/ do
  log.info "Registration: Set Referrer Name to Trade show/convention"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.trade_show
end

Then /^Registration: Set Referrer Name to Web Search$/ do
  log.info "Registration: Set Referrer Name to Web Search"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.web_search
end

Then /^Registration: Set Referrer Name to Email from Stamps$/ do
  log.info "Registration: Set Referrer Name to Email from Stamps.com"
  @profile = registration.profile if @profile.nil?
  @profile.referrer_name.email_from_stamps
end

Then /^Registration: Set How did you hear about us to Web Banner$/ do |how|
  log.info "Registration: Set email to #{email}"
  @profile = registration.profile if @profile.nil?
  @profile.email.set_until email
end

Then /^Registration: Set How will you use Stamps.com to Mostly Mailing$/ do
  log.info "Registration: Set How will you use Stamps.com to Mostly Mailing"
  @profile = registration.profile if @profile.nil?
  @profile.usage_type.mostly_mailing
end

Then /^Registration: Set How will you use Stamps.com to Mostly Shipping$/ do
  log.info "Registration: Set How will you use Stamps.com to Mostly Shipping"
  @profile = registration.profile if @profile.nil?
  @profile.usage_type.mostly_shipping
end

Then /^Registration: Set How will you use Stamps.com to Both Mailing and Shipping$/ do
  log.info "Registration: Set How will you use Stamps.com to Both Mailing and Shipping"
  @profile = registration.profile if @profile.nil?
  @profile.usage_type.mailing_and_shipping
end

Then /^Registration: Set How will you use Stamps.com to Home Office$/ do
  log.info "Registration: Set How will you use Stamps.com to Home Office"
  @profile = registration.profile if @profile.nil?
  @profile.usage_type.individual
end

Then /^Registration: Set 1st Answer to (.*)$/ do |answer|
  log.info "Registration: Set 1st Answer to #{answer}"
  @profile = registration.profile if @profile.nil?
  @profile.first_answer.set_until answer
end

Then /^Registration: Set 2nd Answer to (.*)$/ do |answer|
  log.info "Registration: Set 2nd Answer to #{answer}"
  @profile = registration.profile if @profile.nil?
  @profile.second_answer.set_until answer
end

Then /^Registration: Set Send me special money-saving offers to checked$/ do
  log.info "Registration: Set Send me special money-saving offers to checked"
  @profile = registration.profile if @profile.nil?
  @profile.send_promo.click
end

Then /^Registration: Set Send me special money-saving offers to unchecked$/ do
  log.info "Registration: Set Send me special money-saving offers to unchecked"
  @profile = registration.profile if @profile.nil?
  @profile.send_promo.click
end

Then /^Registration: Continue$/ do
  log.info "Registration: Continue"
  @profile = registration.profile if @profile.nil?
  @profile.continue.click
end

Then /^Registration: Set 1st Question to What is your mother's maiden name$/ do
  log.info "Registration: Set 1st Question to What is your mother's maiden name?"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.mothers_maiden_name
end

Then /^Registration: Set 1st Question to What is your pet's name$/ do
  log.info "Registration: Set 1st Question to What is your pet's name?"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.pets_name
end

Then /^Registration: Set 1st Question to What is your city of birth$/ do
  log.info "Registration: Set 1st Question to What is your city of birth"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.birth_city
end

Then /^Registration: Set 1st Question to What is your father's birthplace$/ do
  log.info "Registration: Set 1st Question to What is your father's birthplace"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.fathers_birth_place
end

Then /^Registration: Set 1st Question to What street did you grow up on$/ do
  log.info "Registration: Set 1st Question to What street did you grow up on"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.mothers_maiden_name
end

Then /^Registration: Set 1st Question to What is the name of your first school$/ do
  log.info "Registration: Set 1st Question to What is the name of your first school"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.street_name
end

Then /^Registration: Set 1st Question to What is the make and model of your first car$/ do
  log.info "Registration: Set 1st Question to What is the make and model of your first car"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.first_cars_make_model
end

Then /^Registration: Set 2nd Question to What is your mother's maiden name$/ do
  log.info "Registration: Set 1st Question to What is your mother's maiden name?"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.mothers_maiden_name
end

Then /^Registration: Set 2nd Question to What is your pet's name$/ do
  log.info "Registration: Set 1st Question to What is your pet's name?"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.pets_name
end

Then /^Registration: Set 2nd Question to What is your city of birth$/ do
  log.info "Registration: Set 1st Question to What is your city of birth"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.birth_city
end

Then /^Registration: Set 2nd Question to What is your father's birthplace$/ do
  log.info "Registration: Set 1st Question to What is your father's birthplace"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.fathers_birth_place
end

Then /^Registration: Set 2nd Question to What street did you grow up on$/ do
  log.info "Registration: Set 1st Question to What street did you grow up on"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.street_name
end

Then /^Registration: Set 2nd Question to What is the name of your first school$/ do
  log.info "Registration: Set 1st Question to What is the name of your first school"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.street_name
end

Then /^Registration: Set 2nd Question to What is the make and model of your first car$/ do
  log.info "Registration: Set 1st Question to What is the make and model of your first car"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.first_cars_make_model
end

Then /^Registration: Set 2nd Question to What was your high school mascot$/ do
  log.info "Registration: Set 1st Question to What was your high school mascot"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.high_school_mascot
end