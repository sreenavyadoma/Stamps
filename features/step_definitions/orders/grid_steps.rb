
Then /^Grid: Check Order ID (.*)$/ do |order_id|
  logger.step "Grid: Check Order ID #{order_id}"
  @details_form_data[:order_id] = order_id
  # Check if Order ID exists, fail test if it does not
  exists = web_apps.orders.grid.order_id.exist? @details_form_data[:order_id]
  expectation = "exists"
  expectation = "does not exists" unless exists
  expectation.should eql "exists"
  logger.step "Order ID #{@details_form_data[:order_id]} #{expectation}!"
  web_apps.orders.grid.checkbox.check_order @details_form_data[:order_id]
end

Then /^Grid: Expect Store is (.*)$/ do |expectation|
  logger.step "Grid: Expect Store is #{expectation}"
  @store_name = (expectation.downcase.include? "random")?@store_name:expectation
  actual_value = web_apps.orders.grid.store.data @details_form_data[:order_id]
  logger.step "Test #{(actual_value==@store_name)?"Passed":"Failed"}"
  @store_name.should eql actual_value
end

Then /^Grid: Expect Order ID is the same as Details Form Order ID$/ do
  logger.step "Grid: Expect Order ID is the same as Details Form Order ID"
  details_order_id = web_apps.orders.details.toolbar.order_id
  grid_order_id = web_apps.orders.grid.order_id.row 1
  logger.step "Test #{(details_order_id==grid_order_id)?"Passed":"Failed"}"
  details_order_id.should eql grid_order_id
end

Then /^Grid: Expect Ship Cost is the same as Details Form Ship Cost$/ do
  logger.step "Grid: Expect Ship Cost is the same as Details Form Ship Cost"
  details_ship_cost = web_apps.orders.details.footer.total_ship_cost
  grid_ship_cost = web_apps.orders.grid.ship_cost.data @details_form_data[:order_id]
  logger.step "Test #{(details_ship_cost==grid_ship_cost)?"Passed":"Failed"}"
  details_ship_cost.should eql grid_ship_cost
end

Then /^Set Orders Grid Row (\d+) to uncheck$/ do |row|
  logger.step "Set Orders Grid Row #{row} to uncheck"
  web_apps.orders.grid.checkbox.uncheck row
end

Then /^Set Orders Grid Row (\d+) to check$/ do |row|
  logger.step "Set Orders Grid Row #{row} to check"
  web_apps.orders.grid.checkbox.check row
end

When /^Edit Orders Grid row (\d+)$/ do |row|
  logger.step "Edit row #{row} on the Orders Grid"
  web_apps.orders.grid.checkbox.check row
end

When /^Grid: Check row (\d+)$/ do |row|
  logger.step "Edit Orders Grid row #{row}"
  web_apps.orders.grid.checkbox.check row
  web_apps.orders.grid.checkbox.checked?(row).should be true
end

When /^Grid: Uncheck row (\d+)$/ do |row|
  logger.step "Uncheck row #{row} on the Orders Grid"
  web_apps.orders.grid.checkbox.uncheck row
  web_apps.orders.grid.checkbox.checked?(row).should be false
end

Then /^Grid: Uncheck Saved Order ID$/ do
  logger.step "Grid: Uncheck Saved Order ID#{@details_form_data[:order_id]}"
  web_apps.orders.grid.checkbox.uncheck_order @details_form_data[:order_id]
  web_apps.orders.grid.checkbox.order_checked?(@details_form_data[:order_id]).should be false
end

Then /^Grid: Check Saved Order ID$/ do
  logger.step "Grid: Check Saved Order ID #{@details_form_data[:order_id]}"
  web_apps.orders.grid.checkbox.check_order @details_form_data[:order_id]
  web_apps.orders.grid.checkbox.order_checked?(@details_form_data[:order_id]).should be true
end

Then /^Grid: Check Environment Order ID$/ do
  @details_form_data[:order_id] = (ENV['ORDER_ID'].nil?)?"":ENV['ORDER_ID']
  expectation = "ENV['ORDER_ID'] is not nil"
  expectation = "ENV['ORDER_ID'] is nil! This test needs a value for this variable." if @details_form_data[:order_id].size == 0
  expectation.should eql "ENV['ORDER_ID'] is not nil"

  logger.step "Grid: Check Order ID #{@details_form_data[:order_id]}"
  step "Grid: Check Order ID #{@details_form_data[:order_id]}"
