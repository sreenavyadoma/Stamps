Then /^3DCart Store: Set API User Key to (.*)$/ do |api_user_key|
  #StampsTest.log.step "3DCart Store: Set API User Key to #{api_user_key}"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.api_user_key.set api_user_key
end

Then /^3DCart Store: Set URL to your store to (.*)$/ do |store_url|
  #StampsTest.log.step "3DCart Store: Set URL to your store to #{store_url}"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.store_url.set store_url
end

Then /^3DCart Store: Set Product Weight Units to (.*)$/ do |weight_unit|
  #StampsTest.log.step "3DCart Store: Set Product Weight Units to #{weight_unit}"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.weight_unit.select weight_unit
end

Then /^3DCart Store: Connect$/ do
  #StampsTest.log.step "3DCart Store: Connect"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings=@store.connect
end

Then /^3DCart Store: Reconnect$/ do
  #StampsTest.log.step "3DCart Store: Connect"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings=@store.reconnect
end

Then /^Amazon Store: Set Amazon Seller ID to (.*)$/ do |seller_id|
  #SdcLog.step "Amazon Store: Set Amazon Seller ID to #{seller_id}"
  @store.seller_id.set seller_id
end

Then /^Amazon Store: Set Amazon MWS Auth Token to (.*)$/ do |auth_token|
  #SdcLog.step "Amazon Store: Set Amazon MWS Auth Token to  #{auth_token}"
  @store.auth_token.set auth_token
end

Then /^Amazon Store: Click Verify Seller ID [Bb]utton$/ do
  #StampsTest.log.step "Amazon Store: Click Verify Seller ID button"
  @store.verify_seller_id
end

Then /^Amazon Store: Set Order Source to Amazon.com$/ do
  #StampsTest.log.step "Amazon Store: Set Order Source to Amazon.com"
  @store.order_source.amazon
end

Then /^Amazon Store: Set Order Source to Non-Amazon$/ do
  #StampsTest.log.step "Amazon Store: Set Order Source to Non-Amazon"
  @store.order_source.non_amazon
end

Then /^Amazon Store: Set Product Identifier to Use SKU$/ do
  #StampsTest.log.step "Amazon Store: Set Product Identifier to User SKU"
  @store.product_identifier.use_sku
end

Then /^Amazon Store: Set Product Identifier to Use the ASIN$/ do
  #StampsTest.log.step "Amazon Store: Set Product Identifier to Use the ASIN"
  @store.product_identifier.use_asin
end

Then /^Amazon Store: Connect for the first time expecting Amazon Settings modal$/ do
  #SdcLog.step "Amazon Store: Connect for the first time expecting Amazon Settings modal"
  @store_settings=@store.connect_expecting_store_settings
  test_result="Amazon Store Settings modal is #{(@store_settings.present?)?"present":"not present"} - Test #{(@store_settings.present?)?"passed":"failed"}"
  SdcLogger.debug test_result
  if @store_settings.nil?||!(@store_settings.present?)
    raise test_result
  end
end

Then /^Amazon Store: Connect$/ do
  #StampsTest.log.step "Amazon Store: Connect"
  @store.connect
end

Then /^Big Commerce: Expect Login to your Bigcommerce admin link is present$/ do
  expectation="External Bigcommerce link is present"
  expectation="External Bigcommerce link is not present" unless @store.external_link.present?
  expect(expectation).to eql "External Bigcommerce link is present"
end


Then /^Etsy Store: Set Etsy Username to (.*)$/ do |etsy_username|
  #StampsTest.log.step "Etsy Store: Set Etsy Username to #{etsy_username}"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.etsy_username.set etsy_username
  @store.etsy_username.set etsy_username
  @store.etsy_username.set etsy_username
end

Then /^Etsy Store: Find My Shops$/ do
  #StampsTest.log.step "Etsy Store: Find My Shops"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.find_my_shops
end

Then /^Etsy Store: Set Available Shops$/ do
  #StampsTest.log.step "Etsy Store: Find My Shops"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.available_shops
end

Then /^Etsy Store: Connect then sign in with Etsy credentials (.*)\/(.*)$/ do |username, password|
  #StampsTest.log.step "Etsy Store: Connect"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings=@store.connect username, password
  SdcLogger.debug @store_settings.nil?
end

