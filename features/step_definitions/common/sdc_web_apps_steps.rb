
Then /^visit Orders landing page$/ do
  SdcOrdersLandingPage.visit(case SdcEnv.env
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
                             end)
end

Then /^Signin mail$/ do
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

Then /^printon stuff$/ do

  SdcMail.print_form.print_on("")
end

Then /^[Ss]ign-in to SDC Website$/ do
  step "sign-in to Orders as #{usr}, #{pw}" if SdcEnv.sdc_app == :orders
  step "sign-in to Mail as #{usr}, #{pw}" if SdcEnv.sdc_app == :mail
end

Then /^sign-out of SDC Website$/ do
  # if SdcEnv.browser
  #   3.times do
  #     SdcNavigation.user_drop_down.signed_in_user.safe_wait_until_present(timeout: 5)
  #     SdcNavigation.user_drop_down.signed_in_user.hover
  #     SdcNavigation.user_drop_down.sign_out_link.safe_wait_until_present(timeout: 1)
  #     SdcNavigation.user_drop_down.sign_out_link.safe_click
  #     SdcWebsite.landing_page.username.safe_wait_until_present(timeout: 3)
  #     break if SdcWebsite.landing_page.username.present?
  #   end
  # end
end

Then /^sign-in to Orders(?: as (.+), (.+)|)$/ do |usr, pw|
  begin
    if SdcEnv.usr.nil? || SdcEnv.usr.downcase == 'default'
      credentials = SdcUserCredentials.fetch(SdcTest.scenario.tags[0].name)
      usr = credentials[:username]
      pw = credentials[:password]
    else
      usr = SdcEnv.usr
      pw = SdcEnv.pw
    end
  end unless usr && pw

  expect(usr).to be_truthy
  expect(pw).to be_truthy

  SdcWebsite.landing_page.username.set(TestData.store[:username] = usr)
  SdcWebsite.landing_page.password.set(TestData.store[:password] = pw)
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
      expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text_value).to eql(TestData.store[:username])
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

end

Then /^sign-in to Mail(?: as (.+), (.+)|)$/ do |usr, pw|
  begin
    if SdcEnv.usr.nil? || SdcEnv.usr.downcase == 'default'
      credentials = SdcUserCredentials.fetch(SdcTest.scenario.tags[0].name)
      usr = credentials[:username]
      pw = credentials[:password]
    else
      usr = SdcEnv.usr
      pw = SdcEnv.pw
    end
  end unless usr && pw

  expect(usr).to be_truthy
  expect(pw).to be_truthy

  mail = SdcWebsite.mail
  mail.username.set(TestData.store[:username] = usr)
  mail.password.set(TestData.store[:password] = pw)
  if SdcEnv.browser
    5.to_i.times do
      begin
        mail.sign_in.click
        mail.sign_in.click
        mail.sign_in.safe_click
        mail.sign_in.send_keys(:enter)
        mail.sign_in.send_keys(:enter)
        break if signed_in_user.present?
      rescue
        # ignore
      end
    end
    sleep(10)
    SdcWebsite.navigation.user_drop_down.signed_in_user.safe_wait_until_present(timeout: 5)
    expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text_value).to include(TestData.store[:username])

  elsif SdcEnv.ios
    begin
      mail.sign_in.click
      mail.sign_in.send_keys(:enter)
      mail.sign_in.safe_send_keys(:enter)
    rescue
      # ignore
    end

  elsif SdcEnv.android
    SdcPage.browser.hide_keyboard
    SdcPage.browser.action.move_to(mail.sign_in).click.perform
    SdcPage.browser.action.move_to(mail.sign_in).send_keys(:enter).perform
  end
  sleep 3
end