Then /^PP: a user navigates to Reset Password Request Confirmation$/ do
 PPResetPasswordConfirmationPage.visit
end

Then /PP: expect reset email sent header exists$/ do
  PartnerPortal.reset_password_confirm_page.header.wait_until_present(timeout: 10)
  expect(PartnerPortal.reset_password_confirm_page.header).to be_present, 'Reset Email Sent header DOES NOT exists on reset password confirmation page'
end