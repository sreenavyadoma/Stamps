Then /^WL: click choose supplies page place order button$/ do
  place_order =  WhiteLabel.choose_supplies.place_order
  place_order.wait_until_present(timeout: 30)
  place_order.click
end