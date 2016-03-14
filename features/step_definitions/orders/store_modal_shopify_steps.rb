Then /^Shopify Store: Set Shopify Domain to (.*)$/ do |url|
  log.info "Rakuten Store: Set Rakuten Seller ID #{url}"
  raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.shopify_domain.set url
end

Then /^Shopify Store: Test Connection$/ do
  log.info "Then Shopify Store: Test Connection"
  raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.test_connection
end

Then /^Shopify Store: Connect$/ do
  log.info "Rakuten Store: Connect"
  raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings = @store.connect
end