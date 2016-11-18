
Then /^Open Settings Modal$/ do
  logger.step "Open Settings Modal"
  @general_settings = stamps.orders.toolbar.settings.general_settings #todo-Rob refactor General Settings.
end
# Services checkbox
Then /^Settings: Check Services$/ do
  @general_settings.services.check
end

Then /^Settings:  Uncheck Services$/ do
  @general_settings.services.uncheck
end

# Services checkbox
Then /^Settings: Check Print Confirm$/ do
  @general_settings.print_confirm.check
end

Then /^Settings: Uncheck Print Confirm$/ do
  @general_settings.print_confirm.uncheck
end

# Contacts$ checkbox
Then /^Settings: Check Contacts$/ do
  @general_settings.contacts.check
end

Then /^Settings: Uncheck Contacts$/ do
  @general_settings.contacts.uncheck
end

# Shipments checkbox
Then /^Settings: Check Shipments$/ do
  @general_settings.shipments.check
end

Then /^Settings: Uncheck Shipments$/ do
  @general_settings.shipments.uncheck
end

# USPS Terms checkbox
Then /^Settings: Check USPS Terms$/ do
  @general_settings.usps_terms.check
end

Then /^Settings: Uncheck USPS Terms$/ do
  @general_settings.usps_terms.uncheck
end

# Set Logoff

Then /^Settings:  Set Logoff to 5 min.$/ do
  step "Settings:  Logoff set 5 min"
end

Then /^Settings:  Set Logoff to 10 min.$/ do
  step "Settings:  Logoff set 10 min"
end

Then /^Settings:  Set Logoff to 15 min.$/ do
  step "Settings:  Logoff set 15 min"
end

Then /^Settings:  Set Logoff to 30 min.$/ do
  step "Settings:  Logoff set 30 min"
end

Then /^Settings:  Set Logoff to 1 hour.$/ do
  step "Settings:  Logoff set 1 hour"
end

Then /^Settings:  Set Logoff to 2 hours$/ do
  step "Settings:  Logoff set 2 hours"
end

Then /^Settings:  Logoff set (.*)$/ do |value|
  logger.step "Settings:  Logoff set #{value}"
  case value.downcase
    when "5 min"
      @general_settings.log_off.five_min
    when "10 min"
      @general_settings.log_off.ten_min
    when "15 min"
      @general_settings.log_off.fifteen_min
    when "30 min"
      @general_settings.log_off.thirty_min
    when "1 hour"
      @general_settings.log_off.one_hour
    when "2 hours"
      @general_settings.log_off.two_hours
    else
      "Invalid Logoff Selection -  Settings:  Logoff #{value}".should eql "Settings"
  end
end

Then /^Settings:  Set Postdate to 12:00 a.m.$/ do
  step "Settings:  Postdate Set 12:00 a.m."
end

Then /^Settings:  Set Postdate to 1:00 a.m.$/ do
  step "Settings:  Postdate Set 1:00 a.m."
end

Then /^Settings:  Set Postdate to 2:00 a.m.$/ do
  step "Settings:  Postdate Set 2:00 a.m."
end

Then /^Settings:  Set Postdate to 3:00 a.m.$/ do
  step "Settings:  Postdate Set 3:00 a.m."
end

Then /^Settings:  Set Postdate to 4:00 a.m.$/ do
  step "Settings:  Postdate Set 4:00 a.m."
end

Then /^Settings:  Set Postdate to 5:00 a.m.$/ do
  step "Settings:  Postdate Set 5:00 a.m."
end

Then /^Settings:  Set Postdate to 6:00 a.m.$/ do
  step "Settings:  Postdate Set 6:00 a.m."
end

Then /^Settings:  Set Postdate to 7:00 a.m.$/ do
  step "Settings:  Postdate Set 7:00 a.m."
end

Then /^Settings:  Set Postdate to 8:00 a.m.$/ do
  step "Settings:  Postdate Set 8:00 a.m."
end

Then /^Settings:  Set Postdate to 9:00 a.m.$/ do
  step "Settings:  Postdate Set 9:00 a.m."
end

Then /^Settings:  Set Postdate to 10:00 a.m.$/ do
  step "Settings:  Postdate Set 10:00 a.m."
