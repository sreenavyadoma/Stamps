Then /^[Pp]P: [Ee]xpect user is redirected to Reset Password Page$/ do
  PartnerPortals.password_reset_page.header.safe_wait_while_present
  expect(PartnerPortals.password_reset_page.header). to be_present, "Password Reset header DOES NOT exist on password reset page"
end