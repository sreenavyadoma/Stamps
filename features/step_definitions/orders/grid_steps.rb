
Then /^In Orders Grid, check saved Order ID$/ do
  step "In Orders Grid, check Order ID #{test_data[:order_id]}"
end

Then /^In Orders Grid, check Order ID (.*)$/ do |order_id|
  stamps.orders.orders_grid.column.checkbox.check_order_id(order_id)
  stamps.orders.orders_grid.column.checkbox.order_checked?(order_id).should be true
end

Then /^In Orders Grid, uncheck saved Order ID$/ do
  step "In Orders Grid, uncheck Order ID #{test_data[:order_id]}"
end

Then /^In Orders Grid, uncheck Order ID (.*)$/ do |order_id|
  stamps.orders.orders_grid.column.checkbox.uncheck_order_id(order_id)
  stamps.orders.orders_grid.column.checkbox.order_checked?(order_id).should be false
end

Then /^In Orders Grid, expect Store is (.*)$/ do |expectation|
  test_data[:store_name] = (expectation.downcase.include? "random")?test_data[:store_name]:expectation
  stamps.orders.orders_grid.column.store.data(test_data[:order_id]).should eql test_data[:store_name]
end

Then /^In Orders Grid, expect Order ID is the same as Details Form Order ID$/ do
  details_order_id = stamps.orders.order_details.toolbar.order_id
  grid_order_id = stamps.orders.orders_grid.column.order_id.row(1)
  details_order_id.should eql grid_order_id
end

Then /^In Orders Grid, expect saved Order ID is in Orders Grid row (\d+)$/ do |row|
  stamps.orders.orders_grid.column.order_id.row(1).should eql test_data[:order_id]
end

Then /^In Orders Grid, expect Ship Cost is the same as Details Form Ship Cost$/ do
  details_ship_cost = stamps.orders.order_details.footer.total_ship_cost
  grid_ship_cost = stamps.orders.orders_grid.column.ship_cost.data(test_data[:order_id])
  details_ship_cost.should eql grid_ship_cost
end

Then /^Set Orders Grid Row (\d+) to uncheck$/ do |row|
  stamps.orders.orders_grid.column.checkbox.uncheck(row)
end

Then /^Set Orders Grid Row (\d+) to check$/ do |row|
  stamps.orders.orders_grid.column.checkbox.check(row)
end

When /^Edit Orders Grid row (\d+)$/ do |row|
  stamps.orders.orders_grid.column.checkbox.check(row)
end

When /^In Orders Grid, check row (\d+)$/ do |row|
  stamps.orders.orders_grid.column.checkbox.check row
  stamps.orders.orders_grid.column.checkbox.checked?(row).should be true
end

When /^In Orders Grid, uncheck row (\d+)$/ do |row|
  stamps.orders.orders_grid.column.checkbox.uncheck(row)
  stamps.orders.orders_grid.column.checkbox.checked?(row).should be false
end

Then /^In Orders Grid, expect Date Printed for this order is today$/ do
  grid = stamps.orders.filter_panel.shipped.select
  grid.order_id.sort_descending
  grid_print_date = grid.date_printed.data(test_data[:order_id]) # Dec 3
  expectation_print_date = Date.today.strftime "%b %-d"
  grid_print_date.should eql expectation_print_date
end

Then /^In Orders Grid, expect Ship Date for this order is today$/ do
  step "In Orders Grid, expect Ship Date for this order is today plus 0"
end

Then /^In Orders Grid, expect Ship Date for this order is today plus (\d+)$/ do |day|
  expectation = ParameterHelper.mmddyy_to_mondd @ship_date
  10.times{
    stamps.orders.filter_panel.shipped.select.order_id.sort_descending
    break if stamps.orders.filter_panel.shipped.select.ship_date.data(test_data[:order_id]) == expectation
  }
  stamps.orders.filter_panel.shipped.select.ship_date.data(test_data[:order_id]).should eql expectation
end

Then /^List all Grid column values for row (\d+)/ do |row|
  order_id = stamps.orders.orders_grid.column.order_id.row row
  step "List all Grid column values for Order ID #{order_id}"
end

Then /^List all Grid column values for Order ID (\w+)$/ do |order_id|
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
  #logger.step "Expect Ship-To address is..."
  param_hash = table.hashes.first
  step "In Orders Grid, expect Recipient is #{param_hash[:name]}"
  step "In Orders Grid, expect Company is #{param_hash[:company]}"
  step "In Orders Grid, expect Address is #{param_hash[:address]}"
  step "In Orders Grid, expect City is #{param_hash[:city]}"
  step "In Orders Grid, expect State is #{param_hash[:state]}"
  step "In Orders Grid, expect Zip is #{param_hash[:zip]}"
  step "In Orders Grid, expect Phone is #{param_hash[:phone]}"
  step "In Orders Grid, expect Email is #{param_hash[:email]}"
