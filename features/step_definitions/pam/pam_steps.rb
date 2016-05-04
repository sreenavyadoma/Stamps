
Then /^PAM: Customer Search: Search for username (.*)$/ do |username|
  log.info "PAM: Customer Search: Search for username #{username}"
  #step "PAM: Load Customer Search Page"
  if username.downcase.include? "random"
    usr = @username
  else
    usr = username
    @username = username
  end

  20.times do
    step "PAM: Load Customer Search Page"
    step "PAM: Customer Search: Set username to #{usr}"
    step "PAM: Customer Search: Set 5.2 or lower"
    step "PAM: Customer Search: Click Search button"
    break if @customer_profile.instance_of? Pam::CustomerProfile
  end
end

Then /^PAM: Load PAM Page$/ do
  log.info "Step: PAM: Load PAM Page"
  step "I launch browser" if @browser.nil?
  pam.visit
end

Then /^PAM: Load Customer Search Page$/ do
  log.info "PAM: Load Customer Search Page"
  step "PAM: Load PAM Page" if @customer_search.nil?
  @customer_search = pam.customer_search
end

Then /^PAM: Customer Search: Set username to (.*)$/ do |username|
  log.info "PAM: Customer Search: Set username to #{username}"
  if username.downcase.include? "random"
    usr = @username
  else
    @username = username
    usr = username
  end
  log.info "PAM: Customer Search: Set username to #{usr}"
  @customer_search = pam.customer_search if @customer_search.nil?
  @customer_search.username.set_until usr
  sleep 1
end

Then /^PAM: Customer Search: Set 5.2 or lower$/ do
  log.info "PAM: Customer Search: Set 5.2 or lower"
  @customer_search = pam.customer_search if @customer_search.nil?
  @customer_search.user_5_2_or_lower
  @customer_search.user_5_2_or_lower
end

Then /^PAM: Customer Search: Click Search button$/ do
  log.info "PAM: Customer Search: Click Search button"
  step "PAM: Load Customer Search Page" if @customer_search.nil?
  search_result = @customer_search.search
  case search_result
    when Pam::CustomerProfile
      @customer_profile = search_result
      @pam_customer_profile_found = @customer_profile.present?
    else
      @pam_customer_profile_found = false
  end

  begin
    log.info "PAM CUSTOMER SEARCH RESULT:  NOT FOUND!"
  end unless @pam_customer_profile_found
end

Then /^PAM: Customer Profile: Click Change Meter Limit link$/ do
  if @pam_customer_profile_found
    raise "Illegal State Exception:  Customer Profile was not loaded before this step was called.  Check your test." if @customer_profile.nil?
    @change_meter_limit = @customer_profile.header.change_meter_limit
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: Change Meter Limit: Set New Meter Limit to \$(\d+)$/ do |new_limit|
  log.info "PAM: Change Meter Limit: Set New Meter Limit to #{new_limit}"
  if @pam_customer_profile_found
    @change_meter_limit.new_meter_limit.set_until new_limit
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: Change Meter Limit: Set USPS approval to Checked$/ do
  log.info "PAM: Change Meter Limit: Set USPS approval to Checked"
  if @pam_customer_profile_found
    @change_meter_limit.usps_approval.check
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: Change Meter Limit: Set USPS approval to Unchecked$/ do
  log.info "PAM: Change Meter Limit: Set USPS approval to Unchecked"
  if @pam_customer_profile_found
    @change_meter_limit.usps_approval.uncheck
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: Change Meter Limit: Click Submit$/ do
  log.info "PAM: Change Meter Limit: Click Submit"
  if @pam_customer_profile_found
    @customer_profile = @change_meter_limit.submit.ok
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: Customer Profile: Click ACH Credit link$/ do
  log.info "PAM: Customer Profile: Click ACH Credit link"
  if @pam_customer_profile_found
    raise "Illegal State Exception:  Customer Profile was not loaded before this step was called.  Check your test." if @customer_profile.nil?
    @ach_credit = @customer_profile.header.ach_credit
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: ACH Purchase: Set Amount to \$(\d+)\.(\d+)$/ do |dollars, cents|
  log.info "PAM: ACH Purchase: Set Amount to $#{dollars}.#{cents}"
  if @pam_customer_profile_found
    dollar_amount = @ach_credit.dollar_amount
    dollar_amount.set_until dollars
    dollar_amount.safe_click
    dollar_amount.safe_click
    dollar_amount.safe_click

    cents_amount = @ach_credit.cents_amount
    cents_amount.safe_click
    cents_amount.safe_click
    cents_amount.safe_click
    cents_amount.set_until cents

    comments = @ach_credit.comments
    comments.safe_click
    comments.safe_click
    comments.safe_click
    comments.set_until @username

    @customer_profile = @ach_credit.submit.yes.ok
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: Customer Profile: Get Available Postage Amount$/ do
  log.info "PAM: Customer Profile: Get Available Postage Amount"

  log.message "PAM: Available Postage ############################"
  log.message "PAM: Available Postage ############################"
  log.message "PAM: Available Postage ############################"
  log.message "PAM: Available Postage $#{@customer_profile.available_postage.text}"
  log.message "PAM: Available Postage $#{@customer_profile.available_postage.text}"
  log.message "PAM: Available Postage $#{@customer_profile.available_postage.text}"
  log.message "PAM: Available Postage ############################"
  log.message "PAM: Available Postage ############################"
  log.message "PAM: Available Postage ############################"
