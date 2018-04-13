
Then /^[Pp]P: set dashboard page to small viewport$/ do
  SdcDriver.driver.window.resize_to(320, 480)
end

Then /^[Pp]P: set dashboard page to medium viewport$/ do
  SdcDriver.driver.window.resize_to(768, 1024)
end

Then /^[Pp]P: set dashboard page to large viewport$/ do
  SdcDriver.driver.window.resize_to(1920, 1080)
end


Then /^[Pp]P: [Ee]xpect user is redirected to the Dashboard Page$/ do
   StampsEndicia.dashboard_page.header.safe_wait_while_present
   expect(StampsEndicia.dashboard_page.header). to be_present, "Dashboard header DOES NOT exist on dashboard page"
end

Then /^[Pp]P: [Ee]xpect on dashboard page Stamps Endicia Partner Portal Logo exists$/ do
  expect(StampsEndicia.dashboard_page.sdc_endicia_logo_browser). to be_present, "Dashboard header DOES NOT exist on dashboard page"
end

Then /^[Pp]P: click on Stamps Endicia Partner Portal logo$/ do
  StampsEndicia.dashboard_page.sdc_endicia_logo_browser.safe_click
end

Then /^[Pp]P: [Ee]xpect on dashboard page displays hamburger menu$/ do

end



