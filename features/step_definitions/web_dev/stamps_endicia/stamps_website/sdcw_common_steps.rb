Then /^SDCW: navigate back$/ do
  SdcPage.browser.back
  step 'pause for 1 second'
end

Then /^SDCW: page redirects to (.*)$/ do |str|
  sdcw_page = TestSession.env.url
end

Then /^SDCW: blur_out on page$/ do
  StampsWebsite.common_page.stamps_logo.blur_out
  step 'pause for 1 second'
end

Then /^SDCW: click stamps website logo$/ do
  StampsWebsite.common_page.stamps_logo.click
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/')
    when :prod
      expect(url).to eql('https://www.stamps.com/')
  end
end

Then /^SDCW: click get started button$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common_page.get_started_xs.click!
  else
    common_page.get_started.click!
  end
  step 'pause for 2 second'
  step 'WL: expect profile page email exists'

  url = SdcPage.browser.url

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://qacc-registration.stamps.com/registration/#!&p=profile')
    when :stg
      expect(url).to eql('https://staging-registration.stamps.com/registration/#!&p=profile')
    when :prod
      expect(url).to eql('https://registration.stamps.com/registration/#!&p=profile')
  end
end

Then /^SDCW: click get log in button$/ do
  StampsWebsite.common_page.log_in.click!
  step 'pause for 2 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://print.qacc.stamps.com/SignIn/')
    when :stg
      expect(url).to eql('https://print.testing.stamps.com/SignIn/')
    when :prod
      expect(url).to eql('https://print.stamps.com/SignIn/')
  end
end

Then /^SDCW: click FAQ$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: click hamburger button'
    common_page.faq_header_xs.click
  else
    common_page.faq_header_xs.click
  end

  step 'pause for 2 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/postage-online/faqs/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/postage-online/faqs/')
    when :prod
      expect(url).to eql('https://stamps.com/postage-online/faqs/')
  end
end

Then /^SDCW: click hamburger button$/ do
  menu_xs = StampsWebsite.common_page.menu_xs
  menu_xs.wait_until_present(timeout: 5)
  step 'pause for 1 second'
  att_value = menu_xs.attribute_value 'class'
  menu_xs.click if att_value == 'navbar-toggle collapsed'
  step 'pause for 2 second'
  expect(menu_xs.attribute_value 'class').to eql('navbar-toggle')
end

Then /^SDCW: click hamburger --> get started link$/ do
  step 'SDCW: click hamburger button'
  StampsWebsite.common_page.get_started_xs.click
  step 'pause for 2 second'
  step 'WL: expect profile page email exists'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://qa-registration.stamps.com/registration/#!&p=profile')
    when :stg
      expect(url).to eql('https://staging-registration.stamps.com/registration/#!&p=profile')
    when :prod
      expect(url).to eql('https://registration.stamps.com/registration/#!&p=profile')
  end
end

Then /^SDCW: click hamburger --> learn more$/ do
  step 'SDCW: click hamburger button'
  menu_learn_more_xs = StampsWebsite.common_page.menu_learn_more_xs
  menu_learn_more_xs.wait_until_present(timeout: 5)
  step 'pause for 1 second'
  att_value = menu_learn_more_xs.attribute_value 'class'
  menu_learn_more_xs.click if att_value == 'list-group-item list-group-item-success collapsed'
  step 'pause for 1 second'
  expect(menu_learn_more_xs.attribute_value 'class').to eql('list-group-item list-group-item-success')
end

Then /^SDCW: click learn more --> small office mailers link$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
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
  step 'pause for 2 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/postage-online/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/postage-online/')
    when :prod
      expect(url).to eql('https://stamps.com/postage-online/')
  end
end

Then /^SDCW: click learn more --> online sellers link$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
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
  step 'pause for 2 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/shipping/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/shipping/')
    when :prod
      expect(url).to eql('https://stamps.com/shipping/')
  end
end

Then /^SDCW: click learn more --> warehouse shippers link$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
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
  step 'pause for 2 second'
  url = SdcPage.browser.url

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/warehouse/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/warehouse/')
    when :prod
      expect(url).to eql('https://stamps.com/warehouse/')
  end
end