end

Then /^Grid: Expect Date Printed for this order is today$/ do
  logger.step "Grid: Expect Date Printed for this order is today"
  grid = web_apps.orders.filter.shipped
  grid.order_id.sort_descending
  grid_print_date = grid.date_printed.data @details_form_data[:order_id] # Dec 3
  expectation_print_date = Date.today.strftime "%b %-d"

  logger.step "Order ID:  #{@details_form_data[:order_id]} - Orders Grid Date Printed:  #{grid_print_date} - Today's date:  #{expectation_print_date}"
  logger.step "Test #{(grid_print_date==expectation_print_date)?"Passed":"Failed"}"
  grid_print_date.should eql expectation_print_date
end

Then /^Grid: Expect Ship Date for this order is today$/ do
  logger.step "Grid: Expect Ship Date for this order is today"
  step "Grid: Expect Ship Date for this order is today plus 0"
end

Then /^Grid: Expect Ship Date for this order is today plus (\d+)$/ do |day|
  logger.step "Grid: Expect Ship Date for this order is today plus #{day}"
  expectation_ship_date = ParameterHelper.mmddyy_to_mondd @ship_date

  grid = web_apps.orders.filter.shipped

  10.times{
    grid.order_id.sort_descending
    grid_ship_date = grid.ship_date.data @details_form_data[:order_id] # Dec 3
    logger.step "Order ID:  #{@details_form_data[:order_id]} - Print Modal Saved Ship Date: #{@ship_date} - Orders Grid Ship Date:  #{grid_ship_date}"

    break if grid_ship_date == expectation_ship_date
  }

  grid_ship_date = grid.ship_date.data @details_form_data[:order_id]
  logger.step "Test #{(grid_ship_date==expectation_ship_date)?"Passed":"Failed"}"
  grid_ship_date.should eql expectation_ship_date
end

Then /^List all Grid column values for row (\d+)/ do |row|
  logger.step "List all Grid column values for row #{row}"
  order_id = web_apps.orders.grid.order_id.row row
  step "List all Grid column values for Order ID #{order_id}"
end

Then /^List all Grid column values for Order ID (\w+)$/ do |order_id|
  logger.step "List all Grid column values for Order ID #{order_id}"
  @grid = web_apps.orders.grid

  row2_order_id = @grid.order_id.row 2
  logger.step @grid.checkbox.order_checked? row2_order_id

  @grid.checkbox.check 1
  logger.step @grid.checkbox.checked? 1
  @grid.checkbox.check 2
  logger.step @grid.checkbox.checked? 2
  @grid.checkbox.check 3
  logger.step @grid.checkbox.checked? 3

  @grid.checkbox.uncheck 1
  logger.step @grid.checkbox.checked? 1
  @grid.checkbox.uncheck 2
  logger.step @grid.checkbox.checked? 2
  @grid.checkbox.uncheck 3
  logger.step @grid.checkbox.checked? 3

  @grid.checkbox.check 2
  logger.step @grid.checkbox.checked? 2
  @grid.checkbox.check 4
  logger.step @grid.checkbox.checked? 4
  @grid.checkbox.check 6
  logger.step @grid.checkbox.checked? 6

  checked_hash = @grid.checkbox.checked_rows

  @grid.checkbox.check_all
  @grid.checkbox.uncheck_all

  @grid.checkbox.check_all checked_hash

  logger.step @grid.item_name.data order_id
  logger.step @grid.ship_cost.data order_id
  logger.step @grid.age.data order_id
  logger.step @grid.order_date.data order_id
  logger.step @grid.recipient.data order_id
  logger.step @grid.company.data order_id
  logger.step @grid.address.data order_id
  logger.step @grid.city.data order_id
  logger.step @grid.state.data order_id
  logger.step @grid.zip.data order_id
  logger.step @grid.country.data order_id
  logger.step @grid.phone.data order_id
  logger.step @grid.email.data order_id
  logger.step @grid.qty.data order_id
  logger.step @grid.item_sku.data order_id
  logger.step @grid.ship_from.data order_id
  logger.step @grid.service.data order_id
  logger.step @grid.weight.data order_id
  logger.step @grid.insured_value.data order_id
  logger.step @grid.reference_no.data order_id
  logger.step @grid.cost_code.data order_id
  logger.step @grid.order_status.data order_id
  logger.step @grid.ship_date.data order_id
  logger.step @grid.tracking_no.data order_id
  logger.step @grid.order_total.data order_id

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
  @details_form_data[:order_id].should be_truthy
  10.times do
    break if web_apps.orders.grid.age.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.age.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Order Date is populated$/ do
  logger.step "Grid: Expect Order Date is populated"
  @details_form_data[:order_id].should be_truthy
  5.times do
    break if web_apps.orders.grid.order_date.data(@details_form_data[:order_id]).size > 4
  end
  actual = web_apps.orders.grid.order_date.data(@details_form_data[:order_id])
  logger.step "Test #{(actual.size > 4)?"Passed":"Failed"}"
  actual.size.should be > 4
