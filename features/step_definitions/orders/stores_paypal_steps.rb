

Then /^[Ee]xpect [Pp]ay[Pp]al [Ss]tore modal present$/ do
  expect(stamps.orders.marketplace.paypal.present?).to be(true), "PayPal Store is not present"
end

Then /^[Ee]xpect [Pp]ay[Pp]al logo present$/ do
  expect(stamps.orders.marketplace.paypal.paypal_store_icon.present?).to be(true), "PayPal logo is not present"
end

Then /^[Ss]et [Pp]ay[Pp]al Email Address to (.*)$/ do |email|
  stamps.orders.marketplace.paypal.paypal_email_address.set(test_param[:paypal_email]=email)
end

Then /^[Cc]lick [Pp]ay[Pp]al [Vv]erify [Ee]mail [Bb]utton$/ do
  stamps.orders.marketplace.paypal.verify_email_button.click
end

Then /^PayPal Email Verification Required: Close modal$/ do
  #StampsTest.log.step "PayPal Email Verification Required: Close modal"
  stamps.orders.marketplace.paypal.email_verification_modal.close
end

Then /^PayPal Email Verification Required: Send Email Verification$/ do
  #StampsTest.log.step "PayPal Email Verification Required: Send Email Verification"
  @verification_sent=stamps.orders.marketplace.paypal.email_verification_modal.send_email_verification
end

Then /^PayPal: Expect Email Verification Sent modal is present$/ do
  #StampsTest.log.step "PayPal: Expect Email Verification Sent modal is present"
  expectation="Email Verification Sent modal is present"
  if @verification_sent.nil?
    expectation="Email Verification Sent modal is not present"
  else
    expectation="Email Verification Sent modal is not present" unless @verification_sent.present?
  end
  #StampsTest.log.step "Test #{(expectation=="Email Verification Sent modal is present")?"Passed":"Failed"}"
  expect(expectation).to eql "Email Verification Sent modal is present"
end

Then /^PayPal: Expect Verification Email is sent to (.*)$/ do |expectation|
  #StampsTest.log.step "PayPal: Expect Verification Email is sent to #{expectation}"
  actual=@verification_sent.email
  @verification_sent.close
  #StampsTest.log.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  expect(actual).to eql expectation
end

Then /^PayPal: Close modal$/ do
  #StampsTest.log.step "PayPal: Close modal"
  @store.close
end

Then /^[Ss]et [Pp]ay[Pp]al orders number option to use the PayPal transaction ID$/ do
  #The default selected radio button on this page is radio_transaction_id, and in its initial default state the class name for radio_transaction_id is different than when it is selected by the user , making the StampsRadio validation fail.
  #Therefore, radio_invoice_number needs to be selected first so that the when radio_transaction_id is selected, its class name can be used for validation.
  stamps.orders.marketplace.paypal.verify_email.radio_invoice_number.select
  stamps.orders.marketplace.paypal.verify_email.radio_transaction_id.select
end

Then /^[Ss]et [Pp]ay[Pp]al orders number option to use the invoice number$/ do
  stamps.orders.marketplace.paypal.verify_email.radio_invoice_number.select
end

Then /^[Ss]et [Pp]ay[Pp]al Email Address restriction to (.*)$/ do |email|
  stamps.orders.marketplace.paypal.verify_email.restrict_to_email_address.set email
  test_param[:paypal_email_restriction]=email
end

Then /^[Ss]et [Pp]ay[Pp]al import option to import all transactions$/ do
  #The default selected radio button on this page is radio_import_all_transactions, and in its initial default state the class name for radio_import_all_transactions is different than when it is selected by the user , making the StampsRadio validation fail.
  #Therefore, radio_import_selected_types needs to be selected first so that the when radio_import_all_transactions is selected, its class name can be used for validation.

  stamps.orders.marketplace.paypal.verify_email.radio_import_selected_types.select
  stamps.orders.marketplace.paypal.verify_email.radio_import_all_transactions.select
end

Then /^[Ss]et [Pp]ay[Pp]al import option to only import the following transaction types$/ do
  stamps.orders.marketplace.paypal.verify_email.radio_import_selected_types.select
end

Then /^[Cc]heck Cart as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_cart.check
end

Then /^[Cc]heck Web Accept as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_web_accept.check
end

Then /^[Cc]heck Express Checkout as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_express_checkout.check
end

Then /^[Cc]heck Send Money as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_send_money.check
end

Then /^[Cc]heck Virtual Terminal as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_virtual_terminal.check
end

Then /^[Cc]heck Subscription Payment as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_subscription_payment.check
end

Then /^[Cc]heck Merchant Payment as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_merchant_payment.check
end

Then /^[Cc]heck Mass Payment as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_mass_payment.check
end

