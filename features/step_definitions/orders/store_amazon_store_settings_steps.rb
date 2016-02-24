Then /^Amazon Settings: Set Store Nickname to (.*)$/ do |nickname|
  log.info "Amazon Settings: Set Store Nickname to #{nickname}"
  raise "Amazon Settings is not open.  Check your test workflow." if @amazon_store_settings.nil?
  log.info "Old Amazon Store Name:#{@amazon_store_name}"
  @amazon_store_name = (nickname.downcase.include? "random")?test_helper.random_alpha_numeric(20):nickname
  log.info "New Amazon Store Name:#{@amazon_store_name}"
  @amazon_store_settings.store_nickname.set @amazon_store_name
end

Then /^Amazon Settings: Set Service Mapping (\d+), Requested Services (.*), Shipping Service (.*)$/ do |item_number, requested_services, shipping_service|
  log.info "Amazon Settings: Set Requested Services to random #{requested_services}"
  raise "Amazon Settings is not open.  Check your test workflow." if @amazon_store_settings.nil?

  service_mapping_item =@amazon_store_settings.service_mapping.item item_number.to_i
  service_mapping_item.requested_services.set (requested_services.downcase.include? "random")?test_helper.random_alpha_numeric(20):requested_services
  service_mapping_item.shipping_Service.select shipping_service
end

Then /^Amazon Settings: Check Automatically Import New Orders$/ do
  log.info "Amazon Settings: Check Automatically Import New Orders"
  raise "Amazon Settings is not open.  Check your test workflow." if @amazon_store_settings.nil?
  sleep 1
  @amazon_store_settings.automatically_import_new_orders.check
end

Then /^Amazon Settings: Uncheck Automatically Import New Orders$/ do
  log.info "Amazon Settings: Uncheck Automatically Import New Orders"
  raise "Amazon Settings is not open.  Check your test workflow." if @amazon_store_settings.nil?
  sleep 1
  @amazon_store_settings.automatically_import_new_orders.uncheck
end

Then /^Amazon Settings: Save$/ do
  raise "Amazon Settings is not open.  Check your test workflow." if @amazon_store_settings.nil?
  sleep 2
  @amazon_store_settings.save
  sleep 3
end
