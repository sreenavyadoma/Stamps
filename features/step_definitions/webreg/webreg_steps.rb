Then /^WebReg: Load Registration Page$/ do
  step "WebReg: Load Registration Page in #{ENV['URL']}"
end

Then /^WebReg: Load Registration Page in (\w+)$/ do |env|
  step "I launch browser default"
  log.info "WebReg: Load Registration Page in #{env} "
  @profile = registration.visit(env).profile
  @profile.wait_until_present
  raise "Unable to load Registration page." unless @profile.present?
end

Then /^WebReg:  Continue to Mailing Information Page$/ do
  log.info "WebReg:  Continue to Mailing Information Page"
  @profile = registration.profile if @profile.nil?
  @profile.continue_to_mailing_info
end

Then /^WebReg: Set User ID and Email to Random Value$/ do
  log.info "WebReg: Set User ID and Email to Random Value"
  @username = test_helper.rand_username
  step "WebReg: Set Email to #{@username}@mailinator.com"
  step "WebReg: Set User ID to #{@username}"
end

Then /^WebReg: Set User ID and Email from Jenkins$/ do
  raise "No username specified when test was ran.  Don't forget to assign a value to USERNAME." if ENV['USERNAME'].nil? || ENV['USERNAME'].size==0
  log.info "WebReg: Set User ID and Email to #{@username}"
  step "WebReg: Set Email to #{@username}@mailinator.com"
  step "WebReg: Set User ID to #{@username}"
end

Then /^WebReg: Set User ID and Email to (.*)$/ do |usrname|
  @username = (ENV['USERNAME'].size>0)?ENV['USERNAME']:usrname #
  log.info "WebReg: Set User ID and Email to #{@username}"
  step "WebReg: Set Email to #{@username}@mailinator.com"
  step "WebReg: Set User ID to #{@username}"
end

Then /^WebReg: Set Email to (.*)$/ do |email|
  log.info "WebReg: Set Email to #{email}"
  @profile = registration.profile if @profile.nil?
  email_field = @profile.email
  email_field.wait_until_present
  sleep 1
  email_field.set_until email

end

Then /^WebReg: Set User ID to (.*)$/ do |user_id|
  log.info "WebReg: Set User ID to #{user_id}"
  @profile = registration.profile if @profile.nil?
  @profile.user_id.set_until user_id
end

Then /^WebReg: Set Password to (.*)$/ do |password|
  log.info "WebReg: Set Password to #{password}"
  @profile = registration.profile if @profile.nil?
  @profile.password.set_until password
end

Then /^WebReg: Set Re-Type password to (.*)$/ do |password|
  log.info "WebReg: Set Re-Type password to #{password}"
  @profile = registration.profile if @profile.nil?
  @profile.retype_password.set_until password
end

Then /^WebReg: Set Referrer Name to Web Banner$/ do
  log.info "WebReg: Set Referrer Name to Web Banner"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  referrer_name.web_banner if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Radio Podcast Streaming Audio$/ do
  log.info "WebReg: Set Referrer Name to Radio/Podcast/Streaming Audio"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  referrer_name.streaming_audio if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Television Commercial$/ do
  log.info "WebReg: Set Referrer Name to Television Commercial"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  referrer_name.television_commercial if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Telephone Call$/ do
  log.info "WebReg: Set Referrer Name to Telephone Call"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  referrer_name.telephone_call if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Other$/ do
  log.info "WebReg: Set Referrer Name to Other"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  referrer_name.other if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Recommended by Friend$/ do
  log.info "WebReg: Set Referrer Name to Recommended by Friend"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  referrer_name.recommended_by_friend if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Recommended by USPS$/ do
  log.info "WebReg: Set Referrer Name to Recommended by USPS"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  referrer_name.recommended_by_usps if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Newspaper Ad$/ do
  log.info "WebReg: Set Referrer Name to Newspaper Ad"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  @profile.referrer_name.newspapaer_ad if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Magazine Ad$/ do
  log.info "WebReg: Set Referrer Name to Magazine Ad"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  referrer_name.magazine_ad if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Received Mailer$/ do
  log.info "WebReg: Set Referrer Name to Received Mailer"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  @profile.referrer_name.received_mailer if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Already used in office$/ do
  log.info "WebReg: Set Referrer Name to Already used in office"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  referrer_name.already_used_in_office if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Trade show convention$/ do
  log.info "WebReg: Set Referrer Name to Trade show/convention"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  @profile.referrer_name.trade_show if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Web Search$/ do
  log.info "WebReg: Set Referrer Name to Web Search"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  referrer_name.web_search if referrer_name.present?
