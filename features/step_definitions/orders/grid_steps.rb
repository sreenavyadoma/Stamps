

Then /^[Cc]heck Orders Grid (?:saved Order ID|Order ID (.*))$/ do |order_id|
  stamps.orders.orders_grid.column.checkbox.check_order_id(order_id)
  expect(stamps.orders.orders_grid.column.checkbox.order_id_checked?(order_id)).to be(true)
end

Then /^(?:U|u)ncheck Orders Grid (?:saved Order ID|Order ID (.*))$/ do |order_id|
  stamps.orders.orders_grid.column.checkbox.uncheck_order_id(order_id)
  expect(stamps.orders.orders_grid.column.checkbox.order_id_checked?(order_id)).to be(false)
end

Then /^[Ee]xpect Orders Grid Store is (.*)$/ do |expectation|
  test_parameter[:store_name] = (expectation.downcase.include? 'random')?test_parameter[:store_name]:expectation
  expect(stamps.orders.orders_grid.column.store.data(test_parameter[:order_id])).to eql test_parameter[:store_name]
end

Then /^[Ee]xpect Orders Grid Order ID is the same as Details Form Order ID$/ do
  details_order_id = stamps.orders.order_details.toolbar.order_id
  grid_order_id = stamps.orders.orders_grid.column.order_id.row(1)
  expect(details_order_id).to eql grid_order_id
end

Then /^[Ee]xpect Orders Grid saved Order ID is in Orders Grid row (\d+)$/ do |row|
  30.times { sleep(0.25); break if stamps.orders.orders_grid.column.order_id.row(row) == test_parameter[:order_id] }
  expect(stamps.orders.orders_grid.column.order_id.row(row)).to eql test_parameter[:order_id]
end

Then /^[Ee]xpect Orders Grid Ship Cost is the same as Details Form Ship Cost$/ do
  expect(stamps.orders.order_details.footer.total_ship_cost).to eql(stamps.orders.orders_grid.column.ship_cost.data(test_parameter[:order_id]))
end

Then /^[Ss]et Orders Grid Row (\d+) to uncheck$/ do |row|
  stamps.orders.orders_grid.column.checkbox.uncheck(row)
end

Then /^[Ss]et Orders Grid Row (\d+) to check$/ do |row|
  stamps.orders.orders_grid.column.checkbox.check(row)
end

When /^Edit Orders Grid row (\d+)$/ do |row|
  stamps.orders.orders_grid.column.checkbox.check(row)
end

When /^[Cc]heck Orders Grid row (\d+)$/ do |row|
  stamps.orders.orders_grid.column.checkbox.check row
  expect(stamps.orders.orders_grid.column.checkbox.checked?(row)).to be(true)
end

When /^(?:U|u)ncheck Orders Grid row (\d+)$/ do |row|
  stamps.orders.orders_grid.column.checkbox.uncheck(row)
  expect(stamps.orders.orders_grid.column.checkbox.checked?(row)).to be(false)
end

Then /^[Ee]xpect Orders Grid Date Printed for this order is today$/ do
  stamps.orders.orders_grid.column.order_date.sort_descending
  expect(stamps.orders.orders_grid.column.date_printed.data(test_parameter[:order_id])).to eql(Date.today.strftime "%b %-d")
end

Then /^[Ee]xpect Orders Grid Ship Date for this order is today$/ do
  step "expect Orders Grid Ship Date for this order is today plus 0"
end

Then /^[Ee]xpect Orders Grid Ship Date for this order is today plus (\d+)$/ do |day|
  expectation = ParameterHelper.now_plus_mon_dd_excl_sunday day
  10.times {
    stamps.orders.orders_grid.column.order_date.sort_descending
    break if stamps.orders.orders_grid.column.ship_date.data(test_parameter[:order_id]) == expectation
  }
  expect(stamps.orders.orders_grid.column.ship_date.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Ship-To address is;$/ do |table|
  param_hash = table.hashes.first
  step "expect Orders Grid Recipient is #{param_hash[:name]}"
  step "expect Orders Grid Company is #{param_hash[:company]}"
  step "expect Orders Grid Address is #{param_hash[:address]}"
  step "expect Orders Grid City is #{param_hash[:city]}"
  step "expect Orders Grid State is #{param_hash[:state]}"
  step "expect Orders Grid Zip is #{param_hash[:zip]}"
  step "expect Orders Grid Phone is #{param_hash[:phone]}"
  step "expect Orders Grid Email is #{param_hash[:email]}"
end

Then /^[Ee]xpect Orders Grid Age is (.+)$/ do |expectation|
  expect(test_parameter[:order_id]).to be_truthy
  10.times { break if stamps.orders.orders_grid.column.age.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.age.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Order Date is populated$/ do
  expect(test_parameter[:order_id]).to be_truthy
  5.times { break if stamps.orders.orders_grid.column.order_date.data(test_parameter[:order_id]).size > 4 }
  expect(stamps.orders.orders_grid.column.order_date.data(test_parameter[:order_id]).size).to be > 4
end

Then /^[Ee]xpect Orders Grid Recipient is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:name] if expectation.nil?
  expect(test_parameter[:order_id]).to be_truthy
  10.times { break if stamps.orders.orders_grid.column.recipient.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.recipient.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Company is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:company] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.company.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.company.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Address is (?:correct|(.*))$/ do |expectation|
  expectation = "#{test_parameter[:street_address_1]}#{(test_parameter[:street_address_2].scan(/(\w+)/).size>0)?" #{test_parameter[:street_address_2]}":""}" if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.address.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.address.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid City is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:city] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.city.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.city.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid State is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:state] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.state.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.state.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Zip is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:zip] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.zip.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.zip.data(test_parameter[:order_id])).to include(expectation)
end

Then /^[Ee]xpect Orders Grid Country is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:country] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.country.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.country.data(test_parameter[:order_id])).to include(expectation)
end

