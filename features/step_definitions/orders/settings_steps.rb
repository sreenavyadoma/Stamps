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
  log.info "Expectation: Expect Show Unavailable Services Unchecked"

  actual = orders.toolbar.settings_modal.get_checkbox_status(1)
  #log_expectation_eql "Show Unavailable Services", false, actual
  actual.should eql false
end

Then /^Expect Dont Show Print Confirmation Dialog Unchecked$/ do
  log.info "Expectation: Expect Dont Show Print Confirmation Dialog Unchecked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(2)
  #log_expectation_eql "Dont Show Print Confirmation Dialog", false, actual
  actual.should eql false

end

Then /^Expect USPS Terms Unchecked in Settings Modal$/ do
  log.info "Expectation: Expect USPS Terms Unchecked in Settings Modal"
  actual = orders.toolbar.settings_modal.get_checkbox_status(3)
  #log_expectation_eql "USPS Restrictions", false, actual
  actual.should eql false

end

Then /^Expect Save Delivery Addresses Unchecked$/ do
  log.info "Expectation: Expect Save Delivery Addresses Unchecked"
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
  log.info "Expectation: Expect Email Shipment Deliveries Unchecked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(6)
  #log_expectation_eql "Email Shipment Deliveries", false, actual
  actual.should eql false

end


Then /^Expect Show Unavailable Services Checked$/ do
  log.info "Expectation: Expect Show Unavailable Services Checked"

  actual = orders.toolbar.settings_modal.get_checkbox_status(1)
  #log_expectation_eql "Show Unavailable Services", true, actual
  actual.should eql true

end

Then /^Expect Dont Show Print Confirmation Dialog Checked$/ do
  log.info "Expectation: Expect Dont Show Print Confirmation Dialog Checked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(2)
  #log_expectation_eql "Dont Show Print Confirmation Dialog", true, actual
  actual.should eql true

end

Then /^Expect USPS Terms Checked in Settings Modal$/ do
  log.info "Expectation: Expect USPS Terms Checked in Settings Modal"
  actual = orders.toolbar.settings_modal.get_checkbox_status(3)
  #log_expectation_eql "USPS Restrictions", true, actual
  actual.should eql true

end

Then /^Expect Save Delivery Addresses Checked$/ do
  log.info "Expectation: Expect Save Delivery Addresses Checked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(4)
  #log_expectation_eql "Save Delivery Addresses", true, actual
  actual.should eql true

end

Then /^Expect Email Shipment Notifications Checked$/ do
  log.info "Expectation: Expect Email Shipment Notifications Checked"
  actual = orders.toolbar.settings_modal.get_checkbox_status(5)
  #log_expectation_eql "Email Shipment Notifications", true, actual
  actual.should eql true

end

Then /^Expect Email Shipment Deliveries Checked$/ do
  log.info "Expectation: Expect Email Shipment Deliveries Checked"
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
  log.info "Expectation: Expect Logoff Time to be #{duration}"
  actual = orders.toolbar.settings_modal.get_logoff_time
  #log_expectation_eql "Logoff Time", duration, actual
  actual.should eql duration

end

Then /^Expect Postdate Time to be (.*)$/ do |time|
  log.info "Expectation: Expect Postdate Time to be #{time}"
  actual = orders.toolbar.settings_modal.get_postdate_time
  #log_expectation_eql "Postdate Time", time, actual
  actual.should eql time

end

Then /^Expect Postage Balance Notification Amount to be (.*)$/ do |amount|
  log.info "Expectation: Expect Postage Balance Notification Amount to be #{amount}"
  actual = orders.toolbar.settings_modal.get_balance_notification_amt
  #log_expectation_eql "Balance Notification Amount", amount, actual
  actual.should eql amount

end

Then /^Save Settings changes$/ do
  log.info "Step: Save settings changes"
  orders.toolbar.settings_modal.save_changes
end