Then /^SDCW: click learn more --> corporate postage solutions link$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
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
  step 'pause for 2 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/enterprise/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/enterprise/')
    when :prod
      expect(url).to eql('https://stamps.com/enterprise/')
  end
end

Then /^SDCW: click hamburger --> customer support$/ do
  step 'SDCW: click hamburger button'
  StampsWebsite.common_page.customer_support_header_xs.click
  step 'pause for 2 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close
  expect(url).to eql('https://stamps--tst.custhelp.com/app/answers/list')
end

Then /^SDCW: click hamburger --> customer log-in/ do
  step 'SDCW: click hamburger button'
  StampsWebsite.common_page.customer_log_in_xs.click

  step 'pause for 2 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://print.qacc.stamps.com/SignIn/?')
    when :stg
      expect(url).to eql('https://print.testing.stamps.com/SignIn/?')
    when :prod
      expect(url).to eql('https://print.stamps.com/SignIn/?')
  end
end

Then /^SDCW: expect hamburger --> call us 1-888-434-0055 to be present/ do
  step 'SDCW: click hamburger button'
  call_us_xs = StampsWebsite.common_page.call_us_xs
  expect(call_us_xs.text_value).to be_present
  expect(call_us_xs.text_value).to eql('Call Us 1-888-434-0055')
end


Then /^SDCW: verify default elements on header for browser$/ do
  step 'SDCW: navigate to postage online page'
  step 'SDCW: click stamps website logo'
  step 'SDCW: navigate back'
  step 'SDCW: click get started button'
  step 'SDCW: navigate back'
  step 'SDCW: click get log in button'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> small office mailers link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> online sellers link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> warehouse shippers link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> corporate postage solutions link'
  step 'SDCW: navigate back'
end

Then /^SDCW: verify default elements on header for mobile$/ do
  step 'SDCW: navigate to postage online page'
  step 'SDCW: click stamps website logo'
  step 'SDCW: navigate back'
  step 'SDCW: click get started button'
  step 'SDCW: navigate back'
  step 'SDCW: click hamburger --> get started link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> small office mailers link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> online sellers link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> warehouse shippers link'
  step 'SDCW: navigate back'
  step 'SDCW: click learn more --> corporate postage solutions link'
  step 'SDCW: navigate back'
  step 'SDCW: click hamburger --> customer support'
  step 'SDCW: click hamburger --> customer log-in'
  step 'SDCW: navigate back'
  step 'SDCW: expect hamburger --> call us 1-888-434-0055 to be present'
end

Then /^SDCW: verify default elements on footer for browser$/ do
  step 'SDCW: expect stamps website footer usps logo exists'
  step 'SDCW: expect stamps website footer usps logo words is Stamps.com is an independent vendor of the USPS.'
  step 'SDCW: expect stamps website footer copyright exists'
  step 'SDCW: expect stamps website footer copyright text is Copyright © 1998-2018 Stamps.com Inc.'
  step 'SDCW: click footer copyright link'
  step 'SDCW: click footer small office mailers'
  step 'SDCW: click footer online sellers'
  step 'SDCW: click footer warehouse shippers'
  step 'SDCW: click footer corporate postage solutions'
  step 'SDCW: click footer photo stamps'
  step 'SDCW: click footer supplies'
  step 'SDCW: click footer download software'
  step 'SDCW: click footer customer support'
  step 'SDCW: click footer how to videos'
  step 'SDCW: click footer faq'
  step 'SDCW: click footer system status'
  step 'SDCW: click company stuff --> about us'
  step 'SDCW: click footer shipping partners'
  step 'SDCW: click footer privacy policy'
  step 'SDCW: click footer investor info'
  step 'SDCW: click footer careers'
  step 'SDCW: click footer affiliates'
  step 'SDCW: click footer site map'
  step 'SDCW: click footer contact us'
  step 'SDCW: click footer developer overview'
  step 'SDCW: click footer developer registration'
  step 'SDCW: click footer developer reference guide'
  step 'SDCW: click footer developer products'
  step 'SDCW: click footer facebook'
  step 'SDCW: click footer twitter'
  step 'SDCW: click footer google plus'
  step 'SDCW: click footer youtube'
  step 'SDCW: click footer linkedin'
  step 'SDCW: click footer blog'
end

