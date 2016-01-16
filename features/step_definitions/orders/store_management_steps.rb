Then /^Select Toolbar Settings Menu Item Add\/Edit Stores$/ do
  log.info "STEPS:  Select Toolbar Settings Menu Item Add/Edit Stores"
  @manage_stores = orders.toolbar.settings.manage_stores
end

Then /^Add Amazon Store using Amazon Seller ID (.*) and MWS Auth Token (.*)$/ do |store_id, auth_token|
  log.info "Add Amazon Store using Amazon Seller ID #{store_id} and MWS Auth Token #{auth_token}"

  amazon = orders.toolbar.settings.manage_stores.add_store.amazon
  amazon.seller_id.set store_id
  amazon.auth_token.set auth_token
  amazon.verify_seller_id.click
  amazon.connect

end
