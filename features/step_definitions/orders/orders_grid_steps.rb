
Then /^[Cc]heck [Oorders ]*?[Ggrid ]*?[Ccached ]*?[Oo]rder[IiDd ]*?(?:| (\d+))$/ do |order_id|
  order_id = order_id.nil? ? TestData.hash[:order_id].values.last : TestData.hash[:order_id][order_id.to_i]
  stamps.orders.orders_grid.grid_column(:checkbox).check_order_id(order_id)
  expect(stamps.orders.orders_grid.grid_column(:checkbox).order_id_checked?(order_id)).to be(true), "Couldn't check Order ID #{order_id}"
end

Then /^[Uu]ncheck [Oorders ]*?[Ggrid ]*?[Ccached ]*?[Oo]rder[IiDd ]*?(?:| (\d+))$/ do |order_id|
  order_id = order_id.nil? ? TestData.hash[:order_id].values.last : TestData.hash[:order_id][order_id.to_i]
  stamps.orders.orders_grid.grid_column(:checkbox).uncheck_order_id(order_id)
  expect(stamps.orders.orders_grid.grid_column(:checkbox).order_id_checked?(order_id)).to be(false)
end

When /^[Cc]heck(?: [O]rders)?(?: [Gg]rid)? [Rr]ow (\d+)$/ do |row|
  stamps.orders.orders_grid.grid_column(:checkbox).check(row)
  expect(checked = stamps.orders.orders_grid.grid_column(:checkbox).checked?(
      row)).to be(true), "Row #{row} is #{checked ? 'checked' : 'unchecked'}"
end

When /^[Uu]ncheck(?: [O]rders)?(?: [Gg]rid)? [Rr]ow (\d+)$/ do |row|
  if SdcEnv.new_framework
    #skip for now
  else
    expect(stamps.orders.orders_grid.grid_column(:checkbox).uncheck(
        row)).to be(false), "Unable to uncheck Orders Grid row #{row}"
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Store is (.*)$/ do |expectation|
  TestData.hash[:store_name] = expectation.downcase.include?('random') ? TestData.hash[:store_name] : expectation
  expect(stamps.orders.orders_grid.grid_column(:hash).data(TestData.hash[:order_id].values.last)).to eql TestData.hash[:store_name]
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Order ID is the same as Details Form Order ID$/ do
  expect(stamps.orders.order_details.toolbar.order_id.text.parse_digits).to eql(stamps.orders.orders_grid.grid_column(:order_id).row(1))
end

Then /^[Ee]xpect cached Order ID is in [Oo]rders [Gg]rid [Rr]ow (\d+)$/ do |row|
  15.times do
    sleep(0.25);
    break if stamps.orders.orders_grid.grid_column(:order_id).row(row) == TestData.hash[:order_id].values.last
  end
  expect(stamps.orders.orders_grid.grid_column(:order_id).row(row)).to eql TestData.hash[:order_id].values.last
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Ship Cost is the same as Details Form Ship Cost$/ do
  expect(stamps.orders.order_details.footer.total_ship_cost.text.dollar_amount_str.to_f.round(2).to_s).to eql(stamps.orders.orders_grid.grid_column(:ship_cost).data(TestData.hash[:order_id].values.last))
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Date Printed for this order is (?:correct|(\d{2}\/\d{2}\/\d{4}))$/ do |str|
  expect(stamps.orders.orders_grid.grid_column(:date_printed).data(TestData.hash[:order_id].values.last)).to eql(TestHelper.grid_date_format(str.nil? ? Date.today.strftime("%b %-d") : str))
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Ship Date for this order is (?:correct|(\d{2}\/\d{2}\/\d{4}))$/ do |str|
  expect(stamps.orders.orders_grid.grid_column(:ship_date).data(TestData.hash[:order_id].values.last)).to eql(TestHelper.grid_date_format(str.nil? ? stamps.orders.modals.orders_print_modal.ship_date.textbox.text : str))