end

Then /^WebReg: Set Referrer Name to Email from Stamps$/ do
  log.info "WebReg: Set Referrer Name to Email from Stamps.com"
  @profile = registration.profile if @profile.nil?
  referrer_name = @profile.referrer_name
  referrer_name.email_from_stamps if referrer_name.present?
end

Then /^WebReg: Set How did you hear about us to Web Banner$/ do |how|
  log.info "WebReg: Set Email to #{email}"
  @profile = registration.profile if @profile.nil?
  @profile.email.set_until email
end

Then /^WebReg: Set How will you use Stamps.com to Mostly Mailing$/ do
  log.info "WebReg: Set How will you use Stamps.com to Mostly Mailing"
  @profile = registration.profile if @profile.nil?
  @profile.usage_type.mostly_mailing
end

Then /^WebReg: Set How will you use Stamps.com to Mostly Shipping$/ do
  log.info "WebReg: Set How will you use Stamps.com to Mostly Shipping"
  @profile = registration.profile if @profile.nil?
  @profile.usage_type.mostly_shipping
end

Then /^WebReg: Set How will you use Stamps.com to Both Mailing and Shipping$/ do
  log.info "WebReg: Set How will you use Stamps.com to Both Mailing and Shipping"
  @profile = registration.profile if @profile.nil?
  @profile.usage_type.mailing_and_shipping
end

Then /^WebReg: Set How will you use Stamps.com to Home Office$/ do
  log.info "WebReg: Set How will you use Stamps.com to Home Office"
  @profile = registration.profile if @profile.nil?
  @profile.usage_type.individual
end

Then /^WebReg: Set 1st Answer to (.*)$/ do |answer|
  log.info "WebReg: Set 1st Answer to #{answer}"
  @profile = registration.profile if @profile.nil?
  @profile.first_answer.set_until answer
end

Then /^WebReg: Set 2nd Answer to (.*)$/ do |answer|
  log.info "WebReg: Set 2nd Answer to #{answer}"
  @profile = registration.profile if @profile.nil?
  @profile.second_answer.set_until answer
end

Then /^WebReg: Set Send me special money-saving offers to checked$/ do
  log.info "WebReg: Set Send me special money-saving offers to checked"
  @profile = registration.profile if @profile.nil?
  @profile.send_promo.click
end

Then /^WebReg: Set Send me special money-saving offers to unchecked$/ do
  log.info "WebReg: Set Send me special money-saving offers to unchecked"
  @profile = registration.profile if @profile.nil?
  @profile.send_promo.click
end

Then /^WebReg: Set 1st Question to What is your mother's maiden name$/ do
  log.info "WebReg: Set 1st Question to What is your mother's maiden name?"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.mothers_maiden_name
end

Then /^WebReg: Set 1st Question to What is your pet's name$/ do
  log.info "WebReg: Set 1st Question to What is your pet's name?"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.pets_name
end

Then /^WebReg: Set 1st Question to What is your city of birth$/ do
  log.info "WebReg: Set 1st Question to What is your city of birth"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.birth_city
end

Then /^WebReg: Set 1st Question to What is your father's birthplace$/ do
  log.info "WebReg: Set 1st Question to What is your father's birthplace"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.fathers_birth_place
end

Then /^WebReg: Set 1st Question to What street did you grow up on$/ do
  log.info "WebReg: Set 1st Question to What street did you grow up on"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.mothers_maiden_name
end

