Then /^WL: check choose supplies page is present then verify the page and click place order button$/ do
  if TestData.hash[:atg_promotion] == ''
    expect(WhiteLabel.choose_supplies.cs_header).not_to be_present, 'Choose Supplies Page is PRESENT when there is no ATG Promotion'
  else
    step 'WL: expect choose supplies page customize your welcome kit is present'
    step 'WL: click choose supplies page place order button'
  end
end

Then /^WL: expect choose supplies page customize your welcome kit is present$/ do
  cs_header =  WhiteLabel.choose_supplies.cs_header
  cs_header.wait_until_present(timeout: 50)
  expect(cs_header).to be_present, "Customize your Welcome Kit is NOT present, ATG Promotion: #{TestData.hash[:atg_promotion]}"
end

Then /^WL: click choose supplies page place order button$/ do
  place_order =  WhiteLabel.choose_supplies.place_order
  place_order.wait_until_present(timeout: 30)
  place_order.click!
end

