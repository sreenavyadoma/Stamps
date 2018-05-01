
Then /^[Pp]P: set dashboard page to small viewport$/ do
  if SdcEnv.browser
    SdcDriver.driver.window.resize_to(320, 480)
  else
    #ignore
  end
end

Then /^[Pp]P: set dashboard page to medium viewport$/ do
  if SdcEnv.browser
    SdcDriver.driver.window.resize_to(768, 1024)
  else
    #ignore
  end
end

Then /^[Pp]P: set dashboard page to large viewport$/ do
  if SdcEnv.browser
    SdcDriver.driver.window.resize_to(1920, 1080)
     $SdcPage.browser.window.resize_to(1920, 1080)
  else
    #ignore
  end
end


Then /^[Pp]P: [Ee]xpect user is redirected to the Dashboard Page$/ do
   PartnerPortal.dashboard_page.dashboard_header.safe_wait_while_present
   expect(PartnerPortal.dashboard_page.dashboard_header). to be_present, "User was not redirected to the dashboard page"
end

Then /^[Pp]P: [Ee]xpect on dashboard page displays hamburger menu$/ do
  expect(PartnerPortal.dashboard_page.hamburger). to be_present, "hamburger button DOES NOT exist on dashboard page"
end

Then /^[Pp]P: click hamburger menu on dashboard page$/ do
  PartnerPortal.dashboard_page.hamburger.safe_click
end

Then /^[Pp]P: expect Preferred Rates Qualified Postage to exists$/ do
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_postage). to be_present "PreFered rates Qualified Postage canvas DOES NOT exist on dashboard page"
end