end

Then /^In Orders Grid, expect Age is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Age is #{expectation}"
  test_data[:order_id].should be_truthy
  10.times do
    break if stamps.orders.orders_grid.column.age.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.age.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Order Date is populated$/ do
  #logger.step "In Orders Grid, expect Order Date is populated"
  test_data[:order_id].should be_truthy
  5.times do
    break if stamps.orders.orders_grid.column.order_date.data(test_data[:order_id]).size > 4
  end
  stamps.orders.orders_grid.column.order_date.data(test_data[:order_id]).size.should be > 4
end

Then /^In Orders Grid, expect Recipient is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Recipient is #{expectation}"
  test_data[:order_id].should be_truthy
  10.times do
    break if stamps.orders.orders_grid.column.recipient.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.recipient.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Company is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Company is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.company.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.company.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Address is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Address is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.address.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.address.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect City is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect City is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.city.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.city.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect State is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect State is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.state.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.state.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Zip is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Zip is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.zip.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.zip.data(test_data[:order_id]).should include expectation
end

Then /^In Orders Grid, expect Country is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Country is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.country.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.country.data(test_data[:order_id]).should include expectation
end

Then /^In Orders Grid, expect Column (\w+) appears to left of (.+)$/ do |left_column, right_column|
  #logger.step "In Orders Grid, expect Column #{left_column} appears to left of #{right_column}"
  stamps.orders.orders_grid.column.is_next_to?(left_column, right_column).should be true
end

Then /^In Orders Grid, expect Email is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Email is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.email.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.email.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Phone is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Phone is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.phone.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.phone.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Pounds is (\d+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Pounds is #{expectation}"
  20.times do
    break if stamps.orders.orders_grid.column.weight.lb(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.weight.lb(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Ounces is (\d+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Ounces is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.weight.oz(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.weight.oz(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Weight is (\d+) lb. (\d+) oz.$/ do |pounds, ounces|
  #logger.step "In Orders Grid, expect Weight is #{pounds} lb. #{ounces} oz."
  expectation = "#{pounds} lbs. #{ounces} oz." #1 lbs. 0 oz.
  #logger.step "In Orders Grid, expect Weight is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.weight.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.weight.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Weight\(lb\) is (.*)$/ do |expectation|
  #logger.step "In Orders Grid, expect Weight(lb) is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.weight.lb(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.weight.lb(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Weight\(oz\) is (.*)$/ do |expectation|
  #logger.step "In Orders Grid, expect Weight(oz) is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.weight.oz(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.weight.oz(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Qty. is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Qty. is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.qty.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.qty.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Item SKU is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect SKU is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.item_sku.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.item_sku.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Item Name is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Name is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.item_name.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.item_name.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Ship From is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Ship is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.ship_from.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.ship_from.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect service is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect service is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.service.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.service.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Insured Value is \$(.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Insured Value is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.insured_value.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.insured_value.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Reference No. is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Reference No. is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.reference_no.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.reference_no.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Cost Code is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Cost Code is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.cost_code.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.cost_code.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Tracking service is USPS Tracking$/ do
  step "In Orders Grid, expect Tracking service is \"USPS Tracking\""
end

Then /^In Orders Grid, expect Tracking service is Signature Required$/ do
  step "In Orders Grid, expect Tracking service is \"Signature Required\""
end

Then /^In Orders Grid, expect Tracking service is None$/ do
  step "In Orders Grid, expect Tracking service is \"None\""
end

Then /^In Orders Grid, expect Tracking service is \"(.+)\"$/ do |expectation|
  #logger.step "In Orders Grid, expect Tracking service is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.tracking_service.data(test_data[:order_id]) == expectation
  end
  stamps.orders.orders_grid.column.tracking_service.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Order Status is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Order Status is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.order_status.data(test_data[:order_id]) == expectation
  end
  stamps.orders.orders_grid.column.order_status.data(test_data[:order_id]).should eql expectation
end

Then /^In Orders Grid, expect Tracking Number is populated$/ do
  #logger.step "In Orders Grid, expect Tracking Number is populated"
  20.times do
    break if stamps.orders.orders_grid.column.tracking_no.data(test_data[:order_id]).length > 3
  end
  stamps.orders.orders_grid.column.tracking_no.data(test_data[:order_id]).length.should be > 3
end

Then /^In Orders Grid, expect Order Total is (.+)$/ do |expectation|
  #logger.step "In Orders Grid, expect Order Total is #{expectation}"
  10.times do
    break if stamps.orders.orders_grid.column.order_total.data(test_data[:order_id]).eql? expectation
  end
  stamps.orders.orders_grid.column.order_total.data(test_data[:order_id]).should eql expectation
end
