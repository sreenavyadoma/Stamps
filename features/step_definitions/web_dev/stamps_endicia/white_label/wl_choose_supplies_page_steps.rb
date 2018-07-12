Then /^WL: expect customize your welcome kit is present$/ do
  cs_header =  WhiteLabel.choose_supplies.cs_header
  cs_header.wait_until_present(timeout: 50)
  expect(cs_header).to be_present, 'Customize your Welcome Kit is NOT present'
end

Then /^WL: click choose supplies page place order button$/ do
  place_order =  WhiteLabel.choose_supplies.place_order
  place_order.wait_until_present(timeout: 30)
  place_order.click
end

