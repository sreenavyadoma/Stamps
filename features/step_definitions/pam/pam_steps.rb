
Then /^PAM: Load PAM Page$/ do
  logger.info "PAM: Load PAM Page"
  pam.visit
end

Then /^PAM: Load Customer Search Page$/ do
  logger.info "PAM: Load Customer Search Page"
  step "PAM: Load PAM Page" if @customer_search.nil?
  @customer_search = pam.customer_search
end

Then /^PAM Customer Search: Set username to (.*)$/ do |username|
  logger.info "PAM Customer Search: Set username to #{username}"

  if username.downcase.include? "random"
    usr = @username
  else
    @username = username
    usr = username
  end
  logger.info "PAM Customer Search: Set username to #{usr}"
  
  @customer_search.username.set usr
  sleep 1
end

Then /^PAM Customer Search: Set 5.2 or lower$/ do
  logger.info "PAM Customer Search: Set 5.2 or lower"
  @customer_search.user_5_2_or_lower
  @customer_search.user_5_2_or_lower
end

Then /^PAM Customer Search: Click Search button$/ do
  logger.info "PAM Customer Search: Click Search button"

  @customer_profile = @customer_search.search
  if @customer_profile.instance_of? Pam::CustomerProfile
    if @customer_profile.present?
      @pam_customer_profile_found = true
    else
      step "PAM Customer Search: Set username to #{@username}"
      step "PAM Customer Search: Set 5.2 or lower"
      step "PAM Customer Search: Click Search button"
    end
  else
    @pam_customer_profile_found = false
  end
end


Then /^PAM Customer Search: Verify user is found$/ do
  expectation = "Customer was found"

  if @pam_customer_profile_found
    actual_value = expectation
  else
    case @customer_profile
      when Pam::CustomerProfileNotFound
        actual_value = @customer_profile.text
      when Pam::MeterInfoNotAvailableForAccount
        actual_value = @customer_profile.text
      else
        actual_value = "Customer was not found!"
    end
  end
  actual_value.should eql expectation
end

Then /^PAM Customer Profile: Click Change Meter Limit link$/ do
  if @pam_customer_profile_found
    raise "Illegal State Exception:  Customer Profile was not loaded before this step was called.  Check your test." if @customer_profile.nil?
    @change_meter_limit = @customer_profile.header.change_meter_limit
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM Change Meter Limit: Set New Meter Limit to \$(\d+)$/ do |new_limit|
  logger.info "PAM Change Meter Limit: Set New Meter Limit to #{new_limit}"
  if @pam_customer_profile_found
    @change_meter_limit.new_meter_limit.set new_limit
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM Change Meter Limit: Set USPS approval to Checked$/ do
  logger.info "PAM Change Meter Limit: Set USPS approval to Checked"
  if @pam_customer_profile_found
    @change_meter_limit.usps_approval.check
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM Change Meter Limit: Set USPS approval to Unchecked$/ do
  logger.info "PAM Change Meter Limit: Set USPS approval to Unchecked"
  if @pam_customer_profile_found
    @change_meter_limit.usps_approval.uncheck
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM Change Meter Limit: Click Submit$/ do
  logger.info "PAM Change Meter Limit: Click Submit"
  if @pam_customer_profile_found
    @customer_profile = @change_meter_limit.submit.ok
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM Customer Profile: Click ACH Credit link$/ do
  logger.info "PAM Customer Profile: Click ACH Credit link"
  if @pam_customer_profile_found
    raise "Illegal State Exception:  Customer Profile was not loaded before this step was called.  Check your test." if @customer_profile.nil?
    @ach_credit = @customer_profile.header.ach_credit
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM ACH Purchase: Set Amount to \$(\d+)\.(\d+)$/ do |dollars, cents|
  logger.info "PAM ACH Purchase: Set Amount to $#{dollars}.#{cents}"
  if @pam_customer_profile_found
    dollar_amount = @ach_credit.dollar_amount
    dollar_amount.set dollars
    dollar_amount.safe_click
    dollar_amount.safe_click
    dollar_amount.safe_click

    cents_amount = @ach_credit.cents_amount
    cents_amount.safe_click
    cents_amount.safe_click
    cents_amount.safe_click
    cents_amount.set cents

    comments = @ach_credit.comments
    comments.safe_click
    comments.safe_click
    comments.safe_click
    comments.set @username

    @customer_profile = @ach_credit.submit.yes.ok
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM Customer Profile: Get Available Postage Amount$/ do
  logger.info "PAM Customer Profile: Get Available Postage Amount"

  logger.message "PAM: Available Postage ############################"
  logger.message "PAM: Available Postage ############################"
  logger.message "PAM: Available Postage ############################"
  logger.message "PAM: Available Postage $#{@customer_profile.available_postage.text}"
  logger.message "PAM: Available Postage $#{@customer_profile.available_postage.text}"
  logger.message "PAM: Available Postage $#{@customer_profile.available_postage.text}"
  logger.message "PAM: Available Postage ############################"
  logger.message "PAM: Available Postage ############################"
  logger.message "PAM: Available Postage ############################"
