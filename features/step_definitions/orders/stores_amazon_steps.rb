Then /^Amazon Store: Set Amazon Seller ID to (.*)$/ do |seller_id|
  #StampsTest.log.step "Amazon Store: Set Amazon Seller ID to #{seller_id}"
  @store.seller_id.set seller_id
end

Then /^Amazon Store: Set Amazon MWS Auth Token to (.*)$/ do |auth_token|
  #StampsTest.log.step "Amazon Store: Set Amazon MWS Auth Token to  #{auth_token}"
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
  #StampsTest.log.step "Amazon Store: Connect for the first time expecting Amazon Settings modal"
  @store_settings=@store.connect_expecting_store_settings
  test_result="Amazon Store Settings modal is #{(@store_settings.present?)?"present":"not present"} - Test #{(@store_settings.present?)?"passed":"failed"}"
  StampsTest.log.step test_result
  if @store_settings.nil?||!(@store_settings.present?)
    raise test_result
  end
end

Then /^Amazon Store: Connect$/ do
  #StampsTest.log.step "Amazon Store: Connect"
  @store.connect
end