Then /^Select Toolbar Settings Menu Item Add\/Edit Stores$/ do
  log.info "STEPS:  Select Toolbar Settings Menu Item Add/Edit Stores"
  @manage_stores = orders.toolbar.settings.manage_stores
end

Then /^Open Manage Stores modal$/ do
  step "Select Toolbar Settings Menu Item Add/Edit Stores" if @manage_stores.nil?
end

Then /^Click Manage Stores Add button$/ do
  step "Open Add Store or Marketplace modal"
end

Then /^Open Add Store or Marketplace modal$/ do
  @market_place = @manage_stores.add if @market_place.nil?
end

Then /^Select Amazon Store from Marketplace modal$/ do
  step "Open Add Store or Marketplace modal" if @market_place.nil?
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
  @amazon.verify_seller_id
end

Then /^Set Amazon Store - Order Source to Amazon.com$/ do
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Set Amazon Store - Order Source to Amazon.com"
  @amazon.order_source.amazon
end

Then /^Set Amazon Store - Order Source to Non-Amazon$/ do
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Set Amazon Store - Order Source to Non-Amazon"
  @amazon.order_source.non_amazon
end

Then /^Set Amazon Store - Product Identifier to Use SKU$/ do
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Set Amazon Store - Product Identifier to User SKU"
  @amazon.product_identifier.use_sku
end

Then /^Set Amazon Store - Product Identifier to Use the ASIN$/ do
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Set Amazon Store - Product Identifier to Use the ASIN"
  @amazon.product_identifier.use_asin
end

Then /^Click Amazon Store Connect button$/ do
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Click Amazon Store Connect button"
  @amazon.connect
end

Then /^Close Manage Stores modal$/ do
  step "Select Amazon Store from Marketplace modal" if @amazon.nil?
  log.info "Close Manage Stores modal"
  unless @manage_stores.nil?
    @manage_stores.close
  end
end

Then /^Delete Manage Stores Modal Row (\d+)$/ do |row|
  log.info "Delete Manage Stores Modal Row #{row}"
  step "Open Manage Stores modal"
  grid = @manage_stores.grid
  size = grid.size
  log.info "Grid Count before delete is #{size}"
  delete_modal = @manage_stores.grid.delete_row row
  delete_modal.delete
  new_size = grid.size
  log.info "Test #{(size == new_size + 1)?"Passed":"Failed"} - Old Grid line items:  #{size}.  New Grid line items:  #{new_size}"
  log.info "Test #{(delete_modal.present?)?"Failed":"Passed"}"
  expect(size == new_size + 1).to be true
  delete_modal.present?.should be false
end
