Then /^(?:[Cc]lick Orders Toolbar Add button|add new order|add [Oo]rder (\d+))$/ do |count|
  test_param[:old_balance]=stamps.navigation_bar.balance.amount
  stamps.orders.orders_grid.grid_column(:checkbox).uncheck(1)
  test_param[:order_id][(count.nil?)?test_param[:ord_id_ctr]+=1:count.to_i] =  stamps.orders.orders_toolbar.toolbar_add.click
  expect(stamps.orders.orders_grid.grid_column(:checkbox).checked?(1)).to be(true), "Orders Grid checkbox 1 is unchecked!"
  step "Save Order Details data"
end

Then /^Save Order Details data$/ do
  if stamps.orders.single_order_details.present?
    test_param[:country]=stamps.orders.single_order_details.ship_to.country.textbox.text
    test_param[:service_cost]=stamps.orders.single_order_details.service.cost
    test_param[:service]=stamps.orders.single_order_details.service.textbox.text
    test_param[:ship_from]=stamps.orders.single_order_details.single_ship_from.textbox.text
    test_param[:insure_for_cost]=stamps.orders.single_order_details.insure_for.cost
    test_param[:total_ship_cost]=stamps.orders.single_order_details.footer.total_ship_cost
    test_param[:awaiting_shipment_count]=stamps.orders.filter_panel.awaiting_shipment.count
    test_param[:tracking_cost]=stamps.orders.single_order_details.tracking.cost
    test_param[:tracking]=stamps.orders.single_order_details.tracking.textbox.text
  end
end

Then /^[Cc]lick [Oo]rders [Tt]oolbar [Pp]rint [Bb]utton$/ do
  step "Save Order Details data"
  expect(stamps.orders.orders_toolbar.toolbar_print.click).to match(/You have \d label ready to print/)
end

Then /^[Cc]lick [Oo]rders [Tt]oolbar [Ss]ettings [Bb]utton$/ do
  stamps.orders.orders_toolbar.orders_settings.click
end

Then /^[Ii]n Orders Toolbar, Refresh Orders$/ do
  stamps.orders.orders_toolbar.refresh_orders
end

#todo-Rob Revisit Reprinting tests, make it part of Printing tests
Then /^[Ii]n Print modal, Open Reprint Modal$/ do
  @reprint_modal=stamps.orders.orders_toolbar.reprint
end

Then /^Label Unavailable: Expect Visible$/ do
  case @reprint_modal
    when LabelUnavailable
      test_config.logger.step @reprint_modal.message
      label_unavailable_visible=@reprint_modal.present?
      #test_config.logger.step "Test #{(label_unavailable_visible)?"Passed":"Failed"}"
      @reprint_modal.ok
      @reprint_modal.close
      expect(label_unavailable_visible).to be(true)
    else
      #test_config.logger.step "Test #{(@reprint_modal.present?)?"Passed":"Failed"}"
      expect(@reprint_modal).to be_present
  end
end

Then /^[Ss]elect [Gg]rid [Tt]oolbar [Mm]ore [Aa]ctions item ([Ss]plit [Oo]rder|[Aa]pply [Bb]ulk [Aa]ction|[Cc]ombine [Oo]rders)$/ do |str|
  case str.downcase
    when /combine orders/
      #stamps.orders.orders_toolbar.toolbar_more_actions.select_combine_orders
    when /split order/
      stamps.orders.orders_toolbar.toolbar_more_actions.select_split_order #todo-ORDERSAUTO-3405 code review: select_split_order should return window title, do assertion on window title here.
    when /apply bulk action/
      #stamps.orders.orders_toolbar.toolbar_more_actions.select_apply_bulk_action
    else
      #ignore
  end
end