end

Then /^Settings:  Set Postdate to 11:00 a.m.$/ do
  step "Settings:  Postdate Set 11:00 a.m."
end

Then /^Settings:  Set Postdate to 12:00 p.m.$/ do
  step "Settings:  Postdate Set 12:00 p.m."
end

Then /^Settings:  Set Postdate to 1:00 p.m.$/ do
  step "Settings:  Postdate Set 1:00 p.m."
end

Then /^Settings:  Set Postdate to 2:00 p.m.$/ do
  step "Settings:  Postdate Set 2:00 p.m."
end

Then /^Settings:  Set Postdate to 3:00 p.m.$/ do
  step "Settings:  Postdate Set 3:00 p.m."
end

Then /^Settings:  Set Postdate to 4:00 p.m.$/ do
  step "Settings:  Postdate Set 4:00 p.m."
end

Then /^Settings:  Set Postdate to 5:00 p.m.$/ do
  step "Settings:  Postdate Set 5:00 p.m."
end

Then /^Settings:  Set Postdate to 6:00 p.m.$/ do
  step "Settings:  Postdate Set 6:00 p.m."
end

Then /^Settings:  Set Postdate to 7:00 p.m.$/ do
  step "Settings:  Postdate Set 7:00 p.m."
end

Then /^Settings:  Set Postdate to 8:00 p.m.$/ do
  step "Settings:  Postdate Set 8:00 p.m."
end

Then /^Settings:  Set Postdate to 9:00 p.m.$/ do
  step "Settings:  Postdate Set 9:00 p.m."
end

Then /^Settings:  Set Postdate to 10:00 p.m.$/ do
  step "Settings:  Postdate Set 10:00 p.m."
end

Then /^Settings:  Set Postdate to 11:00 p.m.$/ do
  step "Settings:  Postdate Set 11:00 p.m."
end

Then /^Settings:  Postdate Set (.*)$/ do |value|
  logger.set "Settings:  Postdate Set #{value}"
  case value.downcase
    when "12:00 a.m."
      @general_settings.post_date.twelve_am
    when "1:00 a.m."
      @general_settings.post_date.one_am
    when "2:00 a.m."
      @general_settings.post_date.two_am
    when "3:00 a.m."
      @general_settings.post_date.three_am
    when "4:00 a.m."
      @general_settings.post_date.four_am
    when "5:00 a.m."
      @general_settings.post_date.five_am
    when "6:00 a.m."
      @general_settings.post_date.six_am
    when "7:00 a.m."
      @general_settings.post_date.seven_am
    when "8:00 a.m."
      @general_settings.post_date.eight_am
    when "9:00 a.m."
      @general_settings.post_date.nine_am
    when "10:00 a.m."
      @general_settings.post_date.ten_am
    when "11:00 a.m."
      @general_settings.post_date.eleven_am
    when "12:00 p.m."
      @general_settings.post_date.twelve_pm
    when "1:00 p.m."
      @general_settings.post_date.one_pm
    when "2:00 p.m."
      @general_settings.post_date.two_pm
    when "3:00 p.m."
      @general_settings.post_date.three_pm
    when "4:00 p.m."
      @general_settings.post_date.four_pm
    when "5:00 p.m."
      @general_settings.post_date.five_pm
    when "6:00 p.m."
      @general_settings.post_date.six_pm
    when "7:00 p.m."
      @general_settings.post_date.seven_pm
    when "8:00 p.m."
      @general_settings.post_date.eight_pm
    when "9:00 p.m."
      @general_settings.post_date.nine_pm
    when "10:00 p.m."
      @general_settings.post_date.ten_pm
    when "11:00 p.m."
      @general_settings.post_date.eleven_pm
    else
      "Invalid Postdate Selection -  Settings:  Postdate #{value}".should eql "Settings"
  end
end
# Mail Balance
Then /^Settings:  Set Mail Balance to 0$/ do
  step 'Settings:  Mail Balance Set 0'
end

Then /^Settings:  Set Mail Balance to 10$/ do
  step 'Settings:  Mail Balance Set 10'
end

Then /^Settings:  Set Mail Balance to 25$/ do
  step 'Settings:  Mail Balance Set 25'
