
Then /^Orders Grid Toolbar: Move to Shipped$/ do
  logger.step "Orders Grid Toolbar: Move to Shipped"
  stamps.orders.orders_grid.order_id.row_num(test_data[:order_id]).should be > 0
  stamps.orders.orders_grid.toolbar.move.to_shipped.cancel
  stamps.orders.orders_grid.toolbar.move.to_shipped.move
end

Then /^Orders Grid Toolbar: Move to Canceled$/ do
  logger.step "Orders Grid Toolbar: Move to Canceled"
  stamps.orders.orders_grid.order_id.row_num(test_data[:order_id]).should be > 0
  stamps.orders.orders_grid.toolbar.move.to_canceled.cancel
  stamps.orders.orders_grid.toolbar.move.to_canceled.move
end

Then /^Orders Grid Toolbar: Move to Awaiting Shipment$/ do
  logger.step "Move order to Awaiting Shipmen"
  stamps.orders.orders_grid.order_id.row_num(test_data[:order_id]).should be > 0
  stamps.orders.orders_grid.toolbar.move.to_awaiting_shipment.cancel
  stamps.orders.orders_grid.toolbar.move.to_awaiting_shipment.move
end

Then /^Orders Grid Toolbar: Move to On Hold$/ do
  logger.step "Move order to Awaiting Shipmen"
  stamps.orders.orders_grid.column.order_date.sort_descending
  stamps.orders.orders_grid.order_id.row_num(test_data[:order_id]).should be > 0
  stamps.orders.orders_grid.toolbar.move.to_awaiting_shipment.cancel
  stamps.orders.orders_grid.toolbar.move.to_awaiting_shipment.move
end

Then /^Orders Grid: Check Order ID (.*)$/ do |order_id|
  logger.step "Orders Grid: Check Order ID #{order_id}"
  test_data[:order_id] = order_id
  # Check if Order ID exists, fail test if it does not
  stamps.orders.orders_grid.column.order_id.exist?(test_data[:order_id]).should be true
  logger.step "Order ID #{test_data[:order_id]} #{test_data[:order_id]}!"
  stamps.orders.orders_grid.column.checkbox.check_order_id(test_data[:order_id])
end

Then /^Orders Grid: Expect Store is (.*)$/ do |expectation|
  logger.step "Orders Grid: Expect Store is #{expectation}"
  test_data[:store_name] = (expectation.downcase.include? "random")?test_data[:store_name]:expectation
  stamps.orders.orders_grid.column.store.data(test_data[:order_id]).should eql test_data[:store_name]
end

Then /^Orders Grid: Expect Order ID is the same as Details Form Order ID$/ do
  logger.step "Orders Grid: Expect Order ID is the same as Details Form Order ID"
  details_order_id = stamps.orders.order_details.toolbar.order_id
  grid_order_id = stamps.orders.orders_grid.column.order_id.row(1)
  details_order_id.should eql grid_order_id
end

Then /^Orders Grid: Expect saved Order ID is in Orders Grid row (\d+)$/ do |row|
  logger.step "Orders Grid: Expect saved Order ID is the same as Orders Grid row #{row}"
  stamps.orders.orders_grid.column.order_id.row(1).should eql test_data[:order_id]
end

Then /^Orders Grid: Expect Ship Cost is the same as Details Form Ship Cost$/ do
  logger.step "Orders Grid: Expect Ship Cost is the same as Details Form Ship Cost"
  details_ship_cost = stamps.orders.order_details.footer.total_ship_cost
  grid_ship_cost = stamps.orders.orders_grid.column.ship_cost.data(test_data[:order_id])
  details_ship_cost.should eql grid_ship_cost
end

Then /^Set Orders Grid Row (\d+) to uncheck$/ do |row|
  logger.step "Set Orders Grid Row #{row} to uncheck"
  stamps.orders.orders_grid.column.checkbox.uncheck(row)
end

Then /^Set Orders Grid Row (\d+) to check$/ do |row|
  logger.step "Set Orders Grid Row #{row} to check"
  stamps.orders.orders_grid.column.checkbox.check(row)
end

