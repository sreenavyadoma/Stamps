Then /^PayPal: Set PayPal Email Address to (.*)$/ do |email|
  #test_config.logger.step "PayPal: Set PayPal Email Address to #{email}"
  @store.email_address.set email
end

Then /^PayPal: Expect PayPal store modal is present$/ do
  #test_config.logger.step "PayPal: Expect PayPal store modal is present"
  expectation = "PayPal store modal is present"
  if @store.nil?
    expectation = "PayPal store modal is not present"
  else
    expectation = "PayPal store modal is not present" unless @store.present?
  end
  #test_config.logger.step "Test #{(expectation=="PayPal store modal is present")?"Passed":"Failed"}"
  expect(expectation).to eql "PayPal store modal is present"
end

Then /^PayPal: Test Connection$/ do
  #test_config.logger.step "PayPal: Test Connection"
  @verification_required = @store.test_connection
end

Then /^PayPal Email Verification Required: Expect modal is present$/ do
  #test_config.logger.step "PayPal Email Verification Required: Expect modal is present"
  expectation = "Email Verification Required modal is present"
  if @verification_required.nil?
    expectation = "Email Verification Required modal is not present"
  else
    expectation = "Email Verification Required modal is not present" unless @verification_required.present?
  end
  #test_config.logger.step "Test #{(expectation=="Email Verification Required modal is not present")?"Passed":"Failed"}"
  expect(expectation).to eql "Email Verification Required modal is present"
end

Then /^PayPal Email Verification Required: Close modal$/ do
  #test_config.logger.step "PayPal Email Verification Required: Close modal"
  @verification_required.close
end

Then /^PayPal Email Verification Required: Send Email Verification$/ do
  #test_config.logger.step "PayPal Email Verification Required: Send Email Verification"
  @verification_sent = @verification_required.send_email_verification
end

Then /^PayPal: Expect Email Verification Sent modal is present$/ do
  #test_config.logger.step "PayPal: Expect Email Verification Sent modal is present"
  expectation = "Email Verification Sent modal is present"
  if @verification_sent.nil?
    expectation = "Email Verification Sent modal is not present"
  else
    expectation = "Email Verification Sent modal is not present" unless @verification_sent.present?
  end
  #test_config.logger.step "Test #{(expectation=="Email Verification Sent modal is present")?"Passed":"Failed"}"
  expect(expectation).to eql "Email Verification Sent modal is present"
end

Then /^PayPal: Expect Verification Email is sent to (.*)$/ do |expectation|
  #test_config.logger.step "PayPal: Expect Verification Email is sent to #{expectation}"
  actual = @verification_sent.email
  @verification_sent.close
  #test_config.logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  expect(actual).to eql expectation
end

Then /^PayPal: Close modal$/ do
  #test_config.logger.step "PayPal: Close modal"
  @store.close
end