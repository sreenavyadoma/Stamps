Then /^Select Toolbar Settings Menu Item Add\/Edit Stores$/ do
  log.info "STEPS:  Select Toolbar Settings Menu Item Add/Edit Stores"
  @manage_stores = orders.toolbar.settings.manage_stores
end

Then /^Open Manage Stores modal$/ do
  step "Select Toolbar Settings Menu Item Add/Edit Stores" if @manage_stores.nil?
end

Then /^Click Manage Stores Add button$/ do
  step "Open Add Your Store or Marketplace modal"
end

Then /^Open Add Your Store or Marketplace modal$/ do
  @market_place = @manage_stores.add if @market_place.nil?
end

Then /^Select Amazon Store from Marketplace modal$/ do
  step "Open Add Your Store or Marketplace modal" if @market_place.nil?
  @amazon = @market_place.amazon
end

Then /^Set Amazon Store - Amazon Seller ID to (.*)$/ do |seller_id|
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Set Amazon Store - Amazon Seller ID to #{seller_id}"
  @amazon.seller_id.set seller_id
end

Then /^Set Amazon Store - Amazon MWS Auth Token to (.*)$/ do |auth_token|
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Set Amazon Store - Amazon MWS Auth Token to  #{auth_token}"
  @amazon.auth_token.set auth_token
end

Then /^Click Amazon Store Verify Seller ID button$/ do
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Click Amazon Store Verify Seller ID button"
  amazon.verify_seller_id
end

Then /^Set Amazon Store - Order Source to (.*)$/ do |order_source|
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Set Amazon Store - Order Source to #{order_source}"
  @amazon.order_source.select order_source
end

Then /^Set Amazon Store - Product Identifier to (.*)$/ do |identifier|
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Set Amazon Store - Product Identifier to #{identifier}"
  @amazon.product_identifier.select identifier
end

Then /^Click Amazon Store Connect button$/ do
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Click Amazon Store Connect button"
  amazon.connect
end

Then /^Close Manage Stores modal$/ do
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Close Manage Stores modal"
  unless @manage_stores.nil?
    @manage_stores.close
  end
end



Then /^Add Amazon Store using Amazon Seller ID (.*) and MWS Auth Token (.*)$/ do |store_id, auth_token|
  log.info "Add Amazon Store using Amazon Seller ID #{store_id} and MWS Auth Token #{auth_token}"

  @manage_stores = orders.toolbar.settings.manage_stores if @manage_stores.nil?

  amazon = @manage_stores.add.amazon
  amazon.seller_id.set store_id
  amazon.auth_token.set auth_token
  amazon.verify_seller_id
  amazon.connect
  @manage_stores.close

end