end

Then /^Settings:  Set Mail Balance to 50$/ do
  step 'Settings:  Mail Balance Set 50'
end


Then /^Settings:  Set Mail Balance to 100$/ do
  step 'Settings:  Mail Balance Set 100'
end


Then /^Settings:  Set Mail Balance to 250$/ do
  step 'Settings:  Mail Balance Set 250'
end


Then /^Settings:  Set Mail Balance to 500$/ do
  step 'Settings:  Mail Balance Set 500'
end

Then /^Settings:  Mail Balance Set (.*)$/ do |value|
  logger.step "Settings:  Mail Balance Set #{value}"
  case value.downcase
    when "0"
      @general_settings.postage_balance.zero
    when "10"
      @general_settings.postage_balance.ten
    when "25"
      @general_settings.postage_balance.twenty_five
    when "50"
      @general_settings.postage_balance.fifty
    when "100"
      @general_settings.postage_balance.one_hundred
    when "250"
      @general_settings.postage_balance.two_hundred_fifty
    when "500"
      @general_settings.postage_balance.five_hundred
    else
      "Invalid Mail Balance Selection -  Settings:  Mail Balance #{value}".should eql "Settings"
  end
end

# Expectations
#  Services
Then /^Settings:  Expect Services Checked$/ do
  @general_settings.services.checked?.should be true
end

Then /^Settings:  Expect Services Unchecked$/ do
  @general_settings.services.checked?.should be false
end

#  Print Confirm
Then /^Settings:  Expect Print Confirm Checked$/ do
  @general_settings.print_confirm.checked?.should be true
end

Then /^Settings:  Expect Print Confirm Unchecked$/ do
  @general_settings.print_confirm.checked?.should be false
end

#  Print Confirm
Then /^Settings:  Expect USPS Terms Checked$/ do
  @general_settings.usps_terms.checked?.should be true
end

Then /^Settings:  Expect USPS Terms Unchecked$/ do
  @general_settings.usps_terms.checked?.should be false
end

#  Contacts
Then /^Settings:  Expect Contacts Checked$/ do
  @general_settings.contacts.checked?.should be true
end

Then /^Settings:  Expect Contacts Unchecked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  @general_settings.contacts.checked?.should be false
end

#  Shipments
Then /^Settings:  Expect Shipments Checked$/ do
  step "Open Settings Modal" if @general_settings.nil?
  @general_settings.shipments.checked?.should be true
end

Then /^Settings:  Expect Shipments Unchecked$/ do
  @general_settings.shipments.checked?.should be false
end

# Logoff
Then /^Settings:  Expect Logoff is set for 5 min.$/ do
  step "Settings:  Expect Logoff is 5 min."
end

Then /^Settings:  Expect Logoff is set for 10 min.$/ do
  step "Settings:  Expect Logoff is 10 min."
end

Then /^Settings:  Expect Logoff is set for 15 min.$/ do
  step "Settings:  Expect Logoff is 15 min."
end

Then /^Settings:  Expect Logoff is set for 30 min.$/ do
  step "Settings:  Expect Logoff is 30 min."
end

Then /^Settings:  Expect Logoff is set for 1 hour$/ do
  step "Settings:  Expect Logoff is 1 hour"
end

Then /^Settings:  Expect Logoff is set for 2 hours$/ do
  step "Settings:  Expect Logoff is 2 hours"
end

Then /^Settings:  Expect Logoff is (.*)$/ do |expectation|
  step "Open Settings Modal" if @general_settings.nil?
  @general_settings.log_off.text_box.text.should eql expectation
end

# Postadate
Then /^Settings:  Expect Postdate set to 12:00 a.m.$/ do
  step "Settings:  Expect Postdate is 12:00 a.m."
end

Then /^Settings:  Expect Postdate set to 1:00 a.m.$/ do
  step "Settings:  Expect Postdate is 1:00 a.m."
end

Then /^Settings:  Expect Postdate set to 2:00 a.m.$/ do
  step "Settings:  Expect Postdate is 2:00 a.m."
end

Then /^Settings:  Expect Postdate set to 3:00 a.m.$/ do
  step "Settings:  Expect Postdate is 3:00 a.m."
