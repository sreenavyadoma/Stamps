
Then /^[Pp]P: set window to small viewport$/ do
  if SdcEnv.browser
    SdcPage.browser.window.resize_to(320, 480)
  else
    #ignore
  end
end

Then /^[Pp]P: set window to medium viewport$/ do
  if SdcEnv.browser
    SdcPage.browser.window.resize_to(768, 1024)
  else
    #ignore
  end
end

Then /^[Pp]P: set window to large viewport$/ do
  if SdcEnv.browser
    SdcPage.browser.window.resize_to(1920, 1080)
  else
    #ignore
  end
end

Then /^[Pp]P: [Ee]xpect Stamps Endicia Partner Portal Logo exists$/ do
  expect(PartnerPortal.pp_common_page.sdc_endicia_logo_browser). to be_present, "Stamps Endicia Partner Portal Logo header DOES NOT exist on dashboard page"
end

Then /^[Pp]P: click on Stamps Endicia Partner Portal logo$/ do
  PartnerPortal.stamps_endicia_common_page.sdc_endicia_logo_browser.send_keys(:enter)
end

Then /^[Pp]P: navigate back to previous page$/ do
SdcPage.browser.back
end