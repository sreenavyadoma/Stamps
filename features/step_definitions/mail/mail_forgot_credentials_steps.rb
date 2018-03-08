Then /^Mail: Open Forgot Username Modal/ do
  #StampsTest.log.step "Mail: Open Forgot Username Modal"
  @forgot_username=stamps.mail.sign_in_modal.forgot_username if @forgot_username.nil?

end

Then /^[Oo]n Print form, set forgotten email to (.*)$/ do |email|
  #SdcTest.log.step "on Print form, enter forgotten email: \n #{email}"
  #@forgot_username=stamps.mail.sign_in_modal.forgot_username if @forgot_username.nil?
  @forgot_username.email.set email
  @forgot_username.continue
  @forgot_username.ok
end

Then /^Mail: Open Forgot Password Modal/ do
  #StampsTest.log.step "Mail: Open Forgot Password Modal"
  @forgot_password=stamps.mail.sign_in_modal.forgot_password if @forgot_password.nil?
end

Then /^[Oo]n Print form, set forgotten username to (.*)$/ do |username|
  #SdcTest.log.step "on Print form, enter forgotten username: \n #{username}"
  #@forgot_password=stamps.mail.sign_in_modal.forgot_password if @forgot_password.nil?  #Alex
  @forgot_password.username.set username
  @forgot_password.continue
end

Then /^[Oo]n Print form, set secret answer 1 to (.*)$/ do |answer|
#Then /^[Oo]n Print form, set secret answer (\d+) to (.*)$/ do |number, answer|
#SdcTest.log.step "on Print form, set secret answer 1 to: \n #{answer}"
  #@forgot_password=stamps.mail.sign_in_modal.forgot_password if @forgot_password.nil?  #Alex
  @forgot_password.secret_answer_1.set answer   #Alex test
  #@forgot_password.secret_answer(number).set(answer)
end

Then /^[Oo]n Print form, set secret answer 2 to (.*)$/ do |answer|
  #SdcTest.log.step "on Print form, set secret answer 1 to: \n #{answer}"
  #@forgot_password=stamps.mail.sign_in_modal.forgot_password if @forgot_password.nil?  #Alex
  @forgot_password.secret_answer_2.set answer
end

Then /^Mail: Confirm password reset/ do
  #StampsTest.log.step "Mail: Confirm password reset"
  #@forgot_password=stamps.mail.sign_in_modal.forgot_password if @forgot_password.nil?  #Alex
  @forgot_password.continue
  @forgot_password.confirm_reset
end

