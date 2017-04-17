

Then /^[Cc]heck Orders Grid (?:saved Order ID|Order ID (.*))$/ do |order_id|
  order_id = parameter[:order_id][0] if order_id.nil?
  stamps.orders.orders_grid.column.checkbox.check_order_id(order_id)
  expect(stamps.orders.orders_grid.column.checkbox.order_id_checked?(order_id)).to be(true)
end

Then /^[Uu]ncheck Orders Grid (?:saved Order ID|Order ID (.*))$/ do |order_id|
  order_id = parameter[:order_id][0] if order_id.nil?
  stamps.orders.orders_grid.column.checkbox.uncheck_order_id(order_id)
  expect(stamps.orders.orders_grid.column.checkbox.order_id_checked?(order_id)).to be(false)
end

Then /^[Ee]xpect Orders Grid Store is (.*)$/ do |expectation|
  parameter[:store_name] = (expectation.downcase.include? 'random')?parameter[:store_name]:expectation
  expect(stamps.orders.orders_grid.column.store.data(parameter[:order_id][0])).to eql parameter[:store_name]
end

Then /^[Ee]xpect Orders Grid Order ID is the same as Details Form Order ID$/ do
  details_order_id = stamps.orders.order_details.toolbar.order_id
  grid_order_id = stamps.orders.orders_grid.column.order_id.row(1)
  expect(details_order_id).to eql grid_order_id
end

Then /^[Ee]xpect Orders Grid saved Order ID is in Orders Grid row (\d+)$/ do |row|
  30.times { sleep(0.25); break if stamps.orders.orders_grid.column.order_id.row(row) == parameter[:order_id][0] }
  expect(stamps.orders.orders_grid.column.order_id.row(row)).to eql parameter[:order_id][0]
end

Then /^[Ee]xpect Orders Grid Ship Cost is the same as Details Form Ship Cost$/ do
  expect(stamps.orders.order_details.footer.total_ship_cost).to eql(stamps.orders.orders_grid.column.ship_cost.data(parameter[:order_id][0]))
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

When /^[Uu]ncheck Orders Grid row (\d+)$/ do |row|
  stamps.orders.orders_grid.column.checkbox.uncheck(row)
  expect(stamps.orders.orders_grid.column.checkbox.checked?(row)).to be(false), "Can't uncheck Orders Grid row #{row}"
end

Then /^[Ee]xpect Orders Grid Date Printed for this order is today$/ do
  stamps.orders.orders_grid.column.order_date.sort_descending
  expect(stamps.orders.orders_grid.column.date_printed.data(parameter[:order_id][0])).to eql(Date.today.strftime "%b %-d")
end

Then /^[Ee]xpect Orders Grid Ship Date for this order is today$/ do
  step "expect Orders Grid Ship Date for this order is today plus 0"
end

Then /^[Ee]xpect Orders Grid Ship Date for this order is today plus (\d+)$/ do |day|
  expectation = helper.now_plus_mon_dd_excl_sunday day
  10.times {
    stamps.orders.orders_grid.column.order_date.sort_descending
    break if stamps.orders.orders_grid.column.ship_date.data(parameter[:order_id][0]) == expectation
  }
  expect(stamps.orders.orders_grid.column.ship_date.data(parameter[:order_id][0])).to eql expectation
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
  expect(parameter[:order_id][0]).to be_truthy
  10.times { break if stamps.orders.orders_grid.column.age.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.age.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Order Date is populated$/ do
  expect(parameter[:order_id][0]).to be_truthy
  5.times { break if stamps.orders.orders_grid.column.order_date.data(parameter[:order_id][0]).size > 4 }
  expect(stamps.orders.orders_grid.column.order_date.data(parameter[:order_id][0]).size).to be > 4
end

Then /^[Ee]xpect Orders Grid Recipient is (?:correct|(.*))$/ do |expectation|
  expectation = parameter[:name] if expectation.nil?
  expect(parameter[:order_id][0]).to be_truthy
  10.times { break if stamps.orders.orders_grid.column.recipient.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.recipient.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Company is (?:correct|(.*))$/ do |expectation|
  expectation = parameter[:company] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.company.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.company.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Address is (?:correct|(.*))$/ do |expectation|
  expectation = "#{parameter[:street_address_1]}#{(parameter[:street_address_2].scan(/(\w+)/).size>0)?" #{parameter[:street_address_2]}":""}" if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.address.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.address.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid City is (?:correct|(.*))$/ do |expectation|
  expectation = parameter[:city] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.city.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.city.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid State is (?:correct|(.*))$/ do |expectation|
  expectation = parameter[:state] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.state.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.state.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Zip is (?:correct|(.*))$/ do |expectation|
  expectation = parameter[:zip] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.zip.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.zip.data(parameter[:order_id][0])).to include(expectation)
end

Then /^[Ee]xpect Orders Grid Country is (?:correct|(.*))$/ do |expectation|
  expectation = parameter[:country] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.country.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.country.data(parameter[:order_id][0])).to include(expectation)
