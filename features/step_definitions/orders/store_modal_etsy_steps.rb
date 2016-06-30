
Then /^Etsy Store: Set Etsy Username to (.*)$/ do |etsy_username|
  logger.info "Etsy Store: Set Etsy Username to #{etsy_username}"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.etsy_username.set etsy_username
  @store.etsy_username.set etsy_username
  @store.etsy_username.set etsy_username
end

Then /^Etsy Store: Find My Shops$/ do
  logger.info "Etsy Store: Find My Shops"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.find_my_shops
end

Then /^Etsy Store: Set Available Shops$/ do
  logger.info "Etsy Store: Find My Shops"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store.available_shops
end

Then /^Etsy Store: Connect then sign in with Etsy credentials (.*)\/(.*)$/ do |username, password|
  logger.info "Etsy Store: Connect"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings = @store.connect username, password
  logger.info @store_settings.nil?
end

Then /^Etsy Store: Reconnect then sign in with Etsy credentials (.*)\/(.*)$/ do |username, password|
  logger.info "Etsy Store: Connect"
  raise "Etsy Store modal is not visible or present.  Check your test workflow" if @store.nil?
  @store_settings = @store.reconnect username, password
  logger.info @store_settings.nil?
end