end

Then /^[Ee]xpect Ship-To address is;$/ do |table|
  step "expect Orders Grid Recipient is #{table.hashes.first[:name]}"
  step "expect Orders Grid Company is #{table.hashes.first['company']}"
  step "expect Orders Grid Address is #{table.hashes.first[:address]}"
  step "expect Orders Grid City is #{table.hashes.first[:city]}"
  step "expect Orders Grid State is #{table.hashes.first[:state]}"
  step "expect Orders Grid Zip is #{table.hashes.first[:zip]}"
  step "expect Orders Grid Phone is #{table.hashes.first[:phone]}"
  step "expect Orders Grid Email is #{table.hashes.first[:email]}"
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Age is (.+)$/ do |expectation|
  expect(TestData.hash[:order_id].values.last).to be_truthy
  10.times { break if stamps.orders.orders_grid.grid_column(:age).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:age).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Order Date is populated$/ do
  expect(TestData.hash[:order_id].values.last).to be_truthy
  5.times { break if stamps.orders.orders_grid.grid_column(:order_date).data(TestData.hash[:order_id].values.last).size > 4 }
  expect(stamps.orders.orders_grid.grid_column(:order_date).data(TestData.hash[:order_id].values.last).size).to be > 4
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Recipient is (?:correct|(.*))$/ do |expectation|
  step "Pause for 2 seconds"
  expectation = TestData.hash[:full_name] if expectation.nil?
  expect(TestData.hash[:order_id].values.last).to be_truthy
  10.times { break if stamps.orders.orders_grid.grid_column(:recipient).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:recipient).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Company is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:company] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.grid_column(:company).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:company).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Address is (?:correct|(.*))$/ do |expectation|
  expectation = "#{TestData.hash[:street_address_1]}#{(TestData.hash[:street_address_2].scan(/(\w+)/).size > 0) ? " #{TestData.hash[:street_address_2]}" : ""}" if expectation.nil?
  10.times { break if stamps.orders.orders_grid.grid_column(:address).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:address).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid City is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:city] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.grid_column(:city).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:city).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid State is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:state] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.grid_column(:state).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:state).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Zip is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:zip] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.grid_column(:zip).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:zip).data(TestData.hash[:order_id].values.last)).to include(expectation)
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Country is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:country] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.grid_column(:country).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:country).data(TestData.hash[:order_id].values.last)).to include(expectation)
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Email is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:email] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.grid_column(:email).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:email).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Phone is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:phone] if expectation.nil?
  10.times { break if stamps.orders.orders_grid.grid_column(:phone).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:phone).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Pounds is (?:correct|(.*))$/ do |expectation|
  if SdcEnv.new_framework
    #skip for now
  else
    expectation = TestData.hash[:pounds] if expectation.nil?
    10.times { break if stamps.orders.orders_grid.grid_column(:weight).lb(TestData.hash[:order_id].values.last).eql? expectation.to_i }
    expect(stamps.orders.orders_grid.grid_column(:weight).lb(TestData.hash[:order_id].values.last)).to eql expectation.to_i
  end

end

