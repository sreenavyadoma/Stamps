Given /^[Pp]P: [Aa] user navigates to the Reset Password Page$/ do
  step 'Start test driver'
  step 'PP: A user navigates to the login page'
  step 'PP: User clicks Forgot Password link'
  step 'PP: expect user is redirected to Reset Password Page'
end

Then /^[Pp]P: [Aa] user navigates to Reset Password Page$/ do
 PPResetPasswordPage.visit
end

Then /^[Pp]P: [Ee]xpect user is redirected to Reset Password Page$/ do
  PartnerPortal.reset_password_page.header.wait_until_present(timeout: 10)
  expect(PartnerPortal.reset_password_page.header).to be_present, 'User was not redirected to the Reset Password Page'
end

Then /^PP: expect reset password page email text field exists$/ do
  PartnerPortal.reset_password_page.email.wait_until_present(timeout: 10)
  expect(PartnerPortal.reset_password_page.email).to be_present, 'Email text field DOES NOT exists on Reset Password page'
end

Then /^PP: expect reset password page submit button exists$/ do
  PartnerPortal.reset_password_page.submit.wait_until_present(timeout: 10)
  expect(PartnerPortal.reset_password_page.submit).to be_present, 'Submit button DOES NOT exists on Reset Password page'
end

Then /^PP: expect reset password page icon exists$/ do
  PartnerPortal.reset_password_page.icon.wait_until_present(timeout: 10)
  expect(PartnerPortal.reset_password_page.icon).to be_present, 'Icon DOES NOT exists on Reset Password page'
end

Then /^PP: reset password page click on submit button$/ do
  PartnerPortal.reset_password_page.submit.send_keys(:enter)
end

Then /^PP: expect reset password page email error message index (\d+) to be (.*)$/ do |index, str|
   email_error = PartnerPortal.reset_password_page.email_error
   email_error.wait_until_present(timeout: 5)
   TestData.hash[:email_error] = email_error.text_value.split("\n")
   expect(TestData.hash[:email_error][index.to_i - 1]).to eql(str)
end

Then /^PP: set reset password page email to (?:env value|(.*))/ do |str|
  email =  PartnerPortal.reset_password_page.email
  email.wait_until_present(timeout: 5)
  email.set(TestData.hash[:email] = (str.nil?) ? (SdcEnv.usr) : str)
end







