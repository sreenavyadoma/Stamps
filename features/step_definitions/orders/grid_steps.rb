
Then /^Grid: Check Order ID (.*)$/ do |order_id|
  logger.step "Grid: Check Order ID #{order_id}"
  test_data[:order_id] = order_id
  # Check if Order ID exists, fail test if it does not
  stamps.orders.grid.order_id.exist?(test_data[:order_id]).should be true
  logger.step "Order ID #{test_data[:order_id]} #{expectation}!"
  stamps.orders.grid.checkbox.check_order(test_data[:order_id])
end

Then /^Grid: Expect Store is (.*)$/ do |expectation|
  logger.step "Grid: Expect Store is #{expectation}"
  test_data[:store_name] = (expectation.downcase.include? "random")?test_data[:store_name]:expectation
  stamps.orders.grid.store.data(test_data[:order_id]).should eql test_data[:store_name]
end

Then /^Grid: Expect Order ID is the same as Details Form Order ID$/ do
  logger.step "Grid: Expect Order ID is the same as Details Form Order ID"
  details_order_id = stamps.orders.order_details.toolbar.order_id
  grid_order_id = stamps.orders.grid.order_id.row(1)
  details_order_id.should eql grid_order_id
end

Then /^Grid: Expect Ship Cost is the same as Details Form Ship Cost$/ do
  logger.step "Grid: Expect Ship Cost is the same as Details Form Ship Cost"
  details_ship_cost = stamps.orders.order_details.footer.total_ship_cost
  grid_ship_cost = stamps.orders.grid.ship_cost.data(test_data[:order_id])
  details_ship_cost.should eql grid_ship_cost
end

Then /^Set Orders Grid Row (\d+) to uncheck$/ do |row|
  logger.step "Set Orders Grid Row #{row} to uncheck"
  stamps.orders.grid.checkbox.uncheck(row)
end

Then /^Set Orders Grid Row (\d+) to check$/ do |row|
  logger.step "Set Orders Grid Row #{row} to check"
  stamps.orders.grid.checkbox.check(row)
end

When /^Edit Orders Grid row (\d+)$/ do |row|
  logger.step "Edit row #{row} on the Orders Grid"
  stamps.orders.grid.checkbox.check(row)
end

When /^Grid: Check row (\d+)$/ do |row|
  logger.step "Edit Orders Grid row #{row}"
  stamps.orders.grid.checkbox.check row
  stamps.orders.grid.checkbox.checked?(row).should be true
end

When /^Grid: Uncheck row (\d+)$/ do |row|
  logger.step "Uncheck row #{row} on the Orders Grid"
  stamps.orders.grid.checkbox.uncheck(row)
  stamps.orders.grid.checkbox.checked?(row).should be false
end

Then /^Grid: Uncheck Saved Order ID$/ do
  logger.step "Grid: Uncheck Saved Order ID #{test_data[:order_id]}"
  step "Save Shipping Costs Data"
  stamps.orders.grid.checkbox.uncheck_order(test_data[:order_id])
  stamps.orders.grid.checkbox.order_checked?(test_data[:order_id]).should be false
end

Then /^Grid: Check Saved Order ID$/ do
  logger.step "Grid: Check Saved Order ID #{test_data[:order_id]}"
  5.times do
    stamps.orders.grid.checkbox.check_order(test_data[:order_id])
    break if stamps.orders.grid.checkbox.order_checked?(test_data[:order_id])
  end
  stamps.orders.grid.checkbox.order_checked?(test_data[:order_id]).should be true
end

Then /^Grid: Check Environment Order ID$/ do
  logger.step "Grid: Check Order ID #{test_data[:order_id]}"
  step "Grid: Check Order ID #{test_data[:order_id]}"
end

Then /^Grid: Expect Date Printed for this order is today$/ do
  logger.step "Grid: Expect Date Printed for this order is today"
  grid = stamps.orders.left_panel.shipped
  grid.order_id.sort_descending
  grid_print_date = grid.date_printed.data(test_data[:order_id]) # Dec 3
  expectation_print_date = Date.today.strftime "%b %-d"

  logger.step "Order ID:  #{test_data[:order_id]} - Orders Grid Date Printed:  #{grid_print_date} - Today's date:  #{expectation_print_date}"
  grid_print_date.should eql expectation_print_date
