Then /^[Ee]stablish [Pp]artner [Pp]ortal db connection$/ do
  PartnerPortal.db_connection
end

Then /^[Cc]lose [Pp]artner [Pp]ortal db connection$/ do
  PartnerPortal.db_connection.close
end

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
  PartnerPortal.common_page.global_header.wait_until_present(timeout: 10)
  PartnerPortal.common_page.global_header.click
end

Then /^[Pp]P: [Ee]xpect global header exists$/ do
  PartnerPortal.common_page.global_header.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.global_header).to be_present, 'Global header DOES NOT exist'
end

Then /^[Pp]P: [Ee]xpect global header does not exists$/ do
  expect(PartnerPortal.common_page.global_header).not_to be_present, 'Global header is PRESENT'
end

Then /^[Pp]P: [Ee]xpect footer to exists$/ do
  PartnerPortal.common_page.footer.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.footer).to be_present, 'Footer DOES NOT exist'
end

Then /^[Pp]P: [Ee]xpect footer does not exists$/ do
  expect(PartnerPortal.common_page.footer).not_to be_present, 'Footer is PRESENT'
end

Then /^PP: expect copyright dates is (\d+) - current year$/ do |year|
  system_date = DateTime.now.utc
  copyright_date_actual = PartnerPortal.common_page.copyright_date.text_value.gsub(/\P{ASCII}/, '').strip.gsub("Copyright", "").split('-')

  expect(copyright_date_actual.first.to_i).to eql(year)
  expect(system_date.year).to eql(copyright_date_actual.last.to_i)
end

Then /^PP: click on Copyright Stamps.com link$/ do
 PartnerPortal.common_page.stamps_copyright_link.send_keys(:enter)
end

Then /^PP: click on Copyright Endicia link$/ do
  PartnerPortal.common_page.endicia_copyright_link.send_keys(:enter)
end

Then /^PP: click on Stamps.com Privacy Policy link$/ do
  PartnerPortal.common_page.stamps_privacy_policy_link.send_keys(:enter)
end

Then /^PP: click on Endicia Privacy Policy link$/ do
  PartnerPortal.common_page.endicia_privacy_policy_link.send_keys(:enter)
end

Then /^PP: expect (.*) open in a new tab$/ do |str|
  step 'pause for 2 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close
  expect(url).to eql(str)
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

Then /^[Pp]P: [Ee]xpect [Dd]ashboard on left panel exists$/ do
  PartnerPortal.common_page.panel_dashboard.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_dashboard).to be_present, 'Dashboard on Left Panel DOES NOT exist'
end

Then /^PP: click on dashboard on left panel$/ do
  PartnerPortal.common_page.panel_dashboard.wait_until_present(timeout: 10)
  PartnerPortal.common_page.panel_dashboard.send_keys(:enter)
end

Then /^[Pp]P: [Cc]lick on [Ll]ogout on left panel$/ do
  PartnerPortal.common_page.panel_logout.wait_until_present(timeout: 10)
  PartnerPortal.common_page.panel_logout.send_keys(:enter)
end

Then /^[Pp]P: [Ee]xpect [Ll]ogout on left panel exists$/ do
  PartnerPortal.common_page.panel_logout.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_logout).to be_present, 'Logout on Left Panel DOES NOT exist'
end

Then /^PP: expect usps logo on left panel exists$/ do
  PartnerPortal.common_page.panel_usps_logo.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_usps_logo).to be_present, 'USPS on Left Panel DOES NOT exist'
end


Then /^[Pp]P: [Ee]xpect left panel to expand for browser$/ do
  PartnerPortal.common_page.panel_expanded_lg.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_expanded_lg).to be_present, 'Expanded Panel DOES NOT exist browser mode'
end

Then /^[Pp]P: [Ee]xpect left panel to collapse for browser$/ do
  PartnerPortal.common_page.panel_collapsed_lg.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_collapsed_lg).to be_present, 'Collapsed Panel DOES NOT exist browser mode'
end

Then /^PP: expect left panel does not exist for browser$/ do
  expect(PartnerPortal.common_page.panel_expanded_lg).not_to be_present, 'Expanded Panel IS PRESENT browser mode'
  expect(PartnerPortal.common_page.panel_collapsed_lg).not_to be_present, 'Collapsed Panel IS PRESENT browser mode'
  expect(PartnerPortal.common_page.panel_arrow).not_to be_present, 'Arrow on left panel is PRESENT browser mode'
  expect(PartnerPortal.common_page.panel_hamburger).not_to be_present, 'Hamburger button IS PRESENT browser mode'
end

Then /^[Pp]P: [Ee]xpect arrow on left panel does not exists for browser$/ do
  expect(PartnerPortal.common_page.panel_arrow).not_to be_present, 'Arrow on left panel is PRESENT browser mode'
end

Then /^[Pp]P: [Ee]xpect arrow on left panel exists for browser$/ do
  PartnerPortal.common_page.panel_arrow.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_arrow).to be_present, 'Arrow on Panel DOES NOT exist browser mode'
end


Then /^[Pp]P: [Cc]lick on arrow on left panel$/ do
  PartnerPortal.common_page.panel_arrow.wait_until_present(timeout: 10)
  PartnerPortal.common_page.panel_arrow.click
end

Then /^PP: expect partner logo is unique to partner$/ do
    step 'Establish Partner Portal db connection'
    logo_expected = PartnerPortal.common_page.partner_logo_query(SdcEnv.usr)
    step 'Close partner portal db connection'

    logo_actual = PartnerPortal.common_page.panel_partner_logo.attribute_value 'src'
    expect(logo_expected).to eql(logo_actual.split('com/').last)


end


Then /^[Pp]P: [Ee]xpect [Hh]amburger button exists for browser$/ do
  PartnerPortal.common_page.panel_hamburger.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_hamburger).to be_present, 'Hamburger button DOES NOT exist browser mode'
end

Then /^[Pp]P: [Ee]xpect [Hh]amburger button does not exists for browser$/ do
  expect(PartnerPortal.common_page.panel_hamburger).not_to be_present, 'Hamburger button IS PRESENT browser mode'
end

Then /^PP: click on hamburger button$/ do
  PartnerPortal.common_page.panel_hamburger.wait_until_present(timeout: 10)
  PartnerPortal.common_page.panel_hamburger.click
end

Then /^[Pp]P: [Ee]xpect left panel to expand for mobile$/ do
  PartnerPortal.common_page.panel_expanded_xs.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_expanded_xs).to be_present, 'Expanded Panel DOES NOT exist mobile mode'
end

Then /^[Pp]P: [Ee]xpect left panel to collapse for mobile$/ do
  PartnerPortal.common_page.panel_collapsed_xs.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.panel_collapsed_xs).to be_present, 'Collapsed Panel DOES NOT exist mobile mode'
end

Then /^[Pp]P: [Ee]xpect [Hh]amburger button exists for mobile$/ do
  PartnerPortal.common_page.hamburger_button_xs.wait_until_present(timeout: 10)
  expect(PartnerPortal.common_page.hamburger_button_xs).to be_present, 'Hamburger button DOES NOT exist mobile mode'
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

Then /^[Pp]P: [Ee]xpect [Xx] button does not exists$/ do
  expect(PartnerPortal.common_page.x_button).not_to be_present, 'X button is PRESENT in mobile mode'
end

Then /^[Pp]P: [Cc]lick on [Xx] button$/ do
  PartnerPortal.common_page.x_button.wait_until_present(timeout: 10)
  PartnerPortal.common_page.x_button.click
end