Then /^[Ee]xpect [Oo]rders [Gg]rid Ounces is (?:correct|(.*))$/ do |expectation|
  if SdcEnv.new_framework
    #skip for now
  else
    expectation = TestData.hash[:ounces] if expectation.nil?
    10.times { break if stamps.orders.orders_grid.grid_column(:weight).oz(TestData.hash[:order_id].values.last).eql? expectation.to_i }
    expect(stamps.orders.orders_grid.grid_column(:weight).oz(TestData.hash[:order_id].values.last)).to eql expectation.to_i
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Weight is (\d+) lb. (\d+) oz.$/ do |pounds, ounces|
  if SdcEnv.new_framework
    #skip for now
  else
    expectation = "#{pounds} lbs. #{ounces} oz."
    10.times { break if stamps.orders.orders_grid.grid_column(:weight).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(stamps.orders.orders_grid.grid_column(:weight).data(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Weight\(lb\) is (.*)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.grid_column(:weight).lb(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:weight).lb(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Weight\(oz\) is (.*)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.grid_column(:weight).oz(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:weight).oz(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Qty. is (.+)$/ do |expectation|
  20.times { break if stamps.orders.orders_grid.grid_column(:qty).data(TestData.hash[:order_id].values.last).eql? expectation.to_i }
  expect(stamps.orders.orders_grid.grid_column(:qty).data(TestData.hash[:order_id].values.last)).to eql expectation.to_i
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Item SKU is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.grid_column(:item_sku).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:item_sku).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Item Name is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.grid_column(:item_name).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:item_name).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Ship From is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.grid_column(:ship_from).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:ship_from).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid service is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:service] if expectation.nil?
  expectation = TestData.hash[:service_look_up][expectation.split(' ').first].nil? ? expectation : TestData.hash[:service_look_up][expectation.split(' ').first]
  10.times { break if stamps.orders.orders_grid.grid_column(:service).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:service).data(TestData.hash[:order_id].values.last)).to eql(expectation)
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Insured Value is \$(.+)$/ do |expectation|
  if SdcEnv.new_framework
    #skip for now
  else
    10.times { break if stamps.orders.orders_grid.grid_column(:insured_value).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(stamps.orders.orders_grid.grid_column(:insured_value).data(TestData.hash[:order_id].values.last)).to eql expectation.to_f.round(2)
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Reference No. is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.grid_column(:reference_no).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:reference_no).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Tracking service is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.grid_column(:tracking_service).data(TestData.hash[:order_id].values.last) == expectation }
  expect(stamps.orders.orders_grid.grid_column(:tracking_service).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Order Status is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.grid_column(:order_status).data(TestData.hash[:order_id].values.last) == expectation }
  expect(stamps.orders.orders_grid.grid_column(:order_status).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Tracking Number is populated$/ do
  20.times { break if stamps.orders.orders_grid.grid_column(:tracking_no).data(TestData.hash[:order_id].values.last).length > 3 }
  expect(stamps.orders.orders_grid.grid_column(:tracking_no).data(TestData.hash[:order_id].values.last).length).to be > 3
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Order Total is (.+)$/ do |expectation|
  10.times { break if stamps.orders.orders_grid.grid_column(:order_total).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(stamps.orders.orders_grid.grid_column(:order_total).data(TestData.hash[:order_id].values.last)).to eql expectation
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Ship Cost error to contain \"(.*)\"$/ do |expectation|
  grid_order_id = stamps.orders.orders_grid.grid_column(:order_id).row 1
  ship_cost_error = stamps.orders.orders_grid.grid_column(:ship_cost).data_error grid_order_id
  expect(ship_cost_error).to include(expectation)
  ship_cost_error = stamps.orders.orders_grid.grid_column(:ship_cost).data_error "81453"
  ship_cost_error = stamps.orders.orders_grid.grid_column(:ship_cost).data_error "81408"
  ship_cost_error = stamps.orders.orders_grid.grid_column(:ship_cost).data_error "81407"
end

Then /^[Ee]xpect [Oo]rders [Gg]rid ship cost data error tooltip is \"(.*)\"$/ do |expectation|
  #SdcLog.step "expect Orders Grid ship cost data error tooltip is #{expectation}"
  grid_order_id = stamps.orders.orders_grid.grid_column(:order_id).row 1
  grid_ship_cost = stamps.orders.orders_grid.grid_column(:ship_cost).data grid_order_id
  error = grid_ship_cost.attribute_expectation "data-errorqtip"
  #SdcLog.step "Test #{(error.include? expectation)?"Passed":"Failed"}"
  expect(error).to include(expectation)
end