When /^Edit Orders Grid row (\d+)$/ do |row|
  logger.step "Edit row #{row} on the Orders Grid"
  stamps.orders.orders_grid.column.checkbox.check(row)
end

When /^Orders Grid: Check row (\d+)$/ do |row|
  logger.step "Edit Orders Grid row #{row}"
  stamps.orders.orders_grid.column.checkbox.check row
  stamps.orders.orders_grid.column.checkbox.checked?(row).should be true
end

When /^Orders Grid: Uncheck row (\d+)$/ do |row|
  logger.step "Uncheck row #{row} on the Orders Grid"
  stamps.orders.orders_grid.column.checkbox.uncheck(row)
  stamps.orders.orders_grid.column.checkbox.checked?(row).should be false
end

Then /^Orders Grid: Uncheck Saved Order ID$/ do
  logger.step "Orders Grid: Uncheck Saved Order ID #{test_data[:order_id]}"
  step "Save Test Data"
  stamps.orders.orders_grid.column.checkbox.uncheck_order(test_data[:order_id])
  stamps.orders.orders_grid.column.checkbox.order_checked?(test_data[:order_id]).should be false
end

Then /^Orders Grid: Check saved Order ID$/ do
  logger.step "Orders Grid: Check saved Order ID #{test_data[:order_id]}"
  5.times do
    stamps.orders.orders_grid.column.checkbox.check_order_id(test_data[:order_id])
    break if stamps.orders.orders_grid.column.checkbox.order_checked?(test_data[:order_id])
  end
  stamps.orders.orders_grid.column.checkbox.order_checked?(test_data[:order_id]).should be true
end

Then /^Orders Grid: Expect Date Printed for this order is today$/ do
  logger.step "Orders Grid: Expect Date Printed for this order is today"
  grid = stamps.orders.filter_panel.shipped.select
  grid.order_id.sort_descending
  grid_print_date = grid.date_printed.data(test_data[:order_id]) # Dec 3
  expectation_print_date = Date.today.strftime "%b %-d"

  logger.step "Order ID:  #{test_data[:order_id]} - Orders Grid Date Printed:  #{grid_print_date} - Today's date:  #{expectation_print_date}"
  grid_print_date.should eql expectation_print_date
end

Then /^Orders Grid: Expect Ship Date for this order is today$/ do
  logger.step "Orders Grid: Expect Ship Date for this order is today"
  step "Orders Grid: Expect Ship Date for this order is today plus 0"
end

Then /^Orders Grid: Expect Ship Date for this order is today plus (\d+)$/ do |day|
  logger.step "Orders Grid: Expect Ship Date for this order is today plus #{day}"
  expectation = ParameterHelper.mmddyy_to_mondd @ship_date
  10.times{
    stamps.orders.filter_panel.shipped.select.order_id.sort_descending
    break if stamps.orders.filter_panel.shipped.select.ship_date.data(test_data[:order_id]) == expectation
  }
  stamps.orders.filter_panel.shipped.select.ship_date.data(test_data[:order_id]).should eql expectation
end

Then /^List all Grid column values for row (\d+)/ do |row|
  logger.step "List all Grid column values for row #{row}"
  order_id = stamps.orders.orders_grid.column.order_id.row row
  step "List all Grid column values for Order ID #{order_id}"
end

