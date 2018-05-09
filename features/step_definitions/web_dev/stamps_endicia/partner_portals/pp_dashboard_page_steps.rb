
Then /^[Pp]P: [Ee]xpect [Dd]ashboard [Pp]age header exist$/ do
   PartnerPortal.dashboard_page.dashboard_header.wait_until_present(timeout: 30)
   expect(PartnerPortal.dashboard_page.dashboard_header). to be_present, 'Dashboard header DOES NOT exist on dashboard page'
end

Then /^[Pp]P: expect Preferred Rates Qualified Postage to exists$/ do
  expect(PartnerPortal.dashboard_page.preferred_rates_qualified_postage). to be_present 'PreFered rates Qualified Postage canvas DOES NOT exist on dashboard page'
end

Then /^[Pp]P: expect dashboard header on left panel exists$/ do
  expect(PartnerPortal.dashboard_page.panel_dashboard). to be_present 'Dashboard header on left panel  DOES NOT exist on dashboard page'
end


Then /^[Pp]P: [Cc]lick submit in dashboard page$/ do
  PartnerPortal.dashboard_page.submit.send_keys(:enter)
end

