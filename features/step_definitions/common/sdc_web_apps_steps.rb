Then /^Verify Health Check for (.+)$/ do |str|

  env = case(str.downcase)
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

Then /^[Ss]ign-in to SDC Website$/ do
  step "sign-in to Orders as #{usr}, #{pw}" if SdcEnv.sdc_app == :orders
  step "sign-in to Mail as #{usr}, #{pw}" if SdcEnv.sdc_app == :mail
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
      SdcWebsite.orders.loading_popup.safe_wait_until_present(timeout: 5)
      SdcWebsite.orders.loading_popup.safe_wait_while_present(timeout: 5)
      SdcWebsite.navigation.user_drop_down.signed_in_user.safe_wait_until_present(timeout: 5)
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
  TestData.store[:username] = usr
  TestData.store[:password] = pw
end