end

Then /^Grid: Expect Ship Date for this order is today$/ do
  logger.step "Grid: Expect Ship Date for this order is today"
  step "Grid: Expect Ship Date for this order is today plus 0"
end

Then /^Grid: Expect Ship Date for this order is today plus (\d+)$/ do |day|
  logger.step "Grid: Expect Ship Date for this order is today plus #{day}"
  expectation = ParameterHelper.mmddyy_to_mondd @ship_date
  10.times{
    stamps.orders.left_panel.shipped.order_id.sort_descending
    break if stamps.orders.left_panel.shipped.ship_date.data(test_data[:order_id]) == expectation
  }
  stamps.orders.left_panel.shipped.ship_date.data(test_data[:order_id]).should eql expectation
end

Then /^List all Grid column values for row (\d+)/ do |row|
  logger.step "List all Grid column values for row #{row}"
  order_id = stamps.orders.grid.order_id.row row
  step "List all Grid column values for Order ID #{order_id}"
end

Then /^List all Grid column values for Order ID (\w+)$/ do |order_id|
  logger.step "List all Grid column values for Order ID #{order_id}"
  row2_order_id = stamps.orders.grid.order_id.row 2
  logger.step stamps.orders.grid.checkbox.order_checked? row2_order_id

  stamps.orders.grid.checkbox.check 1
  logger.step stamps.orders.grid.checkbox.checked? 1
  stamps.orders.grid.checkbox.check 2
  logger.step stamps.orders.grid.checkbox.checked? 2
  stamps.orders.grid.checkbox.check 3
  logger.step stamps.orders.grid.checkbox.checked? 3

  stamps.orders.grid.checkbox.uncheck 1
  logger.step stamps.orders.grid.checkbox.checked? 1
  stamps.orders.grid.checkbox.uncheck 2
  logger.step stamps.orders.grid.checkbox.checked? 2
  stamps.orders.grid.checkbox.uncheck 3
  logger.step stamps.orders.grid.checkbox.checked? 3

  stamps.orders.grid.checkbox.check 2
  logger.step stamps.orders.grid.checkbox.checked? 2
  stamps.orders.grid.checkbox.check 4
  logger.step stamps.orders.grid.checkbox.checked? 4
  stamps.orders.grid.checkbox.check 6
  logger.step stamps.orders.grid.checkbox.checked? 6

  checked_hash = stamps.orders.grid.checkbox.checked_rows

  stamps.orders.grid.checkbox.check_all
  stamps.orders.grid.checkbox.uncheck_all

  stamps.orders.grid.checkbox.check_all checked_hash

  logger.step stamps.orders.grid.item_name.data order_id
  logger.step stamps.orders.grid.ship_cost.data order_id
  logger.step stamps.orders.grid.age.data order_id
  logger.step stamps.orders.grid.order_date.data order_id
  logger.step stamps.orders.grid.recipient.data order_id
  logger.step stamps.orders.grid.company.data order_id
  logger.step stamps.orders.grid.address.data order_id
  logger.step stamps.orders.grid.city.data order_id
  logger.step stamps.orders.grid.state.data order_id
  logger.step stamps.orders.grid.zip.data order_id
  logger.step stamps.orders.grid.country.data order_id
  logger.step stamps.orders.grid.phone.data order_id
  logger.step stamps.orders.grid.email.data order_id
  logger.step stamps.orders.grid.qty.data order_id
  logger.step stamps.orders.grid.item_sku.data order_id
  logger.step stamps.orders.grid.ship_from.data order_id
  logger.step stamps.orders.grid.service.data order_id
  logger.step stamps.orders.grid.weight.data order_id
  logger.step stamps.orders.grid.insured_value.data order_id
  logger.step stamps.orders.grid.reference_no.data order_id
  logger.step stamps.orders.grid.cost_code.data order_id
  logger.step stamps.orders.grid.order_status.data order_id
  logger.step stamps.orders.grid.ship_date.data order_id
  logger.step stamps.orders.grid.tracking_no.data order_id
  logger.step stamps.orders.grid.order_total.data order_id
