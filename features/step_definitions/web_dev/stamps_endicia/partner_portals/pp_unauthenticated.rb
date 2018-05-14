Then /^[Pp]P: [Dd]e-[Aa]uthenticate (?:user|(.*))$/ do
  step 'Establish Partner Portal db connection'
  PartnerPortal.common_page.user_session_timeout
  SdcPage.browser.refresh
end

Then /^[Pp]P: [Ee]xpect user is redirect to the login page$/ do

end