
Then /^(?:I|i)n Orders Grid, check saved Order ID$/ do
  step "In Orders Grid, check Order ID #{test_data[:order_id]}"
end

Then /^(?:I|i)n Orders Grid, check Order ID (.*)$/ do |order_id|
  stamps.orders.orders_grid.column.checkbox.check_order_id(order_id)
  expect(stamps.orders.orders_grid.column.checkbox.order_id_checked?(order_id)).to be true
end

Then /^(?:I|i)n Orders Grid, uncheck saved Order ID$/ do
  step "In Orders Grid, uncheck Order ID #{test_data[:order_id]}"
end

Then /^(?:I|i)n Orders Grid, uncheck Order ID (.*)$/ do |order_id|
  stamps.orders.orders_grid.column.checkbox.uncheck_order_id(order_id)
  expect(stamps.orders.orders_grid.column.checkbox.order_id_checked?(order_id)).to be false
end

Then /^(?:I|i)n Orders Grid, expect Store is (.*)$/ do |expectation|
  test_data[:store_name] = (expectation.downcase.include? 'random')?test_data[:store_name]:expectation
  expect(stamps.orders.orders_grid.column.store.data(test_data[:order_id])).to eql test_data[:store_name]
end

Then /^(?:I|i)n Orders Grid, expect Order ID is the same as Details Form Order ID$/ do
  details_order_id = stamps.orders.order_details.toolbar.order_id
  grid_order_id = stamps.orders.orders_grid.column.order_id.row(1)
  expect(details_order_id).to eql grid_order_id
end

Then /^(?:I|i)n Orders Grid, expect saved Order ID is in Orders Grid row (\d+)$/ do |row|
  30.times { sleep(0.25); break if stamps.orders.orders_grid.column.order_id.row(row) == test_data[:order_id] }
  expect(stamps.orders.orders_grid.column.order_id.row(row)).to eql test_data[:order_id]
end

Then /^(?:I|i)n Orders Grid, expect Ship Cost is the same as Details Form Ship Cost$/ do
  expect(stamps.orders.order_details.footer.total_ship_cost).to eql(stamps.orders.orders_grid.column.ship_cost.data(test_data[:order_id]))
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

When /^(?:I|i)n Orders Grid, check row (\d+)$/ do |row|
  stamps.orders.orders_grid.column.checkbox.check row
  expect(stamps.orders.orders_grid.column.checkbox.checked?(row)).to be true
end

When /^(?:I|i)n Orders Grid, uncheck row (\d+)$/ do |row|
  stamps.orders.orders_grid.column.checkbox.uncheck(row)
  expect(stamps.orders.orders_grid.column.checkbox.checked?(row)).to be false
end

Then /^(?:I|i)n Orders Grid, expect Date Printed for this order is today$/ do
  stamps.orders.orders_grid.column.order_date.sort_descending
  expect(stamps.orders.orders_grid.column.date_printed.data(test_data[:order_id])).to eql(Date.today.strftime "%b %-d")
end

Then /^(?:I|i)n Orders Grid, expect Ship Date for this order is today$/ do
  step "In Orders Grid, expect Ship Date for this order is today plus 0"
end

Then /^(?:I|i)n Orders Grid, expect Ship Date for this order is today plus (\d+)$/ do |day|
  expectation = ParameterHelper.now_plus_mon_dd day
  10.times {
    stamps.orders.orders_grid.column.order_date.sort_descending
    break if stamps.orders.orders_grid.column.ship_date.data(test_data[:order_id]) == expectation
  }
  expect(stamps.orders.orders_grid.column.ship_date.data(test_data[:order_id])).to eql expectation
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

