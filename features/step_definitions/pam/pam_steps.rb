Then /^PAM:  Load QA Payment Administration Manager Page$/ do
  pam.visit :qa
end

Then /^PAM:  Authentication Required$/ do
  pam.visit :qa
end

Then /^PAM: Load Customer Search Page$/ do
  log.info "PAM: Load Customer Search Page"
  step "PAM:  Load QA Payment Administration Manager Page" if @customer_search.nil?
  @customer_search = pam.customer_search
end

Then /^PAM: Customer Search: Search for username (.*)$/ do |username|
  log.info "PAM: Customer Search: Search for username #{username}"
  step "PAM: Load Customer Search Page" if @customer_search.nil?
  usr = @random_username if username.downcase.include? "random"

  100.times do
    @customer_search.username.set_until usr
    @search_result = @customer_search.search
    case @search_result
      when Pam::CustomerProfileNotFound
        @customer_search = pam.customer_search
        log.info "No records found."
        sleep 2
      when Pam::CustomerProfile
        @customer_profile = @search_result
        break
    end
  end

end

Then /^PAM: Customer Search: Set username to (.*)$/ do |username|
  usr = @random_username if username.downcase.include? "random"
  log.info "PAM: Customer Search: Set username to #{usr}"
  step "PAM: Load Customer Search Page" if @customer_search.nil?
  @customer_search.username.set_until usr
  @customer_search.username.set_until usr
  @customer_search.username.set_until usr
  sleep 1
end

Then /^PAM: Customer Search: Click Search button$/ do
  log.info "PAM: Customer Search: Click Search button"
  step "PAM: Load Customer Search Page" if @customer_search.nil?
  @customer_profile = @customer_search.search
  @customer_profile.wait_until_present
  @customer_profile.present?.should be true
end

Then /^PAM: Customer Profile: Click Change Meter Limit link$/ do
  raise "Illegal State Exception:  Customer Profile was not loaded before this step was called.  Check your test." if @customer_profile.nil?
  @change_meter_limit = @customer_profile.header.change_meter_limit
end

Then /^PAM: Change Meter Limit: Set New Meter Limit to \$(\d+)$/ do |new_limit|
  log.info "PAM: Change Meter Limit: Set New Meter Limit to #{new_limit}"
  @change_meter_limit.new_meter_limit.set_until new_limit
end

Then /^PAM: Change Meter Limit: Set USPS approval to Checked$/ do
  log.info "PAM: Change Meter Limit: Set USPS approval to Checked"
  @change_meter_limit.usps_approval.check
end

Then /^PAM: Change Meter Limit: Set USPS approval to Unchecked$/ do
  log.info "PAM: Change Meter Limit: Set USPS approval to Unchecked"
  @change_meter_limit.usps_approval.uncheck
end

Then /^PAM: Change Meter Limit: Click Submit$/ do
  log.info ""
  @customer_profile = @change_meter_limit.submit.ok
end

Then /^PAM: Customer Profile: Click ACH Credit link$/ do
  log.info "PAM: Customer Profile: Click ACH Credit link"
  raise "Illegal State Exception:  Customer Profile was not loaded before this step was called.  Check your test." if @customer_profile.nil?
  @ach_credit = @customer_profile.header.ach_credit
end

Then /^PAM: ACH Purchase: Set Amount to \$(\d+)\.(\d+)$/ do |dollars, cents|
  log.info "PAM: ACH Purchase: Set Amount to $#{dollars}.#{cents}"
  @ach_credit.dollar_amount.set_until dollars
  @ach_credit.cents_amount.set_until cents
  @ach_credit.comments.set_until @random_username
  @customer_profile = @ach_credit.submit.yes.ok
end

Then /^PAM: Customer Profile: Click  AppCap Overrides link$/ do
  log.info "PAM: Customer Profile: Click  AppCap Overrides link"
  raise "Illegal State Exception:  Customer Profile was not loaded before this step was called.  Check your test." if @customer_profile.nil?
  @appcapp_overrides = @customer_profile.header.appcapp_overrides
end

Then /^PAM: AppCap Overrides: Set Internet Postage Printing to Always On$/ do
  log.info "PAM: AppCap Overrides: Set Internet Postage Printing to Always On"
  @appcapp_overrides.internet_postage_printing.always_on
end

Then /^PAM: AppCap Overrides: Set Internet Postage Printing to Always Off$/ do
  log.info "PAM: AppCap Overrides: Set Internet Postage Printing to Always Off"
  @appcapp_overrides.internet_postage_printing.always_off
