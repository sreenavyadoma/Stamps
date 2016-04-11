When /^Toolbar: Add$/ do
  log.info "Step: Toolbar: Add"
  log.info "Toolbar: Add"
  @old_balance = orders.navigation_bar.balance.amount
  orders.grid.checkbox.uncheck 1
  @order_details = orders.toolbar.add
  @order_id = @order_details.toolbar.order_id
  log.info "New Order ID #{@order_id}"
  @awaiting_shipment_count = orders.filter.awaiting_shipment_count
  @item_count = 0
  @index = 0
end

Then /^Toolbar: Refresh Orders$/ do
  log.info "Toolbar: Refresh Orders"
  orders.toolbar.refresh_orders
end

When /^Print: Open Modal$/ do
  log.info "Step: Print: Open Modal"
  @print_window = orders.toolbar.print_modal
end

When /^Open Reprint Modal$/ do
  log.info "Step: RePrint"
  @reprint_modal = orders.toolbar.reprint
end

When /^Label Unavailable:  Expect Visible$/ do
  log.info "Step: Label Unavailable:  Expect Visible"
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


When /^Print: Print$/ do
  log.info "Step: Print"
  print_modal = orders.toolbar.print_modal
  @ship_date = print_modal.ship_date.text
  @paper_tray = print_modal.paper_tray.text_box.text
  @printer = print_modal.printer.text_box.text
  @printing_on = print_modal.printing_on.text_box.text
  @printing_error = print_modal.print
end

Then /^I Add a second order$/ do
  log.info "Step: I Add a second order"
  @order_details = orders.toolbar.add
  @order_id_2 = @order_details.toolbar.order_id
end

Then /^I Add a third order$/ do
  log.info "Step: I Add a third order"
  @order_details = orders.toolbar.add
  @order_id_3 = @order_details.toolbar.order_id
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

