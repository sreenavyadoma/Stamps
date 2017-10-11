
Then /^[Ss]elect [Gg]rid [Tt]oolbar [Mm]ove [Mm]enu item (.*)$/ do |str|
  expect(['Move to Shipped', 'Move to Canceled', 'Move to On Hold', 'Move to Awaiting Shipment']).to include str
  case str
    when /Move to Shipped/
      stamps.orders.orders_toolbar.move_dropdown.move_to_shipped
    when /Move to Canceled/
      stamps.orders.orders_toolbar.move_dropdown.move_to_canceled
    when /Move to On Hold/
      stamps.orders.orders_toolbar.move_dropdown.move_to_on_hold
    when /Move to Awaiting Shipment/
      stamps.orders.orders_toolbar.move_dropdown.move_to_awaiting_shipment
    else
      #ignore
  end
end

# Moved to Shipped Modal
Then /^[Cc]lick Move to Shipped modal move button$/ do
  expect(stamps.orders.orders_toolbar.move_dropdown.move_to_shipped).to be_present, "Move to Shipped modal is not present"
  stamps.orders.orders_toolbar.move_dropdown.move_to_shipped.move_to_shipped
end

Then /^[Cc]lick Move to Shipped modal cancel button$/ do
  expect(stamps.orders.orders_toolbar.move_dropdown.move_to_shipped).to be_present, "Move to Shipped modal is not present"
  stamps.orders.orders_toolbar.move_dropdown.move_to_shipped.cancel
end

Then /^[Ee]xpect Move to Shipped modal order number is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_param[:order_id][1] : expectation
  expect(stamps.orders.orders_toolbar.move_dropdown.move_to_shipped.order_number).to eql(expectation)
end

# Moved to Canceled modal
Then /^[Cc]lick Move to Canceled modal move button$/ do
  expect(stamps.orders.orders_toolbar.move_dropdown.move_to_canceled).to be_present, "Move to Canceled modal is not present"
  stamps.orders.orders_toolbar.move_dropdown.move_to_canceled.move
end

# Moved to On Hold modal
Then /^[Ss]et Move to On Hold modal Hold Until date to today plus (\d+)$/ do |day|
  step "set Move to On Hold modal Hold Until date to #{(Date.today + day.to_i).strftime("%m/%d/%Y")}"
end

Then /^[Ss]et Move to On Hold modal Hold Until date to (\d+)\/(\d+)\/(\d+)$/ do |month, day, year|
  expect(stamps.orders.orders_toolbar.move_dropdown.move_to_on_hold).to be_present, "Move to Move to On Hold modal is not present"
  stamps.orders.orders_toolbar.move_dropdown.move_to_on_hold.hold_until.set("#{month}/#{day}/#{year}")
end

Then /^[Cc]lick Move to On Hold modal move button$/ do
  expect(stamps.orders.orders_toolbar.move_dropdown.move_to_on_hold).to be_present, "Move to Move to On Hold modal is not present"
  stamps.orders.orders_toolbar.move_dropdown.move_to_on_hold.move
end

# Moved to Awaiting Shipment modal
Then /^[Cc]lick Move to Awaiting Shipment modal move button$/ do
  expect(stamps.orders.orders_toolbar.move_dropdown.move_to_awaiting_shipment).to be_present, "Move to Awaiting Shipment modal is not present"
  stamps.orders.orders_toolbar.move_dropdown.move_to_awaiting_shipment.move
end