Then /^[Cc]heck Integral Evolution as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_integral_evolution.check
end

Then /^[Cc]heck Website Payments Pro Hosted as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_hosted.check
end

Then /^[Cc]heck Website Payments Pro API as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_api.check
end

Then /^[Uu]ncheck Cart as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_cart.uncheck
end

Then /^[Uu]ncheck Web Accept as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_web_accept.uncheck
end

Then /^[Uu]ncheck Express Checkout as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_express_checkout.uncheck
end

Then /^[Uu]ncheck Send Money as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_send_money.uncheck
end

Then /^[Uu]ncheck Virtual Terminal as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_virtual_terminal.uncheck
end

Then /^[Uu]ncheck Subscription Payment as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_subscription_payment.uncheck
end

Then /^[Uu]ncheck Merchant Payment as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_merchant_payment.uncheck
end

Then /^[Uu]ncheck Mass Payment as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_mass_payment.uncheck
end

Then /^[Uu]ncheck Integral Evolution as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_integral_evolution.uncheck
end

Then /^[Uu]ncheck Website Payments Pro Hosted as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_hosted.uncheck
end

Then /^[Uu]ncheck Website Payments Pro API as a PayPal transaction type$/ do
  stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_api.uncheck
end

Then /^[Ee]xpect Cart is checked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_cart.checked?).to be(true), "Cart is NOT checked"
end

Then /^[Ee]xpect Web Accept is checked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_web_accept.checked?).to be(true), "Web Accept is NOT checked"
end

Then /^[Ee]xpect Express Checkout is checked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_express_checkout.checked?).to be(true), "Express Checkout is NOT checked"
end

Then /^[Ee]xpect Send Money is checked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_send_money.checked?).to be(true), "Send Money is NOT checked"
end

Then /^[Ee]xpect Virtual Terminal is checked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_virtual_terminal.checked?).to be(true), "Virtual Terminal is NOT checked"
end

Then /^[Ee]xpect Subscription Payment is checked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_subscription_payment.checked?).to be(true), "Subscription Payment is NOT checked"
end

Then /^[Ee]xpect Merchant Payment is checked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_merchant_payment.checked?).to be(true), "Merchant Payment is NOT checked"
end

Then /^[Ee]xpect Mass Payment is checked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_mass_payment.checked?).to be(true), "Mass Payment is NOT checked"
end

Then /^[Ee]xpect Integral Evolution is checked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_integral_evolution.checked?).to be(true), "Integral Evolution is NOT checked"
end

Then /^[Ee]xpect Website Payments Pro Hosted is checked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_hosted.checked?).to be(true), "Website Payments Pro Hosted is NOT checked"
end

Then /^[Ee]xpect Website Payments Pro API is checked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_api.checked?).to be(true), "Website Payments Pro API is NOT checked"
end

Then /^[Ee]xpect Cart is unchecked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_cart.checked?).not_to be(true), "Cart is NOT unchecked"
end

Then /^[Ee]xpect Web Accept is unchecked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_web_accept.checked?).not_to be(true), "Web Accept is NOT unchecked"
end

Then /^[Ee]xpect Express Checkout is unchecked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_express_checkout.checked?).not_to be(true), "Express Checkout is NOT unchecked"
end

Then /^[Ee]xpect Send Money is unchecked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_send_money.checked?).not_to be(true), "Send Money is NOT unchecked"
end

Then /^[Ee]xpect Virtual Terminal is unchecked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_virtual_terminal.checked?).not_to be(true), "Virtual Terminal is NOT unchecked"
end

Then /^[Ee]xpect Subscription Payment is unchecked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_subscription_payment.checked?).not_to be(true), "Subscription Payment is NOT unchecked"
end

Then /^[Ee]xpect Merchant Payment is unchecked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_merchant_payment.checked?).not_to be(true), "Merchant Payment is NOT unchecked"
end

Then /^[Ee]xpect Mass Payment is unchecked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_mass_payment.checked?).not_to be(true), "Mass Payment is NOT unchecked"
end

Then /^[Ee]xpect Integral Evolution is unchecked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_integral_evolution.checked?).not_to be(true), "Integral Evolution is NOT unchecked"
end

Then /^[Ee]xpect Website Payments Pro Hosted is unchecked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_hosted.checked?).not_to be(true), "Website Payments Pro Hosted is NOT unchecked"
end

Then /^[Ee]xpect Website Payments Pro API is unchecked as a PayPal transaction type$/ do
  expect(stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_api.checked?).not_to be(true), "Website Payments Pro API is NOT unchecked"
end


Then /^Connect to PayPal Store$/ do
  @store_settings = stamps.orders.marketplace.paypal.verify_email.connect
end