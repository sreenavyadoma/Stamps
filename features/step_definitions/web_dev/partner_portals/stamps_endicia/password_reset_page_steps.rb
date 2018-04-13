Then /^[Pp]P: [Ee]xpect website redirects user to Reset Password Page$/ do
  StampsEndicia.password_reset_page.header.safe_wait_while_present
  expect(StampsEndicia.password_reset_page.header). to be_present, "Password Reset header DOES NOT exist on password reset page"
end