Then /^(?:I|i)n Orders Grid, expect Age is (.+)$/ do |expectation|
  expect(test_data[:order_id]).to be_truthy
  10.times { break if stamps.orders.orders_grid.column.age.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.age.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Order Date is populated$/ do
  expect(test_data[:order_id]).to be_truthy
  5.times { break if stamps.orders.orders_grid.column.order_date.data(test_data[:order_id]).size > 4 }
  expect(stamps.orders.orders_grid.column.order_date.data(test_data[:order_id]).size).to be > 4
end

Then /^(?:I|i)n Orders Grid, expect Recipient (?:is (.*)|and saved Recipient are the same)$/ do |expectation|
  expectation = test_data[:name] if expectation.nil?
  expect(test_data[:order_id]).to be_truthy
  10.times { break if stamps.orders.orders_grid.column.recipient.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.recipient.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Company (?:is (.*)|and saved Company are the same)$/ do |expectation|
  expectation = test_data[:company] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.company.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.company.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Address (?:is (.*)|and saved Address are the same)$/ do |expectation|
  expectation = "#{test_data[:street_address_1]}#{(test_data[:street_address_2].scan(/(\w+)/).size>0)?" #{test_data[:street_address_2]}":""}" if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.address.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.address.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect City (?:is (.*)|and saved City are the same)$/ do |expectation|
  expectation = test_data[:city] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.city.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.city.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect State (?:is (.*)|and saved State are the same)$/ do |expectation|
  expectation = test_data[:state] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.state.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.state.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Zip (?:is (.*)|and saved Zip are the same)$/ do |expectation|
  expectation = test_data[:zip] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.zip.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.zip.data(test_data[:order_id])).to include expectation
end

Then /^(?:I|i)n Orders Grid, expect Country (?:is (.*)|and saved Country are the same)$/ do |expectation|
  expectation = test_data[:country] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.country.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.country.data(test_data[:order_id])).to include expectation
end

Then /^(?:I|i)n Orders Grid, expect Email (?:is (.*)|and saved Email are the same)$/ do |expectation|
  expectation = test_data[:email] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.email.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.email.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Phone (?:is (.*)|and saved Phone are the same)$/ do |expectation|
  expectation = test_data[:phone] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.phone.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.phone.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Column (\w+) appears to left of (.+)$/ do |left_column, right_column|
  expect(stamps.orders.orders_grid.column.is_next_to?(left_column, right_column)).to be true
end

Then /^(?:I|i)n Orders Grid, expect Pounds (?:is (.*)|and saved Pounds are the same)$/ do |expectation|
  expectation = test_data[:pounds] if expectation.nil?
  20.times { break if stamps.orders.orders_grid.column.weight.lb(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.lb(test_data[:order_id])).to eql expectation.to_i
end

Then /^(?:I|i)n Orders Grid, expect Ounces (?:is (.*)|and saved Ounces are the same)$/ do |expectation|
  expectation = test_data[:ounces] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.column.weight.oz(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.oz(test_data[:order_id])).to eql expectation.to_i
end

Then /^(?:I|i)n Orders Grid, expect Weight is (\d+) lb. (\d+) oz.$/ do |pounds, ounces|
  expectation = "#{pounds} lbs. #{ounces} oz."
  10.times { break if stamps.orders.orders_grid.column.weight.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Weight\(lb\) is (.*)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.weight.lb(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.lb(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Weight\(oz\) is (.*)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.weight.oz(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.weight.oz(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Qty. is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.qty.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.qty.data(test_data[:order_id])).to eql expectation.to_i
end

Then /^(?:I|i)n Orders Grid, expect Item SKU is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.item_sku.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.item_sku.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Item Name is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.item_name.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.item_name.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Ship From is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.ship_from.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.ship_from.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect service is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.service.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.service.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Insured Value is \$(.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.insured_value.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.insured_value.data(test_data[:order_id])).to eql expectation.to_f.round(2)
end

Then /^(?:I|i)n Orders Grid, expect Reference No. is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.reference_no.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.reference_no.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Cost Code is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.cost_code.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.cost_code.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Tracking service is USPS Tracking$/ do
  step "In Orders Grid, expect Tracking service is \"USPS Tracking\""
end

Then /^(?:I|i)n Orders Grid, expect Tracking service is Signature Required$/ do
  step "In Orders Grid, expect Tracking service is \"Signature Required\""
end

Then /^(?:I|i)n Orders Grid, expect Tracking service is None$/ do
  step "In Orders Grid, expect Tracking service is \"None\""
end

Then /^(?:I|i)n Orders Grid, expect Tracking service is \"(.+)\"$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.tracking_service.data(test_data[:order_id]) == expectation }
  expect(stamps.orders.orders_grid.column.tracking_service.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Order Status is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.order_status.data(test_data[:order_id]) == expectation }
  expect(stamps.orders.orders_grid.column.order_status.data(test_data[:order_id])).to eql expectation
end

Then /^(?:I|i)n Orders Grid, expect Tracking Number is populated$/ do
  20.times { break if stamps.orders.orders_grid.column.tracking_no.data(test_data[:order_id]).length > 3 }
  expect(stamps.orders.orders_grid.column.tracking_no.data(test_data[:order_id]).length).to be > 3
end

Then /^(?:I|i)n Orders Grid, expect Order Total is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.column.order_total.data(test_data[:order_id]).eql? expectation }
  expect(stamps.orders.orders_grid.column.order_total.data(test_data[:order_id])).to eql expectation
end
