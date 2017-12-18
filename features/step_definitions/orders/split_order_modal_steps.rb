Then /^[Ee]xpect item details in Split order Modal are correct$/ do

  #stamps.orders.single_order_details.items_ordered.item(item_number.to_i).item_qty.set(test_param[:details_associated_items][item_number][:item_qty]


  item_number=1
  20.times do
    expect(stamps.orders.orders_toolbar.toolbar_more_actions.split_order.item(item_number-1).original_item_qty).to eq test_param[:details_associated_items][item_number.to_s][:item_qty]
    expect(stamps.orders.orders_toolbar.toolbar_more_actions.split_order.item(item_number-1).original_item_id).to eq test_param[:details_associated_items][item_number.to_s][:item_id]
    expect(stamps.orders.orders_toolbar.toolbar_more_actions.split_order.item(item_number-1).original_item_description).to eq test_param[:details_associated_items][item_number.to_s][:item_description]
    #expect(stamps.orders.orders_toolbar.toolbar_more_actions.split_order.item_qty[item_number-1]).to be test_param[:details_associated_items][item_number][:item_qty]
    #expect(stamps.orders.orders_toolbar.toolbar_more_actions.split_order.item_id[item_number-1]).to be test_param[:details_associated_items][item_number][:item_id]
    #expect(stamps.orders.orders_toolbar.toolbar_more_actions.split_order.item_description[item_number-1]).to be test_param[:details_associated_items][item_number][:item_description]
    item_number+=1
    break if item_number > test_param[:details_associated_items].length
  end
  expect(stamps.orders.orders_toolbar.toolbar_more_actions.split_order.item(item_number-1).original_item_qty).nil?
end

Then /^[Ee]xpect [Ss]plit [Oo]rder [Mm]odal original order id is correct$/ do
  expect(stamps.orders.orders_toolbar.toolbar_more_actions.split_order.original_order_id).to eql test_param[:order_id].values.last
end

Then /^[Ee]xpect [Ss]plit [Oo]rder [Mm]odal default new order id is correct$/ do
  expect(stamps.orders.orders_toolbar.toolbar_more_actions.split_order.new_order_id.text).to eql (test_param[:order_id].values.last + "-1")
end

Then /^[Ss]et new order number to (.*)$/ do |number|
  stamps.orders.orders_toolbar.toolbar_more_actions.split_order.new_order_id.set number
end

Then /^[Ss]et new order quantity for item (\d+) to (\d+)$/ do |item_number, quantity|
  stamps.orders.orders_toolbar.toolbar_more_actions.split_order.item(item_number.to_i-1).new_item_qty.set quantity
end

Then /^[Cc]onfirm order split$/ do
  test_param[:split_order_id] = stamps.orders.orders_toolbar.toolbar_more_actions.split_order.new_order_id.text
  stamps.orders.orders_toolbar.toolbar_more_actions.split_order.confirm_order_split
end

Then /[Cc]onfirm new order is selected$/ do
  expect(stamps.orders.single_order_details.toolbar.order_id).to eql test_param[:split_order_id]
end