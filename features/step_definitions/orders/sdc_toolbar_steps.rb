Then /^[Aa]dd new order$/ do
  step 'add order 1'
end

Then /^[Aa]dd [Oo]rder (\d+)$/ do |count|
  if SdcEnv.new_framework
    #todo TestData.store[:old_balance] = SdcWebsite.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
    #todo stamps.orders.orders_grid.grid_column(:checkbox).uncheck(1)
    step 'Wait until order toolbar present 40, 3'
    SdcOrders.toolbar.add.click
    SdcOrders.order_details.order_id.wait_until_present
    TestData.store[:order_id][count.to_i] = SdcOrders.order_details.order_id.text_value.parse_digits
    #todo expect(stamps.orders.orders_grid.grid_column(:checkbox).checked?(1)).to be(true), "Orders Grid checkbox 1 is unchecked!"
    step "Save Order Details data"
  else
    TestData.store[:old_balance] = stamps.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
    stamps.orders.orders_grid.grid_column(:checkbox).uncheck(1)
    TestData.store[:order_id][count.to_i] = stamps.orders.orders_toolbar.toolbar_add.click
    expect(stamps.orders.orders_grid.grid_column(:checkbox).checked?(1)).to be(true), "Orders Grid checkbox 1 is unchecked!"
    step "Save Order Details data"
  end
  TestData.store[:ord_id_ctr] += 1
end

Then /^Save Order Details data$/ do
  step "Expect Order Details is present"
  if SdcEnv.new_framework
    TestData.store[:country] = SdcOrders.order_details.ship_to.domestic.country.text_field.text_value
    TestData.store[:service_cost] = SdcOrders.order_details.service.cost.text_value.dollar_amount_str.to_f.round(2)
    TestData.store[:service] = SdcOrders.order_details.service.text_field.text_value
    TestData.store[:ship_from] = SdcOrders.order_details.ship_from.text_field.text_value
    TestData.store[:insure_for_cost] = SdcOrders.order_details.insurance.cost.text_value.dollar_amount_str.to_f.round(2)
    TestData.store[:total_ship_cost] = SdcOrders.order_details.footer.total_ship_cost.text_value.dollar_amount_str.to_f.round(2)
    TestData.store[:awaiting_shipment_count] = SdcOrders.filter_panel.awaiting_shipment.count.text_value.to_f.round(2)
    TestData.store[:tracking_cost] = SdcOrders.order_details.tracking.cost.text_value.dollar_amount_str.to_f.round(2)
    TestData.store[:tracking] = SdcOrders.order_details.tracking.text_field.text_value
  else
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
  if SdcEnv.new_framework
    SdcOrders.order_details.footer.print.safe_click
    expect(SdcOrders.modals.print_modal.title).to be_present
    expect(SdcOrders.modals.print_modal.title).to match(/You have \d label ready to print/)
  else
    expect(stamps.orders.orders_toolbar.toolbar_print.click).to match(/You have \d label ready to print/)
  end
end