end

Then /^Settings:  Expect Postdate set to 4:00 a.m.$/ do
  step "Settings:  Expect Postdate is 4:00 a.m."
end

Then /^Settings:  Expect Postdate set to 5:00 a.m.$/ do
  step "Settings:  Expect Postdate is 5:00 a.m."
end

Then /^Settings:  Expect Postdate set to 6:00 a.m.$/ do
  step "Settings:  Expect Postdate is 6:00 a.m."
end

Then /^Settings:  Expect Postdate set to 7:00 a.m.$/ do
  step "Settings:  Expect Postdate is 7:00 a.m."
end

Then /^Settings:  Expect Postdate set to 8:00 a.m.$/ do
  step "Settings:  Expect Postdate is 8:00 a.m."
end

Then /^Settings:  Expect Postdate set to 9:00 a.m.$/ do
  step "Settings:  Expect Postdate is 9:00 a.m."
end

Then /^Settings:  Expect Postdate set to 10:00 a.m.$/ do
  step "Settings:  Expect Postdate is 10:00 a.m."
end

Then /^Settings:  Expect Postdate set to 11:00 a.m.$/ do
  step "Settings:  Expect Postdate is 11:00 a.m."
end

Then /^Settings:  Expect Postdate set to 12:00 p.m.$/ do
  step "Settings:  Expect Postdate is 12:00 p.m."
end

Then /^Settings:  Expect Postdate set to 1:00 p.m.$/ do
  step "Settings:  Expect Postdate is 1:00 p.m."
end

Then /^Settings:  Expect Postdate set to 2:00 p.m.$/ do
  step "Settings:  Expect Postdate is 2:00 p.m."
end

Then /^Settings:  Expect Postdate set to 3:00 p.m.$/ do
  step "Settings:  Expect Postdate is 3:00 p.m."
end

Then /^Settings:  Expect Postdate set to 4:00 p.m.$/ do
  step "Settings:  Expect Postdate is 4:00 p.m."
end

Then /^Settings:  Expect Postdate set to 5:00 p.m.$/ do
  step "Settings:  Expect Postdate is 5:00 p.m."
end

Then /^Settings:  Expect Postdate set to 6:00 p.m.$/ do
  step "Settings:  Expect Postdate is 6:00 p.m."
end

Then /^Settings:  Expect Postdate set to 7:00 p.m.$/ do
  step "Settings:  Expect Postdate is 7:00 p.m."
end

Then /^Settings:  Expect Postdate set to 8:00 p.m.$/ do
  step "Settings:  Expect Postdate is 8:00 p.m."
end

Then /^Settings:  Expect Postdate set to 9:00 p.m.$/ do
  step "Settings:  Expect Postdate is 9:00 p.m."
end

Then /^Settings:  Expect Postdate set to 10:00 p.m.$/ do
  step "Settings:  Expect Postdate is 10:00 p.m."
end

Then /^Settings:  Expect Postdate set to 11:00 p.m.$/ do
  step "Settings:  Expect Postdate is 11:00 p.m."
end

Then /^Settings:  Expect Postdate is (.*)$/ do |expectation|
  step "Open Settings Modal" if @general_settings.nil?
  @general_settings.post_date.text_box.text.should eql expectation
end

# Mail Balance
Then /^Settings:  Expect Mail Balance set to 0$/ do
  step "Settings:  Expect Mail Balance is $0"
end

Then /^Settings:  Expect Mail Balance set to 10$/ do
  step "Settings:  Expect Mail Balance is $10"
end

Then /^Settings:  Expect Mail Balance set to 25$/ do
  step "Settings:  Expect Mail Balance is $25"
end

Then /^Settings:  Expect Mail Balance set to 50$/ do
  step "Settings:  Expect Mail Balance is $50"
end

Then /^Settings:  Expect Mail Balance set to 100$/ do
  step "Settings:  Expect Mail Balance is $100"
end

Then /^Settings:  Expect Mail Balance set to 250$/ do
  step "Settings:  Expect Mail Balance is $250"
end

Then /^Settings:  Expect Mail Balance set to 500$/ do
  step "Settings:  Expect Mail Balance is $500"
end

