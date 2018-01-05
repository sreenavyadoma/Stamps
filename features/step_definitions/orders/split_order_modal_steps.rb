Then /^[Ee]xpect item details in [Ss]plit [Oo]rder Modal are correct$/ do
  item_number=1
  20.times do
    expect(stamps.orders.modals.split_order_modal.item(item_number-1).original_item_qty).to eq test_param[:details_associated_items][item_number.to_s][:item_qty] #confirm quantity of item in Split Order modal matches quantity of same item in single order details form
    expect(stamps.orders.modals.split_order_modal.item(item_number-1).original_item_id).to eq test_param[:details_associated_items][item_number.to_s][:item_id] #confirm id of item in Split Order modal matches id of same item in single order details form
    expect(stamps.orders.modals.split_order_modal.item(item_number-1).original_item_description).to eq test_param[:details_associated_items][item_number.to_s][:item_description] #confirm description of item in Split Order modal matches description of same item in single order details form
    item_number+=1
    break if item_number > test_param[:details_associated_items].length #break once all items in single order details form have been compared
  end
  expect(stamps.orders.modals.split_order_modal.item(item_number-1).original_item_qty).nil? #confirm that there are no other items in split order modal
end

Then /^[Ee]xpect [Ss]plit [Oo]rder [Mm]odal original order id is correct$/ do
  expect(stamps.orders.modals.split_order_modal.original_order_id).to eql test_param[:order_id].values.last #confirm original order id in Split order modal matches id of the last created order
end

Then /^[Ee]xpect [Ss]plit [Oo]rder [Mm]odal default new order id is correct$/ do
  expect(stamps.orders.modals.split_order_modal.new_order_id.text).to eql (test_param[:order_id].values.last + "-1") #confirm that the default new order id is the same as the original id with "-1" appended to it
end

Then /^[Ss]et [Ss]plit [Oo]rder new order number to (.*)$/ do |number|
  stamps.orders.modals.split_order_modal.new_order_id.set (number.downcase=='random')?(test_helper.random_phone_number):number
end

Then /^[Ss]et [Ss]plit [Oo]rder new order quantity for item (\d+) to (\d+)$/ do |item_number, quantity|
  stamps.orders.modals.split_order_modal.item(item_number.to_i-1).new_item_qty.set quantity
end

Then /^[Cc]lick [Ss]plit [Oo]rder modal confirm button$/ do
  test_param[:split_order_id] = stamps.orders.modals.split_order_modal.new_order_id.text  #save the new order id
  stamps.orders.modals.split_order_modal.confirm_order_split
end

Then /[Ee]xpect new order from [Ss]plit [Oo]rder modal is selected in orders grid$/ do
  expect(stamps.orders.single_order_details.toolbar.order_id).to eql test_param[:split_order_id] #confirm the order id in the single order details form matches the saved new order id
end