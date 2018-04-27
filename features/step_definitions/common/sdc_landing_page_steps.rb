Then /^set username in Mail(?: to (.+)|)$/ do |usr|

  begin
    if SdcEnv.usr.nil? || SdcEnv.usr.downcase == 'default'
      credentials = SdcUserCredentials.fetch(SdcTest.scenario.tags[0].name)
      usr = credentials[:username]
    else
      usr = SdcEnv.usr
    end
  end unless usr

  expect(usr).to be_truthy

  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 3)
  modal.sign_in_link.click
  modal.username.set(TestData.store[:username] = usr)

end

Then /^set password in Mail(?: to (.+)|)$/ do |pw|
  begin
    if SdcEnv.usr.nil? || SdcEnv.usr.downcase == 'default'
      credentials = SdcUserCredentials.fetch(SdcTest.scenario.tags[0].name)
      pw = credentials[:password]
    else
      pw = SdcEnv.pw
    end
  end unless pw

  expect(pw).to be_truthy

  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 3)
  modal.sign_in_link.click
  modal.password.set(TestData.store[:password] = pw)
end

Then /^set [Rr]emember [Uu]sername to [Cc]hecked$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 3)
  modal.sign_in_link.click
  modal.remember_username.set
end

Then /^set [Rr]emember [Uu]sername to [Uu]nchecked$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 3)
  modal.sign_in_link.click
  modal.remember_username.clear
end

Then /^[Ee]xpect [Rr]emember [Uu]sername to be [Cc]hecked$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 3)
  modal.sign_in_link.click
  expect(modal.remember_username.set?).to eql true
end

Then /^[Ee]xpect [Rr]emember [Uu]sername to be [Uu]nchecked$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 3)
  modal.sign_in_link.click
  expect(modal.remember_username.set?).to eql false
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

  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 3)
  modal.sign_in_link.click
  modal.username.set(TestData.store[:username] = usr)
  modal.password.set(TestData.store[:password] = pw)
  if SdcEnv.browser
    modal.sign_in.wait_until_present(timeout: 3)
    modal.sign_in.click
    signed_in_user.wait_until_present(timeout: 10)
    expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text_value).to include(TestData.store[:username])
  elsif SdcEnv.ios
    raise StandardError, 'Not Implemented'
  elsif SdcEnv.android
    raise StandardError, 'Not Implemented'
  end
  sleep 3
end

Then /^[Cc]lick the [Ss]ign [Ii]n button in [Mm]ail$/ do
  modal = SdcWebsite.navigation.mail_sign_in_modal
  signed_in_user = SdcWebsite.navigation.user_drop_down.signed_in_user
  if SdcEnv.browser
        modal.sign_in_link.wait_until_present(timeout: 3)
        modal.sign_in_link.click
        modal.sign_in.click
        signed_in_user.wait_until_present(timeout: 10)
        expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text_value).to include(TestData.store[:username])
  elsif SdcEnv.ios
    raise StandardError, 'Not Implemented'
  elsif SdcEnv.android
    raise StandardError, 'Not Implemented'
  end
  sleep 3

end

Then /^[Oo]pen [Ss]ign [Ii]n [Mm]odal in [Mm]ail$/ do
  modal=SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 3)
  modal.sign_in_link.click
  modal.username.safe_wait_until_present(timeout: 5)
end

Then /^[Ee]xpect [Uu]sername is present in Mail [Uu]sername field$/ do

  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.click
  modal.username.safe_wait_until_present(timeout: 5)
  expect(modal.username.value).to eql TestData.store[:username]

end