end

Then /^[Ee]xpect Orders Grid Email is (?:correct|(.*))$/ do |expectation|
  expectation = parameter[:email] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.email.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.email.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Phone is (?:correct|(.*))$/ do |expectation|
  expectation = parameter[:phone] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.phone.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.phone.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Column (\w+) appears to left of (.+)$/ do |left_column, right_column|
  expect(stamps.orders.orders_grid.column.is_next_to?(left_column, right_column)).to be(true)
end

Then /^[Ee]xpect Orders Grid Pounds is (?:correct|(.*))$/ do |expectation|
  expectation = parameter[:pounds] if expectation.nil?
  20.times { break if stamps.orders.orders_grid.column.weight.lb(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.lb(parameter[:order_id][0])).to eql expectation.to_i
end

Then /^[Ee]xpect Orders Grid Ounces is (?:correct|(.*))$/ do |expectation|
  expectation = parameter[:ounces] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.weight.oz(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.oz(parameter[:order_id][0])).to eql expectation.to_i
end

Then /^[Ee]xpect Orders Grid Weight is (\d+) lb. (\d+) oz.$/ do |pounds, ounces|
  expectation = "#{pounds} lbs. #{ounces} oz."
  10.times { break if stamps.orders.orders_grid.column.weight.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Weight\(lb\) is (.*)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.weight.lb(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.lb(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Weight\(oz\) is (.*)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.weight.oz(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.oz(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Qty. is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.qty.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.qty.data(parameter[:order_id][0])).to eql expectation.to_i
end

Then /^[Ee]xpect Orders Grid Item SKU is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.item_sku.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.item_sku.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Item Name is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.item_name.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.item_name.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Ship From is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.ship_from.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.ship_from.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid service is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.service.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.service.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Insured Value is \$(.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.insured_value.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.insured_value.data(parameter[:order_id][0])).to eql expectation.to_f.round(2)
end

Then /^[Ee]xpect Orders Grid Reference No. is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.reference_no.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.reference_no.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Cost Code is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.cost_code.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.cost_code.data(parameter[:order_id][0])).to eql expectation
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
  10.times { break if stamps.orders.orders_grid.column.tracking_service.data(parameter[:order_id][0]) == expectation }
  expect(stamps.orders.orders_grid.column.tracking_service.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Order Status is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.order_status.data(parameter[:order_id][0]) == expectation }
  expect(stamps.orders.orders_grid.column.order_status.data(parameter[:order_id][0])).to eql expectation
end

Then /^[Ee]xpect Orders Grid Tracking Number is populated$/ do
  20.times { break if stamps.orders.orders_grid.column.tracking_no.data(parameter[:order_id][0]).length > 3 }
  expect(stamps.orders.orders_grid.column.tracking_no.data(parameter[:order_id][0]).length).to be > 3
end

Then /^[Ee]xpect Orders Grid Order Total is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.order_total.data(parameter[:order_id][0]).eql? expectation }
  expect(stamps.orders.orders_grid.column.order_total.data(parameter[:order_id][0])).to eql expectation
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
  #config.logger.step "expect Orders Grid ship cost data error tooltip is #{expectation}"
  grid_order_id = stamps.orders.orders_grid.column.order_id.row 1
  grid_ship_cost = stamps.orders.orders_grid.column.ship_cost.data grid_order_id
  error = grid_ship_cost.attribute_expectation "data-errorqtip"
  #config.logger.step "Test #{(error.include? expectation)?"Passed":"Failed"}"
  expect(error).to include(expectation)
end
