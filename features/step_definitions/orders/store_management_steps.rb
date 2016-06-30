
Then /^Manage Stores: Open Modal$/ do
  logger.info "Manage Stores: Open Modal"
  @manage_stores = orders.toolbar.settings.manage_stores
end

Then /^Manage Stores: Add$/ do
  logger.info "Manage Stores: Add"
  @market_place = @manage_stores.add
end

Then /^Manage Stores: Close Modal$/ do
  logger.info "Manage Stores: Close Modal"
  @manage_stores.close
end

Then /^Manage Stores: Delete Row (\d+)$/ do |row|
  logger.info "Manage Stores: Delete Row #{row}"
  step "Manage Stores: Open Modal"
  grid = @manage_stores.stores_grid
  size = grid.size
  logger.info "Grid Count before delete is #{size}"
  delete_modal = @manage_stores.stores_grid.delete_row row
  delete_modal.delete
=begin
  30.times do
    logger.info "Old Grid line items:  #{size}.  New Grid line items:  #{grid.size}"
    break if size == grid.size + 1
    sleep 1
  end
=end
  #new_size = grid.size
  #logger.info "Test #{(size == new_size + 1)?"Passed":"Failed"} - Old Grid line items:  #{size}.  New Grid line items:  #{new_size}"
  logger.info "Test #{(delete_modal.present?)?"Failed":"Passed"}"
  #expect(size == new_size + 1).to be true
  delete_modal.present?.should be false
end

Then /^Manage Stores: Select Store (.*)$/ do |store_name|
  @store_name = (store_name.downcase.include? "random")?@store_name:store_name
  logger.info "Manage Stores: Select Store #{@store_name}"
  raise "Unble to select store name: #{@store_name}.  Either it's nil or does not exist in the modal.  Check your test." if @store_name.nil?
  raise "Store name can't be nil or an empty String" if @store_name.nil? || @store_name.size == 0
  @manage_stores.stores_grid.select @store_name
  @manage_stores.stores_grid.select @store_name
  @manage_stores.stores_grid.select @store_name
end

Then /^Manage Stores: Delete All Stores$/ do
  logger.info "Manage Stores: Delete All Stores"
  @manage_stores.stores_grid.delete_all
end

Then /^Manage Stores: Delete$/ do
  logger.info "Manage Stores: Delete"
  @manage_stores.delete_item.delete
end

Then /^Manage Stores: Reconnect$/ do
  logger.info "Manage Stores: Reconnect"
  @store = @manage_stores.reconnect
end

Then /^Manage Stores: Edit$/ do
  logger.info "Manage Stores: Edit"
  @store_settings = @manage_stores.edit
  test_result = "Store Settings modal is #{(@store_settings.present?)?"present":"not present"} - Test #{(@store_settings.present?)?"passed":"failed"}"
  logger.info test_result
  if @store_settings.nil? || !(@store_settings.present?)
    raise test_result
  end
end

Then /^Manage Stores: Expect Manage Stores grid contains (.*)$/ do |grid_item|

end


