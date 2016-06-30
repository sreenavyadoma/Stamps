Then /^Postage: Open Forgot Username Modal/ do
  logger.info "Postage: Open Forgot Username Modal"
  @forgot_username = postage.landing_page.forgot_username if @forgot_username.nil?

end

Then /^Postage: Set forgotten email to (.*)/ do |email|
  logger.info "Postage: Enter forgotten email: \n #{email}"
  @forgot_username = postage.landing_page.forgot_username if @forgot_username.nil?
  @forgot_username.email.set email
  @forgot_username.continue
  @forgot_username.ok
end

Then /^Postage: Open Forgot Password Modal/ do
  logger.info "Postage: Open Forgot Password Modal"
  @forgot_password = postage.landing_page.forgot_password if @forgot_password.nil?
end

Then /^Postage: Set forgotten username to (.*)/ do |username|
  logger.info "Postage: Enter forgotten username: \n #{username}"
  @forgot_password = postage.landing_page.forgot_password if @forgot_password.nil?
  @forgot_password.username.set username
  @forgot_password.continue
end

Then /^Postage: Set secret answer 1 to (.*)/ do |answer|
  logger.info "Postage: Set secret answer 1 to: \n #{answer}"
  @forgot_password = postage.landing_page.forgot_password if @forgot_password.nil?
  @forgot_password.secret_answer_1.set answer
end

Then /^Postage: Set secret answer 2 to (.*)/ do |answer|
  logger.info "Postage: Set secret answer 1 to: \n #{answer}"
  @forgot_password = postage.landing_page.forgot_password if @forgot_password.nil?
  @forgot_password.secret_answer_2.set answer
end

Then /^Postage: Confirm password reset/ do
  logger.info "Postage: Confirm password reset"
  @forgot_password = postage.landing_page.forgot_password if @forgot_password.nil?
  @forgot_password.continue
  @forgot_password.confirm_reset
end

