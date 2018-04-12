Then /^PP: expect website redirects user to Dashboard Page$/ do
   StampsEndicia.dashboard_page.header.safe_wait_while_present
   expect(StampsEndicia.dashboard_page.header). to be_present, "Dashboard header DOES NOT exist on dashboard page"
end
