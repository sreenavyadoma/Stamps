
Then /^Open Settings Modal$/ do
  log.info "Step: Open Settings Modal"
  @general_settings = orders.toolbar.settings.general_settings

  log.info @general_settings.services.checked?
  @general_settings.services.check
  log.info @general_settings.services.checked?
  @general_settings.services.uncheck
  log.info @general_settings.services.checked?

  log.info @general_settings.print_confirm.checked?
  @general_settings.print_confirm.check
  log.info @general_settings.print_confirm.checked?
  @general_settings.print_confirm.uncheck
  log.info @general_settings.print_confirm.checked?

  log.info @general_settings.usps_terms.checked?
  @general_settings.usps_terms.check
  log.info @general_settings.usps_terms.checked?
  @general_settings.usps_terms.uncheck
  log.info @general_settings.usps_terms.checked?

  log.info @general_settings.contacts.checked?
  @general_settings.contacts.check
  log.info @general_settings.contacts.checked?
  @general_settings.contacts.uncheck
  log.info @general_settings.contacts.checked?

  log.info @general_settings.shipments.checked?
  @general_settings.shipments.check
  log.info @general_settings.shipments.checked?
  @general_settings.shipments.uncheck
  log.info @general_settings.shipments.checked?

  log.info @general_settings.log_off.text_box.text
  @general_settings.log_off.five_min
  log.info @general_settings.log_off.text_box.text
  @general_settings.log_off.ten_min
  log.info @general_settings.log_off.text_box.text
  @general_settings.log_off.fifteen_min
  log.info @general_settings.log_off.text_box.text
  @general_settings.log_off.thirty_min
  log.info @general_settings.log_off.text_box.text
  @general_settings.log_off.one_hour
  log.info @general_settings.log_off.text_box.text
  @general_settings.log_off.two_hour
  log.info @general_settings.log_off.text_box.text

  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.twelve_am
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.one_am
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.two_am
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.three_am
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.four_am
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.five_am
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.six_am
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.seven_am
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.eight_am
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.nine_am
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.ten_am
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.eleven_am
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.twelve_pm
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.one_pm
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.two_pm
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.three_pm
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.four_pm
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.five_pm
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.six_pm
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.seven_pm
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.eight_pm
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.nine_pm
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.ten_pm
  log.info @general_settings.post_date.text_box.text
  @general_settings.post_date.eleven_pm
  log.info @general_settings.post_date.text_box.text

  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.zero
  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.ten
  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.twenty_five
  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.fifty
  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.one_hundred
  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.two_hundred_fifty
  log.info @general_settings.postage_balance.text_box.text
  @general_settings.postage_balance.five_hundred
  log.info @general_settings.postage_balance.text_box.text

  reset_fields = @general_settings.reset_fields
  log.info reset_fields.ship_to_address.checked?
  reset_fields.ship_to_address.uncheck
  log.info reset_fields.ship_to_address.checked?
  reset_fields.ship_to_address.check
  log.info reset_fields.ship_to_address.checked?

  log.info reset_fields.tracking.checked?
  reset_fields.tracking.uncheck
  log.info reset_fields.tracking.checked?
  reset_fields.tracking.check
  log.info reset_fields.tracking.checked?

  log.info reset_fields.extra_services.checked?
  reset_fields.extra_services.uncheck
  log.info reset_fields.extra_services.checked?
  reset_fields.extra_services.check
  log.info reset_fields.extra_services.checked?

  log.info reset_fields.insurance.checked?
  reset_fields.insurance.uncheck
  log.info reset_fields.insurance.checked?
  reset_fields.insurance.check
  log.info reset_fields.insurance.checked?

  log.info reset_fields.reference_numbers.checked?
  reset_fields.reference_numbers.uncheck
  log.info reset_fields.reference_numbers.checked?
  reset_fields.reference_numbers.check
  log.info reset_fields.reference_numbers.checked?

  log.info reset_fields.cost_code.checked?
  reset_fields.cost_code.uncheck
  log.info reset_fields.cost_code.checked?
  reset_fields.cost_code.check
  log.info reset_fields.cost_code.checked?

  log.info reset_fields.customs.checked?
  reset_fields.customs.uncheck
  log.info reset_fields.customs.checked?
  reset_fields.customs.check
  log.info reset_fields.customs.checked?

  log.info reset_fields.quantity.checked?
  reset_fields.quantity.uncheck
  log.info reset_fields.quantity.checked?
  reset_fields.quantity.check
  log.info reset_fields.quantity.checked?

  log.info reset_fields.stamps_amount.checked?
  reset_fields.stamps_amount.uncheck
  log.info reset_fields.stamps_amount.checked?
  reset_fields.stamps_amount.check
  log.info reset_fields.stamps_amount.checked?

  log.info reset_fields.auto_advance_label_position.checked?
  reset_fields.auto_advance_label_position.uncheck
  log.info reset_fields.auto_advance_label_position.checked?
  reset_fields.auto_advance_label_position.check
  log.info reset_fields.auto_advance_label_position.checked?

  reset_fields.weight.lbs.increment 10
  reset_fields.weight.lbs.decrement 5
  reset_fields.weight.lbs.set 2
  reset_fields.weight.lbs.set 7

  reset_fields.weight.oz.increment 10
  reset_fields.weight.oz.decrement 5
  reset_fields.weight.oz.set 2
  reset_fields.weight.oz.set 7

  reset_fields.dimensions.length.increment 10
  reset_fields.dimensions.length.decrement 5
  reset_fields.dimensions.length.set 2
  reset_fields.dimensions.length.set 7

  reset_fields.dimensions.width.increment 10
  reset_fields.dimensions.width.decrement 5
  reset_fields.dimensions.width.set 2
  reset_fields.dimensions.width.set 7

  reset_fields.dimensions.height.increment 10
  reset_fields.dimensions.height.decrement 5
  reset_fields.dimensions.height.set 2
  reset_fields.dimensions.height.set 7

  reset_fields.close
  @general_settings.save

  log.info "rob"