Then /^WebReg: Set 1st Question to What is the name of your first school$/ do
  log.info "WebReg: Set 1st Question to What is the name of your first school"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.street_name
end

Then /^WebReg: Set 1st Question to What is the make and model of your first car$/ do
  log.info "WebReg: Set 1st Question to What is the make and model of your first car"
  @profile = registration.profile if @profile.nil?
  @profile.first_question.first_cars_make_model
end

Then /^WebReg: Set 2nd Question to What is your mother's maiden name$/ do
  log.info "WebReg: Set 1st Question to What is your mother's maiden name?"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.mothers_maiden_name
end

Then /^WebReg: Set 2nd Question to What is your pet's name$/ do
  log.info "WebReg: Set 1st Question to What is your pet's name?"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.pets_name
end

Then /^WebReg: Set 2nd Question to What is your city of birth$/ do
  log.info "WebReg: Set 1st Question to What is your city of birth"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.birth_city
end

Then /^WebReg: Set 2nd Question to What is your father's birthplace$/ do
  log.info "WebReg: Set 1st Question to What is your father's birthplace"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.fathers_birth_place
end

Then /^WebReg: Set 2nd Question to What street did you grow up on$/ do
  log.info "WebReg: Set 1st Question to What street did you grow up on"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.street_name
end

Then /^WebReg: Set 2nd Question to What is the name of your first school$/ do
  log.info "WebReg: Set 1st Question to What is the name of your first school"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.street_name
end

Then /^WebReg: Set 2nd Question to What is the make and model of your first car$/ do
  log.info "WebReg: Set 1st Question to What is the make and model of your first car"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.first_cars_make_model
end

Then /^WebReg: Set 2nd Question to What was your high school mascot$/ do
  log.info "WebReg: Set 1st Question to What was your high school mascot"
  @profile = registration.profile if @profile.nil?
  @profile.second_question.high_school_mascot
end

Then /^WebReg: Continue$/ do
  log.info "WebReg: Continue"
  @profile = registration.profile if @profile.nil?
  @profile.continue.click
end

Then /^WebReg: Continue to Mailing Information Page$/ do
  log.info "WebReg: Continue to Mailing Information Page"
  @profile = registration.profile if @profile.nil?
  @membership = registration.profile.membership
  10.times do
    @profile.continue.click
    sleep 1
    break if @membership.present?
  end
  @membership.wait_until_present
end

Then /^WebReg: Set Mailing Info State to Armed Forces Americas$/ do
  log.info "WebReg: Set Mailing Info State to AA Armed Forces Americas"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.armed_forces_americas
end

Then /^WebReg: Set Mailing Info State to Armed Forces$/ do
  log.info "WebReg: Set Mailing Info State to AE Armed Forces"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.armed_forces
end

Then /^WebReg: Set Mailing Info State to Alaska$/ do
  log.info "WebReg: Set Mailing Info State to Alaska"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.alaska
end

Then /^WebReg: Set Mailing Info State to Alabama$/ do
  log.info "WebReg: Set Mailing Info State to AL Alabama"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.alabama
end

Then /^WebReg: Set Mailing Info State to Armed Forces Pacific$/ do
  log.info "WebReg: Set Mailing Info State to Armed Forces Pacific"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.armed_forces_pacific
end

Then /^WebReg: Set Mailing Info State to Arkansas$/ do
  log.info "WebReg: Set Mailing Info State to Arkansas"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.arkansa
end

Then /^WebReg: Set Mailing Info State to American Samoa$/ do
  log.info "WebReg: Set Mailing Info State to American Samoa"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.american_samoa
end

Then /^WebReg: Set Mailing Info State to Arizona$/ do
  log.info "WebReg: Set Mailing Info State to Arizona"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.arizona
end

Then /^WebReg: Set Mailing Info State to California$/ do
  log.info "WebReg: Set Mailing Info State to California"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.california
end

Then /^WebReg: Set Mailing Info State to Colorado$/ do
  log.info "WebReg: Set Mailing Info State to Colorado"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.colorado
end

