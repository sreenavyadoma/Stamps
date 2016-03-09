Then /^Rakuten Store: Set Rakuten Seller ID (.*)$/ do |seller_id|
  log.info "Rakuten Store: Set Rakuten Seller ID #{seller_id}"
  raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @rakuten_store.nil?
  @rakuten_store.seller_id.set seller_id
end

Then /^Rakuten Store: Set FTP Username (.*)$/ do |seller_id|
  log.info "Rakuten Store: Set FTP Username #{seller_id}"
  raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @rakuten_store.nil?
  @rakuten_store.ftp_username.set seller_id
end

Then /^Rakuten Store: Set FTP Password (.*)$/ do |seller_id|
  log.info "Rakuten Store: Set FTP Password #{seller_id}"
  raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @rakuten_store.nil?
  @rakuten_store.ftp_password.set seller_id
end

Then /^Rakuten Store: Set Map Rakuten SKU as your Product SKU to checked$/ do
  log.info "Rakuten Store: Set Map Rakuten SKU as your Product SKU to checked"
  raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @rakuten_store.nil?
  @rakuten_store.map_rakuten_sku.check
end

Then /^Rakuten Store: Set Map Rakuten SKU as your Product SKU to unchecked$/ do
  log.info "Rakuten Store: Set Map Rakuten SKU as your Product SKU to unchecked"
  raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @rakuten_store.nil?
  @rakuten_store.map_rakuten_sku.uncheck
end

Then /^Rakuten Store: Test Connection$/ do
  log.info "Rakuten Store: Test Connection"
  raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @rakuten_store.nil?
  @rakuten_store.test_connection
end

Then /^Rakuten Store: Connect$/ do
  log.info "Rakuten Store: Connect"
  raise "Rakuten Store modal is not visible or present.  Check your test workflow" if @rakuten_store.nil?
  @store_settings = @rakuten_store.connect
end