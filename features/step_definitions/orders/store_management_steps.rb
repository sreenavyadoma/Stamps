
Then /^Manage Stores: Open Modal$/ do
  #logger.step "Manage Stores: Open Modal"
  @manage_stores = stamps.orders.toolbar.settings.manage_stores
end

Then /^Manage Stores: Add$/ do
  #logger.step "Manage Stores: Add"
  @market_place = @manage_stores.add
end

Then /^Manage Stores: Close Modal$/ do
  #logger.step "Manage Stores: Close Modal"
  @manage_stores.close
end

Then /^Manage Stores: Delete Row (\d+)$/ do |row|
  #logger.step "Manage Stores: Delete Row #{row}"
  step "Manage Stores: Open Modal"
  grid = @manage_stores.stores_grid
  size = grid.size
  #logger.step "Grid Count before delete is #{size}"
  delete_modal = @manage_stores.stores_grid.delete_row row
  delete_modal.delete
  expect(delete_modal.present?).to be false
end

Then /^Manage Stores: Select Store (.*)$/ do |store_name|
  test_data[:store_name] = (store_name.downcase.include? 'random')?test_data[:store_name]:store_name
  #logger.step "Manage Stores: Select Store #{test_data[:store_name]}"
  raise "Unble to select store name: #{test_data[:store_name]}.  Either it's nil or does not exist in the modal.  Check your test." if test_data[:store_name].nil?
  raise "Store name can't be nil or an empty String" if test_data[:store_name].nil? || test_data[:store_name].size == 0
  @manage_stores.stores_grid.select(test_data[:store_name])
end

Then /^Manage Stores: Delete All Stores$/ do
  #logger.step "Manage Stores: Delete All Stores"
  @manage_stores.stores_grid.delete_all
end

Then /^Manage Stores: Delete$/ do
  #logger.step "Manage Stores: Delete"
  @manage_stores.delete_item.delete
end

Then /^Manage Stores: Reconnect$/ do
  #logger.step "Manage Stores: Reconnect"
  @store = @manage_stores.reconnect
end

Then /^Manage Stores: Edit$/ do
  #logger.step "Manage Stores: Edit"
  @store_settings = @manage_stores.edit
  test_result = "Store Settings modal is #{(@store_settings.present?)?"present":"not present"} - Test #{(@store_settings.present?)?"passed":"failed"}"
  logger.step test_result
  if @store_settings.nil? || !(@store_settings.present?)
    raise test_result
  end
end

Then /^Manage Stores: Expect Manage Stores grid contains (.*)$/ do |grid_item|

end


