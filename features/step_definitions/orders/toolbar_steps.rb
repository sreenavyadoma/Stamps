Then /^Toolbar: Add$/ do
  logger.info "Toolbar: Add"
  web_apps.orders.grid.checkbox.uncheck 1
  @order_details = web_apps.orders.toolbar.add.click #todo-rob refactor click
  @order_id = @order_details.toolbar.order_id
  step "Save Shipping Costs Data"
  logger.info "New Order ID #{@order_id}"
  @awaiting_shipment_count = web_apps.orders.filter.awaiting_shipment_count
  @item_count = 0
  @index = 0
end

Then /^Toolbar: Move to Shipped$/ do
  logger.info "Toolbar: Move to Shipped"
  grid = web_apps.orders.grid
  raise "Order ID #{@order_id} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @order_id) > 0
  grid.order_date.sort_descending
  grid.checkbox.check_order_id @order_id
  grid.toolbar.move.to_shipped.cancel
  grid.toolbar.move.to_shipped.move
end

Then /^Toolbar: Move to Canceled$/ do
  logger.info "Toolbar: Move to Canceled"
  grid = web_apps.orders.grid
  raise "Order ID #{@order_id} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @order_id) > 0
  grid.order_date.sort_descending
  grid.checkbox.check_order_id @order_id
  grid.toolbar.move.to_canceled.cancel
  grid.toolbar.move.to_canceled.move
end

Then /^Toolbar: Refresh Orders$/ do
  logger.info "Toolbar: Refresh Orders"
  web_apps.orders.toolbar.refresh_orders
end

Then /^Print: Expect Print Modal is present$/ do
  expectation = "present"
  if web_apps.orders.toolbar.print_btn.print_modal.nil?
    expectation = "not present"
  else
    expectation = "not present" unless web_apps.orders.toolbar.print_btn.print_modal.present?
  end

  logger.info "Test #{(expectation=="present")?"Passed":"Failed"}"
  expectation.should eql "present"
end

Then /^Print: Print$/ do
  logger.info "Print"
  print_modal = web_apps.orders.toolbar.print_btn.print_modal
  @ship_date = print_modal.ship_date.text
  @paper_tray = print_modal.paper_tray.text_box.text
  @printer = print_modal.printer.text_box.text
  @printing_on = print_modal.printing_on.text_box.text
  @printing_error = print_modal.print
end

Then /^Print: Open Reprint Modal$/ do
  logger.info "RePrint"
  @reprint_modal = web_apps.orders.toolbar.reprint
end

Then /^Label Unavailable:  Expect Visible$/ do
  logger.info "Label Unavailable:  Expect Visible"
  case @reprint_modal
    when LabelUnavailable
      logger.info @reprint_modal.message
      label_unavailable_visible = @reprint_modal.present?
      logger.info "Test #{(label_unavailable_visible)?"Passed":"Failed"}"
      @reprint_modal.ok
      @reprint_modal.close
      label_unavailable_visible.should be true
    else
      logger.info "Test #{(@reprint_modal.present?)?"Passed":"Failed"}"
      @reprint_modal.present?.should be true
  end
end

Then /^Toolbar: Add second order$/ do
  logger.info "Toolbar: Add second order"
  @order_details = web_apps.orders.toolbar.add.click
  @order_id_2 = @order_details.toolbar.order_id
end

Then /^Toolbar: Add third order$/ do
  logger.info "Toolbar: Add third order"
  @order_details = web_apps.orders.toolbar.add.click
  @order_id_3 = @order_details.toolbar.order_id
end

Then /^Add a second order$/ do
  logger.info "Add a second order"
  first_row_order_id = web_apps.orders.grid.order_id.row 1
  5.times{
    @order_id_2 = web_apps.orders.toolbar.add.click_shipping_address_window
    if first_row_order_id.include? @order_id
      sleep(3)
    end
    break unless first_row_order_id.include? @order_id_2
  }
  logger.info "Second Order Id:  #{@order_id_2}"
  web_apps.orders.grid.checkbox.edit @order_id_2
end

Then /^Fail the test$/ do
  logger.info "Fail the test"
  true.should eql  false
end

Then /^Test Features$/ do |count|
  logger.info "Test Features"
  web_apps.orders.grid.checkbox.check_all
  count = web_apps.orders.multi_order.order_count
  logger.info count
  web_apps.orders.grid.checkbox.uncheck_all
end

