Then /^SDCW: navigate back$/ do
  SdcPage.browser.back
  step 'pause for 1 second'
end

Then /^SDCW: click stamps website logo$/ do
  StampsWebsite.common_page.stamps_logo.click
  step 'pause for 1 second'
  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.qacc.stamps.com/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.staging.stamps.com/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://www.stamps.com/')
  end
end

Then /^SDCW: click get started button$/ do
  StampsWebsite.common_page.get_started.click!
  step 'pause for 2 second'
  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://qacc-registration.stamps.com/registration/#!&p=profile')
    when :stg
      expect(SdcPage.browser.url).to eql('https://staging-registration.stamps.com/registration/#!&p=profile')
    when :prod
      expect(SdcPage.browser.url).to eql('https://registration.stamps.com/registration/#!&p=profile')
  end
end

Then /^SDCW: click get log in button$/ do
  StampsWebsite.common_page.log_in.click!
  step 'pause for 2 second'
  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://print.qacc.stamps.com/SignIn/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://print.testing.stamps.com/SignIn/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://print.stamps.com/SignIn/')
  end
end

Then /^SDCW: click learn more->small office mailers link$/ do
  common_page = StampsWebsite.common_page
  if TestSession.env.local_browser == :edge
    common_page.learn_more.click
  else
    common_page.learn_more.hover
  end

  common_page.small_office_mailers.click
  step 'pause for 1 second'
  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.qacc.stamps.com/postage-online/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.staging.stamps.com/postage-online/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://stamps.com/postage-online/')
  end
end

Then /^SDCW: click learn more->online sellers link$/ do
  common_page = StampsWebsite.common_page
  if TestSession.env.local_browser == :edge
    common_page.learn_more.click
  else
    common_page.learn_more.hover
  end
  common_page.online_sellers.click
  step 'pause for 1 second'

  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.qacc.stamps.com/shipping/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.staging.stamps.com/shipping/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://stamps.com/shipping/')
  end
end

Then /^SDCW: click learn more->warehouse shippers link$/ do
  common_page = StampsWebsite.common_page
  if TestSession.env.local_browser == :edge
    common_page.learn_more.click
  else
    common_page.learn_more.hover
  end
  common_page.warehouse_shippers.click
  step 'pause for 1 second'

  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.qacc.stamps.com/warehouse/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.staging.stamps.com/warehouse/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://stamps.com/warehouse/')
  end
end

Then /^SDCW: click learn more->corporate postage solutions link$/ do
  common_page = StampsWebsite.common_page

  if TestSession.env.local_browser == :edge
    common_page.learn_more.click
  else
    common_page.learn_more.hover
  end
  common_page.corporate_postage_solutions.click
  step 'pause for 1 second'

  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.qacc.stamps.com/enterprise/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.staging.stamps.com/enterprise/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://stamps.com/enterprise/')
  end
end

Then /^SDCW: click FAQ$/ do
  StampsWebsite.common_page.faq.click
  step 'pause for 1 second'
  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.qacc.stamps.com/postage-online/faqs/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.staging.stamps.com/postage-online/faqs/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://stamps.com/postage-online/faqs/')
  end
end