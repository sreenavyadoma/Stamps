Then /^Store Settings: Set Store Nickname to (.*)$/ do |nickname|
  log.info "Store Settings: Set Store Nickname to #{nickname}"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  log.info "Old Amazon Store Name:#{@amazon_store_name}"
  @amazon_store_name = (nickname.downcase.include? "random")?test_helper.random_alpha_numeric(20):nickname
  log.info "New Amazon Store Name:#{@amazon_store_name}"
  @store_settings.store_nickname.set @amazon_store_name
end

Then /^Store Settings: Set Service Mapping (\d+), Requested Services (.*), Shipping Service (.*)$/ do |item_number, requested_services, shipping_service|
  log.info "Store Settings: Set Requested Services to random #{requested_services}"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?

  service_mapping_item =@store_settings.service_mapping.item item_number.to_i
  service_mapping_item.requested_services.set (requested_services.downcase.include? "random")?test_helper.random_alpha_numeric(20):requested_services
  service_mapping_item.shipping_Service.select shipping_service
end

Then /^Store Settings: Check Automatically Import New Orders$/ do
  log.info "Store Settings: Check Automatically Import New Orders"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  sleep 1
  @store_settings.automatically_import_new_orders.check
end

Then /^Store Settings: Uncheck Automatically Import New Orders$/ do
  log.info "Store Settings: Uncheck Automatically Import New Orders"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  sleep 1
  @store_settings.automatically_import_new_orders.uncheck
end

Then /^Store Settings: Save$/ do
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  sleep 2
  @store_settings.save
  sleep 3
end