end

Then /^Grid: Expect Recipient is (.+)$/ do |expectation|
  logger.step "Grid: Expect Recipient is #{expectation}"
  @details_form_data[:order_id].should be_truthy
  10.times do
    break if web_apps.orders.grid.recipient.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.recipient.data @details_form_data[:order_id]
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Company is (.+)$/ do |expectation|
  logger.step "Grid: Expect Company is #{expectation}"
  10.times do
    break if web_apps.orders.grid.company.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.company.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Address is (.+)$/ do |expectation|
  logger.step "Grid: Expect Address is #{expectation}"
  10.times do
    break if web_apps.orders.grid.address.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.address.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect City is (.+)$/ do |expectation|
  logger.step "Grid: Expect City is #{expectation}"
  10.times do
    break if web_apps.orders.grid.city.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.city.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect State is (.+)$/ do |expectation|
  logger.step "Grid: Expect State is #{expectation}"
  10.times do
    break if web_apps.orders.grid.state.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.state.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Zip is (.+)$/ do |expectation|
  logger.step "Grid: Expect Zip is #{expectation}"
  10.times do
    break if web_apps.orders.grid.zip.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.zip.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should include expectation
end

Then /^Grid: Expect Country is (.+)$/ do |expectation|
  logger.step "Grid: Expect Country is #{expectation}"
  10.times do
    break if web_apps.orders.grid.country.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.country.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Column (\w+) appears to left of (.+)$/ do |left_column, right_column|
  logger.step "Grid: Expect Column #{left_column} appears to left of #{right_column}"
  is_next_to = web_apps.orders.grid.column.is_next_to? left_column, right_column
  expectation = "true"
  expectation =  "false" unless is_next_to
  logger.step "Test #{(expectation=="true")?"Passed":"Failed"}"
  expectation.should eql "true"
end

