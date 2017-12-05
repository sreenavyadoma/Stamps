Then /^[Ss]et PayPal Email Address to (.*)$/ do |email|
  stamps.orders.market_place.paypal_store.email_address.set(test_param[:paypal_email]=email)
end

Then /^[Cc]lick [Pp]aypal [Vv]erify [Ee]mail [Bb]utton$/ do
  stamps.orders.market_place.paypal_store.verify_email
end

Then /^PayPal Email Verification Required: Close modal$/ do
  #test_config.logger.step "PayPal Email Verification Required: Close modal"
  stamps.orders.market_place.paypal_store.email_verification_modal.close
end

Then /^PayPal Email Verification Required: Send Email Verification$/ do
  #test_config.logger.step "PayPal Email Verification Required: Send Email Verification"
  @verification_sent=stamps.orders.market_place.paypal_store.email_verification_modal.send_email_verification
end

Then /^PayPal: Expect Email Verification Sent modal is present$/ do
  #test_config.logger.step "PayPal: Expect Email Verification Sent modal is present"
  expectation="Email Verification Sent modal is present"
  if @verification_sent.nil?
    expectation="Email Verification Sent modal is not present"
  else
    expectation="Email Verification Sent modal is not present" unless @verification_sent.present?
  end
  #test_config.logger.step "Test #{(expectation=="Email Verification Sent modal is present")?"Passed":"Failed"}"
  expect(expectation).to eql "Email Verification Sent modal is present"
end

Then /^PayPal: Expect Verification Email is sent to (.*)$/ do |expectation|
  #test_config.logger.step "PayPal: Expect Verification Email is sent to #{expectation}"
  actual=@verification_sent.email
  @verification_sent.close
  #test_config.logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  expect(actual).to eql expectation
end

Then /^PayPal: Close modal$/ do
  #test_config.logger.step "PayPal: Close modal"
  @store.close
end

Then /^[Ss]et Paypal orders number option to use the Paypal transaction ID$/ do
  stamps.orders.market_place.paypal_store.verify_email.radio_transaction_id
end

Then /^[Ss]et Paypal orders number option to use the invoice number$/ do
  stamps.orders.market_place.paypal_store.verify_email.radio_invoice_number
end

Then /^[Ss]et PayPal Email Address restriction to (.*)$/ do |email|
  test_param[:paypal_email_restriction]=email
  stamps.orders.market_place.paypal_store.verify_email.restrict_to_email_address.set email
end

Then /^[Ss]et Paypal import option to import all transactions$/ do
  stamps.orders.market_place.paypal_store.verify_email.radio_import_all_transactions
end

Then /^[Ss]et Paypal import option to only import the following transaction types$/ do
  stamps.orders.market_place.paypal_store.verify_email.radio_import_selected_types
end

Then /^[Cc]heck Cart as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_cart.check
end

Then /^[Cc]heck Web Accept as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_web_accept.check
end

Then /^[Cc]heck Express Checkout as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_express_checkout.check
end

Then /^[Cc]heck Send Money as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_send_money.check
end

Then /^[Cc]heck Virtual Terminal as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_virtual_terminal.check
end

Then /^[Cc]heck Subscription Payment as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_subscription_payment.check
end

Then /^[Cc]heck Merchant Payment as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_merchant_payment.check
end

Then /^[Cc]heck Mass Payment as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_mass_payment.check
end

Then /^[Cc]heck Integral Evolution as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_integral_evolution.check
end

Then /^[Cc]heck Website Payments Pro Hosted as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_website_payments_pro_hosted.check
end

Then /^[Cc]heck Website Payments Pro API as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_website_payments_pro_api.check
end

Then /^[Uu]ncheck Cart as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_cart.uncheck
end

Then /^[Uu]ncheck Web Accept as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_web_accept.uncheck
end

Then /^[Uu]ncheck Express Checkout as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_express_checkout.uncheck
end

Then /^[Uu]ncheck Send Money as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_send_money.uncheck
end

Then /^[Uu]ncheck Virtual Terminal as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_virtual_terminal.uncheck
end

Then /^[Uu]ncheck Subscription Payment as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_subscription_payment.uncheck
end

Then /^[Uu]ncheck Merchant Payment as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_merchant_payment.uncheck
end

Then /^[Uu]ncheck Mass Payment as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_mass_payment.uncheck
end

Then /^[Uu]ncheck Integral Evolution as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_integral_evolution.uncheck
end

Then /^[Uu]ncheck Website Payments Pro Hosted as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_website_payments_pro_hosted.uncheck
end

Then /^[Uu]ncheck Website Payments Pro API as a Paypal transaction type$/ do
  stamps.orders.market_place.paypal_store.verify_email.type_website_payments_pro_api.uncheck
end

Then /^Connect to Paypal Store$/ do
  stamps.orders.market_place.paypal_store.verify_email.connect
end