
Then /^Details: Delete Ship-From address (\w+)$/ do |address|
  logger.step "Details: Delete Ship-From address #{address}"
  # not implemented
end

Then /^Ship-From: Delete all addresses$/ do
  logger.step "Ship-From: Delete all addresses"
  stamps.orders.order_details.ship_from.select("Manage Shipping Addresses...").delete_all.close_window
end

Then /^Ship-From: Delete Row (\d+) from Manage Shipping Addresses Modal/ do |row|
  logger.step "Ship-From: Delete Row #{row} from Manage Shipping Addresses Modal"
  stamps.orders.order_details.ship_from.select("Manage Shipping Addresses...").delete_row(row)
end

Then /^Ship-From: Edit address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  logger.step "Ship-From: Edit address for name = \"#{name}\", company = \"#{company}\" and city = \"#{city}\" to #{new_address}"
  ship_address_modal = stamps.orders.order_details.ship_from.select "Manage Shipping Addresses..."
  ship_address_modal.edit_address name, company, city,  new_address.hashes.first
end

Then /^Ship-From: Add address$/ do |ship_from|
  test_data[:ship_from_address] = ship_from
  logger.step "Ship-From: Add address #{test_data[:ship_from_address]}"
  add_form = stamps.orders.order_details.ship_from.select("Manage Shipping Addresses...")
  add_form.add.shipping_address test_data[:ship_from_address].hashes.first
end

Then /^Ship-From: Add address (\w+)$/ do |address|
  test_data[:ship_from_address] = (address.include?'random ship from zone 1 through 4')?(ParameterHelper.rand_ship_from_zone_1_4):address
  stamps.orders.order_details.ship_from.select("Manage Shipping Addresses...").add(test_data[:ship_from_address])
  logger.step "Random address added: #{test_data[:ship_from_address]}"
end

Then /^Ship-From: Set Manage Shipping Addresses to$/ do
  logger.step "Ship-From: Set Manage Shipping Addresses to"
  stamps.orders.order_details.ship_from.select("Manage Shipping Addresses...").add table.hashes.first
end

Then /^Ship-From: Expect selection has (.*)$/ do |address|
  logger.step "Expect #{address} Ship-From address was added"
  step "Details: Blur out"
  #stamps.orders.order_details.ship_from.select("Manage Shipping Addresses...").address_located?(test_data[:ship_from_address]).should be true
end