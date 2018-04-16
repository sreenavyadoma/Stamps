
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
  else
    #ignore
  end
end


Then /^[Pp]P: [Ee]xpect user is redirected to the Dashboard Page$/ do
   PartnerPortals.dashboard_page.header.safe_wait_while_present
   expect(PartnerPortals.dashboard_page.header). to be_present, "User was not redirected to the dashboard page"
end

Then /^[Pp]P: [Ee]xpect on dashboard page displays hamburger menu$/ do
  expect(PartnerPortals.dashboard_page.hamburger). to be_present, "hamburger button DOES NOT exist on dashboard page"
end

Then /^[Pp]P: click hamburger menu on dashboard page$/ do
  PartnerPortals.dashboard_page.hamburger.safe_click
end