Then /^Settings:  Expect Mail Balance is (.*)$/ do |expectation|
  @general_settings.postage_balance.text_box.text.should eql expectation
end

# Reset Fields

Then /^Settings:  Open Reset Fields Modal$/ do
  @reset_fields = @general_settings.reset_fields
end

Then /^Reset Fields:  Check Service$/ do
  @reset_fields.service.check
end

Then /^Reset Fields:  Uncheck Service$/ do
  @reset_fields.service.uncheck
end

Then /^Reset Fields:  Expect Service Checked$/ do
  @reset_fields.service.checked?.should be true
end

Then /^Reset Fields:  Expect Service Unchecked$/ do
  @reset_fields.service.checked?.should be false
end

Then /^Reset Fields:  Check Weight$/ do
  @reset_fields.weight.checkbox.check
end

Then /^Reset Fields:  Uncheck Weight$/ do
  logger.step "Reset Fields:  Uncheck Weight"
  @reset_fields.weight.checkbox.uncheck
end

Then /^Reset Fields:  Expect Weight Checked$/ do
  logger.step "Reset Fields:  Expect Weight Checked"
  @reset_fields.weight.checkbox.checked?.should be true
end

Then /^Reset Fields:  Expect Weight Unchecked$/ do
  logger.step "Reset Fields:  Expect Weight Unchecked"
  @reset_fields.weight.checkbox.checked?.should be false
end

Then /^Reset Fields:  Check Dimensions$/ do
  logger.step "Reset Fields:  Check Weight"
  @reset_fields.dimensions.checkbox.check
end

Then /^Reset Fields:  Uncheck Dimensions$/ do
  logger.step "Reset Fields:  Uncheck Weight"
  @reset_fields.dimensions.checkbox.uncheck
end

Then /^Reset Fields:  Expect Dimensions Checked$/ do
  logger.step "Reset Fields:  Expect Dimensions Checked"
  @reset_fields.dimensions.checkbox.checked?.should be true
end

Then /^Reset Fields:  Expect Dimensions Unchecked$/ do
  logger.step "Reset Fields:  Expect Dimensions Unchecked"
  @reset_fields.dimensions.checkbox.checked?.should be false
end

Then /^Reset Fields:  Check Ship to Address$/ do
  logger.step "Reset Fields:  Check Ship to Address"
  @reset_fields.ship_to_address.check
end

Then /^Reset Fields:  Uncheck Ship to Address$/ do
  logger.step "Reset Fields:  Uncheck Ship to Address"
  @reset_fields.ship_to_address.uncheck
end


Then /^Reset Fields:  Expect Ship to Address Checked$/ do
  logger.step "Reset Fields:  Expect Ship to Address Checked"
  @reset_fields.ship_to_address.checked?.should be true
end

Then /^Reset Fields:  Expect Ship to Address Unchecked$/ do
  logger.step "Reset Fields:  Expect Ship to Address Unchecked"
  @reset_fields.ship_to_address.checked?.should be false
end

Then /^Reset Fields:  Check Tracking$/ do
  logger.step "Reset Fields:  Check Tracking"
  @reset_fields.tracking.check
end

Then /^Reset Fields:  Uncheck Tracking$/ do
  logger.step "Reset Fields:  Uncheck Tracking"
  @reset_fields.tracking.uncheck
end

Then /^Reset Fields:  Expect Tracking Checked$/ do
  logger.step "Reset Fields:  Expect Tracking Checked"
  @reset_fields.tracking.checked?.should be true
end

Then /^Reset Fields:  Expect Tracking Unchecked$/ do
  logger.step "Reset Fields:  Expect Tracking Unchecked"
  @reset_fields.tracking.checked?.should be false
end

Then /^Reset Fields:  Check Extra Services$/ do
    logger.step "Reset Fields:  Check Extra Services"
  @reset_fields.extra_services.check
end

Then /^Reset Fields:  Uncheck Extra Services$/ do
  logger.step "Reset Fields:  Uncheck Extra Services"
  @reset_fields.extra_services.uncheck
end

Then /^Reset Fields:  Expect Extra Services Checked$/ do
  logger.step "Reset Fields:  Expect Extra Services Checked"
  @reset_fields.extra_services.checked?.should be true

