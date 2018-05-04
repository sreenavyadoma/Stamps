Then /^Verify Health Check for (.+)$/ do |str|
  expect(SdcEnv::HEALTH_CHECK_APPS).to include(str.downcase)
  SdcHealthCheck.visit(str)
  expect(SdcHealthCheck.browser.text).to include("All tests passed") if SdcEnv.health_check
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

Then /^visit Orders landing page$/ do
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

Then /^visit Mail$/ do
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

  SdcMailLandingPage.visit(env)
end

Then /^[Ss]ign-out of SDC [Ww]ebsite$/ do
  SdcNavigation.user_drop_down.signed_in_user.safe_wait_until_present(timeout: 5)
  SdcNavigation.user_drop_down.signed_in_user.hover
  SdcNavigation.user_drop_down.sign_out_link.safe_wait_until_present(timeout: 1)
  SdcNavigation.user_drop_down.sign_out_link.safe_click
  SdcWebsite.landing_page.username.safe_wait_until_present(timeout: 3)
end

Then /^sign-in to Orders(?: as (.+), (.+)|)$/ do |usr, pw|
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

  SdcWebsite.landing_page.username.set_attribute('value', 'new value')
  SdcWebsite.landing_page.username.set(usr)
  SdcWebsite.landing_page.password.set(pw)
  if SdcEnv.browser
    if SdcEnv.sauce_device
      SdcWebsite.landing_page.sign_in.click
      SdcWebsite.navigation.user_drop_down.signed_in_user.safe_wait_until_present(timeout: 10)
      sleep 5
    else
      3.times do
        SdcWebsite.landing_page.sign_in.safe_click
        break if SdcWebsite.navigation.user_drop_down.signed_in_user.present?
      end
      SdcWebsite.orders.loading_popup.safe_wait_until_present(timeout: 30)
      SdcWebsite.orders.loading_popup.safe_wait_while_present(timeout: 30)
      SdcWebsite.navigation.user_drop_down.signed_in_user.safe_wait_until_present(timeout: 30)
      expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text_value).to eql(usr)
    end

  elsif SdcEnv.ios
    begin
      landing_page.sign_in.click
      landing_page.sign_in.send_keys(:enter)
        #landing_page.sign_in.safe_send_keys(:enter)
    rescue
      # ignore
    end

  elsif SdcEnv.android
    SdcPage.browser.hide_keyboard
    SdcPage.browser.action.move_to(landing_page.sign_in).click.perform
    SdcPage.browser.action.move_to(landing_page.sign_in).send_keys(:enter).perform
  end
  TestData.hash[:username] = usr
  TestData.hash[:password] = pw
end

