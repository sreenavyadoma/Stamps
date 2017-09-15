Then /^(?:[Cc]lick Orders Toolbar Add button|add new order|add [Oo]rder (\d+))$/ do |order_count|
  test_param[:old_balance] = stamps.navigation_bar.balance.amount
  stamps.orders.orders_grid.column.checkbox.uncheck(1)
  stamps.orders.orders_toolbar.add.order_details
  order_count = (order_count.nil?)?0:order_count.to_i
  test_param[:order_id][order_count] = stamps.orders.order_details.toolbar.order_id
  step "Save Order Details data"
end

Then /^Save Order Details data$/ do
  if stamps.orders.order_details.present?
    test_param[:country] = stamps.orders.order_details.ship_to.country.textbox.text
    test_param[:service_cost] = stamps.orders.order_details.service.cost
    test_param[:service] = stamps.orders.order_details.service.textbox.text
    test_param[:ship_from] = stamps.orders.order_details.ship_from.textbox.text
    test_param[:insure_for_cost] = stamps.orders.order_details.insure_for.cost
    test_param[:total_ship_cost] = stamps.orders.order_details.footer.total_ship_cost
    test_param[:awaiting_shipment_count] = stamps.orders.filter_panel.awaiting_shipment.count
    test_param[:tracking_cost] = stamps.orders.order_details.tracking.cost
    test_param[:tracking] = stamps.orders.order_details.tracking.textbox.text
  end
end

Then /^[Ii]n Orders Toolbar, Refresh Orders$/ do
  stamps.orders.orders_toolbar.refresh_orders
end

Then /^[Ee]xpect [Pp]rint [Mm]odal [Pp]rint [Mm]odal is present$/ do
  expect(stamps.orders.orders_toolbar.print_btn.print_modal.present?).to be_truthy
end

Then /^[Cc]lick [Pp]rint [Mm]odal [Pp]rint button$/ do
  print_modal = stamps.orders.orders_toolbar.print_btn.print_modal
  @ship_date = print_modal.ship_date.text
  @paper_tray = print_modal.paper_tray.textbox.text
  @printer = print_modal.printer.textbox.text
  @printing_on = print_modal.printing_on.textbox.text
  @printing_error = print_modal.print
  sleep(4)
end

Then /^[Ii]n Print modal, Open Reprint Modal$/ do
  @reprint_modal = stamps.orders.orders_toolbar.reprint
end

Then /^Label Unavailable:  Expect Visible$/ do
  #test_config.logger.step "Label Unavailable:  Expect Visible"
  case @reprint_modal
    when LabelUnavailable
      test_config.logger.step @reprint_modal.message
      label_unavailable_visible = @reprint_modal.present?
      #test_config.logger.step "Test #{(label_unavailable_visible)?"Passed":"Failed"}"
      @reprint_modal.ok
      @reprint_modal.close
      expect(label_unavailable_visible).to be(true)
    else
      #test_config.logger.step "Test #{(@reprint_modal.present?)?"Passed":"Failed"}"
      expect(@reprint_modal.present?).to be(true)
  end
end


