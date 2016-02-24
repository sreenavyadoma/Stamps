Then /^Amazon Store: Set Amazon Seller ID to (.*)$/ do |seller_id|
  step "Marketplace: Select amazon.com" if @amazon_store.nil?
  log.info "Amazon Store: Set Amazon Seller ID to #{seller_id}"
  @amazon_store.seller_id.set seller_id
end

Then /^Amazon Store: Set Amazon MWS Auth Token to (.*)$/ do |auth_token|
  step "Marketplace: Select amazon.com" if @amazon_store.nil?
  log.info "Amazon Store: Set Amazon MWS Auth Token to  #{auth_token}"
  @amazon_store.auth_token.set auth_token
end

Then /^Amazon Store: Click Verify Seller ID button$/ do
  step "Marketplace: Select amazon.com" if @amazon_store.nil?
  log.info "Amazon Store: Click Verify Seller ID button"
  @amazon_store.verify_seller_id
end

Then /^Amazon Store: Set Order Source to Amazon.com$/ do
  step "Marketplace: Select amazon.com" if @amazon_store.nil?
  log.info "Amazon Store: Set Order Source to Amazon.com"
  @amazon_store.order_source.amazon
end

Then /^Amazon Store: Set Order Source to Non-Amazon$/ do
  step "Marketplace: Select amazon.com" if @amazon_store.nil?
  log.info "Amazon Store: Set Order Source to Non-Amazon"
  @amazon_store.order_source.non_amazon
end

Then /^Amazon Store: Set Product Identifier to Use SKU$/ do
  step "Marketplace: Select amazon.com" if @amazon_store.nil?
  log.info "Amazon Store: Set Product Identifier to User SKU"
  @amazon_store.product_identifier.use_sku
end

Then /^Amazon Store: Set Product Identifier to Use the ASIN$/ do
  step "Marketplace: Select amazon.com" if @amazon_store.nil?
  log.info "Amazon Store: Set Product Identifier to Use the ASIN"
  @amazon_store.product_identifier.use_asin
end

Then /^Amazon Store: Connect for the first time expecting Amazon Settings modal$/ do
  step "Marketplace: Select amazon.com" if @amazon_store.nil?
  log.info "Amazon Store: Connect for the first time expecting Amazon Settings modal"
  @amazon_store_settings = @amazon_store.connect_expecting_store_settings
  test_result = "Amazon Store Settings modal is #{(@amazon_store_settings.present?)?"present":"not present"} - Test #{(@amazon_store_settings.present?)?"passed":"failed"}"
  log.info test_result
  if @amazon_store_settings.nil? || !(@amazon_store_settings.present?)
    raise test_result
  end
end

Then /^Amazon Store: Connect$/ do
  step "Marketplace: Select amazon.com" if @amazon_store.nil?
  log.info "Amazon Store: Connect"
  @amazon_store.connect
end