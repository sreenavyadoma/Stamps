
Then /^Etsy Store: Set Etsy Username to (.*)$/ do |etsy_username|
  logger.step "Etsy Store: Set Etsy Username to #{etsy_username}"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.etsy_username.set etsy_username
  @store.etsy_username.set etsy_username
  @store.etsy_username.set etsy_username
end

Then /^Etsy Store: Find My Shops$/ do
  logger.step "Etsy Store: Find My Shops"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.find_my_shops
end

Then /^Etsy Store: Set Available Shops$/ do
  logger.step "Etsy Store: Find My Shops"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.available_shops
end

Then /^Etsy Store: Connect then sign in with Etsy credentials (.*)\/(.*)$/ do |username, password|
  logger.step "Etsy Store: Connect"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings = @store.connect username, password
  logger.step @store_settings.nil?
end

Then /^Etsy Store: Reconnect then sign in with Etsy credentials (.*)\/(.*)$/ do |username, password|
  logger.step "Etsy Store: Connect"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings = @store.reconnect username, password
  logger.step @store_settings.nil?
end


