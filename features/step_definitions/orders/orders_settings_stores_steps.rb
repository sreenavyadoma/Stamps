
Then /^[Cc]lick [Oo]rder [Ss]ettings [Ss]tores Add [Bb]utton$/ do
  expect(stamps.orders.modals.orders_settings_modal.stores_tab.add).to eql('Add your Store or Marketplace')
  step "expect Marketplace modal is present"
end

Then /^[Ss]elect [Oo]rder [Ss]ettings [Ss]tore (.+)$/ do |store|
  expect(stamps.orders.modals.orders_settings_modal.stores_tab.select_store(store)).to eql(store)
end

Then /^[Ss]elect saved [Oo]rder [Ss]ettings [Ss]tore$/ do
  expect(stamps.orders.modals.orders_settings_modal.stores_tab.select_store(test_param[:store_nickname])).to eql(test_param[:store_nickname])
end

Then /^[Cc]lick [Oo]rder [Ss]ettings [Ss]tores [Ee]dit [Bb]utton$/ do
  stamps.orders.modals.orders_settings_modal.stores_tab.edit
end

Then /^[Cc]lick [Oo]rder [Ss]ettings [Ss]tores Reconnect [Bb]utton$/ do
  pending #stamps.orders.modals.orders_settings_modal.stores_tab.reconnect
end

Then /^[Cc]lick [Oo]rder [Ss]ettings [Ss]tores Delete [Bb]utton$/ do
  stamps.orders.modals.orders_settings_modal.stores_tab.delete
end

Then /^[Cc]lick [Oo]rder [Ss]ettings [Ss]tores Delete confirmation [Bb]utton$/ do
  stamps.orders.modals.orders_settings_modal.stores_tab.delete_store_confirm_modal.confirm_delete
end

Then /^[Ss]elect [Oo]rder [Ss]ettings Store name (.*)$/ do |store|
  pending #stamps.orders.modals.orders_settings_modal.stores_tab.select store
end

Then /^[Ee]xpect [Oo]rder [Ss]ettings Store name (.*) to be present$/ do |store|
  expect(stamps.orders.modals.orders_settings_modal.stores_tab.store_list(store)).to be_present
end

Then /^[Ee]xpect [Oo]rders [Ss]ettings [Ss]tore [S]aved nickname is not present in list$/ do
  expect(stamps.orders.modals.orders_settings_modal.stores_tab.store_exists(test_param[:store_nickname])).not_to be(true), "Deleted store is PRESENT and it should NOT be PRESENT"
end

Then /^[Ee]xpect [Oo]rders [Ss]ettings [Ss]tore [Nn]ickname (.*) is not present in list$/ do |store|
  expect(stamps.orders.modals.orders_settings_modal.stores_tab.store_exists(store)).not_to be(true), "Deleted store is PRESENT and it should NOT be PRESENT"
end



Then /^Manage [Ss]tores: Close Modal$/ do
  #test_config.logger.step "Manage [Ss]tores: Close Modal"
  @manage_stores.close
end

Then /^Manage [Ss]tores: Delete Row (\d+)$/ do |row|
  #test_config.logger.step "Manage [Ss]tores: Delete Row #{row}"
  step "Manage [Ss]tores: Open Modal"
  grid=@manage_stores.stores_grid
  size=grid.size
  #test_config.logger.step "Grid Count before delete is #{size}"
  delete_modal=@manage_stores.stores_grid.delete_row row
  delete_modal.delete
  expect(delete_modal.present?).not_to be(true)
end

Then /^Manage [Ss]tores: Select Store (.*)$/ do |store_name|
  test_param[:store_name]=(store_name.downcase.include? 'random')?test_param[:store_name]:store_name
  #test_config.logger.step "Manage [Ss]tores: Select Store #{test_data[:store_name]}"
  raise "Unble to select store name: #{test_param[:store_name]}.  Either it's nil or does not exist in the modal.  Check your test." if test_param[:store_name].nil?
  raise "Store name can't be nil or an empty String" if test_param[:store_name].nil?||test_param[:store_name].size==0
  @manage_stores.stores_grid.select(test_param[:store_name])
end

Then /^Manage [Ss]tores: Delete All [Ss]tores$/ do
  #test_config.logger.step "Manage [Ss]tores: Delete All [Ss]tores"
  @manage_stores.stores_grid.delete_all
end

Then /^Manage [Ss]tores: Delete$/ do
  #test_config.logger.step "Manage [Ss]tores: Delete"
  @manage_stores.delete_item.delete
end

Then /^Manage [Ss]tores: Reconnect$/ do
  #test_config.logger.step "Manage [Ss]tores: Reconnect"
  @store=@manage_stores.reconnect
end

Then /^Manage [Ss]tores: Edit$/ do
  #test_config.logger.step "Manage [Ss]tores: Edit"
  @store_settings=@manage_stores.edit
  test_result="Store [Ss]ettings modal is #{(@store_settings.present?)?"present":"not present"} - Test #{(@store_settings.present?)?"passed":"failed"}"
  test_config.logger.step test_result
  if @store_settings.nil?||!(@store_settings.present?)
    raise test_result
  end
end

Then /^Manage [Ss]tores: Expect Manage [Ss]tores grid contains (.*)$/ do |grid_item|

end


