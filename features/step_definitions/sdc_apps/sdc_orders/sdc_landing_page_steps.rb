
Then /^visit Orders landing page$/ do
  step 'initialize orders test parameters'

  env = case SdcEnv.env
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
end

Then /^initialize orders test parameters$/ do
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
  TestData.hash[:username] = ENV['USR']
  TestData.hash[:password] = ENV['PW']
  TestData.hash[:sdc_app] = ENV['WEB_APP']
  TestData.hash[:url] = ENV['URL']
  TestData.hash[:test] = ENV['USER_CREDENTIALS']
end

Then /^fetch user credentials from MySQL$/ do
  begin
    if SdcEnv.usr.nil? || SdcEnv.usr.downcase == 'default'
      credentials = SdcUserCredentials.fetch(SdcEnv.scenario.tags[0].name)
      usr = credentials[:username]
      pw = credentials[:password]
    else
      usr = SdcEnv.usr
      pw = SdcEnv.pw
    end
  end unless usr && pw
  expect(usr).to be_truthy
  expect(pw).to be_truthy
  TestData.hash[:username] = usr
  TestData.hash[:password] = pw
end

Then /^sign-in to Orders$/ do
  step 'fetch user credentials from MySQL'
  step 'visit Orders landing page'
  step "set Orders landing page username to #{TestData.hash[:username]}"
  step "set Orders landing page password to #{TestData.hash[:password]}"

  landing_page = SdcWebsite.landing_page
  signed_in_user = SdcWebsite.navigation.user_drop_down.signed_in_user
  if SdcEnv.browser
    if SdcEnv.sauce_device
      step 'click Orders landing page sign-in button'
      SdcWebsite.navigation.user_drop_down.signed_in_user.safe_wait_until_present(timeout: 15)
    else
      step 'click Orders landing page sign-in button'

      loading_orders = SdcWebsite.orders.loading_orders
      loading_orders.wait_until_present(timeout: 8)
      loading_orders.wait_while_present(timeout: 10)
      signed_in_user.safe_wait_until_present(timeout: 5)
      expect(signed_in_user.text_value).to eql(TestData.hash[:username])
    end

  elsif SdcEnv.ios
    begin
      landing_page.sign_in.click
      landing_page.sign_in.send_keys(:enter)
        #landing_page.sign_in.safe_send_keys(:enter)
    rescue ::StandardError
      # ignore
    end

  elsif SdcEnv.android
    SdcPage.browser.hide_keyboard
    SdcPage.browser.action.move_to(landing_page.sign_in).click.perform
    SdcPage.browser.action.move_to(landing_page.sign_in).send_keys(:enter).perform
  end
end

Then /^set Orders landing page username to (.+)$/ do |str|
  SdcWebsite.landing_page.username.set(str)
end

Then /^set Orders landing page password to (.+)$/ do |str|
  SdcWebsite.landing_page.password.set(str)
end

Then /^click Orders landing page sign-in button$/ do
  SdcWebsite.landing_page.sign_in.click
end

Then /^[Ss]ign-out of SDC [Ww]ebsite$/ do
  user_drop_down = SdcNavigation.user_drop_down
  user_drop_down.signed_in_user.safe_wait_until_present(timeout: 5)
  user_drop_down.signed_in_user.hover
  user_drop_down.sign_out_link.safe_wait_until_present(timeout: 1)
  user_drop_down.sign_out_link.safe_click
  SdcWebsite.landing_page.username.safe_wait_until_present(timeout: 4)
end

Then /^Verify Health Check for (.+)$/ do |str|

  env = case str.downcase
        when /orders/
          case SdcEnv.env
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
          case SdcEnv.env
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
          case SdcEnv.env
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
          case SdcEnv.env
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

  SdcHealthCheck.visit(env, app)
  expect(SdcHealthCheck.browser.text).to include("All tests passed") if SdcEnv.health_check
end