Then /^Etsy Store: Reconnect then sign in with Etsy credentials (.*)\/(.*)$/ do |username, password|
  #StampsTest.log.step "Etsy Store: Connect"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings=@store.reconnect username, password
  SdcLogger.debug @store_settings.nil?
end


Then /^[Ee]xpect [Pp]ay[Pp]al [Ss]tore modal present$/ do
  pending
  #  expect(stamps.orders.marketplace.paypal.present?).to be(true), "PayPal Store is not present"
end

Then /^[Ee]xpect [Pp]ay[Pp]al logo present$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.paypal_store_icon.present?).to be(true), "PayPal logo is not present"
end

Then /^[Ss]et [Pp]ay[Pp]al Email Address to (.*)$/ do |email|
  pending
  #  stamps.orders.marketplace.paypal.paypal_email_address.set(TestData.hash[:paypal_email] = email)
end

Then /^[Cc]lick [Pp]ay[Pp]al [Vv]erify [Ee]mail [Bb]utton$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email_button.click
end

Then /^PayPal Email Verification Required: Close modal$/ do
  #StampsTest.log.step "PayPal Email Verification Required: Close modal"
  pending
  #  stamps.orders.marketplace.paypal.email_verification_modal.close
end

Then /^PayPal Email Verification Required: Send Email Verification$/ do
  #SdcLog.step "PayPal Email Verification Required: Send Email Verification"
  pending
  #  @verification_sent = stamps.orders.marketplace.paypal.email_verification_modal.send_email_verification
end

Then /^PayPal: Expect Email Verification Sent modal is present$/ do
  #SdcLog.step "PayPal: Expect Email Verification Sent modal is present"
  pending
  # expectation = "Email Verification Sent modal is present"
  # if @verification_sent.nil?
  #   expectation = "Email Verification Sent modal is not present"
  # else
  #   expectation = "Email Verification Sent modal is not present" unless @verification_sent.present?
  # end
  # #SdcLog.step "Test #{(expectation=="Email Verification Sent modal is present")?"Passed":"Failed"}"
  # expect(expectation).to eql "Email Verification Sent modal is present"
end

Then /^PayPal: Expect Verification Email is sent to (.*)$/ do |expectation|
  #SdcLog.step "PayPal: Expect Verification Email is sent to #{expectation}"
  pending
  # actual = @verification_sent.email
  # @verification_sent.close
  # #SdcLog.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  # expect(actual).to eql expectation
end

Then /^PayPal: Close modal$/ do
  #StampsTest.log.step "PayPal: Close modal"
  pending
  # @store.close
end

Then /^[Ss]et [Pp]ay[Pp]al orders number option to use the PayPal transaction ID$/ do
  #The default selected radio button on this page is radio_transaction_id, and in its initial default state the class name for radio_transaction_id is different than when it is selected by the user , making the StampsRadio validation fail.
  #Therefore, radio_invoice_number needs to be selected first so that the when radio_transaction_id is selected, its class name can be used for validation.
  pending
  #  stamps.orders.marketplace.paypal.verify_email.radio_invoice_number.select
  # stamps.orders.marketplace.paypal.verify_email.radio_transaction_id.select
end

Then /^[Ss]et [Pp]ay[Pp]al orders number option to use the invoice number$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.radio_invoice_number.select
end

Then /^[Ss]et [Pp]ay[Pp]al Email Address restriction to (.*)$/ do |email|
  pending
  #  stamps.orders.marketplace.paypal.verify_email.restrict_to_email_address.set email
  # TestData.hash[:paypal_email_restriction] = email
end

Then /^[Ss]et [Pp]ay[Pp]al import option to import all transactions$/ do
  #The default selected radio button on this page is radio_import_all_transactions, and in its initial default state the class name for radio_import_all_transactions is different than when it is selected by the user , making the StampsRadio validation fail.
  #Therefore, radio_import_selected_types needs to be selected first so that the when radio_import_all_transactions is selected, its class name can be used for validation.

  pending
  # stamps.orders.marketplace.paypal.verify_email.radio_import_selected_types.select
  # stamps.orders.marketplace.paypal.verify_email.radio_import_all_transactions.select
end

Then /^[Ss]et [Pp]ay[Pp]al import option to only import the following transaction types$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.radio_import_selected_types.select
end

Then /^[Cc]heck Cart as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_cart.check
end

