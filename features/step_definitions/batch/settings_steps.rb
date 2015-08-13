Then /^Check Show Unavailable Services$/ do
  log "Check Show Unavailable Services checkbox..."
  batch.toolbar.settings_modal.check_unavail_services

end

Then /^Check Dont Show Print Confirmation Dialog$/ do
  log "Check Dont Show Print Confirmation Dialog checkbox..."
  batch.toolbar.settings_modal.check_print_confirm_dialog

end

Then /^Check Save Delivery Addresses$/ do
  log "Check Save Delivery Addresses checkbox..."
  batch.toolbar.settings_modal.check_save_contacts

end

Then /^Check Email Shipment Notifications$/ do
  log "Check Email Shipment Notifications checkbox..."
  batch.toolbar.settings_modal.check_shipment_email

end

Then /^Check Email Shipment Deliveries$/ do
  log "Check Email Shipment Deliveries checkbox..."
  batch.toolbar.settings_modal.check_shipment_delivery

end

Then /^Uncheck Show Unavailable Services$/ do
  log "Uncheck Show Unavailable Services checkbox..."
  batch.toolbar.settings_modal.uncheck_unavail_services

end

Then /^Uncheck Dont Show Print Confirmation Dialog$/ do
  log "Uncheck Dont Show Print Confirmation Dialog checkbox..."
  batch.toolbar.settings_modal.uncheck_print_confirm_dialog

end

Then /^Uncheck Save Delivery Addresses$/ do
  log "Uncheck Save Delivery Addresses checkbox..."
  batch.toolbar.settings_modal.uncheck_save_contacts

end

Then /^Uncheck Email Shipment Notifications$/ do
  log "Uncheck Email Shipment Notifications checkbox..."
  batch.toolbar.settings_modal.uncheck_shipment_email

end

Then /^Uncheck Email Shipment Deliveries$/ do
  log "Uncheck Email Shipment Deliveries checkbox..."
  batch.toolbar.settings_modal.uncheck_shipment_delivery

end

Then /^Expect Show Unavailable Services Unchecked$/ do


  actual = batch.toolbar.settings_modal.get_checkbox_status(2)
  log_expectation_eql "Show Unavailable Services", false, actual
  actual.should eql false
end

Then /^Expect Dont Show Print Confirmation Dialog Unchecked$/ do

  actual = batch.toolbar.settings_modal.get_checkbox_status(6)
  log_expectation_eql "Dont Show Print Confirmation Dialog", false, actual
  actual.should eql false

end

Then /^Expect Save Delivery Addresses Unchecked$/ do

  actual = batch.toolbar.settings_modal.get_checkbox_status(8)
  log_expectation_eql "Save Delivery Addresses", false, actual
  actual.should eql false

end

Then /^Expect Email Shipment Notifications Unchecked$/ do

  actual = batch.toolbar.settings_modal.get_checkbox_status(12)
  log_expectation_eql "Email Shipment Notifications", false, actual
  actual.should eql false

end

Then /^Expect Email Shipment Deliveries Unchecked$/ do

  actual = batch.toolbar.settings_modal.get_checkbox_status(13)
  log_expectation_eql "Email Shipment Deliveries", false, actual
  actual.should eql false

end

Then /^Expect Show Unavailable Services Checked$/ do


  actual = batch.toolbar.settings_modal.get_checkbox_status(2)
  log_expectation_eql "Show Unavailable Services", true, actual
  actual.should eql true

end

Then /^Expect Dont Show Print Confirmation Dialog Checked$/ do

  actual = batch.toolbar.settings_modal.get_checkbox_status(6)
  log_expectation_eql "Dont Show Print Confirmation Dialog", true, actual
  actual.should eql true

end

Then /^Expect Save Delivery Addresses Checked$/ do

  actual = batch.toolbar.settings_modal.get_checkbox_status(8)
  log_expectation_eql "Save Delivery Addresses", true, actual
  actual.should eql true

end

Then /^Expect Email Shipment Notifications Checked$/ do

  actual = batch.toolbar.settings_modal.get_checkbox_status(12)
  log_expectation_eql "Email Shipment Notifications", true, actual
  actual.should eql true

end

Then /^Expect Email Shipment Deliveries Checked$/ do

  actual = batch.toolbar.settings_modal.get_checkbox_status(13)
  log_expectation_eql "Email Shipment Deliveries", true, actual
  actual.should eql true

end







Then /^Change Logoff Time to (.*)$/ do |duration|
  log "Change Logoff Time to \"#{duration}\""
  batch.toolbar.settings_modal.select_logoff_time(duration)

end

Then /^Change Postdate Time to (.*)$/ do |time|
  log "Change Postdate Time to \"#{time}\""
  batch.toolbar.settings_modal.select_postdate_time(time)

end

Then /^Change Postage Balance Notification Amount to (.*)$/ do |amount|
  log "Change Postage Balance Notification Amount to \"#{amount}\""
  batch.toolbar.settings_modal.select_balance_notification(amount)
end

Then /^Expect Logoff Time to be (.*)$/ do |duration|

  actual = batch.toolbar.settings_modal.get_logoff_time
  log_expectation_eql "Logoff Time", duration, actual
  actual.should eql duration

end

Then /^Expect Postdate Time to be (.*)$/ do |time|

  actual = batch.toolbar.settings_modal.get_postdate_time
  log_expectation_eql "Postdate Time", time, actual
  actual.should eql time

end

Then /^Expect Postage Balance Notification Amount to be (.*)$/ do |amount|

  actual = batch.toolbar.settings_modal.get_balance_notification_amt
  log_expectation_eql "Balance Notification Amount", amount, actual
  actual.should eql amount

end

Then /^Save Settings changes$/ do
  log "Save settings changes..."
  batch.toolbar.settings_modal.save_changes
end