Then /^WebReg: Set Mailing Info State to Connecticut$/ do
  log.info "WebReg: Set Mailing Info State to Connecticut"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.connecticut
end

Then /^WebReg: Set Mailing Info State to Canal Zone$/ do
  log.info "WebReg: Set Mailing Info State to Canal Zone"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.canal_zone
end

Then /^WebReg: Set Mailing Info State to District of Columbia$/ do
  log.info "WebReg: Set Mailing Info State to District of Columbia"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.district_of_columbia
end

Then /^WebReg: Set Mailing Info State to Delaware$/ do
  log.info "WebReg: Set Mailing Info State to Delaware"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.delaware
end

Then /^WebReg: Set Mailing Info State to Florida$/ do
  log.info "WebReg: Set Mailing Info State to Florida"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.florida
end

Then /^WebReg: Set Mailing Info State to Micronesia$/ do
  log.info "WebReg: Set Mailing Info State to Micronesia"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.micronesia
end

Then /^WebReg: Set Mailing Info State to Georgia$/ do
  log.info "WebReg: Set Mailing Info State to Georgia"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.georgia
end

Then /^WebReg: Set Mailing Info State to Guam$/ do
  log.info "WebReg: Set Mailing Info State to Guam"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.guam
end

Then /^WebReg: Set Mailing Info State to Hawaii$/ do
  log.info "WebReg: Set Mailing Info State to Hawaii"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.hawaii
end

Then /^WebReg: Set Mailing Info State to Iowa$/ do
  log.info "WebReg: Set Mailing Info State to Iowa"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.iowa
end

Then /^WebReg: Set Mailing Info State to Idaho$/ do
  log.info "WebReg: Set Mailing Info State to Idaho"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.idaho
end

Then /^WebReg: Set Mailing Info State to Illinois$/ do
  log.info "WebReg: Set Mailing Info State to Illinois"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.illinois
end

Then /^WebReg: Set Mailing Info State to Indiana$/ do
  log.info "WebReg: Set Mailing Info State to Indiana"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.indiana
end

Then /^WebReg: Set Mailing Info State to Kansas$/ do
  log.info "WebReg: Set Mailing Info State to Kansas"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.kansas
end

Then /^WebReg: Set Mailing Info State to Kentucky$/ do
  log.info "WebReg: Set Mailing Info State to Kentucky"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.kentucky
end

Then /^WebReg: Set Mailing Info State to Louisiana$/ do
  log.info "WebReg: Set Mailing Info State to Louisiana"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.louisiana
end

Then /^WebReg: Set Mailing Info State to Massachusetts$/ do
  log.info "WebReg: Set Mailing Info State to Massachusetts"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.massachusetts
end

Then /^WebReg: Set Mailing Info State to Maryland$/ do
  log.info "WebReg: Set Mailing Info State to Maryland"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.maryland
end

Then /^WebReg: Set Mailing Info State to Maine$/ do
  log.info "WebReg: Set Mailing Info State to Maine"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.maine
end

Then /^WebReg: Set Mailing Info State to Marshall Islands$/ do
  log.info "WebReg: Set Mailing Info State to Marshall Islands"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.marshall_islands
end

Then /^WebReg: Set Mailing Info State to Minnesota$/ do
  log.info "WebReg: Set Mailing Info State to Minnesota"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.minnesota
end

Then /^WebReg: Set Mailing Info State to Missouri$/ do
  log.info "WebReg: Set Mailing Info State to Missouri"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.missouri
end

Then /^WebReg: Set Mailing Info State to Mariana Islands$/ do
  log.info "WebReg: Set Mailing Info State to Mariana Islands"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.mariana_islands
end

Then /^WebReg: Set Mailing Info State to Mississippi$/ do
  log.info "WebReg: Set Mailing Info State to Mississippi"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.mississippi
end

Then /^WebReg: Set Mailing Info State to Montana$/ do
  log.info "WebReg: Set Mailing Info State to Montana"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.montana
end

