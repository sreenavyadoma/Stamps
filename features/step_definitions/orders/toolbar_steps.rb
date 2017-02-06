Then /^(?:I|i)n Orders Toolbar, click Add button$/ do
  begin
    test_data[:old_balance] = stamps.navigation_bar.balance.amount
    stamps.orders.orders_grid.column.checkbox.uncheck(1)
    stamps.orders.toolbar.add.order_details
    test_data[:order_id] = stamps.orders.order_details.toolbar.order_id
    step "Save Order Details data"
  rescue Exception => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
    e.message.should eql "Add new order"
  end
end

Then /^Save Order Details data$/ do
  stamps.orders.order_details.present?.should be true
  test_data[:country] = stamps.orders.order_details.ship_to.country.text_box.text
  test_data[:service_cost] = stamps.orders.order_details.service.cost
  test_data[:service] = stamps.orders.order_details.service.text_box.text
  test_data[:ship_from] = stamps.orders.order_details.ship_from.text_box.text
  test_data[:insure_for] = stamps.orders.order_details.insure_for.value
  test_data[:insure_for_cost] = stamps.orders.order_details.insure_for.cost
  test_data[:total_ship_cost] = stamps.orders.order_details.footer.total_ship_cost
  test_data[:awaiting_shipment_count] = stamps.orders.filter_panel.awaiting_shipment.count
  test_data[:tracking_cost] = stamps.orders.order_details.tracking.cost
  test_data[:tracking] = stamps.orders.order_details.tracking.text_box.text
end

Then /^(?:I|i)n Orders Toolbar, Refresh Orders$/ do
  stamps.orders.toolbar.refresh_orders
end

Then /^(?:I|i)n Print modal, expect Print Modal is present$/ do
  stamps.orders.toolbar.print_btn.print_modal.present?.should be_truthy
end

Then /^(?:I|i)n Print modal, click Print button$/ do
  print_modal = stamps.orders.toolbar.print_btn.print_modal
  @ship_date = print_modal.ship_date.text
  @paper_tray = print_modal.paper_tray.text_box.text
  @printer = print_modal.printer.text_box.text
  @printing_on = print_modal.printing_on.text_box.text
  @printing_error = print_modal.print
  sleep(4)
end

Then /^(?:I|i)n Print modal, Open Reprint Modal$/ do
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

Then /^(?:I|i)n Orders Grid toolbar, select Move to Shipped$/ do
  stamps.orders.toolbar.move_drop_down.enabled?.should be true
  stamps.orders.toolbar.move_drop_down.move_to_shipped.move
end

Then /^(?:I|i)n Orders Grid toolbar, select Move to Canceled$/ do
  stamps.orders.toolbar.move_drop_down.enabled?.should be true
  stamps.orders.toolbar.move_drop_down.move_to_canceled.move
end

Then /^(?:I|i)n Orders Grid toolbar, select Move to Awaiting Shipment$/ do
  stamps.orders.toolbar.move_drop_down.enabled?.should be true
  stamps.orders.toolbar.move_drop_down.move_to_awaiting_shipment.move
end

Then /^(?:I|i)n Orders Grid toolbar, select Move to On Hold until today plus (\d+)$/ do |day|
  step "In Orders Grid toolbar, select Move to On Hold until #{(Date.today + day.to_i).strftime("%m/%d/%Y")}"
end

Then /^(?:I|i)n Orders Grid toolbar, select Move to On Hold until (\d+)\/(\d+)\/(\d+)$/ do |month, day, year|
  stamps.orders.toolbar.move_drop_down.enabled?.should be true
  stamps.orders.toolbar.move_drop_down.move_to_on_hold.cancel
  stamps.orders.toolbar.move_drop_down.move_to_on_hold.hold_until.set("#{month}/#{day}/#{year}")
  stamps.orders.toolbar.move_drop_down.move_to_on_hold.move
end