end

Then /^General Settings - Check Services$/ do
  @general_settings = orders.toolbar.settings.general_settings
end

Then /^Check Show Unavailable Services$/ do
  log.info "Step: Check Show Unavailable Services checkbox"
  orders.toolbar.settings_modal.check_unavail_services

end

Then /^Check Dont Show Print Confirmation Dialog$/ do
  log.info "Step: Check Dont Show Print Confirmation Dialog checkbox"
  orders.toolbar.settings_modal.check_print_confirm_dialog

end

Then /^Check Save Delivery Addresses$/ do
  log.info "Step: Check Save Delivery Addresses"
  orders.toolbar.settings_modal.check_save_contacts

end

Then /^Check Email Shipment Notifications$/ do
  log.info "Step: Check Email Shipment Notifications"
  orders.toolbar.settings_modal.check_shipment_email

end

Then /^Check Email Shipment Deliveries$/ do
  log.info "Step: Check Email Shipment Deliveries checkbox"
  orders.toolbar.settings_modal.check_shipment_delivery

end

Then /^Check USPS Terms in Settings Modal$/ do
  log.info "Step: Check USPS Terms checkbox in Settings Modal"
  orders.toolbar.settings_modal.check_usps_terms

end

Then /^Uncheck Show Unavailable Services$/ do
  log.info "Step: Uncheck Show Unavailable Services"
  orders.toolbar.settings_modal.uncheck_unavail_services

end

Then /^Uncheck Dont Show Print Confirmation Dialog$/ do
  log.info "Step: Uncheck Dont Show Print Confirmation Dialog"
  orders.toolbar.settings_modal.uncheck_print_confirm_dialog

end

Then /^Uncheck Save Delivery Addresses$/ do
  log.info "Step: Uncheck Save Delivery Addresses"
  orders.toolbar.settings_modal.uncheck_save_contacts

end

Then /^Uncheck Email Shipment Notifications$/ do
  log.info "Step: Uncheck Email Shipment Notifications checkbox"
  orders.toolbar.settings_modal.uncheck_shipment_email

end

Then /^Uncheck Email Shipment Deliveries$/ do
  log.info "Step: Uncheck Email Shipment Deliveries checkbox"
  orders.toolbar.settings_modal.uncheck_shipment_delivery

end

Then /^Uncheck USPS Terms in Settings Modal$/ do
  log.info "Step: Uncheck USPS Terms checkbox in Settings Modal"
  orders.toolbar.settings_modal.uncheck_usps_terms

end

Then /^Expect Show Unavailable Services Unchecked$/ do
  log.info "Step: Expect Show Unavailable Services Unchecked"

  actual = orders.toolbar.settings_modal.get_checkbox_status(1)
  #log_expectation_eql "Show Unavailable Services", false, actual
  actual.should eql false
end

