Then /^PayPal: Set PayPal Email Address to (.*)$/ do |email|
  logger.info "PayPal: Set PayPal Email Address to #{email}"
  @store.email_address.set email
end

Then /^PayPal: Expect PayPal store modal is present$/ do
  logger.info "PayPal: Expect PayPal store modal is present"
  expectation = "PayPal store modal is present"
  if @store.nil?
    expectation = "PayPal store modal is not present"
  else
    expectation = "PayPal store modal is not present" unless @store.present?
  end
  logger.info "Test #{(expectation=="PayPal store modal is present")?"Passed":"Failed"}"
  expectation.should eql "PayPal store modal is present"
end

Then /^PayPal: Test Connection$/ do
  logger.info "PayPal: Test Connection"
  @verification_required = @store.test_connection
end

Then /^PayPal Email Verification Required: Expect modal is present$/ do
  logger.info "PayPal Email Verification Required: Expect modal is present"
  expectation = "Email Verification Required modal is present"
  if @verification_required.nil?
    expectation = "Email Verification Required modal is not present"
  else
    expectation = "Email Verification Required modal is not present" unless @verification_required.present?
  end
  logger.info "Test #{(expectation=="Email Verification Required modal is not present")?"Passed":"Failed"}"
  expectation.should eql "Email Verification Required modal is present"
end

Then /^PayPal Email Verification Required: Close modal$/ do
  logger.info "PayPal Email Verification Required: Close modal"
  @verification_required.close
end

Then /^PayPal Email Verification Required: Send Email Verification$/ do
  logger.info "PayPal Email Verification Required: Send Email Verification"
  @verification_sent = @verification_required.send_email_verification
end

Then /^PayPal: Expect Email Verification Sent modal is present$/ do
  logger.info "PayPal: Expect Email Verification Sent modal is present"
  expectation = "Email Verification Sent modal is present"
  if @verification_sent.nil?
    expectation = "Email Verification Sent modal is not present"
  else
    expectation = "Email Verification Sent modal is not present" unless @verification_sent.present?
  end
  logger.info "Test #{(expectation=="Email Verification Sent modal is present")?"Passed":"Failed"}"
  expectation.should eql "Email Verification Sent modal is present"
end

Then /^PayPal: Expect Verification Email is sent to (.*)$/ do |expectation|
  logger.info "PayPal: Expect Verification Email is sent to #{expectation}"
  actual = @verification_sent.email
  @verification_sent.close
  logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^PayPal: Close modal$/ do
  logger.info "PayPal: Close modal"
  @store.close
end