Then /^[Ee]xpect Orders Grid Email is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:email] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.email.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.email.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Phone is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:phone] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.phone.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.phone.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Column (\w+) appears to left of (.+)$/ do |left_column, right_column|
  expect(stamps.orders.orders_grid.column.is_next_to?(left_column, right_column)).to be(true)
end

Then /^[Ee]xpect Orders Grid Pounds is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:pounds] if expectation.nil?
  20.times { break if stamps.orders.orders_grid.column.weight.lb(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.lb(test_parameter[:order_id])).to eql expectation.to_i
end

Then /^[Ee]xpect Orders Grid Ounces is (?:correct|(.*))$/ do |expectation|
  expectation = test_parameter[:ounces] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.weight.oz(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.oz(test_parameter[:order_id])).to eql expectation.to_i
end

Then /^[Ee]xpect Orders Grid Weight is (\d+) lb. (\d+) oz.$/ do |pounds, ounces|
  expectation = "#{pounds} lbs. #{ounces} oz."
  10.times { break if stamps.orders.orders_grid.column.weight.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Weight\(lb\) is (.*)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.weight.lb(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.lb(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Weight\(oz\) is (.*)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.weight.oz(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.oz(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Qty. is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.qty.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.qty.data(test_parameter[:order_id])).to eql expectation.to_i
end

Then /^[Ee]xpect Orders Grid Item SKU is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.item_sku.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.item_sku.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Item Name is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.item_name.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.item_name.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Ship From is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.ship_from.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.ship_from.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid service is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.service.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.service.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Insured Value is \$(.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.insured_value.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.insured_value.data(test_parameter[:order_id])).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect Orders Grid Reference No. is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.reference_no.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.reference_no.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Cost Code is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.cost_code.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.cost_code.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Tracking service is USPS Tracking$/ do
  step "expect Orders Grid Tracking service is \"USPS Tracking\""
end

Then /^[Ee]xpect Orders Grid Tracking service is Signature Required$/ do
  step "expect Orders Grid Tracking service is \"Signature Required\""
end

Then /^[Ee]xpect Orders Grid Tracking service is None$/ do
  step "expect Orders Grid Tracking service is \"None\""
end

Then /^[Ee]xpect Orders Grid Tracking service is \"(.+)\"$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.tracking_service.data(test_parameter[:order_id]) == expectation }
  expect(stamps.orders.orders_grid.column.tracking_service.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Order Status is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.order_status.data(test_parameter[:order_id]) == expectation }
  expect(stamps.orders.orders_grid.column.order_status.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Tracking Number is populated$/ do
  20.times { break if stamps.orders.orders_grid.column.tracking_no.data(test_parameter[:order_id]).length > 3 }
  expect(stamps.orders.orders_grid.column.tracking_no.data(test_parameter[:order_id]).length).to be > 3
end

Then /^[Ee]xpect Orders Grid Order Total is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.order_total.data(test_parameter[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.order_total.data(test_parameter[:order_id])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Ship Cost error to contain \"(.*)\"$/ do |expectation|
  grid_order_id = stamps.orders.orders_grid.column.order_id.row 1
  ship_cost_error = stamps.orders.orders_grid.column.ship_cost.data_error grid_order_id
  expect(ship_cost_error).to include(expectation)
  ship_cost_error = stamps.orders.orders_grid.column.ship_cost.data_error "81453"
  ship_cost_error = stamps.orders.orders_grid.column.ship_cost.data_error "81408"
  ship_cost_error = stamps.orders.orders_grid.column.ship_cost.data_error "81407"
end

Then /^[Ee]xpect Orders Grid ship cost data error tooltip is \"(.*)\"$/ do |expectation|
  #logger.step "expect Orders Grid ship cost data error tooltip is #{expectation}"
  grid_order_id = stamps.orders.orders_grid.column.order_id.row 1
  grid_ship_cost = stamps.orders.orders_grid.column.ship_cost.data grid_order_id
  error = grid_ship_cost.attribute_expectation "data-errorqtip"
  #logger.step "Test #{(error.include? expectation)?"Passed":"Failed"}"
  expect(error).to include(expectation)
end
