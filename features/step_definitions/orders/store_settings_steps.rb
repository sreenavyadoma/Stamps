Then /^set store settings store nickname to (.*)$/ do |str|
  nickname = (str.downcase.include?('random') ? ParamHelper.rand_alpha_numeric : str)
  stamps.orders.marketplace.store_settings.store_nickname.set(test_param[:store_nickname] = nickname)
end

Then /^select store settings shipping service to ([\w \/]+)$/ do |str|
  expect(stamps.orders.marketplace.store_settings.shipping_service.select(str)).to include(str)
end

Then /^select store settings requested service to ([\w \/]+)$/ do |str|
  stamps.orders.marketplace.store_settings.requested_service.set(str)
end

Then /^expect store settings (\w+) modal is present$/ do |store_name|
  expect(stamps.orders.marketplace.store_settings.window_title.text).to include("#{store_name} Settings")
end

Then /^expect store settings modal is present$/ do
  step "pause for 20 seconds"
  expect(stamps.orders.marketplace.store_settings.window_title.text).to eql("Settings")
end

Then /^[Aa]dd store service Mapping (\d+), Requested Services (.*), Shipping service (.*)$/ do |mapping_number, requested_services, shipping_service|
  step "add store service Mapping #{mapping_number}"
  step "set store service Mapping #{mapping_number} Requested Service to #{requested_services}"
  step "set store service Mapping #{mapping_number} Shipping Service to #{shipping_service}"
end

Then /^[Aa]dd store service Mapping (\d+)$/ do |mapping_number|
  stamps.orders.marketplace.store_settings.service_mapping_list.mapping_number(mapping_number.to_i)
end

Then /^[Ss]et store service Mapping (\d+) Requested Service to (.*)$/ do |mapping_number, value|
  test_param[:service_mapping_items][mapping_number] = {} unless test_param[:service_mapping_items].has_key?(mapping_number)
  test_param[:service_mapping_items][mapping_number][:requested_service] = (value.downcase.include?('random') ? ParamHelper.rand_alpha_numeric : value)
  stamps.orders.marketplace.store_settings.service_mapping_list.mapping_number(mapping_number.to_i).requested_service_mapping.set(test_param[:service_mapping_items][mapping_number][:requested_service])
end

Then /^[Ss]et store service Mapping (\d+) Shipping Service to (.*)$/ do |mapping_number, value|
  test_param[:service_mapping_items][mapping_number] = {} unless test_param[:service_mapping_items].has_key?(mapping_number)
  test_param[:service_mapping_items][mapping_number][:shipping_service] = value
  expect(stamps.orders.marketplace.store_settings.service_mapping_list.mapping_number(mapping_number.to_i).shipping_service_mapping.select(test_param[:service_mapping_items][mapping_number][:shipping_service])).to include(test_param[:service_mapping_items][mapping_number][:shipping_service])
end


Then /^[Aa]dd new store service mapping$/ do
  @store_settings.add_new_service_mapping.click
end

Then /^[Ss]et store service Mapping (\d+), Requested Services (.*), Shipping service (.*)$/ do |item_number, requested_services, shipping_service|
  #StampsTest.log.step "Store Settings: Set Requested Services to random #{requested_services}"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  service_mapping_item = @store_settings.service_mapping.item item_number.to_i
  service_mapping_item.requested_services.set(requested_services.downcase.include? 'random') ? ParamHelper.rand_alpha_numeric(4, 20) : requested_services
  service_mapping_item.shipping_Service.select shipping_service
end

Then /^Store Settings: Set Automatically Import New Orders to checked$/ do
  #StampsTest.log.step "Store Settings: Set Automatically Import New Orders to checked"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  sleep(0.35)
  @store_settings.automatically_import_new_web_apps.orders.check
end

Then /^Store Settings: Uncheck Automatically Import New Orders$/ do
  #StampsTest.log.step "Store Settings: Uncheck Automatically Import New Orders"
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  sleep(0.35)
  @store_settings.automatically_import_new_web_apps.orders.uncheck
end

Then /^Store Settings: Save$/ do
  raise "Amazon Settings is not open.  Check your test workflow." if @store_settings.nil?
  @store_settings.save
end


#### Settings Modal ####

Then /^[Ee]xpect [Ss]quare [Ss]ettings [Dd]ialog is present$/ do
  step "pause for 5 seconds"
  expect(stamps.orders.marketplace.square.settings.window_title.present?).to be(true), "Sqaure Settings dialog is not present"
end

Then /^[Cc]heck Settings dialog store import new orders$/ do
  stamps.orders.marketplace.store_settings.auto_import_new_orders.check
end

Then /^[Ee]xpect Settings dialog store import new orders is checked$/ do
  expect(stamps.orders.marketplace.store_settings.auto_import_new_orders.checked?).to be(true), "Automatically import new orders is NOT checked"
end

Then /^[Uu]ncheck Settings dialog store import new orders$/ do
  stamps.orders.marketplace.store_settings.auto_import_new_orders.uncheck
end

Then /^[Ee]xpect Settings dialog store import new orders is Unchecked$/ do
  expect(stamps.orders.marketplace.store_settings.auto_import_new_orders.checked?).not_to be(true), "Automatically import new orders is NOT unchecked"
end

Then /^[Cc]heck Store Settings dialog Automatically add new products to the [Pp]roducts page$/ do
  stamps.orders.marketplace.store_settings.auto_add_to_products_page.check
end

Then /^[Uu]ncheck Store Settings dialog Automatically add new products to the [Pp]roducts page$/ do
  stamps.orders.marketplace.store_settings.auto_add_to_products_page.uncheck
end

Then /^[Ee]xpect Store Settings dialog Automatically add new products to the [Pp]roducts page is checked$/ do
  expect(stamps.orders.marketplace.store_settings.auto_add_to_products_page.checked?).to be(true), "Automatically add new products to the Products page is NOT checked"
end

Then /^[Ee]xpect Store Settings dialog Automatically add new products to the [Pp]roducts page is unchecked$/ do
  expect(stamps.orders.marketplace.store_settings.auto_add_to_products_page.checked?).not_to be(true), "Automatically add new products to the Products page is NOT unchecked"
end

Then /^[Ss]elect [Uu]niquely [Ii]dentify [Pp]roducts by SKU$/ do
  #The default selected radio button on this page is sku, and in its initial default state the class name for sku is different than when it is selected by the user, making the StampsRadio validation fail.
  #Therefore, product_listing_name needs to be selected first so that the when sku is selected, its class name can be used for validation.
  stamps.orders.marketplace.store_settings.product_listing_name.select
  stamps.orders.marketplace.store_settings.sku.select
end

Then /^[Ss]elect [Uu]niquely [Ii]dentify [Pp]roducts by [Pp]roduct [Ll]isting [Nn]ame$/ do
  stamps.orders.marketplace.store_settings.product_listing_name.select
end

Then /^[Cc]lick [Ss]ave in [Ss]tore [Ss]ettings modal$/ do
  stamps.orders.marketplace.store_settings.save.click
end