end

Then /^Expect Ship-To address is;$/ do |table|
  logger.step "Expect Ship-To address is..."
  param_hash = table.hashes.first
  step "Grid: Expect Recipient is #{param_hash[:name]}"
  step "Grid: Expect Company is #{param_hash[:company]}"
  step "Grid: Expect Address is #{param_hash[:address]}"
  step "Grid: Expect City is #{param_hash[:city]}"
  step "Grid: Expect State is #{param_hash[:state]}"
  step "Grid: Expect Zip is #{param_hash[:zip]}"
  step "Grid: Expect Phone is #{param_hash[:phone]}"
  step "Grid: Expect Email is #{param_hash[:email]}"
end

Then /^Grid: Expect Age is (.+)$/ do |expectation|
  logger.step "Grid: Expect Age is #{expectation}"
  test_data[:order_id].should be_truthy
  10.times do
    break if stamps.orders.grid.age.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.age.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Order Date is populated$/ do
  logger.step "Grid: Expect Order Date is populated"
  test_data[:order_id].should be_truthy
  5.times do
    break if stamps.orders.grid.order_date.data(test_data[:order_id]).size > 4
  end
  stamps.orders.grid.order_date.data(test_data[:order_id]).size.should be > 4
end

Then /^Grid: Expect Recipient is (.+)$/ do |expectation|
  logger.step "Grid: Expect Recipient is #{expectation}"
  test_data[:order_id].should be_truthy
  10.times do
    break if stamps.orders.grid.recipient.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.recipient.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Company is (.+)$/ do |expectation|
  logger.step "Grid: Expect Company is #{expectation}"
  10.times do
    break if stamps.orders.grid.company.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.company.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Address is (.+)$/ do |expectation|
  logger.step "Grid: Expect Address is #{expectation}"
  10.times do
    break if stamps.orders.grid.address.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.address.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect City is (.+)$/ do |expectation|
  logger.step "Grid: Expect City is #{expectation}"
  10.times do
    break if stamps.orders.grid.city.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.city.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect State is (.+)$/ do |expectation|
  logger.step "Grid: Expect State is #{expectation}"
  10.times do
    break if stamps.orders.grid.state.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.state.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Zip is (.+)$/ do |expectation|
  logger.step "Grid: Expect Zip is #{expectation}"
  10.times do
    break if stamps.orders.grid.zip.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.zip.data(test_data[:order_id]).should include expectation
end

Then /^Grid: Expect Country is (.+)$/ do |expectation|
  logger.step "Grid: Expect Country is #{expectation}"
  10.times do
    break if stamps.orders.grid.country.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.country.data(test_data[:order_id]).should include expectation
end

Then /^Grid: Expect Column (\w+) appears to left of (.+)$/ do |left_column, right_column|
  logger.step "Grid: Expect Column #{left_column} appears to left of #{right_column}"
  stamps.orders.grid.column.is_next_to?(left_column, right_column).should be true
end

