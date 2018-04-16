Given /^[Pp]P: [Aa] user navigates to the Reset Password Page$/ do
  step "Start test driver"
  step "PP: A user navigates to the login page"
  step "PP: User clicks Forgot Password link"
  step "PP: expect user is redirected to Reset Password Page"
end

Then /^[Pp]P: [Ee]xpect user is redirected to Reset Password Page$/ do
  PartnerPortals.reset_password_page.header.safe_wait_while_present
  expect(PartnerPortals.reset_password_page.header). to be_present, "User was not redirected to the Reset Password Page"
end

Then /^[Pp]P: [Ee]xpect on Reset Password page Stamps Endicia Partner Portal Logo exists$/ do
  expect(PartnerPortals.reset_password_page.sdc_endicia_logo_browser). to be_present, "Dashboard header DOES NOT exist on dashboard page"
end

