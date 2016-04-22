Then /^Postage: Open Forgot Username Modal/ do
  log.info "Step: Postage: Open Forgot Username Modal"
  @forgot_username = postage.sign_in.forgot_username if @forgot_username.nil?

end

Then /^Postage: Set forgotten email to (.*)/ do |email|
  log.info "Step: Postage: Enter forgotten email: \n #{email}"
  @forgot_username = postage.sign_in.forgot_username if @forgot_username.nil?
  @forgot_username.email.set email
  @forgot_username.continue
  @forgot_username.ok
end

Then /^Postage: Open Forgot Password Modal/ do
  log.info "Step: Postage: Open Forgot Password Modal"
  @forgot_password = postage.sign_in.forgot_password if @forgot_password.nil?
end

Then /^Postage: Set forgotten username to (.*)/ do |username|
  log.info "Step: Postage: Enter forgotten username: \n #{username}"
  @forgot_password = postage.sign_in.forgot_password if @forgot_password.nil?
  @forgot_password.username.set username
  @forgot_password.continue
end

Then /^Postage: Set secret answer 1 to (.*)/ do |answer|
  log.info "Step: Postage: Set secret answer 1 to: \n #{answer}"
  @forgot_password = postage.sign_in.forgot_password if @forgot_password.nil?
  @forgot_password.secret_answer_1.set answer
end

Then /^Postage: Set secret answer 2 to (.*)/ do |answer|
  log.info "Step: Postage: Set secret answer 1 to: \n #{answer}"
  @forgot_password = postage.sign_in.forgot_password if @forgot_password.nil?
  @forgot_password.secret_answer_2.set answer
end

Then /^Postage: Confirm password reset/ do
  log.info "Step: Postage: Confirm password reset"
  @forgot_password = postage.sign_in.forgot_password if @forgot_password.nil?
  @forgot_password.continue
  @forgot_password.confirm_reset
end