Then /^Grid: Expect Email is (.+)$/ do |expectation|
  logger.step "Grid: Expect Email is #{expectation}"
  10.times do
    break if web_apps.orders.grid.email.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.email.data @details_form_data[:order_id]
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Phone is (.+)$/ do |expectation|
  logger.step "Grid: Expect Phone is #{expectation}"
  10.times do
    break if web_apps.orders.grid.phone.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.phone.data @details_form_data[:order_id]
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Pounds is (\d+)$/ do |expectation|
  logger.step "Grid: Expect Pounds is #{expectation}"
  10.times do
    break if web_apps.orders.grid.weight.lbs(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.weight.lbs @details_form_data[:order_id]
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Ounces is (\d+)$/ do |expectation|
  logger.step "Grid: Expect Ounces is #{expectation}"
  10.times do
    break if web_apps.orders.grid.weight.oz(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.weight.oz(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Weight is (\d+) lbs. (\d+) oz.$/ do |pounds, ounces|
  expectation = "#{pounds} lbs. #{ounces} oz."
  logger.step "Grid: Expect Weight is #{expectation}"
  10.times do
    break if web_apps.orders.grid.weight.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.weight.data @details_form_data[:order_id]
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Weight\(lbs\) is (.*)$/ do |expectation|
  logger.step "Grid: Expect Weight(lbs) is #{expectation}"
  10.times do
    break if web_apps.orders.grid.weight.lbs(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.weight.lbs @details_form_data[:order_id]
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Weight\(oz\) is (.*)$/ do |expectation|
  logger.step "Grid: Expect Weight(oz) is #{expectation}"
  10.times do
    break if web_apps.orders.grid.weight.oz(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.weight.oz @details_form_data[:order_id]
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Qty. is (.+)$/ do |expectation|
  logger.step "Grid: Expect Qty. is #{expectation}"
  10.times do
    break if web_apps.orders.grid.qty.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.qty.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Item SKU is (.+)$/ do |expectation|
  logger.step "Grid: Expect SKU is #{expectation}"
  10.times do
    break if web_apps.orders.grid.item_sku.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.item_sku.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Item Name is (.+)$/ do |expectation|
  logger.step "Grid: Expect Name is #{expectation}"
  10.times do
    break if web_apps.orders.grid.item_name.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.item_name.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Ship From is (.+)$/ do |expectation|
  logger.step "Grid: Expect Ship is #{expectation}"
  10.times do
    break if web_apps.orders.grid.ship_from.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.ship_from.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Service is (.+)$/ do |expectation|
  logger.step "Grid: Expect Service is #{expectation}"
  10.times do
    break if web_apps.orders.grid.service.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.service.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Insured Value is \$(.+)$/ do |expectation|
  logger.step "Grid: Expect Insured Value is #{expectation}"
  10.times do
    break if web_apps.orders.grid.insured_value.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.insured_value.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Reference No. is (.+)$/ do |expectation|
  logger.step "Grid: Expect Reference No. is #{expectation}"
  10.times do
    break if web_apps.orders.grid.reference_no.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.reference_no.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Cost Code is (.+)$/ do |expectation|
  logger.step "Grid: Expect Cost Code is #{expectation}"
  10.times do
    break if web_apps.orders.grid.cost_code.data(@details_form_data[:order_id]).eql? expectation
  end
  actual = web_apps.orders.grid.cost_code.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
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
    break if web_apps.orders.grid.tracking_service.data(@details_form_data[:order_id]) == expectation
  end
  actual = web_apps.orders.grid.tracking_service.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Order Status is (.+)$/ do |expectation|
  logger.step "Grid: Expect Order Status is #{expectation}"
  10.times do
    break if web_apps.orders.grid.order_status.data(@details_form_data[:order_id]) == expectation
  end
  actual = web_apps.orders.grid.order_status.data(@details_form_data[:order_id])
  logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Tracking Number is populated$/ do
  logger.step "Grid: Expect Tracking Number is populated"
  20.times do
    break if web_apps.orders.grid.tracking_no.data(@details_form_data[:order_id]).length > 3
  end
  actual = web_apps.orders.grid.tracking_no.data(@details_form_data[:order_id])
  logger.step "Test #{(actual.length > 3)?"Passed":"Failed"}"
  actual.length.should be > 3
end

Then /^Grid: Expect Order Total is (.+)$/ do |expectation|
  logger.step "Grid: Expect Order Total is #{expectation}"
  begin
    10.times do
      break if web_apps.orders.grid.order_total.data(@details_form_data[:order_id]).eql? expectation
     end
    actual = web_apps.orders.grid.order_total.data(@details_form_data[:order_id])
    logger.step "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Expect Order details is;$/ do |table|
  logger.step "Expect Order details is..."
  expectation_hash = table.hashes.first
  step "Grid: Expect Insured Value is $#{expectation_hash[:insured_value]}"
  step "Grid: Expect Weight is #{expectation_hash[:lbs]} lbs. #{expectation_hash[:oz]} oz."
end

Then /^Expect new Order ID created$/ do
  logger.step "Expect new Order ID created"
  logger.step "Saved Order ID created:  #{@details_form_data[:order_id].to_i>0}"
  @details_form_data[:order_id].to_i.should be > 0
end

Then /^Details: Expect Order ID equals Grid order ID$/ do
  logger.step "Details: Expect Order ID equals Grid order ID"
  grid_order_id = web_apps.orders.grid.order_id.row 1
  single_order_form_order_id = web_apps.orders.details.order_id
  logger.step "Grid Order ID: #{grid_order_id}.  Order Details Form Order ID:  #{single_order_form_order_id}.  Test #{(grid_order_id==single_order_form_order_id) ? 'Passed' : 'Failed'}"
  grid_order_id.should eql single_order_form_order_id
end