Then /^WebReg: Set Mailing Info State to North Carolina$/ do
  log.info "WebReg: Set Mailing Info State to North Carolina"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.north_carolina
end

Then /^WebReg: Set Mailing Info State to North Dakota$/ do
  log.info "WebReg: Set Mailing Info State to North Dakota"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.north_dakota
end

Then /^WebReg: Set Mailing Info State to Nebraska$/ do
  log.info "WebReg: Set Mailing Info State to Nebraska"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.nebraska
end

Then /^WebReg: Set Mailing Info State to New Hampshire$/ do
  log.info "WebReg: Set Mailing Info State to New Hampshire"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.new_hampshire
end

Then /^WebReg: Set Mailing Info State to New Jersey$/ do
  log.info "WebReg: Set Mailing Info State to New Jersey"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.new_jersey
end

Then /^WebReg: Set Mailing Info State to New Mexico$/ do
  log.info "WebReg: Set Mailing Info State to New Mexico"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.new_mexico
end

Then /^WebReg: Set Mailing Info State to Nevada$/ do
  log.info "WebReg: Set Mailing Info State to Nevada"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.nevada
end

Then /^WebReg: Set Mailing Info State to New York$/ do
  log.info "WebReg: Set Mailing Info State to New York"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.new_york
end

Then /^WebReg: Set Mailing Info State to Ohio$/ do
  log.info "WebReg: Set Mailing Info State to Ohio"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.ohio
end

Then /^WebReg: Set Mailing Info State to Oklahoma$/ do
  log.info "WebReg: Set Mailing Info State to Oklahoma"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.oklahoma
end

Then /^WebReg: Set Mailing Info State to Oregon$/ do
  log.info "WebReg: Set Mailing Info State to Oregon"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.oregon
end

Then /^WebReg: Set Mailing Info State to Pennsylvania$/ do
  log.info "WebReg: Set Mailing Info State to Pennsylvania"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.pennsylvania
end

Then /^WebReg: Set Mailing Info State to Puerto Rico$/ do
  log.info "WebReg: Set Mailing Info State to Puerto Rico"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.puerto_rico
end

Then /^WebReg: Set Mailing Info State to Palau$/ do
  log.info "WebReg: Set Mailing Info State to Palau"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.palau
end

Then /^WebReg: Set Mailing Info State to Rhode Island$/ do
  log.info "WebReg: Set Mailing Info State to xxxxx"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.rhode_island
end

Then /^WebReg: Set Mailing Info State to South Carolina$/ do
  log.info "WebReg: Set Mailing Info State to South Carolina"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.south_carolina
end

Then /^WebReg: Set Mailing Info State to South Dakota$/ do
  log.info "WebReg: Set Mailing Info State to South Dakota"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.south_dakota
end

Then /^WebReg: Set Mailing Info State to Tennessee$/ do
  log.info "WebReg: Set Mailing Info State to Tennessee"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.tennessee
end

Then /^WebReg: Set Mailing Info State to Texas$/ do
  log.info "WebReg: Set Mailing Info State to Texas"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.texas
end

Then /^WebReg: Set Mailing Info State to Utah$/ do
  log.info "WebReg: Set Mailing Info State to Utah"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.utah
end

Then /^WebReg: Set Mailing Info State to Virginia$/ do
  log.info "WebReg: Set Mailing Info State to Virginia"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.virginia
end

Then /^WebReg: Set Mailing Info State to Virgin Islands$/ do
  log.info "WebReg: Set Mailing Info State to Virgin Islands"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.virgin_islands
end

Then /^WebReg: Set Mailing Info State to Vermont$/ do
  log.info "WebReg: Set Mailing Info State to Vermont"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.vermont
end

Then /^WebReg: Set Mailing Info State to Washington$/ do
  log.info "WebReg: Set Mailing Info State to Washington"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.washington
end

Then /^WebReg: Set Mailing Info State to Wisconsin$/ do
  log.info "WebReg: Set Mailing Info State to Wisconsin"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.wisconsin
end

Then /^WebReg: Set Mailing Info State to West Virginia$/ do
  log.info "WebReg: Set Mailing Info State to West Virginia"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.west_virginia
