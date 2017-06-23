Then /^3DCart Store: Set API User Key to (.*)$/ do |api_user_key|
  #test_config.logger.step "3DCart Store: Set API User Key to #{api_user_key}"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.api_user_key.set api_user_key
end

Then /^3DCart Store: Set URL to your store to (.*)$/ do |store_url|
  #test_config.logger.step "3DCart Store: Set URL to your store to #{store_url}"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.store_url.set store_url
end

Then /^3DCart Store: Set Product Weight Units to (.*)$/ do |weight_unit|
  #test_config.logger.step "3DCart Store: Set Product Weight Units to #{weight_unit}"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.weight_unit.select weight_unit
end

Then /^3DCart Store: Connect$/ do
  #test_config.logger.step "3DCart Store: Connect"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings = @store.connect
end

Then /^3DCart Store: Reconnect$/ do
  #test_config.logger.step "3DCart Store: Connect"
  raise "3dcart Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings = @store.reconnect
end



