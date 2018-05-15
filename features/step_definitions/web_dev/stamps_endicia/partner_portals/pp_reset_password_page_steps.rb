Given /^[Pp]P: [Aa] user navigates to the Reset Password Page$/ do
  step 'Start test driver'
  step 'PP: A user navigates to the login page'
  step 'PP: User clicks Forgot Password link'
  step 'PP: expect user is redirected to Reset Password Page'
end

Then /^[Pp]P: [Ee]xpect user is redirected to Reset Password Page$/ do
  PartnerPortal.reset_password_page.header.wait_until_present(timeout: 10)
  expect(PartnerPortal.reset_password_page.header). to be_present, 'User was not redirected to the Reset Password Page'
end


