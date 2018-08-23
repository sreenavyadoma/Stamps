Then /^SDCW: navigate back$/ do
  SdcPage.browser.back
  step 'pause for 1 second'
end

Then /^SDCW: blur_out on page$/ do
  StampsWebsite.common_page.stamps_logo.blur_out
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


########### footer ############

Then /^SDCW: expect stamps website footer usps logo exists$/ do
  usps_logo = StampsWebsite.common_page.usps_logo
  usps_logo.wait_until_present(timeout: 2)
  expect(usps_logo).to be_present
end

Then /^SDCW: expect stamps website footer usps logo words is (.*)$/ do |str|
  usps_logo_caption = StampsWebsite.common_page.usps_logo_caption
  expect(usps_logo_caption.text_value.strip).to eql(str)
end

Then /^SDCW: expect stamps website footer copyright exists$/ do
  copyright = StampsWebsite.common_page.copyright
  copyright.wait_until_present(timeout: 2)
  expect(copyright).to be_present
end


Then /^SDCW: expect stamps website footer copyright text is (.*)$/ do |str|
  copyright = StampsWebsite.common_page.copyright
  expect(copyright.text_value.strip).to eql(str)
end

Then /^SDCW: page redirects to (.*)$/ do |str|
  sdcw_page = TestSession.env.url
end

Then /^SDCW: click footer copyright link$/ do

  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    # common_page.small_office_mailers_xs.click to do
  else
    if TestSession.env.local_browser == :edge
      common_page.copyright.click
    else
      common_page.copyright.scroll_into_view
      common_page.copyright.hover
      common_page.copyright.click
    end
  end
  step 'pause for 1 second'
  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.qacc.stamps.com/site/copyright/#copyright')
    when :stg
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.staging.stamps.com/site/copyright/#copyright')
    when :prod
      expect(SdcPage.browser.url).to eql('https://stamps.com/site/copyright/#copyright')
  end
end

######## Products #######
Then /^SDCW: click footer small office mailers$/ do
  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    # common_page.small_office_mailers_xs.click to do
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_office_mailers.click
    else
      common_page.footer_office_mailers.scroll_into_view
      common_page.footer_office_mailers.hover
      common_page.footer_office_mailers.click
    end
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

Then /^SDCW: click footer online sellers$/ do
  step 'SDCW: blur_out on page'
  step 'pause for 1 second'
  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    # common_page.small_office_mailers_xs.click to do
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_online_sellers.click
    else
      common_page.footer_online_sellers.scroll_into_view
      common_page.footer_online_sellers.hover
      common_page.footer_online_sellers.click
    end
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

Then /^SDCW: click footer warehouse shippers$/ do

  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    # common_page.small_office_mailers_xs.click to do
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_warehouse_shippers.click
    else
      common_page.footer_warehouse_shippers.scroll_into_view
      common_page.footer_warehouse_shippers.hover
      common_page.footer_warehouse_shippers.click
    end
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

Then /^SDCW: click footer corporate postage solutions$/ do

  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    # common_page.small_office_mailers_xs.click to do
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_corporate_postage_solutions.click
    else
      common_page.footer_corporate_postage_solutions.scroll_into_view
      common_page.footer_corporate_postage_solutions.hover
      common_page.footer_corporate_postage_solutions.click
    end
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

Then /^SDCW: click footer photo stamps$/ do

  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    # common_page.small_office_mailers_xs.click to do
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_photo_stamps.click
    else
      common_page.footer_photo_stamps.scroll_into_view
      common_page.footer_photo_stamps.hover
      common_page.footer_photo_stamps.click
    end
  end
  step 'pause for 3 seconds'
  SdcPage.browser.window(:title => "Photo Stamps, PhotoStamps, Personalized Stamps, Custom Postage").use

  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://photo.corp.stamps.com/Store/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://photo.staging.stamps.com/Store/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://photo.corp.stamps.com/Store/')
  end

  SdcPage.browser.window(:title => "Photo Stamps, PhotoStamps, Personalized Stamps, Custom Postage").close
  step 'pause for 1 second'
