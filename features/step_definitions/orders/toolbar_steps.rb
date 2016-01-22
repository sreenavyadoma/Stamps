When /^Add New Order$/ do
  log.info "Step: Add New Order"
  log.info "Add New Order"
  @old_balance = orders.navigation_bar.balance.amount
  orders.grid.checkbox.uncheck 1
  @order_details = orders.toolbar.add
  @order_id = @order_details.order_id
  log.info "New Order ID #{@order_id}"
  @awaiting_shipment_count = orders.filter.awaiting_shipment_count
  @item_count = 0
  @number = 0
end

Then /^I Add a second order$/ do
  log.info "Step: I Add a second order"
  @order_details = orders.toolbar.add
  @order_id_2 = @order_details.order_id
end

Then /^I Add a third order$/ do
  log.info "Step: I Add a third order"
  @order_details = orders.toolbar.add
  @order_id_3 = @order_details.order_id
end

When /^Add a second order$/ do
  log.info "Step: Add a second order"
  first_row_order_id = orders.grid.order_id.row 1
  5.times{
    @order_id_2 = orders.toolbar.add_shipping_address_window
    if first_row_order_id.include? @order_id
      sleep(3)
    end
    break unless first_row_order_id.include? @order_id_2
  }
  log.info "Second Order Id:  #{@order_id_2}"
  orders.grid.checkbox.edit @order_id_2
end

Then /^Open Settings Modal$/ do
  log.info "Step: Open Settings Modal"
  @general_settings = orders.toolbar.settings.general_settings
end

Then /^Fail the test$/ do
  log.info "Step: Fail the test"
  true.should eql  false
end

Then /^Test Features$/ do |count|
  log.info "Step: Test Features"
  orders.grid.checkbox.check_all
  count = orders.multi_order.order_count
  log.info count
  orders.grid.checkbox.uncheck_all
end