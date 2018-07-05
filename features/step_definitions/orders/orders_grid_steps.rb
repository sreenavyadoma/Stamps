
Then /^check grid order id(?:| (\d*))$/ do |order_id|
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
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

Then /^expect orders grid store is (.*)$/ do |str|
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  column = SdcGrid.grid_column(:store)
  result = column.data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid order id is (?:correct|(.*))$/ do |order_id|
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  column = SdcGrid.grid_column(:order_id)
  result = column.data(order_id)
  expect(result).to eql order_id
end

Then /^expect orders grid ship cost is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:total_ship_cost]
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  column = SdcGrid.grid_column(:ship_cost)
  result = column.data(order_id)
  expect(result).to eql str
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

Then /^expect orders grid age is (.+)$/ do |str|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    expect(TestData.hash[:order_id].values.last).to be_truthy
    10.times { break if SdcGrid.grid_column(:age).data(TestData.hash[:order_id].values.last).eql? str }
    expect(SdcGrid.grid_column(:age).data(TestData.hash[:order_id].values.last)).to eql str
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

Then /^expect orders grid recipient is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:full_name]
  order_id = TestData.hash[:order_id].values.last
  expect(order_id).to be_truthy
  result = SdcGrid.grid_column(:recipient).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid company is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:company]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:company).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid address is (?:correct|(.*))$/ do |str|
  address1 = TestData.hash[:street_address1]
  address2 = TestData.hash[:street_address2]
  str ||= "#{address1}#{(address2.scan(/(\w+)/).size > 0) ? " #{address2}" : ""}"
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:address).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid city is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:city]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:city).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid state is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:state] || TestData.hash[:province]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:state).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid zip is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:zip] || TestData.hash[:postal_code]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:zip).data(order_id)
  expect(result).to include(str)
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Country is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:country]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:country).data(order_id)
  expect(result).to include(str)
end

Then /^expect orders grid email is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:email]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:email).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid phone is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:phone]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:phone).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid pounds is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:pounds]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:weight).lb(order_id)
  expect(result).to eql str.to_i
end

Then /^expect orders grid ounces is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:ounces]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:weight).oz(order_id)
  expect(result).to eql str.to_i
end

Then /^expect orders grid qty is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:items_ordered_qty]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:qty).data(order_id)
  expect(result).to eql str.to_i
end

Then /^expect orders grid item sku is (.+)$/ do |str|
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:item_sku).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid item name is (.+)$/ do |str|
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:item_name).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid weight is (\d+) lb. (\d+) oz.$/ do |lb, oz|
  str = "#{lb} lbs. #{oz} oz."
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:weight).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid service is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:grid_service]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:service).data(order_id)
  expect(result).to eql(str)
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Ship From is (.+)$/ do |str|


  expect(SdcGrid.grid_column(:ship_from).data(TestData.hash[:order_id].values.last)).to eql str
end

Then /^expect orders grid insured value is \$(.+)$/ do |str|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:insured_value).data(TestData.hash[:order_id].values.last).eql? str }
    expect(SdcGrid.grid_column(:insured_value).data(TestData.hash[:order_id].values.last)).to eql str.to_f.round(2)
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Reference No. is (.+)$/ do |str|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:reference_no).data(TestData.hash[:order_id].values.last).eql? str }
    expect(SdcGrid.grid_column(:reference_no).data(TestData.hash[:order_id].values.last)).to eql str
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Tracking service is (.+)$/ do |str|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:tracking_service).data(TestData.hash[:order_id].values.last) == str }
    expect(SdcGrid.grid_column(:tracking_service).data(TestData.hash[:order_id].values.last)).to eql str
  end
end

Then /^expect orders grid order status is (.+)$/ do |str|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:order_status).data(TestData.hash[:order_id].values.last) == str }
    expect(SdcGrid.grid_column(:order_status).data(TestData.hash[:order_id].values.last)).to eql str
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

Then /^[Ee]xpect [Oo]rders [Gg]rid Order Total is (.+)$/ do |str|
  if SdcEnv.new_framework
    #todo - orders grid implementation
  else
    10.times { break if SdcGrid.grid_column(:order_total).data(TestData.hash[:order_id].values.last).eql? str }
    expect(SdcGrid.grid_column(:order_total).data(TestData.hash[:order_id].values.last)).to eql str
  end
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Ship Cost error to contain \"(.*)\"$/ do |str|
  grid_order_id = SdcGrid.grid_column(:order_id).row 1
  ship_cost_error = SdcGrid.grid_column(:ship_cost).data_error grid_order_id
  expect(ship_cost_error).to include(str)
  ship_cost_error = SdcGrid.grid_column(:ship_cost).data_error "81453"
  ship_cost_error = SdcGrid.grid_column(:ship_cost).data_error "81408"
  ship_cost_error = SdcGrid.grid_column(:ship_cost).data_error "81407"
end

Then /^[Ee]xpect [Oo]rders [Gg]rid ship cost data error tooltip is \"(.*)\"$/ do |str|
  #SdcLog.step "expect Orders Grid ship cost data error tooltip is #{str}"
  grid_order_id = SdcGrid.grid_column(:order_id).row 1
  grid_ship_cost = SdcGrid.grid_column(:ship_cost).data grid_order_id
  error = grid_ship_cost.attribute_str "data-errorqtip"
  #SdcLog.step "Test #{(error.include? str)?"Passed":"Failed"}"
  expect(error).to include(str)
end
