
Then /^check grid order id(?:| (\d*))$/ do |order_id|
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             else
               order_id
             end
  column = SdcGrid.grid_column(:checkbox)
  row = column.row_number(order_id)
  checkbox = column.checkbox_row(row)
  checkbox.check
  result = checkbox.checked?
  expect(result).to be(true)
end

Then /^uncheck grid order id(?:| (\d*))$/ do |order_id|
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             else
               order_id
             end
  column = SdcGrid.grid_column(:checkbox)
  row = column.row_number(order_id)
  checkbox = column.checkbox_row(row)
  checkbox.uncheck
  result = checkbox.checked?
  expect(result).to be(false)
end

When /^check row (\d+)$/ do |row|
  checkbox = SdcGrid.grid_column(:checkbox).checkbox_row(row)
  checkbox.check
  expect(checkbox.checked?).to be(true)
end

When /^uncheck row (\d+)$/ do |row|
  checkbox = SdcGrid.grid_column(:checkbox).checkbox_row(row)
  checkbox.uncheck
  expect(checkbox.checked?).to be(false)
end

Then /^expect orders grid store is (.*)$/ do |expectation|
  TestData.hash[:store_name] = expectation.downcase.include?('random') ? TestData.hash[:store_name] : expectation
  expect(SdcGrid.grid_column(:store).data(TestData.hash[:order_id].values.last)).to eql TestData.hash[:store_name]
end

Then /^expect orders grid order id is the same as details form order id$/ do
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    expect(stamps.orders.order_details.toolbar.order_id.text.parse_digits).to eql(SdcGrid.grid_column(:order_id).row(1))
  end
end

Then /^expect cached order id is in orders grid row (\d+)$/ do |row|
  step 'wait for js to stop'
  expect(SdcGrid.grid_column(:order_id).row(row)).to eql TestData.hash[:order_id].values.last
end

Then /^expect cached order id is not in orders grid row (\d+)$/ do |row|
  step 'wait for js to stop'
  expect(SdcGrid.grid_column(:order_id).row(row)).not_to eql(TestData.hash[:order_id].values.last)
end

Then /^expect orders grid ship cost is the same as details form ship cost$/ do
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    expect(stamps.orders.order_details.footer.total_ship_cost.text.dollar_amount_str.to_f.round(2).to_s).to eql(SdcGrid.grid_column(:ship_cost).data(TestData.hash[:order_id].values.last))
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Date Printed for this order is (?:correct|(\d{2}\/\d{2}\/\d{4}))$/ do |str|
  expect(SdcGrid.grid_column(:date_printed).data(TestData.hash[:order_id].values.last)).to eql(TestHelper.grid_date_format(str.nil? ? Date.today.strftime("%b %-d") : str))
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Ship Date for this order is (?:correct|(\d{2}\/\d{2}\/\d{4}))$/ do |str|
  expect(SdcGrid.grid_column(:ship_date).data(TestData.hash[:order_id].values.last)).to eql(TestHelper.grid_date_format(str.nil? ? stamps.orders.modals.orders_print_modal.ship_date.textbox.text : str))
end

Then /^[Ee]xpect Ship-To address is;$/ do |table|
  step "expect orders grid recipient is #{table.hashes.first[:name]}"
  step "expect orders grid company is #{table.hashes.first['company']}"
  step "expect orders grid address is #{table.hashes.first[:address]}"
  step "expect orders grid city is #{table.hashes.first[:city]}"
  step "expect orders grid state is #{table.hashes.first[:state]}"
  step "expect orders grid zip is #{table.hashes.first[:zip]}"
  step "expect orders grid phone is #{table.hashes.first[:phone]}"
  step "expect orders grid email is #{table.hashes.first[:email]}"
end

Then /^expect orders grid age is (.+)$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    expect(TestData.hash[:order_id].values.last).to be_truthy
    10.times { break if SdcGrid.grid_column(:age).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:age).data(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^expect orders grid order date is populated$/ do
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    expect(TestData.hash[:order_id].values.last).to be_truthy
    5.times { break if SdcGrid.grid_column(:order_date).data(TestData.hash[:order_id].values.last).size > 4 }
    expect(SdcGrid.grid_column(:order_date).data(TestData.hash[:order_id].values.last).size).to be > 4
  end
end

Then /^expect orders grid recipient is (?:correct|(.*))$/ do |expectation|
  expectation ||= TestData.hash[:full_name]
  order_id = TestData.hash[:order_id].values.last
  expect(order_id).to be_truthy
  result = SdcGrid.grid_column(:recipient).data(order_id)
  expect(result).to eql expectation
end

Then /^expect orders grid company is (?:correct|(.*))$/ do |expectation|
  expectation ||= TestData.hash[:company]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:company).data(order_id)
  expect(result).to eql expectation
end

Then /^expect orders grid address is (?:correct|(.*))$/ do |expectation|
  address1 = TestData.hash[:street_address1]
  address2 = TestData.hash[:street_address2]
  expectation ||= "#{address1}#{(address2.scan(/(\w+)/).size > 0) ? " #{address2}" : ""}"
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:address).data(order_id)
  expect(result).to eql expectation
end

Then /^expect orders grid city is (?:correct|(.*))$/ do |expectation|
  expectation ||= TestData.hash[:city]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:city).data(order_id)
  expect(result).to eql expectation