Then /^[Cc]heck Web Accept as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_web_accept.check
end

Then /^[Cc]heck Express Checkout as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_express_checkout.check
end

Then /^[Cc]heck Send Money as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_send_money.check
end

Then /^[Cc]heck Virtual Terminal as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_virtual_terminal.check
end

Then /^[Cc]heck Subscription Payment as a PayPal transaction type$/ do
  pending
  #  stamps.orders.marketplace.paypal.verify_email.type_subscription_payment.check
end

Then /^[Cc]heck Merchant Payment as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_merchant_payment.check
end

Then /^[Cc]heck Mass Payment as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_mass_payment.check
end

Then /^[Cc]heck Integral Evolution as a PayPal transaction type$/ do
  pending
  #  stamps.orders.marketplace.paypal.verify_email.type_integral_evolution.check
end

Then /^[Cc]heck Website Payments Pro Hosted as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_hosted.check
end

Then /^[Cc]heck Website Payments Pro API as a PayPal transaction type$/ do
  pending
  #  stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_api.check
end

Then /^[Uu]ncheck Cart as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_cart.uncheck
end

Then /^[Uu]ncheck Web Accept as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_web_accept.uncheck
end

Then /^[Uu]ncheck Express Checkout as a PayPal transaction type$/ do
  pending
  #  stamps.orders.marketplace.paypal.verify_email.type_express_checkout.uncheck
end

Then /^[Uu]ncheck Send Money as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_send_money.uncheck
end

Then /^[Uu]ncheck Virtual Terminal as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_virtual_terminal.uncheck
end

Then /^[Uu]ncheck Subscription Payment as a PayPal transaction type$/ do
  pending
  #  stamps.orders.marketplace.paypal.verify_email.type_subscription_payment.uncheck
end

Then /^[Uu]ncheck Merchant Payment as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_merchant_payment.uncheck
end

Then /^[Uu]ncheck Mass Payment as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_mass_payment.uncheck
end

Then /^[Uu]ncheck Integral Evolution as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_integral_evolution.uncheck
end

Then /^[Uu]ncheck Website Payments Pro Hosted as a PayPal transaction type$/ do
  pending
  #  stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_hosted.uncheck
end

Then /^[Uu]ncheck Website Payments Pro API as a PayPal transaction type$/ do
  pending
  # stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_api.uncheck
end

Then /^[Ee]xpect Cart is checked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_cart.checked?).to be(true), "Cart is NOT checked"
end

Then /^[Ee]xpect Web Accept is checked as a PayPal transaction type$/ do
  pending
  #  expect(stamps.orders.marketplace.paypal.verify_email.type_web_accept.checked?).to be(true), "Web Accept is NOT checked"
end

Then /^[Ee]xpect Express Checkout is checked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_express_checkout.checked?).to be(true), "Express Checkout is NOT checked"
end

Then /^[Ee]xpect Send Money is checked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_send_money.checked?).to be(true), "Send Money is NOT checked"
end

Then /^[Ee]xpect Virtual Terminal is checked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_virtual_terminal.checked?).to be(true), "Virtual Terminal is NOT checked"
end

Then /^[Ee]xpect Subscription Payment is checked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_subscription_payment.checked?).to be(true), "Subscription Payment is NOT checked"
end

Then /^[Ee]xpect Merchant Payment is checked as a PayPal transaction type$/ do
  pending
  #  expect(stamps.orders.marketplace.paypal.verify_email.type_merchant_payment.checked?).to be(true), "Merchant Payment is NOT checked"
end

Then /^[Ee]xpect Mass Payment is checked as a PayPal transaction type$/ do
  pending
  #  expect(stamps.orders.marketplace.paypal.verify_email.type_mass_payment.checked?).to be(true), "Mass Payment is NOT checked"
end

Then /^[Ee]xpect Integral Evolution is checked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_integral_evolution.checked?).to be(true), "Integral Evolution is NOT checked"
end

Then /^[Ee]xpect Website Payments Pro Hosted is checked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_hosted.checked?).to be(true), "Website Payments Pro Hosted is NOT checked"
end

Then /^[Ee]xpect Website Payments Pro API is checked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_api.checked?).to be(true), "Website Payments Pro API is NOT checked"
end

