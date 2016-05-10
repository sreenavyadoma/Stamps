Then /^PayPal: Set PayPal Email Address to (.*)$/ do |email|
  log.info "PayPal: Set PayPal Email Address to #{email}"
  @store.email_address.set email
end

Then /^Paypal: Expect PayPal store modal is present$/ do
  log.info "Paypal: Expect PayPal store modal is present"
  expectation = "PayPal store modal is present"
  if @store.nil?
    expectation = "PayPal store modal is not present"
  else
    expectation = "PayPal store modal is not present" unless @store.present?
  end
  log.info "Test #{(expectation=="PayPal store modal is present")?"Passed":"Failed"}"
  expectation.should eql "PayPal store modal is present"
end

Then /^PayPal: Test Connection$/ do
  log.info "PayPal: Test Connection"
  @verification_required = @store.test_connection
end

Then /^PayPal: Expect Email Verification Required modal is present$/ do
  log.info "PayPal: Expect Email Verification Required modal is present"
  expectation = "Email Verification Required modal is present"
  if @verification_required.nil?
    expectation = "Email Verification Required modal is not present"
  else
    expectation = "Email Verification Required modal is not present" unless @verification_required.present?
  end
  log.info "Test #{(expectation=="Email Verification Required modal is not present")?"Passed":"Failed"}"
  expectation.should eql "Email Verification Required modal is present"
end

Then /^PayPal: Send Email Verification$/ do
  log.info "PayPal: Send Email Verification"
  @verification_sent = @verification_required.send_email_verification
end

Then /^PayPal: Expect Email Verification Sent modal is present$/ do
  log.info "PayPal: Expect Email Verification Sent modal is present"
  expectation = "Email Verification Sent modal is present"
  if @verification_sent.nil?
    expectation = "Email Verification Sent modal is not present"
  else
    expectation = "Email Verification Sent modal is not present" unless @verification_sent.present?
  end
  log.info "Test #{(expectation=="Email Verification Sent modal is present")?"Passed":"Failed"}"
  expectation.should eql "Email Verification Sent modal is present"
end

Then /^PayPal: Expect Verification Email is sent to (.*)$/ do |expectation|
  log.info "PayPal: Expect Verification Email is sent to #{expectation}"
  actual = @verification_sent.email
  @verification_sent.close
  log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end