end

Then /^Reset Fields:  Expect Extra Services Unchecked$/ do
  logger.step "Reset Fields:  Expect Extra Services Unchecked"
  @reset_fields.extra_services.checked?.should be false
end

Then /^Reset Fields:  Check Insurance$/ do
  logger.step "Reset Fields:  Check Insurance"
  @reset_fields.insurance.check
end

Then /^Reset Fields:  Uncheck Insurance$/ do
  logger.step "Reset Fields:  Uncheck Insurance"
  @reset_fields.insurance.uncheck
end

Then /^Reset Fields:  Expect Insurance Checked$/ do
  logger.step "Reset Fields:  Expect Insurance Checked"
  @reset_fields.insurance.checked?.should be true
end

Then /^Reset Fields:  Expect Insurance Unchecked$/ do
  logger.step "Reset Fields:  Expect Insurance Unchecked"
  @reset_fields.insurance.checked?.should be false
end

Then /^Reset Fields:  Check Reference Numbers$/ do
  logger.step "Reset Fields:  Check Reference Number"
  @reset_fields.reference_numbers.check
end

Then /^Reset Fields:  Uncheck Reference Numbers$/ do
  logger.step "Reset Fields:  Uncheck Reference Numbers"
  @reset_fields.reference_numbers.uncheck
end

Then /^Reset Fields:  Expect Reference Numbers Checked$/ do
  logger.step "Reset Fields:  Expect Reference Numbers Checked"
  @reset_fields.reference_numbers.checked?.should be true

end

Then /^Reset Fields:  Expect Reference Numbers Unchecked$/ do
  logger.step "Reset Fields:  Expect Reference Numbers Unchecked"
  @reset_fields.reference_numbers.checked?.should be false
end

Then /^Reset Fields:  Check Cost Code$/ do
  logger.step "Reset Fields:  Check Cost Code"
  @reset_fields.cost_code.check
end

Then /^Reset Fields:  Uncheck Cost Code$/ do
  logger.step "Reset Fields:  Uncheck Cost Code"
  @reset_fields.cost_code.uncheck
end

Then /^Reset Fields:  Expect Cost Code Checked$/ do
  logger.step "Reset Fields:  Expect Cost Code Checked"
  @reset_fields.cost_code.checked?.should be true
end

Then /^Reset Fields:  Expect Cost Code Unchecked$/ do
  logger.step "Reset Fields:  Expect Cost Code Unchecked"
  @reset_fields.cost_code.checked?.should be false
end

Then /^Reset Fields:  Check Customs$/ do
  logger.step "Reset Fields:  Check Customs"
  @reset_fields.customs.check
end

Then /^Reset Fields:  Uncheck Customs$/ do
  logger.step "Reset Fields:  Uncheck Customs"
  @reset_fields.customs.uncheck
end

Then /^Reset Fields:  Expect Customs Checked$/ do
  logger.step "Reset Fields:  Expect Customs Checked"
  @reset_fields.customs.checked?.should be true
end

Then /^Reset Fields:  Expect Customs Unchecked$/ do
  logger.step "Reset Fields:  Expect Customs Unchecked"
  @reset_fields.customs.checked?.should be false
end

Then /^Reset Fields:  Check Quantity$/ do
  logger.step "Reset Fields:  Check Quantity"
  @reset_fields.quantity.check
end

Then /^Reset Fields:  Uncheck Quantity$/ do
  logger.step "Reset Fields:  Uncheck Quantity"
  @reset_fields.quantity.uncheck
end

Then /^Reset Fields:  Expect Quantity Checked$/ do
  logger.step "Reset Fields:  Expect Quantity Checked"
  @reset_fields.quantity.checked?.should be true
end

Then /^Reset Fields:  Expect Quantity Unchecked$/ do
  logger.step "Reset Fields:  Expect Quantity Unchecked"
  @reset_fields.quantity.checked?.should be false
end

Then /^Reset Fields:  Check Stamps Amount$/ do
  logger.step "Reset Fields:  Check Stamps Amount"
  @reset_fields.stamps_amount.check
end

Then /^Reset Fields:  Uncheck Stamps Amount$/ do
  logger.step "Reset Fields:  Uncheck Stamps Amount"
  @reset_fields.stamps_amount.uncheck
