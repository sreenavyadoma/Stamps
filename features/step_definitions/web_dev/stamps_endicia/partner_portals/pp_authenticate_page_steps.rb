Then /^[Pp]P: [Dd]e-[Aa]uthenticate user$/ do
  PartnerPortal.common_page.user_session_timeout
  SdcPage.browser.refresh
end

