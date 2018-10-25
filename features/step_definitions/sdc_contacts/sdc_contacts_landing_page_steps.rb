
Then /^visit Contacts$/ do
  step 'initialize test parameters'

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

  SdcContactsLandingPage.visit(env)
end

Then /^sign-in to contacts$/ do
  step 'visit Contacts'
  step 'fetch user credentials from MySQL'
  modal = SdcWebsite.navigation.contacts_sign_in_modal
  if SdcEnv.browser || SdcEnv.sauce.browser
    if SdcEnv.width.to_i < 1195
      #modal.hamburger_menu.click
      modal.contacts_sign_in.click
      step "set sign in page username to #{TestData.hash[:username]}"
      step "set sign in page password to #{TestData.hash[:password]}"
      step 'click sign in page sign-in button'
    else
      modal.contacts_sign_in_link.safe_wait_until_present(timeout: 30)
      modal.contacts_sign_in_link.hover
      step "set Mail username to #{TestData.hash[:username]}"
      step "set Mail password to #{TestData.hash[:password]}"
      step 'click the Sign In button in Contacts'
      step 'close whats new modal in contacts'
      step 'expect user is signed in to contacts'
    end
  elsif SdcEnv.ios
    raise StandardError, 'Not Implemented'
  elsif SdcEnv.android
    raise StandardError, 'Not Implemented'
  end
  SdcEnv.sdc_app = :contacts
end

#Then /^close whats new modal in mail$/ do
 # whats_new = SdcWebsite.modals.whats_new
  #if whats_new.title.present?
   # whats_new.close.click
  #end
#end

Then /^expect user is signed in to contacts$/ do
  SdcWebsite.navigation.user_drop_down.signed_in_user.wait_until_present(timeout: 15, interval: 0.2)
  expect(SdcWebsite.navigation.user_drop_down.signed_in_user.text_value).to include(TestData.hash[:username])
end

Then /^set Contacts username(?: to (.+)|)$/ do |usr|
  usr = TestData.hash[:username] if usr.nil?
  modal = SdcWebsite.navigation.contacts_sign_in_modal
  modal.contacts_sign_in_link.wait_until_present(timeout: 15)
  modal.contacts_sign_in_link.hover unless modal.contacts_username.present?
  modal.contacts_username.wait_until_present(timeout: 15)
  modal.contacts_username.set(usr)
end

Then /^set contacts password(?: to (.+)|)$/ do |pw|
  pw = TestData.hash[:password] if pw.nil?
  modal = SdcWebsite.navigation.contacts_sign_in_modal
  modal.contacts_sign_in_link.wait_until_present(timeout: 15)
  modal.contacts_sign_in_link.hover unless modal.contacts_password.present?
  modal.contacts_password.set(pw)
end

Then /^[Cc]lick the [Ss]ign [Ii]n button in [Cc]ontacts$/ do
  contacts_modal = SdcWebsite.navigation.contacts_sign_in_modal
  if SdcEnv.ios
    raise StandardError, 'Not Implemented'
  elsif SdcEnv.android
    raise StandardError, 'Not Implemented'
  else
    contacts_modal.contacts_sign_in_link.wait_until_present(timeout: 3)
    contacts_modal.contacts_sign_in_link.hover unless contacts_modal.sign_in.present?
    contacts_modal.sign_in.click
    SdcContacts.modals.verifying_account.safe_wait_until_present(timeout: 3)
    SdcContacts.modals.verifying_account.wait_while_present(timeout: 12)
  end
end

Then /^[Oo]pen [Ss]ign [Ii]n [Mm]odal in [Cc]ontacts$/ do
  modal=SdcWebsite.navigation.contacts_sign_in_modal
  modal.contacts_sign_in_link.wait_until_present(timeout: 3)
  modal.contacts_sign_in_link.hover
  modal.contacts_username.safe_wait_until_present(timeout: 5)
end

Then /^[Ee]xpect [Uu]sername is present in Contacts [Uu]sername field$/ do

  modal = SdcWebsite.navigation.contacts_sign_in_modal
  modal.contacts_sign_in_link.hover
  modal.contacts_username.safe_wait_until_present(timeout: 5)
  expect(modal.contacts_username.value).to eql TestData.hash[:username]

end

Then /^[Ee]xpect [Mm]ail [Ss]ign [Ii]n [Mm]odal error (.*)$/ do |str|

  expect(SdcWebsite.navigation.contacts_sign_in_modal.contacts_invalid_sign_in.text_value).to eql str

end