end

Then /^SDCW: click footer supplies$/ do

  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    # common_page.small_office_mailers_xs.click to do
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_supplies.click
    else
      common_page.footer_supplies.scroll_into_view
      common_page.footer_supplies.hover
      common_page.footer_supplies.click
    end
  end
end

####### support #####
Then /^SDCW: click footer download software$/ do

  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    # common_page.small_office_mailers_xs.click to do
  else
    if TestSession.env.local_browser == :edge
      common_page.download_software.click
    else
      common_page.download_software.scroll_into_view
      common_page.download_software.hover
      common_page.download_software.click
    end
  end
  step 'pause for 1 second'
  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.qacc.stamps.com/download/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.staging.stamps.com/download/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://stamps.com/download/')
  end
end

Then /^SDCW: click footer customer support$/ do

  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    # common_page.small_office_mailers_xs.click to do
  else
    if TestSession.env.local_browser == :edge
      common_page.customer_support.click
    else
      common_page.customer_support.scroll_into_view
      common_page.customer_support.hover
      common_page.customer_support.click
    end
  end
  step 'pause for 3 second'
  SdcPage.browser.window(:title => "Support Home Page").use

  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://stamps--tst.custhelp.com/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://stamps--tst.custhelp.com/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://stamps--tst.custhelp.com/')
  end

  SdcPage.browser.window(:title => "Support Home Page").close
  step 'pause for 1 second'
end

Then /^SDCW: click footer how to videos$/ do

  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    # common_page.small_office_mailers_xs.click to do
  else
    if TestSession.env.local_browser == :edge
      common_page.how_to_videos.click
    else
      common_page.how_to_videos.scroll_into_view
      common_page.how_to_videos.hover
      common_page.how_to_videos.click
    end
  end
  step 'pause for 5 second'
  SdcPage.browser.window(:title => "(16) Stamps.com - YouTube").use

  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://www.youtube.com/user/StampscomVideo')
    when :stg
      expect(SdcPage.browser.url).to eql('https://www.youtube.com/user/StampscomVideo')
    when :prod
      expect(SdcPage.browser.url).to eql('https://www.youtube.com/user/StampscomVideo')
  end

  SdcPage.browser.window(:title => "(16) Stamps.com - YouTube").close
  step 'pause for 1 second'
end

Then /^SDCW: click footer faq$/ do

  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    # common_page.small_office_mailers_xs.click to do
  else
    if TestSession.env.local_browser == :edge
      common_page.faq.click
    else
      common_page.faq.scroll_into_view
      common_page.faq.hover
      common_page.faq.click
    end
  end
  step 'pause for 1 second'
  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.qacc.stamps.com/postage-online/faqs/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://sdcwebsite.staging.stamps.com/postage-online/faqs/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://stamps.com/postage-online/faqs')
  end
end

Then /^SDCW: click footer system status$/ do

  common_page = StampsWebsite.common_page
  if TestSession.env.browser_mobile_emulator || TestSession.env.mobile_device
    # common_page.small_office_mailers_xs.click to do
  else
    if TestSession.env.local_browser == :edge
      common_page.system_status.click
    else
      common_page.system_status.scroll_into_view
      common_page.system_status.hover
      common_page.system_status.click
    end
  end
  step 'pause for 3 second'
  SdcPage.browser.window(:title => "Status.Stamps.com Status").use

  case TestSession.env.url
    when :qacc
      expect(SdcPage.browser.url).to eql('https://status.stamps.com/')
    when :stg
      expect(SdcPage.browser.url).to eql('https://status.stamps.com/')
    when :prod
      expect(SdcPage.browser.url).to eql('https://status.stamps.com/')
  end

  SdcPage.browser.window(:title => "Status.Stamps.com Status").close
  step 'pause for 1 second'
end