Then /^Grid: Expect Email is (.+)$/ do |expectation|
  logger.step "Grid: Expect Email is #{expectation}"
  10.times do
    break if stamps.orders.grid.email.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.email.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Phone is (.+)$/ do |expectation|
  logger.step "Grid: Expect Phone is #{expectation}"
  10.times do
    break if stamps.orders.grid.phone.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.phone.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Pounds is (\d+)$/ do |expectation|
  logger.step "Grid: Expect Pounds is #{expectation}"
  20.times do
    break if stamps.orders.grid.weight.lb(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.weight.lb(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Ounces is (\d+)$/ do |expectation|
  logger.step "Grid: Expect Ounces is #{expectation}"
  10.times do
    break if stamps.orders.grid.weight.oz(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.weight.oz(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Weight is (\d+) lb. (\d+) oz.$/ do |pounds, ounces|
  logger.step "Grid: Expect Weight is #{pounds} lb. #{ounces} oz."
  expectation = "#{pounds} lbs. #{ounces} oz." #1 lbs. 0 oz.
  logger.step "Grid: Expect Weight is #{expectation}"
  10.times do
    break if stamps.orders.grid.weight.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.weight.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Weight\(lb\) is (.*)$/ do |expectation|
  logger.step "Grid: Expect Weight(lb) is #{expectation}"
  10.times do
    break if stamps.orders.grid.weight.lb(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.weight.lb(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Weight\(oz\) is (.*)$/ do |expectation|
  logger.step "Grid: Expect Weight(oz) is #{expectation}"
  10.times do
    break if stamps.orders.grid.weight.oz(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.weight.oz(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Qty. is (.+)$/ do |expectation|
  logger.step "Grid: Expect Qty. is #{expectation}"
  10.times do
    break if stamps.orders.grid.qty.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.qty.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Item SKU is (.+)$/ do |expectation|
  logger.step "Grid: Expect SKU is #{expectation}"
  10.times do
    break if stamps.orders.grid.item_sku.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.item_sku.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Item Name is (.+)$/ do |expectation|
  logger.step "Grid: Expect Name is #{expectation}"
  10.times do
    break if stamps.orders.grid.item_name.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.item_name.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Ship From is (.+)$/ do |expectation|
  logger.step "Grid: Expect Ship is #{expectation}"
  10.times do
    break if stamps.orders.grid.ship_from.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.ship_from.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Service is (.+)$/ do |expectation|
  logger.step "Grid: Expect Service is #{expectation}"
  10.times do
    break if stamps.orders.grid.service.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.service.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Insured Value is \$(.+)$/ do |expectation|
  logger.step "Grid: Expect Insured Value is #{expectation}"
  10.times do
    break if stamps.orders.grid.insured_value.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.insured_value.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Reference No. is (.+)$/ do |expectation|
  logger.step "Grid: Expect Reference No. is #{expectation}"
  10.times do
    break if stamps.orders.grid.reference_no.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.reference_no.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Cost Code is (.+)$/ do |expectation|
  logger.step "Grid: Expect Cost Code is #{expectation}"
  10.times do
    break if stamps.orders.grid.cost_code.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.cost_code.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Tracking Service is USPS Tracking$/ do
  step "Grid: Expect Tracking Service is \"USPS Tracking\""
end

Then /^Grid: Expect Tracking Service is Signature Required$/ do
  step "Grid: Expect Tracking Service is \"Signature Required\""
end

Then /^Grid: Expect Tracking Service is None$/ do
  step "Grid: Expect Tracking Service is \"None\""
end

Then /^Grid: Expect Tracking Service is \"(.+)\"$/ do |expectation|
  logger.step "Grid: Expect Tracking Service is #{expectation}"
  10.times do
    break if stamps.orders.grid.tracking_service.data(test_data[:order_id]) == expectation
  end
  stamps.orders.grid.tracking_service.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Order Status is (.+)$/ do |expectation|
  logger.step "Grid: Expect Order Status is #{expectation}"
  10.times do
    break if stamps.orders.grid.order_status.data(test_data[:order_id]) == expectation
  end
  stamps.orders.grid.order_status.data(test_data[:order_id]).should eql expectation
end

Then /^Grid: Expect Tracking Number is populated$/ do
  logger.step "Grid: Expect Tracking Number is populated"
  20.times do
    break if stamps.orders.grid.tracking_no.data(test_data[:order_id]).length > 3
  end
  stamps.orders.grid.tracking_no.data(test_data[:order_id]).length.should be > 3
end

Then /^Grid: Expect Order Total is (.+)$/ do |expectation|
  logger.step "Grid: Expect Order Total is #{expectation}"
  10.times do
    break if stamps.orders.grid.order_total.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.grid.order_total.data(test_data[:order_id]).should eql expectation
end
