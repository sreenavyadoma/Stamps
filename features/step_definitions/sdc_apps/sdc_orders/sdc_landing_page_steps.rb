
Then /^visit Orders landing page$/ do
  step 'initialize test parameters'
  step 'fetch user credentials from MySQL'

  env = case TestSession.env.url
        when :qacc
          'ext.qacc'
        when :qasc
          'ext.qasc'
        when :stg
          '.testing'
        when :prod
          ''
        else
          # ignore
        end

  SdcOrdersLandingPage.visit(env)
  if TestSession.env.selenium_device
    expect(SdcOrdersLandingPage.browser.current_url).to include('stamps.com')
  else
    expect(SdcOrdersLandingPage.browser.url).to include('stamps.com')
  end
end

Then /^initialize test parameters$/ do
  TestData.hash[:customs_associated_items] = {}
  TestData.hash[:service_mapping_items] = {}
  TestData.hash[:details_associated_items] = {}
  TestData.hash[:order_id] = {}
  TestData.hash[:service_look_up] = {}
  TestData.hash[:service_look_up]['FCM'] = 'First-Class Mail'
  TestData.hash[:service_look_up]['PM'] = 'Priority Mail'
  TestData.hash[:service_look_up]['PME'] = 'Priority Mail Express'
  TestData.hash[:service_look_up]['MM'] = 'Media Mail'
  TestData.hash[:service_look_up]['PSG'] = 'Parcel Select Ground'
  TestData.hash[:service_look_up]['FCMI'] = 'First-Class Mail International'
  TestData.hash[:service_look_up]['PMI'] = 'Priority Mail International'
  TestData.hash[:service_look_up]['PMEI'] = 'Priority Mail Express International'
  TestData.hash[:ord_id_ctr] = 0
  TestData.hash[:sdc_app] = ENV['WEB_APP']
  TestData.hash[:url] = ENV['URL']
  TestData.hash[:test] = ENV['USER_CREDENTIALS']
end

Then /^fetch user credentials from MySQL$/ do
  unless TestData.hash[:username]
    if TestSession.env.usr.nil? || TestSession.env.usr.downcase == 'default'
      credentials = SdcUserCredentials.fetch(SdcEnv.scenario.tags[0].name)
      usr = credentials[:username]
      pw = credentials[:password]
    else
      usr = TestSession.env.usr
      pw = TestSession.env.pw
    end
    TestData.hash[:username] = usr
    TestData.hash[:password] = pw
  end
end

Then /^sign-in to orders$/ do
  step 'visit Orders landing page'
  usr = TestData.hash[:username]
  pw = TestData.hash[:password]
  step "set Orders landing page username to #{usr}"
  step "set Orders landing page password to #{pw}"

  if SdcEnv.ios
    step 'click sign-in button on ios'
  elsif SdcEnv.android
    step 'click sign-in button on android'
  else
    step 'click sign-in button on browser'
    step 'close whats new modal in orders'
  end
  SdcGlobal.web_app = :orders
end

Then /^click sign-in button on browser$/ do
  landing_page = SdcWebsite.landing_page
  toolbar = SdcOrders.toolbar

  step 'click Orders landing page sign-in button'

  SdcOrders.loading_orders.safe_wait_until_present(timeout: 10)
  SdcOrders.loading_orders.safe_wait_while_present(timeout: 60)
  SdcGrid.body.safe_wait_until_present(timeout: 30)
  expect(toolbar.add).to be_present
end

Then /^click sign-in button on ios$/ do
  landing_page = SdcWebsite.landing_page
  landing_page.sign_in.click
  landing_page.sign_in.safe_click
  #landing_page.sign_in.safe_send_keys(:enter)
end

Then /^click sign-in button on android$/ do
  SdcPage.browser.hide_keyboard
  SdcPage.browser.action.move_to(landing_page.sign_in).click.perform
  SdcPage.browser.action.move_to(landing_page.sign_in).send_keys(:enter).perform
end

Then /^set Orders landing page username to (.*)$/ do |str|
  landing_page = SdcWebsite.landing_page
  landing_page.username.wait_until_present(timeout: 90)
  landing_page.username.set(str)
end

Then /^set Orders landing page password to (.*)$/ do |str|
  landing_page = SdcWebsite.landing_page
  landing_page.password.wait_until_present(timeout: 60)
  landing_page.password.set(str)
end

Then /^set sign in page username to (.*)$/ do |str|
  SdcWebsite.landing_page.username.set(str)
end

Then /^set sign in page password to (.*)$/ do |str|
  SdcWebsite.landing_page.password.set(str)
end

Then /^click sign in page sign-in button$/ do
  SdcWebsite.landing_page.sign_in.wait_until_present(timeout: 3)
  SdcWebsite.landing_page.sign_in.click
end

Then /^click Orders landing page sign-in button$/ do
  landing_page = SdcWebsite.landing_page
  landing_page.sign_in.wait_until_present(timeout: 3)
  landing_page.sign_in.click
  landing_page.invalid_username.safe_wait_while_present(timeout: 1)
  if landing_page.invalid_username.present?
    str = landing_page.invalid_username.text_value
    expect(str).to eql('')
  end
end

Then /^close whats new modal in orders$/ do
  whats_new = SdcWebsite.modals.whats_new
  if whats_new.title.present?
    whats_new.close.click
  end
end

Then /^[Ss]ign-out of SDC [Ww]ebsite$/ do
  user_drop_down = SdcNavigation.user_drop_down
  user_drop_down.signed_in_user.wait_until_present(timeout: 5)
  user_drop_down.signed_in_user.hover
  user_drop_down.sign_out_link.safe_wait_until_present(timeout: 1)
  user_drop_down.sign_out_link.safe_click
  SdcWebsite.landing_page.username.safe_wait_until_present(timeout: 4)
end

Then /^Verify Health Check for (.+)$/ do |str|

  env = case str.downcase
        when /orders/
          case TestSession.env.url
          when :qacc
            'printext.qacc'
          when :qasc
            'printext.qasc'
          when :stg
            'print.testing'
          when :prod
            ''
          else
            # ignore
          end

        when /address/
          case TestSession.env.url
          when :qacc
            'printext.qacc'
          when :qasc
            'printext.qasc'
          when :stg
            'print.testing'
          when :prod
            ''
          else
            # ignore
          end

        when /or reports/
          case TestSession.env.url
          when :qacc
            'orext.qacc'
          when :qasc
            'orext.qasc'
          when :stg
            'or.staging'
          when :prod
            ''
          else
            # ignore
          end

        when /postage/
          case TestSession.env.url
          when :qacc
            'orext.qacc'
          when :qasc
            'orext.qasc'
          when :stg
            'or.staging'
          when :prod
            ''
          else
            # ignore
          end
        else
          # ignore
        end

  app = case(str.downcase)
        when /orders/
          :orders
        when /address/
          :addressbook
        when /or reports/
          :orreports
        when /postage/
          :postagetools
        else
          raise ArgumentError, "Healthcheck not supported for #{str}"
        end

  SdcHealthCheck.visit([env, app])

  if TestSession.env.browser_test
    if TestSession.env.health_check
      expect(SdcHealthCheck.browser.text).to include('All tests passed')
    end
  elsif TestSession.env.ios_test
    if TestSession.env.health_check
      expect(SdcHealthCheck.browser.page_source).to include('All tests passed')
    end
  end
end

