
Then /^[Ss]elect [Gg]rid [Tt]oolbar [Mm]ove [Mm]enu item (.*)$/ do |str|
  expect(['Move to Shipped', 'Move to Canceled', 'Move to On Hold', 'Move to Awaiting Shipment']).to include str
  case str
    when /Move to Shipped/
      stamps.orders.orders_toolbar.move_drop_down.move_to_shipped
    when /Move to Canceled/
      stamps.orders.orders_toolbar.move_drop_down.move_to_canceled
    when /Move to On Hold/
      stamps.orders.orders_toolbar.move_drop_down.move_to_on_hold
    when /Move to Awaiting Shipment/
      stamps.orders.orders_toolbar.move_drop_down.move_to_awaiting_shipment
    else
      #ignore
  end
end

# Moved to Shipped Modal
Then /^[Cc]lick Move to Shipped modal move button$/ do
  expect(stamps.orders.orders_toolbar.move_drop_down.move_to_shipped.present?).to be(true), "Move to Shipped modal is not present"
  stamps.orders.orders_toolbar.move_drop_down.move_to_shipped.move_to_shipped
end

Then /^[Cc]lick Move to Shipped modal cancel button$/ do
  expect(stamps.orders.orders_toolbar.move_drop_down.move_to_shipped.present?).to be(true), "Move to Shipped modal is not present"
  stamps.orders.orders_toolbar.move_drop_down.move_to_shipped.cancel
end

Then /^[Ee]xpect Move to Shipped modal order number is (?:correct|(.*))$/ do |expectation|
  expectation = (expectation.nil?)?test_param[:order_id][0] : expectation
  expect(stamps.orders.orders_toolbar.move_drop_down.move_to_shipped.order_number).to eql(expectation)
end



# Moved to Canceled modal
Then /^[Cc]lick Move to Canceled modal move button$/ do
  expect(stamps.orders.orders_toolbar.move_drop_down.move_to_canceled.present?).to be(true), "Move to Canceled modal is not present"
  stamps.orders.orders_toolbar.move_drop_down.move_to_canceled.move
end

# Moved to On Hold modal
Then /^[Ii]n Orders Grid toolbar, select Move to On Hold until today plus (\d+)$/ do |day|
  step "select Grid Toolbar Move menu item Move to On Hold until #{(Date.today + day.to_i).strftime("%m/%d/%Y")}"
end

Then /^[Ii]n Orders Grid toolbar, select Move to On Hold until (\d+)\/(\d+)\/(\d+)$/ do |month, day, year|
  expect(stamps.orders.orders_toolbar.move_drop_down.enabled?).to be(true)
  stamps.orders.orders_toolbar.move_drop_down.move_to_on_hold.cancel
  stamps.orders.orders_toolbar.move_drop_down.move_to_on_hold.hold_until.set("#{month}/#{day}/#{year}")
  stamps.orders.orders_toolbar.move_drop_down.move_to_on_hold.move
end


# Moved to Awaiting Shipment modal
Then /^[Cc]lick Move to Awaiting Shipment modal move button$/ do
  expect(stamps.orders.orders_toolbar.move_drop_down.move_to_awaiting_shipment.present?).to be(true), "Move to Awaiting Shipment modal is not present"
  stamps.orders.orders_toolbar.move_drop_down.move_to_awaiting_shipment.move
end
