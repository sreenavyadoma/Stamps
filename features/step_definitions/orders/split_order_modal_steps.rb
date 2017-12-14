Then /^[Ee]xpect item details in Split order Modal are correct$/ do
  item_number=1
  20.times do
    test_param[:details_associated_items]
    expect(stamps.orders.orders_toolbar.toolbar_more_actions.split_order.item_qty[item_number-1]).to be test_param[:details_associated_items][item_number][:item_qty]
    expect(stamps.orders.orders_toolbar.toolbar_more_actions.split_order.item_id[item_number-1]).to be test_param[:details_associated_items][item_number][:item_id]
    expect(stamps.orders.orders_toolbar.toolbar_more_actions.split_order.item_description[item_number-1]).to be test_param[:details_associated_items][item_number][:item_description]
  end
end

Then /^[Ss]et new order quantity for item (\d+) to (\d+)$/ do |item_number, quantity|
  stamps.orders.orders_toolbar.toolbar_more_actions.split_order.new_item_quantity[item_number-1].set quantity
end

Then /^[Cc]onfirm order split$/ do
  stamps.orders.orders_toolbar.toolbar_more_actions.split_order.confirm_order_split
  test_param[:split_order_id] = test_param[:order_id].values.last + "-1"
end

Then /[Cc]onfirm new order is selected$/ do
  expect(stamps.orders.single_order_details.toolbar.order_id).to eql test_param[:split_order_id]
end