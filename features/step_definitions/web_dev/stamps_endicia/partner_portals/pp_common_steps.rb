Then /^[Pp]P: [Ee]xpect Stamps Endicia Partner Portal Logo exists$/ do
  expect(PartnerPortal.pp_common_page.sdc_endicia_logo_browser). to be_present, "Stamps Endicia Partner Portal Logo header DOES NOT exist on dashboard page"
end

Then /^[Pp]P: click on Stamps Endicia Partner Portal logo$/ do
  PartnerPortal.stamps_endicia_common_page.sdc_endicia_logo_browser.send_keys(:enter)
end

Then /^[Pp]P: navigate back to previous page$/ do
SdcPage.browser.back
end