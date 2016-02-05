Then /^PAM:  Load QA Payment Administration Manager Page$/ do
  pam.visit :qa
end

Then /^PAM: Load Customer Search Page$/ do
  log.info "PAM: Load Customer Search Page"
  step "PAM:  Load QA Payment Administration Manager Page" if @customer_search.nil?
  @customer_search = pam.customer_search
end

Then /^PAM: Customer Search: Set username to (.*)$/ do |username|
  log.info "PAM: Customer Search: Set username to #{username}"
  step "PAM: Load Customer Search Page" if @customer_search.nil?
  @customer_search.username.set_until username
end

Then /^PAM: Customer Search: Click Search button$/ do
  log.info "PAM: Customer Search: Click Search button"
  step "PAM: Load Customer Search Page" if @customer_search.nil?
  @customer_profile = @customer_search.search
end

Then /^PAM: Customer Profile: Click Change Meter Limit link$/ do
  raise "Illegal State Exception:  Customer Profile was not loaded before this step was called.  Check your test." if @customer_profile.nil?
  @change_meter_limit = @customer_profile.header.change_meter_limit
end

Then /^PAM: Change Meter Limit: Set New Meter Limit to \$(\d+)$/ do |new_limit|
  @change_meter_limit.new_meter_limit.set_until new_limit
end

Then /^PAM: Change Meter Limit: Set USPS approval to Checked$/ do
  @change_meter_limit.usps_approval.check
end

Then /^PAM: Change Meter Limit: Set USPS approval to Unchecked$/ do
  @change_meter_limit.usps_approval.uncheck
end

Then /^PAM: Change Meter Limit: Click Submit$/ do
  @customer_profile = @change_meter_limit.submit.ok
end

Then /^PAM: Customer Profile: Click ACH Credit link$/ do
  raise "Illegal State Exception:  Customer Profile was not loaded before this step was called.  Check your test." if @customer_profile.nil?
  @ach_credit = @customer_profile.header.ach_credit
end

Then /^PAM: ACH Purchase: Set Amount to \$(\d+)\.(\d+) and Comments to (.*)$/ do |dollars, cents, comments|
  @ach_credit.dollar_amount.set_until dollars
  @ach_credit.cents_amount.set_until cents
  @ach_credit.comments.set_until comments
  @customer_profile = @ach_credit.submit.yes.ok
end

Then /^$/ do

end