Then /^SDCW: verify default elements on footer for mobile$/ do
  step 'SDCW: click footer small office mailers'
  step 'SDCW: click footer online sellers'
  step 'SDCW: click footer warehouse shippers'
  step 'SDCW: click footer corporate postage solutions'
  step 'SDCW: click footer photo stamps'
  step 'SDCW: click footer supplies'
  step 'SDCW: collapse footer products mobile'
  step 'SDCW: click footer download software'
  step 'SDCW: click footer customer support'
  step 'SDCW: click footer how to videos'
  step 'SDCW: click footer faq'
  step 'SDCW: click footer system status'
  step 'SDCW: collapse footer support mobile'
  step 'SDCW: click company stuff --> about us'
end

#........footer...........#
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

Then /^SDCW: click footer copyright link$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    common_page.copyright_xs.click
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
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/site/copyright/#copyright')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/site/copyright/#copyright')
    when :prod
      expect(url).to eql('https://stamps.com/site/copyright/#copyright')
  end

  step 'SDCW: navigate back'
end

######## Products #######
#
Then /^SDCW: expand footer products mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.footer_products_xs.scroll_into_view
  status = common_page.footer_products_xs.attribute_value  'class'
  common_page.footer_products_xs.click if status.include? 'collapsed'
end

Then /^SDCW: collapse footer products mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.footer_products_xs.scroll_into_view
  status = common_page.footer_products_xs.attribute_value  'class'
  common_page.footer_products_xs.click if status.exclude? 'collapsed'
end

