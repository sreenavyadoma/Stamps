
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
    if SdcEnv.mobile
      expect(PartnerPortal.pp_common_page.sdc_endicia_logo_mobile). to be_present, "Stamps Endicia Partner Portal Logo header DOES NOT exist mobile mode"
    end

    expect(PartnerPortal.pp_common_page.sdc_endicia_logo_browser). to be_present, "Stamps Endicia Partner Portal Logo header DOES NOT exist browser mode"
end

Then /^[Pp]P: click on global header$/ do
  PartnerPortal.stamps_endicia_common_page.global_header.send_keys(:enter)
end

Then /^[Pp]P: [Ee]xpect global  header exists$/ do
  expect(PartnerPortal.pp_common_page.global_header).to be_present, "Global header DOES NOT exist"
end


Then /^[Pp]P: navigate back to previous page$/ do
SdcPage.browser.back
end