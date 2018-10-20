Then /^select row (\d+) on history grid$/ do |row|
  grid = SdcHistory.grid
  checkbox = grid.grid_column(:checkbox).checkbox_row(row)
  checkbox.check
  step "expect row #{row} on history grid is checked"
end

Then /^expect row (\d+) on history grid is checked$/ do |row|
  expect(SdcHistory.grid.grid_column(:checkbox).checkbox_row(row).checked?).to be_truthy
end


Then /^check history grid row for saved tracking number$/ do
  expect(TestData.hash[:tracking_number]).to be_truthy
  expect(TestData.hash[:tracking_number].size).to be > 15
  grid = SdcHistory.grid
  grid
end