end

Then /^Reset Fields:  Expect Stamps Amount Checked$/ do
  logger.step "Reset Fields:  Expect Stamps Amount Checked"
  @reset_fields.stamps_amount.checked?.should be true
end

Then /^Reset Fields:  Expect Stamps Amount Unchecked$/ do
  logger.step "Reset Fields:  Expect Stamps Amount Unchecked"
  @reset_fields.stamps_amount.checked?.should be false
end

Then /^Reset Fields:  Check Auto-Advance Label Position$/ do
  logger.step "Reset Fields:  Check Auto-Advance Label Position"
  @reset_fields.auto_advance_label_position.check
end

Then /^Reset Fields:  Uncheck Auto-Advance Label Position$/ do
  logger.step "Reset Fields:  Uncheck Auto-Advance Label Position"
  @reset_fields.auto_advance_label_position.uncheck
end

Then /^Reset Fields:  Expect Auto-Advance Label Position Checked$/ do
  logger.step "Reset Fields:  Expect Auto-Advance Label Position Checked"
  @reset_fields.auto_advance_label_position.checked?.should be true
end

Then /^Reset Fields:  Expect Auto-Advance Label Position Unchecked$/ do
  logger.step "Reset Fields:  Expect Auto-Advance Label Position Unchecked"
  @reset_fields.auto_advance_label_position.checked?.should be false
end

Then /^Reset Fields:  Set Weight to (\d+) lbs (\d+) oz$/ do |lbs, oz|
  logger.step "Reset Fields:  Set Weight to #{lbs} lbs #{oz} oz"
  step "Reset Fields:  Check Weight"
  @reset_fields.weight.lbs.set lbs
  @reset_fields.weight.oz.set oz
end

Then /^Reset Fields:  Expect Weight lbs equals (\d+)$/ do |lbs|
  logger.step  "Reset Fields:  Expect Weight lbs equals #{lbs}"

  step "Reset Fields:  Check Weight"
  @reset_fields.weight.lbs.text_box.text.to_i.should eql lbs.to_i
end

Then /^Reset Fields:  Expect Weight oz equals (\d+)$/ do |oz|
  logger.step  "Reset Fields:  Expect Weight oz equals #{oz}"
  step "Reset Fields:  Check Weight"
  @reset_fields.weight.oz.text_box.text.to_i.should eql oz.to_i
end

Then /^Reset Fields:  Set Dimensions to length (\d+), width (\d+), height (\d+)$/ do |length, width, height|
  logger.step  "Reset Fields:  Set Dimensions to length #{length}, width #{width}, height #{height}"
  step "Reset Fields:  Check Dimensions"
  @reset_fields.dimensions.length.set length
  @reset_fields.dimensions.width.set width
  @reset_fields.dimensions.height.set height
end

Then /^Reset Fields:  Expect Dimensions to length equals (\d+)$/ do |length|
  logger.step  "Reset Fields:  Expect Dimensions to length equals #{length}"
  step "Reset Fields:  Check Dimensions"
  @reset_fields.dimensions.length.text_box.text.to_i.should eql length.to_i
end

Then /^Reset Fields:  Expect Dimensions to width equals (\d+)$/ do |width|
  logger.step  "Reset Fields:  Expect Dimensions to width equals #{width}"
  step "Reset Fields:  Check Dimensions"
  @reset_fields.dimensions.width.text_box.text.to_i.should eql width.to_i
end

Then /^Reset Fields:  Expect Dimensions to height equals (\d+)$/ do |height|
  logger.step  "Reset Fields:  Expect Dimensions to height equals #{height}"
  step "Reset Fields:  Check Dimensions"
  @reset_fields.dimensions.height.text_box.text.to_i.should eql height.to_i
end

Then /^Reset Fields:  Close$/ do
  logger.step "Reset Fields:  Close"
  @reset_fields.close
end

Then /^Settings:  Save$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.step "Settings:  Save"
  @general_settings.save
end

Then /^Settings:  Close$/ do
  step "Open Settings Modal" if @general_settings.nil?
  logger.step "Settings:  Close"
  @general_settings.close
end