end

Then /^PAM: Customer Profile: Click  AppCap Overrides link$/ do
  log.info "PAM: Customer Profile: Click  AppCap Overrides link"
  if @pam_customer_profile_found
    raise "Illegal State Exception:  Customer Profile was not loaded before this step was called.  Check your test." if @customer_profile.nil?
    @appcapp_overrides = @customer_profile.header.appcapp_overrides
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Internet Postage Printing to Always On$/ do
  log.info "PAM: AppCap Overrides: Set Internet Postage Printing to Always On"
  if @pam_customer_profile_found
    @appcapp_overrides.internet_postage_printing.always_on
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Internet Postage Printing to Always Off$/ do
  log.info "PAM: AppCap Overrides: Set Internet Postage Printing to Always Off"
  if @pam_customer_profile_found
    @appcapp_overrides.internet_postage_printing.always_off
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Internet Postage Printing to No Override$/ do
  log.info "PAM: AppCap Overrides: Set Internet Postage Printing to No Override"
  if @pam_customer_profile_found
    @appcapp_overrides.internet_postage_printing.no_override
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Netstamps Printing to Always On$/ do
  log.info "PAM: AppCap Overrides: Set Netstamps Printing to Always On"
  if @pam_customer_profile_found
    @appcapp_overrides.netstamps_printing.always_on
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Netstamps Printing to Always Off$/ do
  log.info "PAM: AppCap Overrides: Set Netstamps Printing to Always Off"
  if @pam_customer_profile_found
    @appcapp_overrides.netstamps_printing.always_off
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Netstamps Printing to No Override$/ do
  log.info "PAM: AppCap Overrides: Set Netstamps Printing to No Override"
  if @pam_customer_profile_found
    @appcapp_overrides.netstamps_printing.no_override
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Shipping Label Printing to Always On$/ do
  log.info "PAM: AppCap Overrides: Set Shipping Label Printing to Always On"
  if @pam_customer_profile_found
    @appcapp_overrides.shipping_label_printing.always_on
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Shipping Label Printing to Always Off$/ do
  log.info "PAM: AppCap Overrides: Set Shipping Label Printing to Always Off"
  if @pam_customer_profile_found
    @appcapp_overrides.shipping_label_printing.always_off
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Shipping Label Printing to Override$/ do
  log.info "PAM: AppCap Overrides: Set Shipping Label Printing to Override"
  if @pam_customer_profile_found
    @appcapp_overrides.shipping_label_printing.no_override
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set International Shipping to Always On$/ do
  log.info "PAM: AppCap Overrides: Set International Shipping to Always On"
  if @pam_customer_profile_found
    @appcapp_overrides.international_shipping.always_on
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set International Shipping to Always Off$/ do
  log.info "PAM: AppCap Overrides: Set International Shipping to Always Off"
  if @pam_customer_profile_found
    @appcapp_overrides.international_shipping.always_off
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set International Shipping to Override$/ do
  log.info "PAM: AppCap Overrides: Set International Shipping to Override"
  if @pam_customer_profile_found
    @appcapp_overrides.international_shipping.no_override
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Allow High Risk Countries to Always On$/ do
  log.info "PAM: AppCap Overrides: Set Allow High Risk Countries to Always On"
  if @pam_customer_profile_found
    @appcapp_overrides.allow_high_risk_countries.always_on
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Allow High Risk Countries to Always Off$/ do
  log.info "PAM: AppCap Overrides: Set Allow High Risk Countries to Always Off"
  if @pam_customer_profile_found
    @appcapp_overrides.allow_high_risk_countries.always_off
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Allow High Risk Countries to Override$/ do
  log.info "PAM: AppCap Overrides: Set Allow High Risk Countries to Override"
  if @pam_customer_profile_found
    @appcapp_overrides.allow_high_risk_countries.no_override
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Mailing Label Printing to Always On$/ do
  log.info "PAM: AppCap Overrides: Set Mailing Label Printing to Always On"
  if @pam_customer_profile_found
    @appcapp_overrides.mailing_label_printing.always_on
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Mailing Label Printing to Always Off$/ do
  log.info "PAM: AppCap Overrides: Set Mailing Label Printing to Always Off"
  if @pam_customer_profile_found
    @appcapp_overrides.mailing_label_printing.always_off
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Set Mailing Label Printing to Override$/ do
  log.info "PAM: AppCap Overrides: Set Mailing Label Printing to Override"
  if @pam_customer_profile_found
    @appcapp_overrides.mailing_label_printing.no_override
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^PAM: AppCap Overrides: Submit$/ do
  log.info "PAM: AppCap Overrides: Submit"
  if @pam_customer_profile_found
    @customer_profile = @appcapp_overrides.submit.ok
  else
    log.info "PAM:  Customer not found!"
  end
end

Then /^WebReg:  Send username to standard out$/ do
  log.message " ############## NEW USER ID "
  log.message " ############## #{@username}"
  log.message " ############## #{@username}"
  log.message " ############## #{@username}"
  log.message " ############## #{@username}"
  log.message " ############## NEW USER ID "
end




























