Then /^Orders Toolbar: Add$/ do
  begin
    logger.step "Orders Toolbar: Add"
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

Then /^Orders Toolbar: Refresh Orders$/ do
  logger.step "Orders Toolbar: Refresh Orders"
  stamps.orders.toolbar.refresh_orders
end

Then /^Print Modal: Expect Print Modal is present$/ do
  logger.step "Test #{(stamps.orders.toolbar.print_btn.print_modal.present?)?"Passed":"Failed"}"
  stamps.orders.toolbar.print_btn.print_modal.present?.should be_truthy
end

Then /^Print Modal: Print$/ do
  logger.step "Print"
  print_modal = stamps.orders.toolbar.print_btn.print_modal
  @ship_date = print_modal.ship_date.text
  @paper_tray = print_modal.paper_tray.text_box.text
  @printer = print_modal.printer.text_box.text
  @printing_on = print_modal.printing_on.text_box.text
  @printing_error = print_modal.print
  sleep 4
end

Then /^Print Modal: Open Reprint Modal$/ do
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

Then /^Orders Toolbar: Add second order$/ do
  logger.step "Orders Toolbar: Add second order"
  test_data[:order_id_2] = stamps.orders.order_details.toolbar.order_id
end

Then /^Orders Toolbar: Add third order$/ do
  logger.step "Orders Toolbar: Add third order"
  test_data[:order_id_3] = stamps.orders.order_details.toolbar.order_id
end


Then /^Fail the test$/ do
  logger.step "Fail the test"
  true.should eql  false
end

Then /^Test Features$/ do |count|
  logger.step "Test Features"
  stamps.orders.orders_grid.column.checkbox.check_all
  count = stamps.orders.multi_order.order_count
  logger.step count
  stamps.orders.orders_grid.column.checkbox.uncheck_all
end

