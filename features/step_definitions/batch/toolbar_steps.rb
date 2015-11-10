When /^I Add a new order$/ do
  log "Test: I Add a new order"
  log "I Add a new order"
  @old_balance = batch.navigation.balance
  batch.grid.check.uncheck 1
  @single_order_form = batch.toolbar.add
  @order_id = @single_order_form.order_id
end

Then /^I Add a second order$/ do
  log "Test: I Add a second order"
  @single_order_form = batch.toolbar.add
  @order_id_2 = @single_order_form.order_id
end

Then /^I Add a third order$/ do
  log "Test: I Add a third order"
  @single_order_form = batch.toolbar.add
  @order_id_3 = @single_order_form.order_id
end

When /^Add a second order$/ do
  log "Test: Add a second order"
  first_row_order_id = batch.grid.order_id.row 1
  5.times{
    @order_id_2 = batch.toolbar.add_shipping_address_window
    if first_row_order_id.include? @order_id
      sleep(3)
    end
    break unless first_row_order_id.include? @order_id_2
  }
  log "Second Order Id:  #{@order_id_2}"
  batch.grid.check.edit @order_id_2
end

Then /^Open Settings Modal$/ do
  log "Test: Open Settings Modal"
  batch.toolbar.open_settings
end

Then /^Fail the test$/ do
  log "Test: Fail the test"
  true.should eql  false
end

Then /^Test Features$/ do |count|
  log "Test: Test Features"
  batch.grid.check.select_all
  count = batch.multi_order.order_count
  log count
  batch.grid.check.unselect_all
end