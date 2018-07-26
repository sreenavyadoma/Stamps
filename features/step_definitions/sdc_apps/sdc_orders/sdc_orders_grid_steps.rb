Then /^check row for order (\d+)$/ do |num|
  order_id = TestData.hash[:order_id][num]
  SdcGrid.body.wait_until_present(timeout: 10)
  sleep 7 unless SauceSession.config.build_number
  step "check grid order id #{order_id}"
end

Then /^uncheck row for order (\d+)$/ do |num|
  order_id = TestData.hash[:order_id][num]
  SdcGrid.body.wait_until_present(timeout: 10)
  sleep 7 unless SauceSession.config.build_number
  step "uncheck grid order id #{order_id}"
end

Then /^check grid order id(?:| (\d*))$/ do |order_id|
  order_id ||= if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  SdcGrid.body.wait_until_present(timeout: 10)
  sleep 1 unless SauceSession.config.build_number
  column = SdcGrid.grid_column(:checkbox)
  row = column.row_num(order_id)
  checkbox = column.checkbox_row(row)
  checkbox.check
  result = checkbox.checked?
  expect(result).to be(true)
end

Then /^uncheck grid order id(?:| (\d*))$/ do |order_id|
  order_id ||= if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
               end
  SdcGrid.body.wait_until_present(timeout: 10)
  sleep 1 unless SauceSession.config.build_number
  column = SdcGrid.grid_column(:checkbox)
  row = column.row_num(order_id)
  checkbox = column.checkbox_row(row)
  checkbox.uncheck
  result = checkbox.checked?
  expect(result).to be(false)
end

When /^check row (\d+)$/ do |row|
  SdcGrid.body.wait_until_present(timeout: 10)
  checkbox = SdcGrid.grid_column(:checkbox).checkbox_row(row)
  checkbox.check
  expect(checkbox.checked?).to be(true)
end

When /^uncheck row (\d+)$/ do |row|
  SdcGrid.body.wait_until_present(timeout: 10)
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
  result = SdcGrid.grid_column(:store).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid order id is (?:correct|(.*))$/ do |order_id|
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  result = SdcGrid.grid_column(:order_id).data(order_id)
  expect(result).to eql order_id
end

Then /^expect orders grid ship cost is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:total_ship_cost]
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  result = SdcGrid.grid_column(:ship_cost).data(order_id).dollar_amount_str
  expect(result.to_f).to eql str.to_f
end

Then /^expect orders grid ship date is (?:correct|(.*))$/ do |str|
  # Ship date is set after user prints label
  str ||= TestData.hash[:ship_date]
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end

  column = SdcGrid.grid_column(:ship_date)
  expect(column).to be_present
  expect(column.header_text).to eql('Ship Date')
  # Only validate if there's an actual ship date from printing label
  if str
    str = TestHelper.grid_date_format(str)
    result = column.data(order_id)
    expect(result).to eql(str)
  end
end

Then /^expect orders grid date printed is (?:correct|(.*))$/ do |str|
  # Date printed is set after user prints label
  str ||= TestData.hash[:date_printed]
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end

  column = SdcGrid.grid_column(:date_printed)
  expect(column).to be_present
  expect(column.header_text).to eql('Date Printed')
  # Only validate if there's a print date after printing label
  if str
    str = TestHelper.grid_date_format(str)
    result = column.data(order_id)
    expect(result).to eql(str)
  end
end

Then /^expect orders grid order date is populated$/ do
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  result = SdcGrid.grid_column(:order_date).data(order_id)
  expect(result).not_to eql('')
end

Then /^expect orders grid age is (.+)$/ do |str|
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  result = SdcGrid.grid_column(:age).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid recipient is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:full_name]
  order_id = TestData.hash[:order_id].values.last
  expect(order_id).to be_truthy
  sleep 2 unless SauceSession.config.build_number
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

Then /^expect orders grid country is (?:correct|(.*))$/ do |str|
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

Then /^expect orders grid weight is (\d+) lb. (\d+) oz.$/ do |lb, oz|
  str = "#{lb} lbs. #{oz} oz."
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:weight).data(order_id)
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
  expect(result.to_i).to eql str.to_i
end

Then /^expect orders grid item sku is (.+)$/ do |str|
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:item_sku).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid item name is (.+)$/ do |str|
  order_id = TestData.hash[:order_id].values.last
  column = SdcGrid.grid_column(:item_name)
  element = column.element_for_id(order_id)
  5.times do
    break if element.text_value.size.eql? str.size
    element.scroll_into_view
    element.click
    element.double_click
    SdcPage.browser.wait_until(timeout: 2) { element.text_value.size.eql? str.size }
  end
  result = column.data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid service is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:grid_service]
  order_id = TestData.hash[:order_id].values.last
  result = SdcGrid.grid_column(:service).data(order_id)
  expect(result).to eql(str)
end

Then /^expect orders grid service ship-from is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:ship_from]
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  result = SdcGrid.grid_column(:ship_from).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid insured value is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:insured_value]
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  result = SdcGrid.grid_column(:insured_value).data(order_id)
  cost = result.dollar_amount_str.to_f
  expect(cost).to eql str.to_f
end

Then /^expect orders grid reference number is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:reference_no]
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  result = SdcGrid.grid_column(:reference_no).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid tracking service is (?:correct|(.*))$/ do |str|
  str ||= TestData.hash[:tracking]
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  result = SdcGrid.grid_column(:tracking_service).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid order status is (.+)$/ do |str|
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  result = SdcGrid.grid_column(:order_status).data(order_id)
  expect(result).to eql str
end

Then /^expect orders grid tracking number is populated$/ do
  order_id = if order_id.nil?
               TestData.hash[:order_id].values.last
             elsif order_id.size < 2
               TestData.hash[:order_id][order_id.to_i]
             end
  result = SdcGrid.grid_column(:tracking_no).data(order_id)
  expect(result).not_to eql ''
end

Then /^expect orders grid order total is (?:correct|(.*))$/ do |str|
  pending
  # str ||= TestData.hash[:total_ship_cost]
  # order_id = if order_id.nil?
  #              TestData.hash[:order_id].values.last
  #            elsif order_id.size < 2
  #              TestData.hash[:order_id][order_id.to_i]
  #            end
  # result = SdcGrid.grid_column(:ship_cost).data(order_id)
  # expect(result.dollar_amount_str.to_f).to eql str.to_f
end

Then /^[Ee]xpect [Oo]rders [Gg]rid Ship Cost error to contain \"(.*)\"$/ do |str|
  grid_order_id = SdcGrid.grid_column(:order_id).text_at_row 1
  ship_cost_error = SdcGrid.grid_column(:ship_cost).data_error grid_order_id
  expect(ship_cost_error).to include(str)
  ship_cost_error = SdcGrid.grid_column(:ship_cost).data_error "81453"
  ship_cost_error = SdcGrid.grid_column(:ship_cost).data_error "81408"
  ship_cost_error = SdcGrid.grid_column(:ship_cost).data_error "81407"
end

Then /^[Ee]xpect [Oo]rders [Gg]rid ship cost data error tooltip is \"(.*)\"$/ do |str|
  #SdcLog.step "expect Orders Grid ship cost data error tooltip is #{str}"
  grid_order_id = SdcGrid.grid_column(:order_id).text_at_row 1
  grid_ship_cost = SdcGrid.grid_column(:ship_cost).data grid_order_id
  error = grid_ship_cost.attribute_str "data-errorqtip"
  #SdcLog.step "Test #{(error.include? str)?"Passed":"Failed"}"
  expect(error).to include(str)
end
