
Then /^(?:[Cc]lick Orders Toolbar Add button|add new order|add [Oo]rder (\d+))$/ do |count|
  if SdcEnv.mobile
    TestData.store[:old_balance] = SdcWebsite.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
    stamps.orders.orders_grid.grid_column(:checkbox).uncheck(1)
    TestData.store[:order_id][(count.nil?) ? TestData.store[:ord_id_ctr] += 1 : count.to_i] = stamps.orders.orders_toolbar.toolbar_add.click
    expect(stamps.orders.orders_grid.grid_column(:checkbox).checked?(1)).to be(true), "Orders Grid checkbox 1 is unchecked!"
    step "Save Order Details data"
  else
    if SdcEnv.browser
      TestData.store[:old_balance] = stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
      stamps.orders.orders_grid.grid_column(:checkbox).uncheck(1)
      TestData.store[:order_id][(count.nil?) ? TestData.store[:ord_id_ctr] += 1 : count.to_i] = stamps.orders.orders_toolbar.toolbar_add.click
      expect(stamps.orders.orders_grid.grid_column(:checkbox).checked?(1)).to be(true), "Orders Grid checkbox 1 is unchecked!"
      step "Save Order Details data"
    else
      raise "Environment is not defined!"
    end
  end
end

Then /^Save Order Details data$/ do
  if stamps.orders.order_details.present?
    TestData.store[:country] = stamps.orders.order_details.ship_to.domestic.country.textbox.text
    TestData.store[:service_cost] = stamps.orders.order_details.service.cost.text.dollar_amount_str.to_f.round(2)
    TestData.store[:service] = stamps.orders.order_details.service.textbox.text
    TestData.store[:ship_from] = stamps.orders.order_details.single_ship_from.textbox.text
    TestData.store[:insure_for_cost] = stamps.orders.order_details.insure_for.cost.text.dollar_amount_str.to_f.round(2)
    TestData.store[:total_ship_cost] = stamps.orders.order_details.footer.total_ship_cost.text.dollar_amount_str.to_f.round(2)
    TestData.store[:awaiting_shipment_count] = stamps.orders.filter_panel.awaiting_shipment.count
    TestData.store[:tracking_cost] = stamps.orders.order_details.tracking.cost.text.dollar_amount_str.to_f.round(2)
    TestData.store[:tracking] = stamps.orders.order_details.tracking.textbox.text
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
  @reprint_modal = stamps.orders.orders_toolbar.reprint
end

Then /^Label Unavailable: Expect Visible$/ do
  case @reprint_modal
    when LabelUnavailable
      SdcLog.step @reprint_modal.message
      label_unavailable_visible = @reprint_modal.present?
      #StampsTest.log.step "Test #{(label_unavailable_visible)?"Passed":"Failed"}"
      @reprint_modal.ok
      @reprint_modal.close
      expect(label_unavailable_visible).to be(true)
    else
      #SdcLog.step "Test #{(@reprint_modal.present?)?"Passed":"Failed"}"
      expect(@reprint_modal).to be_present
  end
end

Then /^[Ss]elect [Gg]rid [Tt]oolbar [Mm]ore [Aa]ctions item ([Ss]plit [Oo]rder|[Aa]pply [Bb]ulk [Aa]ction|[Cc]ombine [Oo]rders)$/ do |str|
  case str.downcase
    when /combine orders/
      #stamps.orders.orders_toolbar.toolbar_more_actions.select_combine_orders
    when /split order/
      expect(stamps.orders.orders_toolbar.toolbar_more_actions.select_split_order).to match(/Split Order #(?:\d)+/)
    when /apply bulk action/
      #stamps.orders.orders_toolbar.toolbar_more_actions.select_apply_bulk_action
    else
      # ignore
  end
end

