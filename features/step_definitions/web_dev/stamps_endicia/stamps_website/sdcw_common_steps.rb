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

end