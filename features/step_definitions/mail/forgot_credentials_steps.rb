Then /^Mail: Open Forgot Username Modal/ do
  logger.info "Mail: Open Forgot Username Modal"
  @forgot_username = web_apps.mail.sign_in_modal.forgot_username if @forgot_username.nil?

end

Then /^Mail: Set forgotten email to (.*)/ do |email|
  logger.info "Mail: Enter forgotten email: \n #{email}"
  @forgot_username = web_apps.mail.sign_in_modal.forgot_username if @forgot_username.nil?
  @forgot_username.email.set email
  @forgot_username.continue
  @forgot_username.ok
end

Then /^Mail: Open Forgot Password Modal/ do
  logger.info "Mail: Open Forgot Password Modal"
  @forgot_password = web_apps.mail.sign_in_modal.forgot_password if @forgot_password.nil?
end

Then /^Mail: Set forgotten username to (.*)/ do |username|
  logger.info "Mail: Enter forgotten username: \n #{username}"
  @forgot_password = web_apps.mail.sign_in_modal.forgot_password if @forgot_password.nil?
  @forgot_password.username.set username
  @forgot_password.continue
end

Then /^Mail: Set secret answer 1 to (.*)/ do |answer|
  logger.info "Mail: Set secret answer 1 to: \n #{answer}"
  @forgot_password = web_apps.mail.sign_in_modal.forgot_password if @forgot_password.nil?
  @forgot_password.secret_answer_1.set answer
end

Then /^Mail: Set secret answer 2 to (.*)/ do |answer|
  logger.info "Mail: Set secret answer 1 to: \n #{answer}"
  @forgot_password = web_apps.mail.sign_in_modal.forgot_password if @forgot_password.nil?
  @forgot_password.secret_answer_2.set answer
end

Then /^Mail: Confirm password reset/ do
  logger.info "Mail: Confirm password reset"
  @forgot_password = web_apps.mail.sign_in_modal.forgot_password if @forgot_password.nil?
  @forgot_password.continue
  @forgot_password.confirm_reset
end

