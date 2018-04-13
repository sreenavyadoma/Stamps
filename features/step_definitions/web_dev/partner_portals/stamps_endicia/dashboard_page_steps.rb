
Then /^[Pp]P: set dashboard page to small viewport$/ do
  SdcDriver.driver.window.resize_to(320, 480)
end

Then /^PP: expect website redirects user to Dashboard Page$/ do
   StampsEndicia.dashboard_page.header.safe_wait_while_present
   expect(StampsEndicia.dashboard_page.header). to be_present, "Dashboard header DOES NOT exist on dashboard page"
end
