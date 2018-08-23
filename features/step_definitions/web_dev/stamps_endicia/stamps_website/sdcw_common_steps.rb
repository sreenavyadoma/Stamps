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
  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    common_page.get_started_xs.click!
  else
   common_page.get_started.click!
  end
  step 'pause for 2 second'
  step 'WL: expect profile page email exists'
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

Then /^SDCW: click FAQ$/ do
   common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    step 'SDCW: click hamburger button'
    common_page.faq_xs.click
  else
    common_page.faq.click
  end

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

Then /^SDCW: click hamburger button$/ do
  menu_xs = StampsWebsite.common_page.menu_xs
  menu_xs.wait_until_present(timeout: 5)
  att_value = menu_xs.attribute_value 'class'
  menu_xs.click if att_value == 'navbar-toggle collapsed'
  step 'pause for 1 second'
  expect(menu_xs.attribute_value 'class').to eql('navbar-toggle')
end

Then /^SDCW: click hamburger --> get started link$/ do
  step 'SDCW: click hamburger button'
  StampsWebsite.common_page.get_started_xs.click
  step 'pause for 2 second'
  step 'WL: expect profile page email exists'
  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://qa-registration.stamps.com/registration/#!&p=profile')
    when :stg
      expect(SdcPage.browser.url).to eql('https://staging-registration.stamps.com/registration/#!&p=profile')
    when :prod
      expect(SdcPage.browser.url).to eql('https://registration.stamps.com/registration/#!&p=profile')
  end
end

Then /^SDCW: click hamburger --> learn more$/ do
  step 'SDCW: click hamburger button'
  menu_learn_more_xs = StampsWebsite.common_page.menu_learn_more_xs
  att_value = menu_learn_more_xs.attribute_value 'class'
  menu_learn_more_xs.click if att_value == 'list-group-item list-group-item-success collapsed'
  step 'pause for 1 second'
  expect(menu_learn_more_xs.attribute_value 'class').to eql('list-group-item list-group-item-success')
end

Then /^SDCW: click learn more --> small office mailers link$/ do

  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    step 'SDCW: click hamburger --> learn more'
    common_page.small_office_mailers_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.learn_more.click
    else
      common_page.learn_more.hover
    end
    common_page.small_office_mailers.click
  end
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

Then /^SDCW: click learn more --> online sellers link$/ do

  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    step 'SDCW: click hamburger --> learn more'
    common_page.online_sellers_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.learn_more.click
    else
      common_page.learn_more.hover
    end
    common_page.online_sellers.click
  end
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

Then /^SDCW: click learn more --> warehouse shippers link$/ do
  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    step 'SDCW: click hamburger --> learn more'
    common_page.warehouse_shippers_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.learn_more.click
    else
      common_page.learn_more.hover
    end
    common_page.warehouse_shippers.click
  end
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

Then /^SDCW: click learn more --> corporate postage solutions link$/ do
  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    step 'SDCW: click hamburger --> learn more'
    common_page.corporate_postage_solutions_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.learn_more.click
    else
      common_page.learn_more.hover
    end
    common_page.corporate_postage_solutions.click
  end
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

Then /^SDCW: click hamburger --> customer support$/ do
  step 'SDCW: click hamburger button'
  StampsWebsite.common_page.customer_support_xs.click
  step 'pause for 5 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close
  expect(url).to eql('https://stamps--tst.custhelp.com/app/answers/list')
end

Then /^SDCW: click hamburger --> customer log-in/ do
  step 'SDCW: click hamburger button'
  StampsWebsite.common_page.customer_log_in_xs.click
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

Then /^SDCW: click hamburger --> call us 1-888-434-0055/ do
  step 'SDCW: click hamburger button'
  StampsWebsite.common_page.call_us_xs.click
  step 'pause for 2 second'
  SdcPage.browser.alert.text
end