Then /^[Ee]xpect Cart is unchecked as a PayPal transaction type$/ do
  pending
  #expect(stamps.orders.marketplace.paypal.verify_email.type_cart.checked?).not_to be(true), "Cart is NOT unchecked"
end

Then /^[Ee]xpect Web Accept is unchecked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_web_accept.checked?).not_to be(true), "Web Accept is NOT unchecked"
end

Then /^[Ee]xpect Express Checkout is unchecked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_express_checkout.checked?).not_to be(true), "Express Checkout is NOT unchecked"
end

Then /^[Ee]xpect Send Money is unchecked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_send_money.checked?).not_to be(true), "Send Money is NOT unchecked"
end

Then /^[Ee]xpect Virtual Terminal is unchecked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_virtual_terminal.checked?).not_to be(true), "Virtual Terminal is NOT unchecked"
end

Then /^[Ee]xpect Subscription Payment is unchecked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_subscription_payment.checked?).not_to be(true), "Subscription Payment is NOT unchecked"
end

Then /^[Ee]xpect Merchant Payment is unchecked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_merchant_payment.checked?).not_to be(true), "Merchant Payment is NOT unchecked"
end

Then /^[Ee]xpect Mass Payment is unchecked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_mass_payment.checked?).not_to be(true), "Mass Payment is NOT unchecked"
end

Then /^[Ee]xpect Integral Evolution is unchecked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_integral_evolution.checked?).not_to be(true), "Integral Evolution is NOT unchecked"
end

Then /^[Ee]xpect Website Payments Pro Hosted is unchecked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_hosted.checked?).not_to be(true), "Website Payments Pro Hosted is NOT unchecked"
end

Then /^[Ee]xpect Website Payments Pro API is unchecked as a PayPal transaction type$/ do
  pending
  # expect(stamps.orders.marketplace.paypal.verify_email.type_website_payments_pro_api.checked?).not_to be(true), "Website Payments Pro API is NOT unchecked"
end

Then /^Connect to PayPal Store$/ do
  pending
  # @store_settings = stamps.orders.marketplace.paypal.verify_email.connect
end
Then /^Rakuten Store: Set Rakuten Seller ID (.*)$/ do |seller_id|
  #StampsTest.log.step "Rakuten Store: Set Rakuten Seller ID #{seller_id}"
  raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.seller_id.set seller_id
end

Then /^Rakuten Store: Set FTP Username (.*)$/ do |seller_id|
  #StampsTest.log.step "Rakuten Store: Set FTP Username #{seller_id}"

  pending
  #raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.ftp_username.set seller_id
end

Then /^Rakuten Store: Set FTP Password (.*)$/ do |seller_id|
  #StampsTest.log.step "Rakuten Store: Set FTP Password #{seller_id}"

  pending
  #raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.ftp_password.set seller_id
end

Then /^Rakuten Store: Set Map Rakuten SKU as your Product SKU to checked$/ do
  #StampsTest.log.step "Rakuten Store: Set Map Rakuten SKU as your Product SKU to checked"

  pending
  #raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @store.nil?
  #@store.map_rakuten_sku.check
end

Then /^Rakuten Store: Set Map Rakuten SKU as your Product SKU to unchecked$/ do
  #StampsTest.log.step "Rakuten Store: Set Map Rakuten SKU as your Product SKU to unchecked"

  pending
  #raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @store.nil?
  # @store.map_rakuten_sku.uncheck
end

Then /^Rakuten Store: Connect$/ do
  #StampsTest.log.step "Rakuten Store: Connect"
  raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @store.nil?
  # @store_settings=@store.connect
end

Then /^Shopify Store: Set Shopify Domain to (.*)$/ do |url|
  #StampsTest.log.step "Shopify Store: Set Shopify Domain to #{url}"

  pending
  #raise "Shopify Store modal is not visible or present.  Check your test workflow" if @store.nil?
  # @store.shopify_domain.set url
end

Then /^Shopify Store: Connect using Email (.*) and password (.*)$/ do |username, password|
  #StampsTest.log.step "Shopify Store: Connect using Email #{username} and password #{password}"
  raise "Shopify Store modal is not visible or present.  Check your test workflow" if @store.nil?
  # @shopify_result = @store.connect

  # case @shopify_result
  # when Orders::Stores::ShopifySettings
  #   @store_settings = @shopify_result
  # when Orders::Stores::ShopifyPage
  #   @shopify_page = @shopify_result
  #   @shopify_page.username.set username
  #   @shopify_page.password.set password
  #   @store_settings = @shopify_page.landing_page
  # else
  #   raise "Unable to connect Shopify Store, something went wrong.  Check your test."
  # end