end

Then /^expect orders grid state is (?:correct|(.*))$/ do |expectation|
  expectation ||= TestData.hash[:state]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:state).data(order_id)
  expect(result).to eql expectation
end

Then /^expect orders grid zip is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:zip] if expectation.nil?
  10.times { break if SdcGrid.grid_column(:zip).data(TestData.hash[:order_id].values.last).eql? expectation }
  expect(SdcGrid.grid_column(:zip).data(TestData.hash[:order_id].values.last)).to include(expectation)
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Country is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:country] if expectation.nil?
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:country).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:country).data(TestData.hash[:order_id].values.last)).to include(expectation)
  end
end

Then /^expect orders grid email is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:email] if expectation.nil?
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:email).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:email).data(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^expect orders grid phone is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:phone] if expectation.nil?
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:phone).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:phone).data(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^expect orders grid pounds is (?:correct|(.*))$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    expectation = TestData.hash[:pounds] if expectation.nil?
    10.times { break if SdcGrid.grid_column(:weight).lb(TestData.hash[:order_id].values.last).eql? expectation.to_i }
    expect(SdcGrid.grid_column(:weight).lb(TestData.hash[:order_id].values.last)).to eql expectation.to_i
  end

end

Then /^expect orders grid ounces is (?:correct|(.*))$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    expectation = TestData.hash[:ounces] if expectation.nil?
    10.times { break if SdcGrid.grid_column(:weight).oz(TestData.hash[:order_id].values.last).eql? expectation.to_i }
    expect(SdcGrid.grid_column(:weight).oz(TestData.hash[:order_id].values.last)).to eql expectation.to_i
  end
end

Then /^expect orders grid weight is (\d+) lb. (\d+) oz.$/ do |pounds, ounces|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    expectation = "#{pounds} lbs. #{ounces} oz."
    10.times { break if SdcGrid.grid_column(:weight).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:weight).data(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Weight\(lb\) is (.*)$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:weight).lb(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:weight).lb(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Weight\(oz\) is (.*)$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:weight).oz(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:weight).oz(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^expect orders grid qty. is (.+)$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    20.times { break if SdcGrid.grid_column(:qty).data(TestData.hash[:order_id].values.last).eql? expectation.to_i }
    expect(SdcGrid.grid_column(:qty).data(TestData.hash[:order_id].values.last)).to eql expectation.to_i
  end
end

Then /^expect orders grid item sku is (.+)$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:item_sku).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:item_sku).data(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^expect orders grid item name is (.+)$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:item_name).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:item_name).data(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Ship From is (.+)$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:ship_from).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:ship_from).data(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^expect orders grid service is (?:correct|(.*))$/ do |expectation|
  expectation = TestData.hash[:service] if expectation.nil?
  expectation = TestData.hash[:service_look_up][expectation.split(' ').first].nil? ? expectation : TestData.hash[:service_look_up][expectation.split(' ').first]
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:service).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:service).data(TestData.hash[:order_id].values.last)).to eql(expectation)
  end
end

Then /^expect orders grid insured value is \$(.+)$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:insured_value).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:insured_value).data(TestData.hash[:order_id].values.last)).to eql expectation.to_f.round(2)
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Reference No. is (.+)$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:reference_no).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:reference_no).data(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Tracking service is (.+)$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:tracking_service).data(TestData.hash[:order_id].values.last) == expectation }
    expect(SdcGrid.grid_column(:tracking_service).data(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^expect orders grid order status is (.+)$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:order_status).data(TestData.hash[:order_id].values.last) == expectation }
    expect(SdcGrid.grid_column(:order_status).data(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Tracking Number is populated$/ do
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    20.times { break if SdcGrid.grid_column(:tracking_no).data(TestData.hash[:order_id].values.last).length > 3 }
    expect(SdcGrid.grid_column(:tracking_no).data(TestData.hash[:order_id].values.last).length).to be > 3
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Order Total is (.+)$/ do |expectation|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:order_total).data(TestData.hash[:order_id].values.last).eql? expectation }
    expect(SdcGrid.grid_column(:order_total).data(TestData.hash[:order_id].values.last)).to eql expectation
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Ship Cost error to contain \"(.*)\"$/ do |expectation|
  grid_order_id = SdcGrid.grid_column(:order_id).row 1
  ship_cost_error = SdcGrid.grid_column(:ship_cost).data_error grid_order_id
  expect(ship_cost_error).to include(expectation)
  ship_cost_error = SdcGrid.grid_column(:ship_cost).data_error "81453"
  ship_cost_error = SdcGrid.grid_column(:ship_cost).data_error "81408"
  ship_cost_error = SdcGrid.grid_column(:ship_cost).data_error "81407"
end

Then /^[Ee]xpect [Oo]rders [Gg]rid ship cost data error tooltip is \"(.*)\"$/ do |expectation|
  #SdcLog.step "expect Orders Grid ship cost data error tooltip is #{expectation}"
  grid_order_id = SdcGrid.grid_column(:order_id).row 1
  grid_ship_cost = SdcGrid.grid_column(:ship_cost).data grid_order_id
  error = grid_ship_cost.attribute_expectation "data-errorqtip"
  #SdcLog.step "Test #{(error.include? expectation)?"Passed":"Failed"}"
  expect(error).to include(expectation)
end
