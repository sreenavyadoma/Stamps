Then /^WL: check choose supplies page is present then verify the page and click place order button$/ do
  if TestData.hash[:atg_promotion] == ''
    step 'pause for 2 second'
    expect(WhiteLabel.choose_supplies.cs_header).not_to be_present, 'Choose Supplies Page is PRESENT when there is no ATG Promotion'
  else
    step 'WL: expect choose supplies page is present'
    step 'WL: click choose supplies page place order button'
  end
end

Then /^WL: expect offer does not include an atg promotion$/ do
    expect(TestData.hash[:atg_promotion]).to eql('')
end

Then /^WL: expect choose supplies page is present$/ do
  choose_supplies =  WhiteLabel.choose_supplies
  choose_supplies.cs_welcome_kit.wait_until_present(timeout: 50)
  choose_supplies.cs_header.wait_until_present(timeout: 50)
  step 'pause for 1 second'
  expect(choose_supplies.cs_header).to be_present, "Choose Supplies Page is NOT present, ATG Promotion: #{TestData.hash[:atg_promotion]}"
end

Then /^WL: expect choose supplies page header to be (.*)$/ do |str|
  cs_header =  WhiteLabel.choose_supplies.cs_header
  cs_header.wait_until_present(timeout: 50)
  step 'pause for 1 second'
  expect(cs_header.text_value.strip).to eql(str)
end

Then /^WL: expect choose supplies page paragraph index (\d+) to be$/ do |index, str|
  cs_paragraph = WhiteLabel.choose_supplies.cs_paragraph
  expect(cs_paragraph[index-1].inner_text.strip).to eql(str)
end

Then /^WL: select choose supplies postal scale selection (\d+)$/ do |index|
  cs_postal_scale = WhiteLabel.choose_supplies.cs_postal_scale
  cs_postal_scale[index-1].click
end

Then /^WL: select choose supplies original NetStamps label sheet selection (\d+)$/ do |index|
  cs_original_net_stamps = WhiteLabel.choose_supplies.cs_original_net_stamps
  cs_original_net_stamps[index-1].click
end

Then /^WL: select choose supplies patriotic NetStamps label sheet selection (\d+)$/ do |index|
  cs_patriotic_net_stamps = WhiteLabel.choose_supplies.cs_patriotic_net_stamps
  cs_patriotic_net_stamps[index-1].click
end

Then /^WL: select choose supplies postage, delivery, and return address labels selection (\d+)$/ do |index|
  cs_postage_delivery_return_addr = WhiteLabel.choose_supplies.cs_postage_delivery_return_addr
  cs_postage_delivery_return_addr[index-1].click
end

Then /^WL: select choose supplies thermal printers selection (\d+)$/ do |index|
  cs_thermal_printers = WhiteLabel.choose_supplies.cs_thermal_printers
  cs_thermal_printers[index-1].click
end

Then /^WL: select choose supplies NetStamps label sheet selection (\d+)$/ do |index|
  cs_net_stamps = WhiteLabel.choose_supplies.cs_net_stamps
  cs_net_stamps[index-1].click
end

Then /^WL: select choose supplies business envelopes selection (\d+)$/ do |index|
  cs_business_envelopes = WhiteLabel.choose_supplies.cs_business_envelopes
  cs_business_envelopes[index-1].click
end

Then /^WL: select choose supplies large mailers with peel-n-seal selection (\d+)$/ do |index|
  cs_large_mailers = WhiteLabel.choose_supplies.cs_large_mailers
  cs_large_mailers[index-1].click
end

Then /^WL: click choose supplies page place order button$/ do
  choose_supplies =  WhiteLabel.choose_supplies
  choose_supplies.cs_welcome_kit.wait_until_present(timeout: 50)
  choose_supplies.place_order.wait_until_present(timeout: 30)
  choose_supplies.place_order.click!

end

