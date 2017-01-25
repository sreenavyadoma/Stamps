Then /^In Orders Toolbar, click Add button$/ do
  begin
    #logger.step "In Orders Toolbar, click Add button"
    test_data[:old_balance] = stamps.navigation_bar.balance.amount
    stamps.orders.orders_grid.column.checkbox.uncheck(1)
    stamps.orders.toolbar.add.order
    step "Save Test Data"
  rescue Exception => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
    "Unable to add new orders".should eql e.message
  end
end

Then /^In Orders Toolbar, Refresh Orders$/ do
  #logger.step "In Orders Toolbar, Refresh Orders"
  stamps.orders.toolbar.refresh_orders
end

Then /^In Print modal, expect Print Modal is present$/ do
  stamps.orders.toolbar.print_btn.print_modal.present?.should be_truthy
end

Then /^In Print modal, click Print button$/ do
  #logger.step "Print"
  print_modal = stamps.orders.toolbar.print_btn.print_modal
  @ship_date = print_modal.ship_date.text
  @paper_tray = print_modal.paper_tray.text_box.text
  @printer = print_modal.printer.text_box.text
  @printing_on = print_modal.printing_on.text_box.text
  @printing_error = print_modal.print
  sleep 4
end

Then /^In Print modal, Open Reprint Modal$/ do
  #logger.step "RePrint"
  @reprint_modal = stamps.orders.toolbar.reprint
end

Then /^Label Unavailable:  Expect Visible$/ do
  #logger.step "Label Unavailable:  Expect Visible"
  case @reprint_modal
    when LabelUnavailable
      logger.step @reprint_modal.message
      label_unavailable_visible = @reprint_modal.present?
      #logger.step "Test #{(label_unavailable_visible)?"Passed":"Failed"}"
      @reprint_modal.ok
      @reprint_modal.close
      label_unavailable_visible.should be true
    else
      #logger.step "Test #{(@reprint_modal.present?)?"Passed":"Failed"}"
      @reprint_modal.present?.should be true
  end
end

Then /^In Orders Grid toolbar, select Move to Shipped$/ do
  stamps.orders.orders_grid.column.checkbox.order_checked?(test_data[:order_id]).should be true
  stamps.orders.toolbar.move_menu.to_shipped.cancel
  stamps.orders.toolbar.move_menu.to_shipped.move
end

Then /^In Orders Grid toolbar, select Move to Canceled$/ do
  stamps.orders.orders_grid.column.checkbox.order_checked?(test_data[:order_id]).should be true
  stamps.orders.toolbar.move_menu.to_canceled.cancel
  stamps.orders.toolbar.move_menu.to_canceled.move
end

Then /^In Orders Grid toolbar, select Move to Awaiting Shipment$/ do
  stamps.orders.orders_grid.column.checkbox.order_checked?(test_data[:order_id]).should be true
  stamps.orders.toolbar.move_menu.to_awaiting_shipment.cancel
  stamps.orders.toolbar.move_menu.to_awaiting_shipment.move
end

Then /^In Orders Grid toolbar, select Move to On Hold$/ do
  stamps.orders.orders_grid.column.checkbox.order_checked?(test_data[:order_id]).should be true
  stamps.orders.toolbar.move_menu.to_awaiting_shipment.cancel
  stamps.orders.toolbar.move_menu.to_awaiting_shipment.move
end


