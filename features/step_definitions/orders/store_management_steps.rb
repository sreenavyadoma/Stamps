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

Then /^Marketplace modal - Select Amazon Store$/ do
  step "Open Add Store or Marketplace modal" if @market_place.nil?
  @amazon = @market_place.amazon
end

Then /^Amazon Store - Set Amazon Seller ID to (.*)$/ do |seller_id|
  step "Marketplace modal - Select Amazon Store" if @amazon.nil?
  log.info "Amazon Store - Set Amazon Seller ID to #{seller_id}"
  @amazon.seller_id.set seller_id
end

Then /^Amazon Store - Set Amazon MWS Auth Token to (.*)$/ do |auth_token|
  step "Marketplace modal - Select Amazon Store" if @amazon.nil?
  log.info "Amazon Store - Set Amazon MWS Auth Token to  #{auth_token}"
  @amazon.auth_token.set auth_token
end

Then /^Amazon Store - Click Verify Seller ID button$/ do
  step "Marketplace modal - Select Amazon Store" if @amazon.nil?
  log.info "Amazon Store - Click Verify Seller ID button"
  @amazon.verify_seller_id
end

Then /^Amazon Store - Set Order Source to Amazon.com$/ do
  step "Marketplace modal - Select Amazon Store" if @amazon.nil?
  log.info "Amazon Store - Set Order Source to Amazon.com"
  @amazon.order_source.amazon
end

Then /^Amazon Store - Set Order Source to Non-Amazon$/ do
  step "Marketplace modal - Select Amazon Store" if @amazon.nil?
  log.info "Amazon Store - Set Order Source to Non-Amazon"
  @amazon.order_source.non_amazon
end

Then /^Amazon Store - Set Product Identifier to Use SKU$/ do
  step "Marketplace modal - Select Amazon Store" if @amazon.nil?
  log.info "Amazon Store - Set Product Identifier to User SKU"
  @amazon.product_identifier.use_sku
end

Then /^Amazon Store - Set Product Identifier to Use the ASIN$/ do
  step "Marketplace modal - Select Amazon Store" if @amazon.nil?
  log.info "Amazon Store - Set Product Identifier to Use the ASIN"
  @amazon.product_identifier.use_asin
end

Then /^Amazon Store - Click Connect button$/ do
  step "Marketplace modal - Select Amazon Store" if @amazon.nil?
  log.info "Amazon Store - Click Connect button"
  @amazon.connect
end

Then /^Close Manage Stores modal$/ do
  step "Marketplace modal - Select Amazon Store" if @amazon.nil?
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
=begin
  30.times do
    log.info "Old Grid line items:  #{size}.  New Grid line items:  #{grid.size}"
    break if size == grid.size + 1
    sleep 1
  end
=end
  #new_size = grid.size
  #log.info "Test #{(size == new_size + 1)?"Passed":"Failed"} - Old Grid line items:  #{size}.  New Grid line items:  #{new_size}"
  log.info "Test #{(delete_modal.present?)?"Failed":"Passed"}"
  #expect(size == new_size + 1).to be true
  delete_modal.present?.should be false
end
