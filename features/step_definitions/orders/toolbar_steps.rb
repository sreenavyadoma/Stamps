Then /^Toolbar: Add$/ do
  log.info "Toolbar: Add"
  log.info "Toolbar: Add"
  @old_balance = orders.navigation_bar.balance.amount
  orders.grid.checkbox.uncheck 1
  @order_details = orders.toolbar.add.click
  @order_id = @order_details.toolbar.order_id
  log.info "New Order ID #{@order_id}"
  @awaiting_shipment_count = orders.filter.awaiting_shipment_count
  @item_count = 0
  @index = 0
end

Then /^Toolbar: Move to Shipped$/ do
  log.info "Toolbar: Move to Shipped"
  grid = orders.grid
  raise "Order ID #{@order_id} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @order_id) > 0
  grid.order_date.sort_descending
  grid.checkbox.check_order_id @order_id
  grid.toolbar.move.to_shipped.cancel
  grid.toolbar.move.to_shipped.move
  todo-rob
end

Then /^Toolbar: Move to Canceled$/ do
  log.info "Toolbar: Move to Canceled"
  grid = orders.grid
  raise "Order ID #{@order_id} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @order_id) > 0
  grid.order_date.sort_descending
  grid.checkbox.check_order_id @order_id
  grid.toolbar.move.to_canceled.cancel
  grid.toolbar.move.to_canceled.move
end

Then /^Toolbar: Refresh Orders$/ do
  log.info "Toolbar: Refresh Orders"
  orders.toolbar.refresh_orders
end

Then /^Print: Expect Print Modal is present$/ do
  expectation = "present"
  if @print_window.nil?
    expectation = "not present"
  else
    expectation = "not present" unless @print_window.present?
  end

  log.info "Test #{(expectation=="present")?"Passed":"Failed"}"
  expectation.should eql "present"
end

Then /^Print: Print$/ do
  log.info "Print"
  print_modal = orders.toolbar.print_order.click
  @ship_date = print_modal.ship_date.text
  @paper_tray = print_modal.paper_tray.text_box.text
  @printer = print_modal.printer.text_box.text
  @printing_on = print_modal.printing_on.text_box.text
  @printing_error = print_modal.print
end

Then /^Print: Open Reprint Modal$/ do
  log.info "RePrint"
  @reprint_modal = orders.toolbar.reprint
end

Then /^Label Unavailable:  Expect Visible$/ do
  log.info "Label Unavailable:  Expect Visible"
  case @reprint_modal
    when LabelUnavailable
      log.info @reprint_modal.message
      label_unavailable_visible = @reprint_modal.present?
      log.info "Test #{(label_unavailable_visible)?"Passed":"Failed"}"
      @reprint_modal.ok
      @reprint_modal.close
      label_unavailable_visible.should be true
    else
      log.info "Test #{(@reprint_modal.present?)?"Passed":"Failed"}"
      @reprint_modal.present?.should be true
  end
end

Then /^Toolbar: Add second order$/ do
  log.info "Toolbar: Add second order"
  @order_details = orders.toolbar.add.click
  @order_id_2 = @order_details.toolbar.order_id
end

Then /^Toolbar: Add third order$/ do
  log.info "Toolbar: Add third order"
  @order_details = orders.toolbar.add.click
  @order_id_3 = @order_details.toolbar.order_id
end

Then /^Add a second order$/ do
  log.info "Add a second order"
  first_row_order_id = orders.grid.order_id.row 1
  5.times{
    @order_id_2 = orders.toolbar.add.click_shipping_address_window
    if first_row_order_id.include? @order_id
      sleep(3)
    end
    break unless first_row_order_id.include? @order_id_2
  }
  log.info "Second Order Id:  #{@order_id_2}"
  orders.grid.checkbox.edit @order_id_2
end

Then /^Fail the test$/ do
  log.info "Fail the test"
  true.should eql  false
end

Then /^Test Features$/ do |count|
  log.info "Test Features"
  orders.grid.checkbox.check_all
  count = orders.multi_order.order_count
  log.info count
  orders.grid.checkbox.uncheck_all
end