end

Then /^PAM: AppCap Overrides: Set Internet Postage Printing to No Override$/ do
  log.info "PAM: AppCap Overrides: Set Internet Postage Printing to No Override"
  @appcapp_overrides.internet_postage_printing.no_override
end

Then /^PAM: AppCap Overrides: Set Netstamps Printing to Always On$/ do
  log.info "PAM: AppCap Overrides: Set Netstamps Printing to Always On"
  @appcapp_overrides.netstamps_printing.always_on
end

Then /^PAM: AppCap Overrides: Set Netstamps Printing to Always Off$/ do
  log.info "PAM: AppCap Overrides: Set Netstamps Printing to Always Off"
  @appcapp_overrides.netstamps_printing.always_off
end

Then /^PAM: AppCap Overrides: Set Netstamps Printing to No Override$/ do
  log.info "PAM: AppCap Overrides: Set Netstamps Printing to No Override"
  @appcapp_overrides.netstamps_printing.no_override
end

Then /^PAM: AppCap Overrides: Set Shipping Label Printing to Always On$/ do
  log.info "PAM: AppCap Overrides: Set Shipping Label Printing to Always On"
  @appcapp_overrides.shipping_label_printing.always_on
end

Then /^PAM: AppCap Overrides: Set Shipping Label Printing to Always Off$/ do
  log.info "PAM: AppCap Overrides: Set Shipping Label Printing to Always Off"
  @appcapp_overrides.shipping_label_printing.always_off
end

Then /^PAM: AppCap Overrides: Set Shipping Label Printing to Override$/ do
  log.info "PAM: AppCap Overrides: Set Shipping Label Printing to Override"
  @appcapp_overrides.shipping_label_printing.no_override
end

Then /^PAM: AppCap Overrides: Set International Shipping to Always On$/ do
  log.info "PAM: AppCap Overrides: Set International Shipping to Always On"
  @appcapp_overrides.international_shipping.always_on
end

Then /^PAM: AppCap Overrides: Set International Shipping to Always Off$/ do
  log.info "PAM: AppCap Overrides: Set International Shipping to Always Off"
  @appcapp_overrides.international_shipping.always_off
end

Then /^PAM: AppCap Overrides: Set International Shipping to Override$/ do
  log.info "PAM: AppCap Overrides: Set International Shipping to Override"
  @appcapp_overrides.international_shipping.no_override
end

Then /^PAM: AppCap Overrides: Set Allow High Risk Countries to Always On$/ do
  log.info "PAM: AppCap Overrides: Set Allow High Risk Countries to Always On"
  @appcapp_overrides.allow_high_risk_countries.always_on
end

Then /^PAM: AppCap Overrides: Set Allow High Risk Countries to Always Off$/ do
  log.info "PAM: AppCap Overrides: Set Allow High Risk Countries to Always Off"
  @appcapp_overrides.allow_high_risk_countries.always_off
end

Then /^PAM: AppCap Overrides: Set Allow High Risk Countries to Override$/ do
  log.info "PAM: AppCap Overrides: Set Allow High Risk Countries to Override"
  @appcapp_overrides.allow_high_risk_countries.no_override
end

Then /^PAM: AppCap Overrides: Set Mailing Label Printing to Always On$/ do
  log.info "PAM: AppCap Overrides: Set Mailing Label Printing to Always On"
  @appcapp_overrides.mailing_label_printing.always_on
end

Then /^PAM: AppCap Overrides: Set Mailing Label Printing to Always Off$/ do
  log.info "PAM: AppCap Overrides: Set Mailing Label Printing to Always Off"
  @appcapp_overrides.mailing_label_printing.always_off
end

Then /^PAM: AppCap Overrides: Set Mailing Label Printing to Override$/ do
  log.info "PAM: AppCap Overrides: Set Mailing Label Printing to Override"
  @appcapp_overrides.mailing_label_printing.no_override
end

Then /^PAM: AppCap Overrides: Submit$/ do
  log.info "PAM: AppCap Overrides: Submit"
  @customer_profile = @appcapp_overrides.submit.ok
end

Then /^WebReg:  Send username to standard out$/ do
  log.info "NEW USER ID ######## #{@random_username} ########"
  log.info "NEW USER ID ######## #{@random_username} ########"
  log.info "NEW USER ID ######## #{@random_username} ########"
  log.info "NEW USER ID ######## #{@random_username} ########"
end




























