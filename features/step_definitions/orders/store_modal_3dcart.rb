Then /^3dcart Store: Set API User Key to (.*)$/ do |api_user_key|
  log.info "3dcart Store: Set API User Key to #{api_user_key}"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.api_user_key.set api_user_key
end

Then /^3dcart Store: Set URL to your store to (.*)$/ do |store_url|
  log.info "3dcart Store: Set URL to your store to #{store_url}"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.store_url.set store_url
end

Then /^3dcart Store: Set Product Weight Units to (.*)$/ do |weight_unit|
  log.info "3dcart Store: Set Product Weight Units to #{weight_unit}"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.weight_unit.select weight_unit
end

Then /^3dcart Store: Test Connection$/ do
  log.info "3dcart Store: Test Connection"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.test_connection
end

Then /^3dcart Store: Connect$/ do
  log.info "3dcart Store: Connect"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings = @store.connect
end

Then /^3dcart Store: Reconnect$/ do
  log.info "3dcart Store: Connect"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings = @store.reconnect
end