end

Then /^WebReg: Set Mailing Info State to Wyoming$/ do
  log.info "WebReg: Set Mailing Info State to Wyoming"
  @membership = registration.profile.membership if @membership.nil?
  @membership.state.wyoming
end

Then /^WebReg: Set Mailing Info First Name to (.*)$/ do |var|
  log.info "WebReg: Set Mailing Info First Name to #{var}"
  @membership = registration.profile.membership if @membership.nil?
  @membership.first_name.set_until (var.downcase.include? "random") ? test_helper.random_string : var
end

Then /^WebReg: Set Mailing Info Last Name to (.*)$/ do |var|
  log.info "WebReg: Set Mailing Info Last Name to #{var}"
  @membership = registration.profile.membership if @membership.nil?
  @membership.last_name.set_until (var.downcase.include? "random") ? test_helper.random_string : var
end

Then /^WebReg: Set Mailing Info Company to (.*)$/ do |var|
  log.info "WebReg: Set Mailing Info Company to #{var}"
  @membership = registration.profile.membership if @membership.nil?
  @membership.company.set_until (var.downcase.include? "random") ? test_helper.random_string : var
end

Then /^WebReg: Set Mailing Info Address to (.*)$/ do |var|
  log.info "WebReg: Set Mailing Info Address to #{var}"
  @membership = registration.profile.membership if @membership.nil?
  @membership.address.set_until var
end

Then /^WebReg: Set Mailing Info City to (.*)$/ do |var|
  log.info "WebReg: Set Mailing Info City to #{var}"
  @membership = registration.profile.membership if @membership.nil?
  @membership.city.set_until var
end

Then /^WebReg: Set Mailing Info Zip Code to (.*)$/ do |var|
  log.info "WebReg: Set Mailing Info Zip Code to #{var}"
  @membership = registration.profile.membership if @membership.nil?
  @membership.zip.set_until var
end

Then /^WebReg: Set Mailing Info Phone to (.*)$/ do |var|
  log.info "WebReg: Set Mailing Info Phone to #{var}"
  @membership = registration.profile.membership if @membership.nil?
  @membership.phone.set_until (var.downcase.include? "random") ? test_helper.random_phone : var
end

Then /^WebReg: Set Mailing Info Extenion to (.*)$/ do |var|
  log.info "WebReg: Set Mailing Info Extenion to #{var}"
  @membership = registration.profile.membership if @membership.nil?
  @membership.ext.set_until (var.downcase.include? "random") ? test_helper.random_phone_extension : var
end

Then /^WebReg: Set Mailing Info Cardholder name to (.*)$/ do |var|
  log.info "WebReg: Set Mailing Info Cardholder name to #{var}"
  @membership = registration.profile.membership if @membership.nil?
  @membership.card_holder_name.set_until (var.downcase.include? "random") ? test_helper.random_name : var
end

Then /^WebReg: Set Mailing Info Card number to (.*)$/ do |var|
  log.info "WebReg: Set Mailing Info Card number to #{var}"
  @membership = registration.profile.membership if @membership.nil?
  @membership.card_number.set_until var
end

Then /^WebReg: Set Mailing Info Expiration Month to January/ do
  log.info "WebReg: Set Mailing Info Expiration Month to January"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_month.jan
end

Then /^WebReg: Set Mailing Info Expiration Month to February$/ do
  log.info "WebReg: Set Mailing Info Expiration Month to February"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_month.feb
end

Then /^WebReg: Set Mailing Info Expiration Month to March$/ do
  log.info "WebReg: Set Mailing Info Expiration Month to March"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_month.mar
end

Then /^WebReg: Set Mailing Info Expiration Month to April$/ do
  log.info "WebReg: Set Mailing Info Expiration Month to April"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_month.apr
end

Then /^WebReg: Set Mailing Info Expiration Month to May$/ do
  log.info "WebReg: Set Mailing Info Expiration Month to May"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_month.may
end