Then /^Expect Dont Show Print Confirmation Dialog Unchecked$/ do
  log.info "Step: Expect Dont Show Print Confirmation Dialog Unchecked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(2)
  #log_expectation_eql "Dont Show Print Confirmation Dialog", false, actual
  actual.should eql false

end

Then /^Expect USPS Terms Unchecked in Settings Modal$/ do
  log.info "Step: Expect USPS Terms Unchecked in Settings Modal"
  actual = orders.toolbar.settings_modal.get_checkbox_status(3)
  #log_expectation_eql "USPS Restrictions", false, actual
  actual.should eql false

end

Then /^Expect Save Delivery Addresses Unchecked$/ do
  log.info "Step: Expect Save Delivery Addresses Unchecked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(4)
  #log_expectation_eql "Save Delivery Addresses", false, actual
  actual.should eql false

end

Then /^Expect Email Shipment Notifications Unchecked$/ do
  log.info "Step: Expect Email Shipment Notifications Unchecked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(5)
  #log_expectation_eql "Email Shipment Notifications", false, actual
  actual.should eql false

end

Then /^Expect Email Shipment Deliveries Unchecked$/ do
  log.info "Step: Expect Email Shipment Deliveries Unchecked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(6)
  #log_expectation_eql "Email Shipment Deliveries", false, actual
  actual.should eql false

end

Then /^Expect Show Unavailable Services Checked$/ do
  log.info "Step: Expect Show Unavailable Services Checked"

  actual = orders.toolbar.settings_modal.get_checkbox_status(1)
  #log_expectation_eql "Show Unavailable Services", true, actual
  actual.should eql true

end

Then /^Expect Dont Show Print Confirmation Dialog Checked$/ do
  log.info "Step: Expect Dont Show Print Confirmation Dialog Checked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(2)
  #log_expectation_eql "Dont Show Print Confirmation Dialog", true, actual
  actual.should eql true

end

Then /^Expect USPS Terms Checked in Settings Modal$/ do
  log.info "Step: Expect USPS Terms Checked in Settings Modal"
  actual = orders.toolbar.settings_modal.get_checkbox_status(3)
  #log_expectation_eql "USPS Restrictions", true, actual
  actual.should eql true

end

Then /^Expect Save Delivery Addresses Checked$/ do
  log.info "Step: Expect Save Delivery Addresses Checked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(4)
  #log_expectation_eql "Save Delivery Addresses", true, actual
  actual.should eql true

end

Then /^Expect Email Shipment Notifications Checked$/ do
  log.info "Step: Expect Email Shipment Notifications Checked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(5)
  #log_expectation_eql "Email Shipment Notifications", true, actual
  actual.should eql true

end

Then /^Expect Email Shipment Deliveries Checked$/ do
  log.info "Step: Expect Email Shipment Deliveries Checked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(6)
  #log_expectation_eql "Email Shipment Deliveries", true, actual
  actual.should eql true

end

Then /^Change Logoff Time to (.*)$/ do |duration|
  log.info "Step: Change Logoff Time to \"#{duration}\""
  orders.toolbar.settings_modal.select_logoff_time(duration)

end

Then /^Change Postdate Time to (.*)$/ do |time|
  log.info "Step: Change Postdate Time to \"#{time}\""
  orders.toolbar.settings_modal.select_postdate_time(time)

end

Then /^Change Postage Balance Notification Amount to (.*)$/ do |amount|
  log.info "Step: Change Postage Balance Notification Amount to \"#{amount}\""
  orders.toolbar.settings_modal.select_balance_notification(amount)
end

Then /^Expect Logoff Time to be (.*)$/ do |duration|
  log.info "Step: Expect Logoff Time to be #{duration}"
  actual = orders.toolbar.settings_modal.get_logoff_time
  #log_expectation_eql "Logoff Time", duration, actual
  actual.should eql duration

end

Then /^Expect Postdate Time to be (.*)$/ do |time|
  log.info "Step: Expect Postdate Time to be #{time}"
  actual = orders.toolbar.settings_modal.get_postdate_time
  #log_expectation_eql "Postdate Time", time, actual
  actual.should eql time

end

Then /^Expect Postage Balance Notification Amount to be (.*)$/ do |amount|
  log.info "Step: Expect Postage Balance Notification Amount to be #{amount}"
  actual = orders.toolbar.settings_modal.get_balance_notification_amt
  #log_expectation_eql "Balance Notification Amount", amount, actual
  actual.should eql amount

end

Then /^Save Settings changes$/ do
  log.info "Step: Save settings changes"
  orders.toolbar.settings_modal.save_changes
end