end

Then /^PAM Customer Profile: Click  AppCap Overrides link$/ do
  logger.info "PAM Customer Profile: Click  AppCap Overrides link"
  if @pam_customer_profile_found
    raise "Illegal State Exception:  Customer Profile was not loaded before this step was called.  Check your test." if @customer_profile.nil?
    @appcapp_overrides = @customer_profile.header.appcapp_overrides
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Internet Postage Printing to Always On$/ do
  logger.info "PAM AppCap Overrides: Set Internet Postage Printing to Always On"
  if @pam_customer_profile_found
    @appcapp_overrides.internet_postage_printing.always_on
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Internet Postage Printing to Always Off$/ do
  logger.info "PAM AppCap Overrides: Set Internet Postage Printing to Always Off"
  if @pam_customer_profile_found
    @appcapp_overrides.internet_postage_printing.always_off
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Internet Postage Printing to No Override$/ do
  logger.info "PAM AppCap Overrides: Set Internet Postage Printing to No Override"
  if @pam_customer_profile_found
    @appcapp_overrides.internet_postage_printing.no_override
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Netstamps Printing to Always On$/ do
  logger.info "PAM AppCap Overrides: Set Netstamps Printing to Always On"
  if @pam_customer_profile_found
    @appcapp_overrides.netstamps_printing.always_on
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Netstamps Printing to Always Off$/ do
  logger.info "PAM AppCap Overrides: Set Netstamps Printing to Always Off"
  if @pam_customer_profile_found
    @appcapp_overrides.netstamps_printing.always_off
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Netstamps Printing to No Override$/ do
  logger.info "PAM AppCap Overrides: Set Netstamps Printing to No Override"
  if @pam_customer_profile_found
    @appcapp_overrides.netstamps_printing.no_override
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Shipping Label Printing to Always On$/ do
  logger.info "PAM AppCap Overrides: Set Shipping Label Printing to Always On"
  if @pam_customer_profile_found
    @appcapp_overrides.shipping_label_printing.always_on
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Shipping Label Printing to Always Off$/ do
  logger.info "PAM AppCap Overrides: Set Shipping Label Printing to Always Off"
  if @pam_customer_profile_found
    @appcapp_overrides.shipping_label_printing.always_off
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Shipping Label Printing to Override$/ do
  logger.info "PAM AppCap Overrides: Set Shipping Label Printing to Override"
  if @pam_customer_profile_found
    @appcapp_overrides.shipping_label_printing.no_override
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set International Shipping to Always On$/ do
  logger.info "PAM AppCap Overrides: Set International Shipping to Always On"
  if @pam_customer_profile_found
    @appcapp_overrides.international_shipping.always_on
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set International Shipping to Always Off$/ do
  logger.info "PAM AppCap Overrides: Set International Shipping to Always Off"
  if @pam_customer_profile_found
    @appcapp_overrides.international_shipping.always_off
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set International Shipping to Override$/ do
  logger.info "PAM AppCap Overrides: Set International Shipping to Override"
  if @pam_customer_profile_found
    @appcapp_overrides.international_shipping.no_override
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Allow High Risk Countries to Always On$/ do
  logger.info "PAM AppCap Overrides: Set Allow High Risk Countries to Always On"
  if @pam_customer_profile_found
    @appcapp_overrides.allow_high_risk_countries.always_on
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Allow High Risk Countries to Always Off$/ do
  logger.info "PAM AppCap Overrides: Set Allow High Risk Countries to Always Off"
  if @pam_customer_profile_found
    @appcapp_overrides.allow_high_risk_countries.always_off
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Allow High Risk Countries to Override$/ do
  logger.info "PAM AppCap Overrides: Set Allow High Risk Countries to Override"
  if @pam_customer_profile_found
    @appcapp_overrides.allow_high_risk_countries.no_override
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Mailing Label Printing to Always On$/ do
  logger.info "PAM AppCap Overrides: Set Mailing Label Printing to Always On"
  if @pam_customer_profile_found
    @appcapp_overrides.mailing_label_printing.always_on
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Mailing Label Printing to Always Off$/ do
  logger.info "PAM AppCap Overrides: Set Mailing Label Printing to Always Off"
  if @pam_customer_profile_found
    @appcapp_overrides.mailing_label_printing.always_off
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Set Mailing Label Printing to Override$/ do
  logger.info "PAM AppCap Overrides: Set Mailing Label Printing to Override"
  if @pam_customer_profile_found
    @appcapp_overrides.mailing_label_printing.no_override
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^PAM AppCap Overrides: Submit$/ do
  logger.info "PAM AppCap Overrides: Submit"
  if @pam_customer_profile_found
    @customer_profile = @appcapp_overrides.submit.ok
  else
    logger.info "PAM:  Customer not found!"
  end
end

Then /^Registration Profile:  Send username to standard out$/ do
  logger.message " ############## NEW USER ID "
  logger.message " ############## #{@username}"
  logger.message " ############## #{@username}"
  logger.message " ############## #{@username}"
  logger.message " ############## #{@username}"
  logger.message " ############## NEW USER ID "
end




























