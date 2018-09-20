Then /^SDCW: navigate to postage online page$/ do
  StampsWebsite::PostageOnlinePage.visit
  stamps_logo = StampsWebsite.common_page.stamps_logo
  stamps_logo.wait_until_present(timeout: 10)
  expect(stamps_logo).to be_present
end

Then /^SDCW: postage online page click support --> faq$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer support mobile'
    common_page.faq[2].click
  else
    if TestSession.env.local_browser == :edge
      common_page.faq[3].click
    else
      common_page.faq[3].scroll_into_view
      common_page.faq[3].hover
      common_page.faq[3].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/postage-online/faqs/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/postage-online/faqs/')
    when :prod
      expect(url).to eql('https://www.stamps.com/postage-online/faqs')
    else
      expect(url).to eql("https://#{TestSession.env.url}-win10.corp.stamps.com/stampscom/postage-online/faqs/")
  end
  step 'SDCW: navigate back'
end