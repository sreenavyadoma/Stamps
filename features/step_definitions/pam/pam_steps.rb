Then /^PAM:  Load QA Payment Administration Manager Page$/ do
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
  @ach_credit.comments.set_until @random_username
  @customer_profile = @ach_credit.submit.yes.ok
end

Then /^$/ do

end