Then /^SDCW: navigate back$/ do
  SdcPage.browser.back
end

Then /^SDCW: click stamps website logo$/ do
  StampsWebsite.common_page.stamps_logo.click
  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.qacc.stamps.com/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.staging.stamps.com/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://www.stamps.com/')
  end
end

Then /^SDCW: click learn more->small office mailers link$/ do
  common_page = StampsWebsite.common_page
  common_page.learn_more.hover
  common_page.small_office_mailers.click
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
  common_page.learn_more.hover
  common_page.online_sellers.click
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
  common_page.learn_more.hover
  common_page.warehouse_shippers.click
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
  common_page.learn_more.hover
  common_page.corporate_postage_solutions.click
  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.qacc.stamps.com/enterprise/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.staging.stamps.com/enterprise/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://stamps.com/enterprise/')
  end
end

