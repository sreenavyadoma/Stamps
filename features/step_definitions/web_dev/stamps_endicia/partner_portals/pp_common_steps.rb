
Then /^[Pp]P: scroll to top of the page$/ do
   SdcPage.browser.execute_script('document.documentElement.scrollTop = 0')
end

Then /^[Pp]P: scroll to middle of the page$/ do
  SdcPage.browser.execute_script('window.scrollTo(screen.width/2, screen.height/2)');
end

Then /^[Pp]P: scroll to buttom of the page$/ do
    SdcPage.browser.execute_script( 'window.scrollBy(0,document.body.scrollHeight)' )
end

Then /^[Pp]P: navigate back to previous page$/ do
  SdcPage.browser.back
end

Then /^[Pp]P: click on global header$/ do
  PartnerPortal.common_page.global_header.click
end

Then /^[Pp]P: [Ee]xpect global header exists$/ do
  PartnerPortal.common_page.global_header.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.global_header).to be_present, 'Global header DOES NOT exist'
end

Then /^[Pp]P: [Ee]xpect [Pp]artner [Pp]ortal logo exists$/ do
  expect(PartnerPortal.common_page.partner_portal_logo).to be_present, 'Partner Portal logo DOES NOT exist'
end

Then /^[Pp]P: [Ee]xpect Stamps Endicia Partner Portal Logo exists$/ do
    expect(PartnerPortal.common_page.sdc_endicia_logo_browser). to be_present, 'Stamps Endicia Partner Portal Logo header DOES NOT exist browser mode'
end

Then /^[Pp]P: [Ee]xpect Stamps Endicia Partner Portal Logo exists for mobile$/ do
    expect(PartnerPortal.common_page.sdc_endicia_logo_mobile). to be_present, 'Stamps Endicia Partner Portal Logo header DOES NOT exist mobile mode'
end

Then /^[Pp]P: [Ee]xpect [Hh]amburger button exists for mobile$/ do
  PartnerPortal.common_page.hamburger_button_xs.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.hamburger_button_xs).to be_present, 'Hamburger button DOES NOT exist mobile mode'
end

Then /^[Pp]P: [Ee]xpect [Hh]amburger button exists for browser$/ do
  PartnerPortal.common_page.panel_hamburger.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_hamburger).to be_present, 'Hamburger button DOES NOT exist browser mode'
end

Then /^[Pp]P: [Ee]xpect [Hh]amburger button does not exists for browser$/ do
  expect(PartnerPortal.common_page.panel_hamburger).not_to be_present, 'Hamburger button IS PRESENT browser mode'
end

Then /^[Pp]P: [Ee]xpect [Hh]amburger button does not exists for mobile$/ do
  expect(PartnerPortal.common_page.hamburger_button_xs).not_to be_present, 'Hamburger button IS PRESENT mobile'
end

Then /^[Pp]P: [Cc]lick on [Hh]amburger button for mobile$/ do
  PartnerPortal.common_page.hamburger_button_xs.wait_until_present(timeout: 10)
  PartnerPortal.common_page.hamburger_button_xs.click
end

Then /^[Pp]P: [Ee]xpect [Xx] button exists$/ do
  PartnerPortal.common_page.x_button.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.x_button).to be_present, 'X button DOES NOT exist on mobile mode'
end

Then /^[Pp]P: [Cc]lick on [Xx] button$/ do
    PartnerPortal.common_page.x_button.wait_until_present(timeout: 10)
    PartnerPortal.common_page.x_button.click
end

Then /^[Pp]P: [Ee]xpect [Dd]ashboard on left panel exists$/ do
  PartnerPortal.common_page.panel_dashboard.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_dashboard).to be_present, 'Dashboard on panel DOES NOT exist'
end

Then /^[Pp]P: [Ee]xpect left panel to expand for browser$/ do
  PartnerPortal.common_page.panel_expanded_lg.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_expanded_lg).to be_present, 'Expanded Panel DOES NOT exist browser mode'
end

Then /^[Pp]P: [Ee]xpect left panel to collapse for browser$/ do
  PartnerPortal.common_page.panel_collapsed_lg.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_collapsed_lg).to be_present, 'Collapsed Panel DOES NOT exist browser mode'
end

Then /^[Pp]P: [Ee]xpect left panel to expand for mobile$/ do
  PartnerPortal.common_page.panel_expanded_xs.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_expanded_xs).to be_present, 'Expanded Panel DOES NOT exist mobile mode'
end

Then /^[Pp]P: [Ee]xpect left panel to collapse for mobile$/ do
  PartnerPortal.common_page.panel_collapsed_xs.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_collapsed_xs).to be_present, 'Collapsed Panel DOES NOT exist mobile mode'
end

Then /^[Pp]P: [Ee]xpect arrow on left panel does not exists for browser$/ do
  expect(PartnerPortal.common_page.panel_arrow).not_to be_present, 'Arrow on left panel is PRESENT mobile mode'
end

Then /^[Pp]P: [Ee]xpect arrow on left panel exists for browser$/ do
  PartnerPortal.common_page.panel_arrow.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_arrow).to be_present, 'Arrow on Panel DOES NOT exist browser mode'
end


Then /^[Pp]P: [Cc]lick on arrow on left panel$/ do
  PartnerPortal.common_page.panel_arrow.wait_until_present(timeout: 10)
  PartnerPortal.common_page.panel_arrow.click
end


