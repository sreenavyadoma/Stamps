

Then /^visit Mail$/ do
  step 'initialize mail test parameters'

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

Then /^initialize mail test parameters$/ do
  # Mail Print Media
  TestData.hash['Stamps'] = :stamps
  TestData.hash['Shipping Shipping Label - 8 ½" x 11" Paper'] = :shipping_label_8x11
  TestData.hash['Shipping Label - SDC-1200, 4 ¼" x 6 ¾"'] = :shipping_label_sdc_1200
  TestData.hash['Shipping Label - 5 ½" x 8 ½"'] = :shipping_label_5x8
  TestData.hash['Envelope - #10, 4 ⅛" x 9 ½"'] = :envelope_10
  TestData.hash['Envelope - #9, 3 ⅞" x 8 ⅞"'] = :envelope_9
  TestData.hash['Envelope - #A9, 5 ¾" x 8 ¾"'] = :envelope_a9
  TestData.hash['Envelope - #6, 3 ⅝" x 6 ½"'] = :envelope_6
  TestData.hash['Envelope - #A2, 4 ⅜" x 5 ¾"'] = :envelope_a2
  TestData.hash['Envelope - #7, 3 ⅞" x 7 ½"'] = :envelope_7
  TestData.hash['Envelope - #11, 4 ½" x 10 ⅜"'] = :envelope_11
  TestData.hash['Envelope - #12, 4 ¾" x 11"'] = :envelope_12
  TestData.hash['Certified Mail Label - SDC-3610'] = :certified_mail_sdc_3610
  TestData.hash['Certified Mail Label - SDC-3710'] = :certified_mail_sdc_3710
  TestData.hash['Certified Mail Label - SDC-3910'] = :certified_mail_sdc_3910
  TestData.hash['Certified Mail Label - SDC-3930'] = :certified_mail_sdc_3930
  TestData.hash['Certified Mail #11 Envelope - SDC-3810'] = :certified_mail_sdc_3810
  TestData.hash['Roll - 4" x 6" Shipping Label'] = :roll_4x6
  TestData.hash['Roll - 4 ⅛" x 6 ¼" Shipping Label'] = :roll_4_18x6_34
end

Then /^sign-in to Mail$/ do
  step 'visit Mail'
  modal = SdcWebsite.navigation.mail_sign_in_modal
  modal.sign_in_link.wait_until_present(timeout: 80, interval: 0.2)
  step 'fetch user credentials from MySQL'
  modal.sign_in_link.hover
  step "set Mail username to #{TestData.hash[:username]}"
  step "set Mail password to #{TestData.hash[:password]}"

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
  expect(modal.username.value).to eql TestData.hash[:username]

end

Then /^[Ee]xpect [Mm]ail [Ss]ign [Ii]n [Mm]odal error (.*)$/ do |str|

  expect(SdcWebsite.navigation.mail_sign_in_modal.invalid_sign_in.text_value).to eql str

end

