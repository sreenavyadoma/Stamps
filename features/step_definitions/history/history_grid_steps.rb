Then /^check row (\d+) on history grid$/ do |row|
  grid = SdcHistory.grid
  checkbox = grid.grid_column(:checkbox)
  row = checkbox.checkbox_row(row)
  row.check
  expect(row.checked?).to be_truthy
end

Then /^uncheck row (\d+) on history grid$/ do |row|
  grid = SdcHistory.grid
  checkbox = grid.grid_column(:checkbox)
  row = checkbox.checkbox_row(row)
  row.uncheck
  expect(row.checked?).to be false
end

Then /^check row for saved tracking number on history grid$/ do
  TestData.hash[:tracking_number] = '9405511899561459253313'
  expect(TestData.hash[:tracking_number]).to be_truthy
  expect(TestData.hash[:tracking_number].size).to be > 15
  tracking = SdcHistory.grid_column(:tracking_number)
  row_number = tracking.row_num(TestData.hash[:tracking_number])

  checkbox = grid.grid_column(:checkbox)
  row = checkbox.checkbox_row(row_number)
  row.check
end

Then /^expect history grid column (.+) is (.+) for row (\d+)$/ do |column, value, row|
  column = case column
             when 'Date Printed'
               :date_printed
             when 'Total Cost'
               :total_cost
             when 'Adj. Amount'
               :adj_amount
             when 'Shipment Status'
               :shipment_status
             when 'Tracking #'
               :tracking_number
             when 'Date Delivered'
               :date_delivered
             when 'Recipient'
               :recipient
             when 'Weight'
               :weight
             when 'Carrier'
               :carrier
             when 'Service'
               :service
             when 'Insured For'
               :insured_for
             when 'Insurance ID'
               :insurance_id
             when 'Ship Date'
               :ship_date
             when 'Cost Code'
               :cost_code
             when 'Printed Message'
               :printed_message
             when 'User'
               :user
             when 'Refund Type'
               :refund_type
             when 'Refund Request Date'
               :refund_request_date
             when 'Refund Status'
               :refund_status
             when 'Refund Requested'
               :refund_requested
           end
  expect(SdcHistory.grid.grid_column(column).text_at_row(row)).to eql(value)
end

Then /^expect history grid column (.+) is (.+) for saved tracking number$/ do |column, value|
  row_num = SdcHistory.grid.grid_column(:tracking_number).row_num(TestData.hash[:tracking_number])
  step "expect history grid column #{column} is #{value} for row #{row_num}"
end

# correct for row #
Then /^expect history grid weight is correct for row (\d+)$/ do |row|
  str = "#{TestData.hash[:lbs]} lbs. #{TestData.hash[:oz]} oz."
  step "expect history grid column Weight is #{str} for row #{row}"
end

Then /^expect history tracking # is correct for row (\d+)$/ do |row|
  step "expect history grid column Tracking # is #{TestData.hash[:tracking]} for row #{row}"
end

Then /^expect history Service is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:service]} for row #{row}"
end

Then /^expect history grid Total Cost is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:total_ship_cost]} for row #{row}"
end

Then /^expect history grid Insured For is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:insure_for_cost]} for row #{row}"
end

Then /^expect history grid Cost Code is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:cost_code]} for row #{row}"
end

Then /^expect history grid Ship Date is correct for row (\d+)$/ do |row|
  step "expect history grid column Weight is #{TestData.hash[:ship_date]} for row #{row}"
end

