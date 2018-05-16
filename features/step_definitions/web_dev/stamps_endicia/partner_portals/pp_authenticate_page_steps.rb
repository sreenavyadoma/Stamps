Then /^[Pp]P: [Dd]e-[Aa]uthenticate user$/ do
  PartnerPortal.common_page.user_session_timeout
  SdcPage.browser.refresh
end

Then /^[Pp]P: [Ee]xpect user is redirect to the login page$/ do
  step 'PP: Expect login page "Welcome to the" content to exist'
  step 'PP: Expect login page "stamps.com endicia" logo to exist'
  step 'PP: Expect login page "Partner Portal" content to exist'
end