Then /^SDCW: click footer small office mailers$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device

    step 'SDCW: expand footer products mobile'
    common_page.footer_office_mailers[2].click
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_office_mailers[3].click
    else
      common_page.footer_office_mailers[3].scroll_into_view
      common_page.footer_office_mailers[3].hover
      common_page.footer_office_mailers[3].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/postage-online/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/postage-online/')
    when :prod
      expect(url).to eql('https://stamps.com/postage-online/')
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click footer online sellers$/ do
  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    step 'SDCW: expand footer products mobile'
    common_page.footer_online_sellers[2].click
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_online_sellers[3].click
    else
      common_page.footer_online_sellers[3].scroll_into_view
      common_page.footer_online_sellers[3].hover
      common_page.footer_online_sellers[3].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/shipping/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/shipping/')
    when :prod
      expect(url).to eql('https://stamps.com/shipping/')
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click footer warehouse shippers$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    step 'SDCW: expand footer products mobile'
    common_page.footer_warehouse_shippers[2].click
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_warehouse_shippers[3].click
    else
      common_page.footer_warehouse_shippers[3].scroll_into_view
      common_page.footer_warehouse_shippers[3].hover
      common_page.footer_warehouse_shippers[3].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/warehouse/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/warehouse/')
    when :prod
      expect(url).to eql('https://stamps.com/warehouse/')
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click footer corporate postage solutions$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device|| TestSession.env.mobile_device
    step 'SDCW: expand footer products mobile'
    common_page.footer_corporate_postage_solutions[2].click
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_corporate_postage_solutions[3].click
    else
      common_page.footer_corporate_postage_solutions[3].scroll_into_view
      common_page.footer_corporate_postage_solutions[3].hover
      common_page.footer_corporate_postage_solutions[3].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/enterprise/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/enterprise/')
    when :prod
      expect(url).to eql('https://stamps.com/enterprise/')
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click footer photo stamps$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer products mobile'
    common_page.footer_photo_stamps[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_photo_stamps[1].click
    else
      common_page.footer_photo_stamps[1].scroll_into_view
      common_page.footer_photo_stamps[1].hover
      common_page.footer_photo_stamps[1].click
    end
  end
  step 'pause for 3 second'
  url = SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://photo.corp.stamps.com/Store/')
    when :stg
      expect(url).to eql('https://photo.staging.stamps.com/Store/')
    when :prod
      expect(url).to eql('https://photo.corp.stamps.com/Store/')
  end

  step 'pause for 1 second'
end

Then /^SDCW: click footer supplies$/ do
  common_page = StampsWebsite.common_page

  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer products mobile'
    common_page.footer_supplies[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.footer_supplies[1].wait_until_present(timeout: 10)
      common_page.footer_supplies[1].click
    else
      common_page.footer_supplies[1].wait_until_present(timeout: 10)
      common_page.footer_supplies[1].scroll_into_view
      common_page.footer_supplies[1].hover
      common_page.footer_supplies[1].click
    end
  end
  step 'pause for 1 second'
  SdcPage.browser.windows.last.use
  common_page.stamps_store_logo.wait_until_present(timeout: 15)
  url = SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://store.corp.stamps.com/Store/')
    when :stg
      expect(url).to eql('https://store.staging.stamps.com/Store/')
    when :prod
      expect(url).to eql('https://store.corp.stamps.com/Store/')
  end

  step 'pause for 1 second'
end

#......Support.......#
Then /^SDCW: expand footer support mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.footer_support_xs.scroll_into_view
  status = common_page.footer_support_xs.attribute_value  'class'
  common_page.footer_support_xs.click if status.include? 'collapsed'
end

Then /^SDCW: collapse footer support mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.footer_support_xs.scroll_into_view
  status = common_page.footer_support_xs.attribute_value  'class'
  common_page.footer_support_xs.click if status.exclude? 'collapsed'
end

Then /^SDCW: click footer download software$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer support mobile'
    common_page.download_software[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.download_software[1].click
    else
      common_page.download_software[1].scroll_into_view
      common_page.download_software[1].hover
      common_page.download_software[1].click
    end
  end
  step 'pause for 3 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/download/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/download/')
    when :prod
      expect(url).to eql('https://stamps.com/download/')
  end

  step 'SDCW: navigate back'
end

Then /^SDCW: click footer customer support$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer support mobile'
    common_page.customer_support[1].click
  else
    if TestSession.env.local_browser == :edge
      common_page.customer_support[2].click
    else
      common_page.customer_support[2].scroll_into_view
      common_page.customer_support[2].hover
      common_page.customer_support[2].click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://stamps--tst.custhelp.com/')
    when :stg
      expect(url).to eql('https://stamps--tst.custhelp.com/')
    when :prod
      expect(url).to eql('https://stamps--tst.custhelp.com/')
  end

end

Then /^SDCW: click footer how to videos$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer support mobile'
    common_page.how_to_videos[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.how_to_videos[1].click
    else
      common_page.how_to_videos[1].scroll_into_view
      common_page.how_to_videos[1].hover
      common_page.how_to_videos[1].click
    end
  end
  step 'pause for 5 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    expect(url).to eql('https://m.youtube.com/user/StampscomVideo')
  else
    expect(url).to eql('https://www.youtube.com/user/StampscomVideo')
  end

end

Then /^SDCW: click footer faq$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer support mobile'
    common_page.faq[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.faq[1].click
    else
      common_page.faq[1].scroll_into_view
      common_page.faq[1].hover
      common_page.faq[1].click
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
      expect(url).to eql('https://stamps.com/postage-online/faqs')
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click footer system status$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer support mobile'
    common_page.system_status[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.system_status[1].click
    else
      common_page.system_status[1].scroll_into_view
      common_page.system_status[1].hover
      common_page.system_status[1].click
    end
  end
  step 'pause for 3 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://status.stamps.com/')
    when :stg
      expect(url).to eql('https://status.stamps.com/')
    when :prod
      expect(url).to eql('https://status.stamps.com/')
  end

end

####### company stuff #####
Then /^SDCW: expand footer company stuff mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.footer_company_stuff_xs.scroll_into_view
  status = common_page.footer_company_stuff_xs.attribute_value  'class'
  common_page.footer_company_stuff_xs.click if status.include? 'collapsed'
end

Then /^SDCW: collapse footer company stuff mobile$/ do
  common_page = StampsWebsite.common_page
  common_page.footer_company_stuff_xs.scroll_into_view
  status = common_page.footer_company_stuff_xs.attribute_value  'class'
  common_page.footer_company_stuff_xs.click if status.exclude? 'collapsed'
end

Then /^SDCW: click company stuff --> about us$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer company stuff mobile'
    common_page.about_us[0].click

  else
    if TestSession.env.local_browser == :edge
      common_page.about_us[1].click
    else
      common_page.about_us[1].scroll_into_view
      common_page.about_us[1].hover
      common_page.about_us[1].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/company-info/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/company-info/')
    when :prod
      expect(url).to eql('https://stamps.com/company-info/')
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click footer shipping partners$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    step 'SDCW: expand footer company stuff mobile'
    common_page.shipping_partners[0].click
  else
    if TestSession.env.local_browser == :edge
      common_page.shipping_partners[1].click
    else
      common_page.shipping_partners[1].scroll_into_view
      common_page.shipping_partners[1].hover
      common_page.shipping_partners[1].click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/shipping/integrations/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/shipping/integrations/')
    when :prod
      expect(url).to eql('https://stamps.com/shipping/integrations/')
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click footer privacy policy$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device

    common_page.footer_company_stuff_menu_xs.scroll_into_view
    common_page.footer_company_stuff_menu_xs.click!

    common_page.privacy_policy_xs.hover
    common_page.privacy_policy_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.privacy_policy.click
    else
      common_page.privacy_policy.scroll_into_view
      common_page.privacy_policy.hover
      common_page.privacy_policy.click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/privacy-policy/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/privacy-policy/')
    when :prod
      expect(url).to eql('https://stamps.com/privacy-policy/')
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click footer investor info$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device

    common_page.footer_company_stuff_menu_xs.scroll_into_view
    common_page.footer_company_stuff_menu_xs.click!

    common_page.investor_info_xs.hover
    common_page.investor_info_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.investor_info.click
    else
      common_page.investor_info.scroll_into_view
      common_page.investor_info.hover
      common_page.investor_info.click
    end
  end
  step 'pause for 3 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('http://investor.stamps.com/')
    when :stg
      expect(url).to eql('http://investor.stamps.com/')
    when :prod
      expect(url).to eql('http://investor.stamps.com/')
  end

end

Then /^SDCW: click footer careers$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device

    common_page.footer_company_stuff_menu_xs.scroll_into_view

    common_page.careers_xs.hover
    common_page.careers_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.careers.click
    else
      common_page.careers.scroll_into_view
      common_page.careers.hover
      common_page.careers.click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    expect(url.include? 'https://careers-stamps.icims.com/jobs/intro?hashed=-435738745&mobile=true&')
  else
    expect(url).to eql('https://careers-stamps.icims.com/jobs/intro?hashed=-435738745&mobile=false&width=970&height=500&bga=true&needsRedirect=false&jan1offset=-480&jun1offset=-420')
  end

end

Then /^SDCW: click footer affiliates$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device

    common_page.footer_company_stuff_menu_xs.scroll_into_view

    common_page.affiliates_xs.hover
    common_page.affiliates_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.affiliates.click
    else
      common_page.affiliates.scroll_into_view
      common_page.affiliates.hover
      common_page.affiliates.click
    end
  end
  step 'pause for 3 second'
  url = SdcPage.browser.url

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/affiliates/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/affiliates/')
    when :prod
      expect(url).to eql('https://stamps.com/affiliates/')
  end

  step 'SDCW: navigate back'
end

Then /^SDCW: click footer site map$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device

    common_page.footer_company_stuff_menu_xs.scroll_into_view
    common_page.footer_company_stuff_menu_xs.click!

    common_page.site_map_xs.hover
    common_page.site_map_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.site_map.click
    else
      common_page.site_map.scroll_into_view
      common_page.site_map.hover
      common_page.site_map.click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/sitemap/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/sitemap/')
    when :prod
      expect(url).to eql('https://stamps.com/sitemap/')
  end
  step 'SDCW: navigate back'
end

Then /^SDCW: click footer contact us$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device

    common_page.footer_company_stuff_menu_xs.scroll_into_view
    common_page.footer_company_stuff_menu_xs.click!

    common_page.contact_us_xs.hover
    common_page.contact_us_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.contact_us.click
    else
      common_page.contact_us.scroll_into_view
      common_page.contact_us.hover
      common_page.contact_us.click
    end
  end
  step 'pause for 1 second'
  url = SdcPage.browser.url
  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://sdcwebsite.qacc.stamps.com/contact-us/')
    when :stg
      expect(url).to eql('https://sdcwebsite.staging.stamps.com/contact-us/')
    when :prod
      expect(url).to eql('https://stamps.com/contact-us/')
  end
  step 'SDCW: navigate back'
end

#### developers ####
Then /^SDCW: click footer developer overview$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common_page.developer_overview_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.developer_overview.click
    else
      common_page.developer_overview.scroll_into_view
      common_page.developer_overview.hover
      common_page.developer_overview.click
    end
  end
  step 'pause for 3 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://developer.qacc.stamps.com/developer/')
    when :stg
      expect(url).to eql('https://developer.staging.stamps.com/developer/')
    when :prod
      expect(url).to eql('https://stamps.com/developer/')
  end

end

Then /^SDCW: click footer developer registration$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common_page.developer_reg_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.developer_reg.click
    else
      common_page.developer_reg.scroll_into_view
      common_page.developer_reg.hover
      common_page.developer_reg.click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://developer.qacc.stamps.com/developer/register/')
    when :stg
      expect(url).to eql('https://developer.staging.stamps.com/developer/register/')
    when :prod
      expect(url).to eql('https://stamps.com/developer/register/')
  end

end

Then /^SDCW: click footer developer reference guide$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common_page.developer_reff_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.developer_reff.click
    else
      common_page.developer_reff.scroll_into_view
      common_page.developer_reff.hover
      common_page.developer_reff.click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://developer.qacc.stamps.com/developer/docs/swsimv71.html#stamps-api-reference-guide')
    when :stg
      expect(url).to eql('https://developer.staging.stamps.com/developer/docs/swsimv71.html#stamps-api-reference-guide')
    when :prod
      expect(url).to eql('https://developer.stamps.com/developer/docs/swsimv71.html#stamps-api-reference-guide')
  end

end

Then /^SDCW: click footer developer products$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common_page.developer_products_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.developer_products.click
    else
      common_page.developer_products.scroll_into_view
      common_page.developer_products.hover
      common_page.developer_products.click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  case TestSession.env.url
    when :qacc
      expect(url).to eql('https://developer.qacc.stamps.com/developer/products/')
    when :stg
      expect(url).to eql('https://developer.staging.stamps.com/developer/products/')
    when :prod
      expect(url).to eql('https://developer.stamps.com/developer/products/')
  end

end

####### follow us #####
Then /^SDCW: click footer facebook$/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common_page.facebook_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.facebook.click
    else
      common_page.facebook.scroll_into_view
      common_page.facebook.hover
      common_page.facebook.click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  expect(url).to eql('https://www.facebook.com/stamps.com/')

end

Then /^SDCW: click footer twitter/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common_page.twitter_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.twitter.click
    else
      common_page.twitter.scroll_into_view
      common_page.twitter.hover
      common_page.twitter.click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  expect(url).to eql('https://twitter.com/stampscom/')

end

Then /^SDCW: click footer google plus/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common_page.google_plus_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.google_plus.click
    else
      common_page.google_plus.scroll_into_view
      common_page.google_plus.hover
      common_page.google_plus.click
    end
  end
  step 'pause for 3 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close
  expect(url).to eql('https://plus.google.com/+stampscom')

end

Then /^SDCW: click footer youtube/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common_page.youtube_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.youtube.click
    else
      common_page.youtube.scroll_into_view
      common_page.youtube.hover
      common_page.youtube.click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  expect(url).to eql('https://www.youtube.com/user/StampscomVideo')

end

Then /^SDCW: click footer linkedin/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common_page.linkedin_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.linkedin.click
    else
      common_page.linkedin.scroll_into_view
      common_page.linkedin.hover
      common_page.linkedin.click
    end
  end
  step 'pause for 3 second'
  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close

  expect(url).to include('https://www.linkedin.com/')
end

Then /^SDCW: click footer blog/ do

  common_page = StampsWebsite.common_page
  if SdcGlobal.web_dev_device || TestSession.env.mobile_device
    common_page.blog_xs.click
  else
    if TestSession.env.local_browser == :edge
      common_page.blog.click
    else
      common_page.blog.scroll_into_view
      common_page.blog.hover
      common_page.blog.click
    end
  end
  step 'pause for 3 second'

  url =  SdcPage.browser.windows.last.url
  SdcPage.browser.windows.last.close
  expect(url).to eql('http://blog.stamps.com/')

end