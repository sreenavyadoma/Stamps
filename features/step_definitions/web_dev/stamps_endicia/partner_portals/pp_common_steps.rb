
Then /^[Pp]P: set window to small viewport$/ do
  if SdcEnv.browser
    SdcPage.browser.window.resize_to(320, 480)
  end
end

Then /^[Pp]P: set window to medium viewport$/ do
  if SdcEnv.browser
    SdcPage.browser.window.resize_to(992, 1080)
  end
end

Then /^[Pp]P: set window to large viewport$/ do
  if SdcEnv.browser
    SdcPage.browser.window.resize_to(1200, 1080)
  end
end

Then /^[Pp]P: navigate back to previous page$/ do
  SdcPage.browser.back
end

Then /^[Pp]P: click on global header$/ do
  PartnerPortal.pp_common_page.global_header.send_keys(:enter)
end

Then /^[Pp]P: [Ee]xpect global  header exists$/ do
  expect(PartnerPortal.pp_common_page.global_header).to be_present, "Global header DOES NOT exist"
end

Then /^[Pp]P: [Ee]xpect [Pp]artner [Pp]ortal logo exists$/ do
  expect(PartnerPortal.pp_common_page.partner_portal_logo).to be_present, "Partner Portal logo DOES NOT exist"
end

Then /^[Pp]P: [Ee]xpect Stamps Endicia Partner Portal Logo exists$/ do
    expect(PartnerPortal.pp_common_page.sdc_endicia_logo_browser). to be_present, "Stamps Endicia Partner Portal Logo header DOES NOT exist browser mode"
end

Then /^[Pp]P: [Ee]xpect Stamps Endicia Partner Portal Logo exists for mobile$/ do
    expect(PartnerPortal.pp_common_page.sdc_endicia_logo_mobile). to be_present, "Stamps Endicia Partner Portal Logo header DOES NOT exist mobile mode"
end

Then /^[Pp]P: [Ee]xpect [Hh]amburger button exists$/ do
  expect(PartnerPortal.pp_common_page.hamburger_button).to be_present, "Hamburger button DOES NOT exist"
end

Then /^[Pp]P: [Cc]lick on [Hh]amburger button$/ do
  PartnerPortal.pp_common_page.hamburger_button.send_keys(:enter)
end

Then /^[Pp]P: [Cc]lick on [Xx] button$/ do
  PartnerPortal.pp_common_page.hamburger_button.send_keys(:enter)
end