Then /^WebReg: Set Mailing Info Expiration Month to June$/ do
  log.info "WebReg: Set Mailing Info Expiration Month to June"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_month.jun
end

Then /^WebReg: Set Mailing Info Expiration Month to July$/ do
  log.info "WebReg: Set Mailing Info Expiration Month to July"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_month.jul
end

Then /^WebReg: Set Mailing Info Expiration Month to August$/ do
  log.info "WebReg: Set Mailing Info Expiration Month to August"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_month.aug
end

Then /^WebReg: Set Mailing Info Expiration Month to September$/ do
  log.info "WebReg: Set Mailing Info Expiration Month to September"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_month.sep
end

Then /^WebReg: Set Mailing Info Expiration Month to October$/ do
  log.info "WebReg: Set Mailing Info Expiration Month to October"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_month.oct
end

Then /^WebReg: Set Mailing Info Expiration Month to November$/ do
  log.info "WebReg: Set Mailing Info Expiration Month to November"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_month.nov
end

Then /^WebReg: Set Mailing Info Expiration Month to December$/ do
  log.info "WebReg: Set Mailing Info Expiration Month to December"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_month.dec
end

Then /^WebReg: Set Mailing Info Expiration Year to (\d+)$/ do |var|
  log.info "WebReg: Set Mailing Info Expiration Year to #{var}"
  @membership = registration.profile.membership if @membership.nil?
  @membership.expiration_year.select var
end

Then /^WebReg: Set Mailing Info Billing address same as mailing address to Checked$/ do
  log.info "WebReg: Set Mailing Info Billing address same as mailing address to Checked"
  @membership = registration.profile.membership if @membership.nil?
  @membership.billing_same_as_mailing.check
end

Then /^WebReg: Set Mailing Info Billing address same as mailing address to Unchecked$/ do
  log.info "WebReg: Set Mailing Info Billing address same as mailing address to Unchecked"
  @membership = registration.profile.membership if @membership.nil?
  @membership.billing_same_as_mailing.uncheck
end

Then /^WebReg: Set Mailing Info Terms & Conditions to Checked$/ do
  log.info "WebReg: Set Mailing Info Terms & Conditions to Checked"
  @membership = registration.profile.membership if @membership.nil?
  @membership.i_agree.check
end

Then /^WebReg: Set Mailing Info Terms & Conditions to Unchecked$/ do
  log.info "WebReg: Set Mailing Info Terms & Conditions to Unchecked"
  @membership = registration.profile.membership if @membership.nil?
  @membership.i_agree.uncheck
end

Then /^WebReg: Click Mailing Info Back Button$/ do |var|
  log.info "WebReg: Click Mailing Info Back Button"
  @membership = registration.profile.membership if @membership.nil?
  @membership.xxxx.set var
end

Then /^WebReg: Mailing Info Submit$/ do
  log.info "WebReg: Mailing Info Submit"
  @membership = registration.profile.membership if @membership.nil?
  @reg_result = @membership.submit
  case @reg_result
    when WebReg::UserIdTaken
      message = @reg_result.message
      log.info message
      raise message
    when WebReg::ChooseSupplies
      welcome_page = @reg_result.place_order
      sleep 2
      if welcome_page.present?
        step "WebReg:  Send username to standard out"
      end
  end
end

Then /^Choose Supplies:  Place Order$/ do
  raise "Choose Supplies:  Place Order - ILLEGAL STATE EXECPTION!  Check your test" if @reg_result.nil?
  case @reg_result
    when WebReg::UserIdTaken
      message = @reg_result.message
      log.info message
      raise message
    when WebReg::ChooseSupplies
      welcome_page = @reg_result.place_order
      welcome_page.wait_until_present
      if welcome_page.present?
        step "WebReg:  Send username to standard out"
      end
  end
end

Then /^WebReg: Mailing Info Submit2$/ do
  case @registration_submission_result
    when NewAccountWelcomePage
    when UserIdTaken
    else
      raise "Illegal State Exception.  Call Step WebReg: Mailing Info Submit before this step.  Check your test."
  end
end

