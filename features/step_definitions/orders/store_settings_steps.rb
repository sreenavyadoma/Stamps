Then /^Store Settings: Set Store Nickname to (.*)$/ do |nickname|
  logger.step "Store Settings: Set Store Nickname to #{nickname}"
  raise "Store Settings is not open.  Check your test workflow." if @store_settings.nil?
  logger.step "Old Amazon Store Name:#{@store_name}"
  @store_name = (nickname.downcase.include? "random")?ParameterHelper.random_alpha_numeric(20):nickname
  logger.step "Store Nickname: #{@store_name}"
  @store_settings.store_nickname.set @store_name
end

Then /^Store Settings: Set Service Mapping (\d+), Requested Services (.*), Shipping Service (.*)$/ do |item_number, requested_services, shipping_service|
  logger.step "Store Settings: Set Requested Services to random #{requested_services}"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?

  service_mapping_item =@store_settings.service_mapping.item item_number.to_i
  service_mapping_item.requested_services.set (requested_services.downcase.include? "random")?ParameterHelper.random_alpha_numeric(20):requested_services
  service_mapping_item.shipping_Service.select shipping_service
end

Then /^Store Settings: Set Automatically Import New Orders to checked$/ do
  logger.step "Store Settings: Set Automatically Import New Orders to checked"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  sleep 1
  @store_settings.automatically_import_new_web_apps.orders.check
end

Then /^Store Settings: Uncheck Automatically Import New Orders$/ do
  logger.step "Store Settings: Uncheck Automatically Import New Orders"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  sleep 1
  @store_settings.automatically_import_new_web_apps.orders.uncheck
end

Then /^Store Settings: Save$/ do
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  @store_settings.save
end
