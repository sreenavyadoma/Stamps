
Then /^visit Mail$/ do
  SdcGlobal.web_app = :mail
  step 'initialize test parameters'

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

  SdcMailLandingPage.visit(env)
end

Then /^sign-in to mail$/ do
  step 'Verify Health Check for Orders' if TestSession.env.healthcheck
  step 'visit Mail'
  usr = TestSession.env.usr
  pw = TestSession.env.pw
  if TestSession.env.mobile_device
    step "mobile: sign-in to mail as #{usr}/#{pw}"
  elsif SdcPage.browser.window.size.width < 1195
    step "mobile: sign-in to mail as #{usr}/#{pw}"
    step 'mail rating error'
  else
    step "browser: sign-in to mail as #{usr}/#{pw}"
    step 'mail rating error'
  end

  TestData.hash[:username] = usr
  TestData.hash[:password] = pw
end

Then /^browser: sign-in to mail as (.+)\/(.+)$/ do |usr, pw|
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 10)
  modal.sign_in_link.hover
  step "set Mail username to #{usr}"
  step "set Mail password to #{pw}"
  step 'click the Sign In button in Mail'
  step 'close whats new modal in mail'
  step 'expect user is signed in'
end

Then /^mobile: sign-in to mail as (.+)\/(.+)$/ do |usr, pw|
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.hamburger_menu.click
  modal.sign_in.safe_wait_until_present(timeout: 5)
  modal.sign_in.click
  step "sign-in to orders with #{usr}/#{pw}"
end

Then /^mail rating error$/ do
  rating_error = SdcWebsite.modals.rating_error
  rating_error.body.safe_wait_until_present(timeout: 2)
  if rating_error.body.present?
    error_msg = rating_error.body.text_value
    rating_error.ok.click
    expect(error_msg).to eql('')
  end
end



Then /^close whats new modal in mail$/ do
  whats_new = SdcWebsite.modals.whats_new
  if whats_new.title.present?
    whats_new.close.click
  end
end

Then /^expect user is signed in$/ do
  SdcWebsite.navigation.user_drop_down.signed_in_user.wait_until_present(timeout: 15, interval: 0.2)
  expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text_value).to include(TestData.hash[:username])
end

Then /^set Mail username(?: to (.+)|)$/ do |usr|
  usr = TestData.hash[:username] if usr.nil?
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 15)
  modal.sign_in_link.hover unless modal.username.present?
  modal.username.wait_until_present(timeout: 15)
  modal.username.set(usr)
end

Then /^set Mail password(?: to (.+)|)$/ do |pw|
  pw = TestData.hash[:password] if pw.nil?
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 15)
  modal.sign_in_link.hover unless modal.password.present?
  modal.password.set(pw)
end

Then /^[Cc]heck [Rr]emember [Uu]sername$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 15)
  modal.sign_in_link.hover unless modal.remember_username.present?
  modal.remember_username.set
end

Then /^[Uu]ncheck [Rr]emember [Uu]sername$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 15)
  modal.sign_in_link.hover
  modal.remember_username.clear
end

Then /^[Ee]xpect [Rr]emember [Uu]sername is [Cc]hecked$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 3)
  modal.sign_in_link.hover
  expect(modal.remember_username.set?).to eql true
end

Then /^[Ee]xpect [Rr]emember [Uu]sername to be [Uu]nchecked$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 3)
  modal.sign_in_link.hover
  expect(modal.remember_username.set?).to eql false
end

Then /^[Cc]lick the [Ss]ign [Ii]n button in [Mm]ail$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  #verifying_account_info = SdcMail.verifying_account_info
  if SdcEnv.ios
    raise StandardError, 'Not Implemented'
  elsif SdcEnv.android
    raise StandardError, 'Not Implemented'
  else
    modal.sign_in_link.wait_until_present(timeout: 3)
    modal.sign_in_link.hover unless modal.sign_in.present?
    modal.sign_in.click
    SdcMail.verifying_account_info.safe_wait_until_present(timeout: 3)
    SdcMail.verifying_account_info.wait_while_present(timeout: 12)
  end
end

Then /^[Oo]pen [Ss]ign [Ii]n [Mm]odal in [Mm]ail$/ do
  modal=SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 3)
  modal.sign_in_link.hover
  modal.username.safe_wait_until_present(timeout: 5)
end

Then /^[Ee]xpect [Uu]sername is present in Mail [Uu]sername field$/ do

  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.hover
  modal.username.safe_wait_until_present(timeout: 5)
  expect(modal.username.value).to eql TestData.hash[:username]

end

Then /^[Ee]xpect [Mm]ail [Ss]ign [Ii]n [Mm]odal error (.*)$/ do |str|

  expect(SdcWebsite.navigation.mail_sign_in_modal.invalid_sign_in.text_value).to eql str

end

