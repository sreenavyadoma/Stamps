Then /^[Ss]et WebReg Profile email to email to (.*)$/ do |email|
  registration.profile.email.set email
end

Then /^[Ss]et WebReg Profile username to (.*)$/ do |username|
  registration.profile.username.set username
end

Then /^[Ss]et WebReg Profile retype password textbox to (.*)$/ do |password|
  registration.profile.retype_password.set password
end

Then /^[Ss]et WebReg Profile Usage Type list of values to contain (.*)$/ do |str|
  registration.profile.usage_type.set str
end

Then /^[Oo]n WebReg Profile page, continue to Membership page/ do
  registration.profile.continue_button
end

Then /^[Ee]xpect WebReg Membership bread crumbs to contain (.*)$/ do |str|
  expect(registration.bread_crumbs).to eql(str), "Bread crumb #{str} does not exist"
end

Then /^[Ee]xpect WebReg Membership header contain (.*)$/ do |str|
  expect(registration.membership.header).to eql(str)
end

Then /^[Ee]xpect WebReg Membership first name exists$/ do
  expect(registration.membership.first_name.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership last name exists$/ do
  expect(registration.membership.last_name.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership company exists$/ do
  expect(registration.membership.company.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership address exists$/ do
  expect(registration.membership.address.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership city exists$/ do
  expect(registration.membership.city.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership state dropdown exists$/ do
  expect(registration.membership.city.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership zip exists$/ do
  expect(registration.membership.zip.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership phone exists$/ do
  expect(registration.membership.phone.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership stamps logo exists$/ do
  expect(registration.membership.stamps_logo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership usps logo exists$/ do
  expect(registration.membership.usps_logo.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership paragraph to contain (.*)$/ do |str|
  expect(registration.membership.paragraph).to eql(str)
end

Then /^[Ee]xpect WebReg Membership cardholders name exists$/ do
  expect(registration.membership.cardholders_name.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership credit card number exists$/ do
  expect(registration.membership.credit_card_number.present?). to be (true)
end

Then /^[Ee]xpect WebReg Membership month dropdown exists$/ do
  expect(registration.membership.month_dropdown.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership year dropdown exists$/ do
  expect(registration.membership.month_dropdown.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership Billing address same as mailing address checkbox exists$/ do
  expect(registration.membership.billingaddress_sameas_mailing address.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership I agree to the Terms and conditions and Pricing details checkbox exists$/ do
  expect(registration.membership.pricingandTnC.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership back button exists$/ do
  expect(registration.membership.back_button.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership submit button exists$/ do
  expect(registration.membership.submit_button.present?).to be (true)
end

Then /^[Ee]xpect WebReg Membership why do you need my mailing information to contain:$/ do |str|
   p str
   p str
  #expect(registration.membership.why_do_you_need_mailingaddress).to eql(str)
end

Then /^[Ee]xpect WebReg Membership Can I change my mailing address to contain:$/ do |str|
  expect(registration.membership.why_do_you_need_mailingaddress).to eql(str)
end

Then /^[Ee]xpect WebReg Membership Can I use my Stamps.com account outside my office to contain:$/ do |str|
  expect(registration.membership.can_I_use_stamps_outside_office).to eql(str)
end

Then /^[Ee]xpect WebReg Membership Is my credit card information safe to contain:$/ do |str|
  expect(registration.membership.is_my_cc_info_safe).to eql(str)
end

Then /^[Ee]xpect WebReg Membership Pricing and billing details to contain:$/ do |str|
  expect(registration.membership.pricingnbilling).to eql(str)
end

Then /^[Ee]xpect WebReg Membership Cancel anytime to contain:$/ do |str|
  expect(registration.membership.membership_cancel_anytime).to eql(str)
end

Then /^[Ee]xpect WebReg Membership Bonus Offer Details link exists and is clickable$/ do
  expect(registration.membership.offer_details_link.present?).to be (true)
end

Then /^[Ee]xpect WebReg Profile Privacy Policy link exists and is clickable$/ do
  # pending
  # 1. check for presence
  # 2. click if it is.
  # 3. close module if it opens one up or go back to previous page and restore state.
end





Then /^(?:S|s)et WebReg Membership page State to (.*)$/ do |str|
  registration.profile.membership.state.select(str)
end

Then /^(?:S|s)et WebReg Membership page First Name to (.*)$/ do |var|
  test_parameter[:first_name] = (var.downcase.include? 'random') ? ParameterHelper.random_string : var
  registration.profile.membership.first_name.set test_parameter[:first_name]
end

Then /^(?:S|s)et WebReg Membership page Last Name to (.*)$/ do |var|
  test_parameter[:last_name] = (var.downcase.include? 'random') ? ParameterHelper.random_string : var
  registration.profile.membership.last_name.set test_parameter[:last_name]
end

Then /^(?:S|s)et WebReg Membership page Company to (.*)$/ do |var|
  test_parameter[:company] = (var.downcase.include? 'random') ? ParameterHelper.random_string : var
  registration.profile.membership.company.set test_parameter[:company]
end

Then /^(?:S|s)et WebReg Membership page Address to (.*)$/ do |var|
  test_parameter[:company] = (var.downcase.include? 'random') ? ParameterHelper.random_string : var
  registration.profile.membership.address.set test_parameter[:company]
end

Then /^(?:S|s)et WebReg Membership page City to (.*)$/ do |var|
  test_parameter[:membership] = var
  registration.profile.membership.city.set test_parameter[:membership]
end

Then /^(?:S|s)et WebReg Membership page Zip Code to (.*)$/ do |var|
  test_parameter[:zip] = var
  registration.profile.membership.zip.set test_parameter[:zip]
end

Then /^(?:S|s)et WebReg Membership page Phone to (.*)$/ do |var|
  test_parameter[:phone] = (var.downcase.include? 'random') ? ParameterHelper.random_phone : var
  phone = registration.profile.membership.phone
  6.times do
    phone.send_keys test_parameter[:phone]
    sleep(0.35)
    ui_phone = phone.text
    sleep(0.35)
    break if ui_phone.include? '-' and (test_parameter[:phone][-4, 4] == ui_phone[-4, 4])
  end
end

Then /^(?:S|s)et WebReg Membership page Extenion to (.*)$/ do |var|
  test_parameter[:ext] = (var.downcase.include? 'random') ? ParameterHelper.random_phone_extension : var
  registration.profile.membership.ext.set test_parameter[:ext]
end

Then /^(?:S|s)et WebReg Membership page Cardholder name to (.*)$/ do |var|
  test_parameter[:card_holder_name] = (var.downcase.include? 'random') ? ParameterHelper.random_name : var
  registration.profile.membership.card_holder_name.set test_parameter[:card_holder_name]
end

Then /^(?:S|s)et WebReg Membership page Card number to (.*)$/ do |var|
  test_parameter[:card_number] = var
  registration.profile.membership.card_number.set test_parameter[:card_number]
end

Then /^(?:S|s)et WebReg Membership page Expiration Month to January/ do
  registration.profile.membership.expiration_month.jan
end

Then /^(?:S|s)et WebReg Membership page Expiration Month to February$/ do
  registration.profile.membership.expiration_month.feb
end

Then /^(?:S|s)et WebReg Membership page Expiration Month to March$/ do
  registration.profile.membership.expiration_month.mar
end

Then /^(?:S|s)et WebReg Membership page Expiration Month to April$/ do
  registration.profile.membership.expiration_month.apr
end

Then /^(?:S|s)et WebReg Membership page Expiration Month to May$/ do
  registration.profile.membership.expiration_month.may
end

Then /^(?:S|s)et WebReg Membership page Expiration Month to June$/ do
  registration.profile.membership.expiration_month.jun
end

Then /^(?:S|s)et WebReg Membership page Expiration Month to July$/ do
  registration.profile.membership.expiration_month.jul
end

Then /^(?:S|s)et WebReg Membership page Expiration Month to August$/ do
  registration.profile.membership.expiration_month.aug
end

Then /^(?:S|s)et WebReg Membership page Expiration Month to September$/ do
  registration.profile.membership.expiration_month.sep
end

Then /^(?:S|s)et WebReg Membership page Expiration Month to October$/ do
  registration.profile.membership.expiration_month.oct
end

Then /^(?:S|s)et WebReg Membership page Expiration Month to November$/ do
  registration.profile.membership.expiration_month.nov
end

Then /^(?:S|s)et WebReg Membership page Expiration Month to December$/ do
  registration.profile.membership.expiration_month.dec
end

Then /^(?:S|s)et WebReg Membership page Expiration Year to (\d+)$/ do |var|
  test_parameter[:expiration_year] = var
  registration.profile.membership.expiration_year.select test_parameter[:expiration_year]
end

Then /^(?:S|s)et WebReg Membership page Billing address same as mailing address to Checked$/ do
  registration.profile.membership.billing_same_as_mailing.check
end

Then /^(?:S|s)et WebReg Membership page Billing address same as mailing address to Unchecked$/ do
  registration.profile.membership.billing_same_as_mailing.uncheck
end

Then /^(?:S|s)et WebReg Membership page Terms & Conditions to Checked$/ do
  registration.profile.membership.terms_and_conditions.check
end

Then /^(?:S|s)et WebReg Membership page Terms & Conditions to Unchecked$/ do
  registration.profile.membership.terms_and_conditions.uncheck
end

Then /^(?:O|o)n WebReg Membership page, click Back Button$/ do
  expect("").to eql "Step Definition not yet implemented! - On WebReg Membership page, click Back Button"
end

Then /^(?:O|o)n WebReg Membership page, click Submit$/ do
  begin
    registration.profile.membership.submit_correct_errors test_parameter
  rescue Exception => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
  end
end

Then /^(?:O|o)n WebReg Membership page, click Submit and correct errors$/ do
  step "On WebReg Membership page, click Submit"
  10.times do
    case @webreg_result
      #when there's a failure, correct field and resubmit.
      when WebReg::MembershipPhone
        logger.error "Membership Phone Textbox has error: #{@webreg_result.help_text}"
        step "set WebReg Membership page Phone to random"
        step "On WebReg Membership page, click Submit"
      when WebReg::MembershipCardNumber
        logger.error "Membership Phone Textbox has error: #{@webreg_result.help_text}"
        step "set WebReg Membership page Card number to #{test_parameter[:card_number]}"
        step "On WebReg Membership page, click Submit"
      when WebReg::ChooseSupplies
        break
      else
        raise "Unknown WebReg Result object. #{@webreg_result.class} is not recognized. Update step \"On WebReg Membership page, click Submit and correct errors\""
    end
  end
end

Then(/^[Oo]n WebReg Membership page, expect First Name Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.first_name.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, expect Last Name Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.last_name.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, expect Address Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.address.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, expect City Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.city.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, expect State Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.state.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, expect Phone Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.phone.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, expect Cardhoder name Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.card_holder_name.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, expect Card number Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.card_number.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, Expires Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.expiration_month.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, expect Billing Address Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.billing_address.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, expect Billing City Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.billing_city.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, expect Billing State Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.billing_state.help_text
  expect(help_text).to eql expectation
end


Then(/^[Oo]n WebReg Membership page, expect Billing Zip Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.billing_zip.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, expect Terms & Conditions Help Block is (.*)$/) do |expectation|
  help_text = registration.profile.membership.terms_and_conditions.help_text
  expect(help_text).to eql expectation
end

Then(/^[Oo]n WebReg Membership page, Tab$/) do
  registration.profile.membership.tab
end