end

Then /^Shopify Store: Reconnect$/ do
  #StampsTest.log.step "Shopify Store: Reconnect"
  raise "Shopify Store modal is not visible or present.  Check your test workflow" if @store.nil?
  # @store_settings = @store.reconnect
end

Then /^Volusion Store: Set Volusion API URL$/ do
  # @store.api_url ENV['VOLUSION_API_URL']
end

Then /^Volusion Store: Set Volusion API to (.*)$/ do |url|
  # @store.api_url url
end

Then /^Volusion Store: Connect$/ do

  pending
  ## @store_settings=@store.connect
end

Then /^Volusion Store: Reconnect$/ do

  pending
  # # @manage_stores=@store.reconnect
  # expect(@manage_stores.nil?).not_to be_nil
end

Then /^[Ee]xpect [Ss]quare [Ss]tore modal present$/ do

  pending
  # # expect(stamps.orders.marketplace.square.present?).to be(true), "Sqaure Store is not present"
end

Then /^[Ee]xpect [Ss]quare logo present$/ do

  pending
  # # expect(stamps.orders.marketplace.square.store_icon.present?).to be(true), "Sqaure logo is not present"
end

Then /^[Ee]xpect [Ss]quare [Aa]uthorize [Bb]utton present$/ do
  # expect(stamps.orders.marketplace.square.authorize_btn.present?).to be(true), "Sqaure Authorize Button is not present"
end

Then /^[Cc]lick [Ss]quare [Aa]uthorize [Bb]utton$/ do

  pending
  # # stamps.orders.marketplace.square.authorize_btn.click
end

Then /^Yahoo Store: Set Yahoo Store ID to (.*)$/ do |store_id|

  pending
  # #SdcLog.step "Yahoo Store: Set Yahoo Store ID to #{store_id}"
  # @store.store_id.set store_id
end

Then /^Yahoo Store: Set Partner Store Contract Token to (.*)$/ do |token|

  pending
  #  #SdcLog.step "Yahoo Store: Set Partner Store Contract Token to #{token}"
  # @store.contact_token.set token
end

Then /^Yahoo Store: Set First Order ID to Import to (.*)$/ do |order_id|

  pending
  ##SdcLog.step "Yahoo Store: Set First Order ID to Import to #{order_id}"
  # @store.first_order_id_to_import.set order_id
end

Then /^Yahoo Store: Connect$/ do

  pending
  # #SdcLog.step "Yahoo Store: Connect"
  # @store_settings=@store.connect
  # SdcLogger.debug @store_settings.present?
end

Then /^Yahoo Store: Reconnect$/ do

  pending
  ##SdcLog.step "Yahoo Store: Reconnect"
  # @store_settings=@store.reconnect
  # SdcLogger.debug @store_settings.present?
end

Then /^Yahoo Store: Set Order Source to Non-Yahoo$/ do

  pending
  ##StampsTest.log.step "Yahoo Store: Set Order Source to Non-Yahoo"
  # @store.order_source.non_amazon
end

Then /^Yahoo Store: Set Product Identifier to Use SKU$/ do

  pending
  ##StampsTest.log.step "Yahoo Store: Set Product Identifier to User SKU"
  # @store.product_identifier.use_sku
end

Then /^Yahoo Store: Set Product Identifier to Use the ASIN$/ do

  pending
  ##StampsTest.log.step "Yahoo Store: Set Product Identifier to Use the ASIN"
  # @store.product_identifier.use_asin
end

Then /^Yahoo Store: Connect for the first time expecting Yahoo Settings modal$/ do

  pending
  #  #SdcLog.step "Yahoo Store: Connect for the first time expecting Yahoo Settings modal"
  # @store_settings=@store.connect_expecting_store_settings
  # test_result="Yahoo Store Settings modal is #{(@store_settings.present?)?"present":"not present"} - Test #{(@store_settings.present?)?"passed":"failed"}"
  # SdcLogger.debug test_result
  # if @store_settings.nil?||!(@store_settings.present?)
  #   raise test_result
  # end
end
























