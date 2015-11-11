When /^I Add a new order$/ do
  log "Step: I Add a new order"
  log "I Add a new order"
  @old_balance = batch.navigation.balance
  batch.grid.checkbox.uncheck 1
  @single_order_form = batch.toolbar.add
  @order_id = @single_order_form.order_id
end

Then /^I Add a second order$/ do
  log "Step: I Add a second order"
  @single_order_form = batch.toolbar.add
  @order_id_2 = @single_order_form.order_id
end

Then /^I Add a third order$/ do
  log "Step: I Add a third order"
  @single_order_form = batch.toolbar.add
  @order_id_3 = @single_order_form.order_id
end

When /^Add a second order$/ do
  log "Step: Add a second order"
  first_row_order_id = batch.grid.order_id.row 1
  5.times{
    @order_id_2 = batch.toolbar.add_shipping_address_window
    if first_row_order_id.include? @order_id
      sleep(3)
    end
    break unless first_row_order_id.include? @order_id_2
  }
  log "Second Order Id:  #{@order_id_2}"
  batch.grid.checkbox.edit @order_id_2
end

Then /^Open Settings Modal$/ do
  log "Step: Open Settings Modal"
  batch.toolbar.open_settings
end

Then /^Fail the test$/ do
  log "Step: Fail the test"
  true.should eql  false
end

Then /^Test Features$/ do |count|
  log "Step: Test Features"
  batch.grid.checkbox.check_all
  count = batch.multi_order.order_count
  log count
  batch.grid.checkbox.uncheck_all
end