Then /^add new order$/ do
  step 'add order 0'
end

Then /^add order (\d+)$/ do |count|
  #todo TestData.store[:old_balance] = SdcWebsite.navigation_bar.balance.balance_amount.text.dollar_amount_str.to_f
  #todo stamps.orders.orders_grid.grid_column(:checkbox).uncheck(1)
  #step 'Wait until order toolbar present 40, 3'

  toolbar = SdcOrders.toolbar
  order_details = SdcOrders.order_details
  toolbar.add.wait_until_present(timeout: 10)
  SdcOrders.grid.body.wait_until_present(timeout: 20)
  toolbar.add.click
  order_details.title.wait_until_present(timeout: 30)
  order_details.order_id.wait_until_present(timeout: 10)
  TestData.hash[:order_id][count.to_i] = order_details.order_id.text_value.parse_digits

  #todo expect(stamps.orders.orders_grid.grid_column(:checkbox).checked?(1)).to be(true), "Orders Grid checkbox 1 is unchecked!"
  step 'Save Order Details data'
  TestData.hash[:ord_id_ctr] += 1
end

Then /^Save Order Details data$/ do
  step 'expect order details is present'
  TestData.hash[:country] = SdcOrders.order_details.ship_to.domestic.country.text_field.text_value
  TestData.hash[:service_cost] = SdcOrders.order_details.service.cost.text_value.dollar_amount_str.to_f.round(2)
  TestData.hash[:service] = SdcOrders.order_details.service.text_field.text_value
  TestData.hash[:ship_from] = SdcOrders.order_details.ship_from.text_field.text_value
  TestData.hash[:insure_for_cost] = SdcOrders.order_details.insure_for.cost.text_value.dollar_amount_str.to_f.round(2)
  TestData.hash[:total_ship_cost] = SdcOrders.order_details.footer.total_ship_cost.text_value.dollar_amount_str.to_f.round(2)
  TestData.hash[:awaiting_shipment_count] = SdcOrders.filter_panel.awaiting_shipment.count.text_value.to_f.round(2)
  if TestData.hash[:country] == "United States"
    TestData.hash[:tracking_cost] = SdcOrders.order_details.tracking.cost.text_value.dollar_amount_str.to_f.round(2)
    TestData.hash[:tracking] = SdcOrders.order_details.tracking.text_field.text_value
  end
end

Then /^click orders toolbar print button$/ do
  step 'Save Order Details data'
  SdcOrders.order_details.footer.print.click
  expect(SdcOrders.modals.print.title).to be_present
  expect(SdcOrders.modals.print.title.text_value).to match(/You have \d label ready to print/)
end