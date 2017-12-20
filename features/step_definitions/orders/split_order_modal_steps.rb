Then /^[Ee]xpect item details in [Ss]plit [Oo]rder Modal are correct$/ do

  #stamps.orders.single_order_details.items_ordered.item(item_number.to_i).item_qty.set(test_param[:details_associated_items][item_number][:item_qty]


  item_number=1
  20.times do
    expect(stamps.orders.modals.split_order_modal.item(item_number-1).original_item_qty).to eq test_param[:details_associated_items][item_number.to_s][:item_qty]
    expect(stamps.orders.modals.split_order_modal.item(item_number-1).original_item_id).to eq test_param[:details_associated_items][item_number.to_s][:item_id]
    expect(stamps.orders.modals.split_order_modal.item(item_number-1).original_item_description).to eq test_param[:details_associated_items][item_number.to_s][:item_description]
    item_number+=1
    break if item_number > test_param[:details_associated_items].length
  end
  expect(stamps.orders.modals.split_order_modal.item(item_number-1).original_item_qty).nil?
end

Then /^[Ee]xpect [Ss]plit [Oo]rder [Mm]odal original order id is correct$/ do
  expect(stamps.orders.modals.split_order_modal.original_order_id).to eql test_param[:order_id].values.last
end

Then /^[Ee]xpect [Ss]plit [Oo]rder [Mm]odal default new order id is correct$/ do
  expect(stamps.orders.modals.split_order_modal.new_order_id.text).to eql (test_param[:order_id].values.last + "-1")
end

Then /^[Ss]et [Ss]plit [Oo]rder new order number to (.*)$/ do |number|
  stamps.orders.modals.split_order_modal.new_order_id.set (number.downcase=='random')?(test_helper.random_phone_number):number
end

Then /^[Ss]et [Ss]plit [Oo]rder new order quantity for item (\d+) to (\d+)$/ do |item_number, quantity|
  stamps.orders.modals.split_order_modal.item(item_number.to_i-1).new_item_qty.set quantity
end

Then /^[Cc]lick [Ss]plit [Oo]rder modal confirm button$/ do
  test_param[:split_order_id] = stamps.orders.modals.split_order_modal.new_order_id.text
  stamps.orders.modals.split_order_modal.confirm_order_split
end

Then /[Ee]xpect new order from [Ss]plit [Oo]rder modal is selected in orders grid$/ do
  expect(stamps.orders.single_order_details.toolbar.order_id).to eql test_param[:split_order_id]
end