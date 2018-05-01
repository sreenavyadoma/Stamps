

Then /^sign-in to Mail using credentials from MySql$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 80, interval: 0.2)
  step 'fetch user credentials from MySQL'
  modal.sign_in_link.hover
  step "set Mail username #{TestData.store[:username]}"
  step "set Mail password #{TestData.store[:password]}"

  if SdcEnv.browser
    step 'click the Sign In button in Mail'
    step 'expect user is signed in'
  elsif SdcEnv.ios
    raise StandardError, 'Not Implemented'
  elsif SdcEnv.android
    raise StandardError, 'Not Implemented'
  end
end

Then /^expect user is signed in$/ do
  expect(SdcWebsite.navigation.user_drop_down.signed_in_user).to be_present, "User #{TestData.store[:username]} is not signed in."
  expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text_value).to include(TestData.store[:username])
end

Then /^fetch user credentials from MySQL$/ do
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
  TestData.store[:username] = usr
  TestData.store[:password] = pw
end

Then /^set Mail username(?: to (.+)|)$/ do |usr|
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 15)
  modal.sign_in_link.hover unless modal.username.present?
  modal.username.wait_until_present(timeout: 5)
  modal.username.set(TestData.store[:username] = usr)
end

Then /^set Mail password(?: to (.+)|)$/ do |pw|
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 15)
  modal.sign_in_link.hover unless modal.password.present?
  modal.password.set(TestData.store[:password] = pw)
end

Then /^set [Rr]emember [Uu]sername to [Cc]hecked$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 15)
  modal.sign_in_link.hover unless modal.remember_username.present?
  modal.remember_username.set
end

Then /^set [Rr]emember [Uu]sername to [Uu]nchecked$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 15)
  modal.sign_in_link.hover
  modal.remember_username.clear
end

Then /^[Ee]xpect [Rr]emember [Uu]sername to be [Cc]hecked$/ do
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
  if SdcEnv.browser
    modal.sign_in_link.wait_until_present(timeout: 3)
    modal.sign_in_link.hover unless modal.sign_in.present?
    modal.sign_in.click
  elsif SdcEnv.ios
    raise StandardError, 'Not Implemented'
  elsif SdcEnv.android
    raise StandardError, 'Not Implemented'
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
  expect(modal.username.value).to eql TestData.store[:username]

end

Then /^[Ee]xpect [Mm]ail [Ss]ign [Ii]n [Mm]odal error (.*)$/ do |str|

  expect(SdcWebsite.navigation.mail_sign_in_modal.invalid_sign_in.text_value).to eql str

end