Then /^List all Grid column values for Order ID (\w+)$/ do |order_id|
  logger.step "List all Grid column values for Order ID #{order_id}"
  row2_order_id = stamps.orders.orders_grid.column.order_id.row 2
  logger.step stamps.orders.orders_grid.column.checkbox.order_checked? row2_order_id

  stamps.orders.orders_grid.column.checkbox.check 1
  logger.step stamps.orders.orders_grid.column.checkbox.checked? 1
  stamps.orders.orders_grid.column.checkbox.check 2
  logger.step stamps.orders.orders_grid.column.checkbox.checked? 2
  stamps.orders.orders_grid.column.checkbox.check 3
  logger.step stamps.orders.orders_grid.column.checkbox.checked? 3

  stamps.orders.orders_grid.column.checkbox.uncheck(1)
  logger.step stamps.orders.orders_grid.column.checkbox.checked? 1
  stamps.orders.orders_grid.column.checkbox.uncheck(2)
  logger.step stamps.orders.orders_grid.column.checkbox.checked? 2
  stamps.orders.orders_grid.column.checkbox.uncheck(3)
  logger.step stamps.orders.orders_grid.column.checkbox.checked? 3

  stamps.orders.orders_grid.column.checkbox.check 2
  logger.step stamps.orders.orders_grid.column.checkbox.checked? 2
  stamps.orders.orders_grid.column.checkbox.check 4
  logger.step stamps.orders.orders_grid.column.checkbox.checked? 4
  stamps.orders.orders_grid.column.checkbox.check 6
  logger.step stamps.orders.orders_grid.column.checkbox.checked? 6

  checked_hash = stamps.orders.orders_grid.column.checkbox.checked_rows

  stamps.orders.orders_grid.column.checkbox.check_all
  stamps.orders.orders_grid.column.checkbox.uncheck_all

  stamps.orders.orders_grid.column.checkbox.check_all checked_hash

  logger.step stamps.orders.orders_grid.column.item_name.data order_id
  logger.step stamps.orders.orders_grid.column.ship_cost.data order_id
  logger.step stamps.orders.orders_grid.column.age.data order_id
  logger.step stamps.orders.orders_grid.column.order_date.data order_id
  logger.step stamps.orders.orders_grid.column.recipient.data order_id
  logger.step stamps.orders.orders_grid.column.company.data order_id
  logger.step stamps.orders.orders_grid.column.address.data order_id
  logger.step stamps.orders.orders_grid.column.city.data order_id
  logger.step stamps.orders.orders_grid.column.state.data order_id
  logger.step stamps.orders.orders_grid.column.zip.data order_id
  logger.step stamps.orders.orders_grid.column.country.data order_id
  logger.step stamps.orders.orders_grid.column.phone.data order_id
  logger.step stamps.orders.orders_grid.column.email.data order_id
  logger.step stamps.orders.orders_grid.column.qty.data order_id
  logger.step stamps.orders.orders_grid.column.item_sku.data order_id
  logger.step stamps.orders.orders_grid.column.ship_from.data order_id
  logger.step stamps.orders.orders_grid.column.service.data order_id
  logger.step stamps.orders.orders_grid.column.weight.data order_id
  logger.step stamps.orders.orders_grid.column.insured_value.data order_id
  logger.step stamps.orders.orders_grid.column.reference_no.data order_id
  logger.step stamps.orders.orders_grid.column.cost_code.data order_id
  logger.step stamps.orders.orders_grid.column.order_status.data order_id
  logger.step stamps.orders.orders_grid.column.ship_date.data order_id
  logger.step stamps.orders.orders_grid.column.tracking_no.data order_id
  logger.step stamps.orders.orders_grid.column.order_total.data order_id
end

Then /^Expect Ship-To address is;$/ do |table|
  logger.step "Expect Ship-To address is..."
  param_hash = table.hashes.first
  step "Orders Grid: Expect Recipient is #{param_hash[:name]}"
  step "Orders Grid: Expect Company is #{param_hash[:company]}"
  step "Orders Grid: Expect Address is #{param_hash[:address]}"
  step "Orders Grid: Expect City is #{param_hash[:city]}"
  step "Orders Grid: Expect State is #{param_hash[:state]}"
  step "Orders Grid: Expect Zip is #{param_hash[:zip]}"
  step "Orders Grid: Expect Phone is #{param_hash[:phone]}"
  step "Orders Grid: Expect Email is #{param_hash[:email]}"
end

Then /^Orders Grid: Expect Age is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Age is #{expectation}"
  test_data[:order_id].should be_truthy
  10.times do
    break if stamps.orders.orders_grid.column.age.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.age.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Order Date is populated$/ do
  logger.step "Orders Grid: Expect Order Date is populated"
  test_data[:order_id].should be_truthy
  5.times do
    break if stamps.orders.orders_grid.column.order_date.data(test_data[:order_id]).size > 4
  end
  stamps.orders.orders_grid.column.order_date.data(test_data[:order_id]).size.should be > 4
