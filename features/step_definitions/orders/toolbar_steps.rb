Then /^Toolbar: Add$/ do
  begin
    logger.step "Toolbar: Add"
    stamps.orders.grid.checkbox.uncheck 1
    @order_details = stamps.orders.toolbar.add.order_details
    test_data[:order_id] = @order_details.toolbar.order_id
    test_data[:old_balance] = stamps.navigation_bar.balance.amount
    step "Save Shipping Costs Data"
    logger.step "Saved Order ID #{test_data[:order_id]}"
    test_data[:order_id] = test_data[:order_id]
    test_data[:awaiting_shipment_count] = stamps.orders.filter.awaiting_shipment_count
    @item_count = 0
    @index = 0
  rescue Exception => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
    "Unable to add new orders".should eql e.message
  end
end

Then /^Save Shipping Costs Data$/ do
  logger.step "Save Shipping Costs Data"
  test_data[:service_cost] = stamps.orders.details.service.cost
  test_data[:insure_for_cost] = stamps.orders.details.insure_for.cost
  test_data[:tracking_cost] = stamps.orders.details.tracking.cost
  test_data[:total_ship_cost] = stamps.orders.details.footer.total_ship_cost
end

Then /^Toolbar: Move to Shipped$/ do
  logger.step "Toolbar: Move to Shipped"
  grid = stamps.orders.grid
  raise "Order ID #{test_data[:order_id]} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num test_data[:order_id]) > 0
  grid.order_date.sort_descending
  grid.checkbox.check_order test_data[:order_id]
  grid.toolbar.move.to_shipped.cancel
  grid.toolbar.move.to_shipped.move
end

Then /^Toolbar: Move to Canceled$/ do
  logger.step "Toolbar: Move to Canceled"
  grid = stamps.orders.grid
  raise "Order ID #{test_data[:order_id]} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num test_data[:order_id]) > 0
  grid.order_date.sort_descending
  grid.checkbox.check_order test_data[:order_id]
  grid.toolbar.move.to_canceled.cancel
  grid.toolbar.move.to_canceled.move
end

Then /^Toolbar: Refresh Orders$/ do
  logger.step "Toolbar: Refresh Orders"
  stamps.orders.toolbar.refresh_orders
end

Then /^Print: Expect Print Modal is present$/ do
  logger.step "Test #{(stamps.orders.toolbar.print_btn.print_modal.present?)?"Passed":"Failed"}"
  stamps.orders.toolbar.print_btn.print_modal.present?.should be_truthy
end

Then /^Print: Print$/ do
  logger.step "Print"
  print_modal = stamps.orders.toolbar.print_btn.print_modal
  @ship_date = print_modal.ship_date.text
  @paper_tray = print_modal.paper_tray.text_box.text
  @printer = print_modal.printer.text_box.text
  @printing_on = print_modal.printing_on.text_box.text
  @printing_error = print_modal.print
end

Then /^Print: Open Reprint Modal$/ do
  logger.step "RePrint"
  @reprint_modal = stamps.orders.toolbar.reprint
end

Then /^Label Unavailable:  Expect Visible$/ do
  logger.step "Label Unavailable:  Expect Visible"
  case @reprint_modal
    when LabelUnavailable
      logger.step @reprint_modal.message
      label_unavailable_visible = @reprint_modal.present?
      logger.step "Test #{(label_unavailable_visible)?"Passed":"Failed"}"
      @reprint_modal.ok
      @reprint_modal.close
      label_unavailable_visible.should be true
    else
      logger.step "Test #{(@reprint_modal.present?)?"Passed":"Failed"}"
      @reprint_modal.present?.should be true
  end
end

Then /^Toolbar: Add second order$/ do
  logger.step "Toolbar: Add second order"
  @order_details = stamps.orders.toolbar.add.order_details
  test_data[:order_id_2] = @order_details.toolbar.order_id
end

Then /^Toolbar: Add third order$/ do
  logger.step "Toolbar: Add third order"
  @order_details = stamps.orders.toolbar.add.order_details
  test_data[:order_id_3] = @order_details.toolbar.order_id
end

Then /^Add a second order$/ do
  logger.step "Add a second order"
  first_row_order_id = stamps.orders.grid.order_id.row 1
  5.times{
    test_data[:order_id_2] = stamps.orders.toolbar.add.order_details_shipping_address_window
    if first_row_order_id.include? test_data[:order_id]
      sleep(3)
    end
    break unless first_row_order_id.include? test_data[:order_id_2]
  }
  logger.step "Second Order Id:  #{test_data[:order_id_2]}"
  stamps.orders.grid.checkbox.edit test_data[:order_id_2]
end

Then /^Fail the test$/ do
  logger.step "Fail the test"
  true.should eql  false
end

Then /^Test Features$/ do |count|
  logger.step "Test Features"
  stamps.orders.grid.checkbox.check_all
  count = stamps.orders.multi_order.order_count
  logger.step count
  stamps.orders.grid.checkbox.uncheck_all
end

