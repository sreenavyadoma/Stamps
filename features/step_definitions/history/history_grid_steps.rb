Then /^check history grid row for saved tracking number$/ do
  expect(TestData.hash[:tracking_number]).to be_truthy
  expect(TestData.hash[:tracking_number].size).to be > 15
  grid = SdcHistory.grid
  grid
end