end

Then /^Orders Grid: Expect Recipient is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Recipient is #{expectation}"
  test_data[:order_id].should be_truthy
  10.times do
    break if stamps.orders.orders_grid.column.recipient.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.recipient.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Company is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Company is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.company.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.company.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Address is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Address is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.address.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.address.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect City is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect City is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.city.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.city.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect State is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect State is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.state.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.state.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Zip is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Zip is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.zip.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.zip.data(test_data[:order_id]).should include expectation
end

Then /^Orders Grid: Expect Country is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Country is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.country.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.country.data(test_data[:order_id]).should include expectation
end

Then /^Orders Grid: Expect Column (\w+) appears to left of (.+)$/ do |left_column, right_column|
  logger.step "Orders Grid: Expect Column #{left_column} appears to left of #{right_column}"
  stamps.orders.orders_grid.column.is_next_to?(left_column, right_column).should be true
end

Then /^Orders Grid: Expect Email is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Email is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.email.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.email.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Phone is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Phone is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.phone.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.phone.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Pounds is (\d+)$/ do |expectation|
  logger.step "Orders Grid: Expect Pounds is #{expectation}"
  20.times do
    break if stamps.orders.orders_grid.column.weight.lb(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.weight.lb(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Ounces is (\d+)$/ do |expectation|
  logger.step "Orders Grid: Expect Ounces is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.weight.oz(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.weight.oz(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Weight is (\d+) lb. (\d+) oz.$/ do |pounds, ounces|
  logger.step "Orders Grid: Expect Weight is #{pounds} lb. #{ounces} oz."
  expectation = "#{pounds} lbs. #{ounces} oz." #1 lbs. 0 oz.
  logger.step "Orders Grid: Expect Weight is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.weight.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.weight.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Weight\(lb\) is (.*)$/ do |expectation|
  logger.step "Orders Grid: Expect Weight(lb) is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.weight.lb(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.weight.lb(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Weight\(oz\) is (.*)$/ do |expectation|
  logger.step "Orders Grid: Expect Weight(oz) is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.weight.oz(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.weight.oz(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Qty. is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Qty. is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.qty.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.qty.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Item SKU is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect SKU is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.item_sku.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.item_sku.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Item Name is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Name is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.item_name.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.item_name.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Ship From is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Ship is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.ship_from.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.ship_from.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Service is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Service is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.service.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.service.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Insured Value is \$(.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Insured Value is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.insured_value.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.insured_value.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Reference No. is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Reference No. is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.reference_no.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.reference_no.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Cost Code is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Cost Code is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.cost_code.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.cost_code.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Tracking Service is USPS Tracking$/ do
  step "Orders Grid: Expect Tracking Service is \"USPS Tracking\""
end

Then /^Orders Grid: Expect Tracking Service is Signature Required$/ do
  step "Orders Grid: Expect Tracking Service is \"Signature Required\""
end

Then /^Orders Grid: Expect Tracking Service is None$/ do
  step "Orders Grid: Expect Tracking Service is \"None\""
end

Then /^Orders Grid: Expect Tracking Service is \"(.+)\"$/ do |expectation|
  logger.step "Orders Grid: Expect Tracking Service is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.tracking_service.data(test_data[:order_id]) == expectation
  end
  stamps.orders.orders_grid.column.tracking_service.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Order Status is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Order Status is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.order_status.data(test_data[:order_id]) == expectation
  end
  stamps.orders.orders_grid.column.order_status.data(test_data[:order_id]).should eql expectation
end

Then /^Orders Grid: Expect Tracking Number is populated$/ do
  logger.step "Orders Grid: Expect Tracking Number is populated"
  20.times do
    break if stamps.orders.orders_grid.column.tracking_no.data(test_data[:order_id]).length > 3
  end
  stamps.orders.orders_grid.column.tracking_no.data(test_data[:order_id]).length.should be > 3
end

Then /^Orders Grid: Expect Order Total is (.+)$/ do |expectation|
  logger.step "Orders Grid: Expect Order Total is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.order_total.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.order_total.data(test_data[:order_id]).should eql expectation
end
