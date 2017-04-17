
Then /^[Oo]n Order Details form, Delete Ship-From address (\w+)$/ do |address|
  # not implemented
end

Then /^on Manage Shipping Address modal, delete all addresses$/ do
  #config.logger.step "on Manage Shipping Address modal, delete all addresses"
  stamps.orders.order_details.ship_from.select("Manage Shipping Addresses").delete_all.close_window
end

Then /^on Manage Shipping Address modal, delete Row (\d+) from Manage Shipping Addresses Modal/ do |row|
  stamps.orders.order_details.ship_from.select("Manage Shipping Addresses").delete_row(row)
end

Then /^on Manage Shipping Address modal, edit address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  ship_address_modal = stamps.orders.order_details.ship_from.select "Manage Shipping Addresses"
  add_shipping_address = ship_address_modal.select_address(name, company, city)
  add_shipping_address.ship_from_address new_address.hashes.first
end

Then /^on Manage Shipping Address modal, add address$/ do |ship_from|
  parameter[:ship_from_address] = ship_from.hashes.first
  parameter[:ship_from_zip] = parameter[:ship_from_address]["ship_from_zip"]
  parameter[:name] = parameter[:ship_from_address]['name']
  parameter[:company] = parameter[:ship_from_address]['company']
  parameter[:street_address] = parameter[:ship_from_address]["street_address"]
  parameter[:street_address2] = parameter[:ship_from_address]["street_address2"]
  parameter[:city] = parameter[:ship_from_address]['city']
  parameter[:state] = parameter[:ship_from_address]["state"]
  parameter[:zip] = parameter[:ship_from_address]["zip"]
  parameter[:phone] = parameter[:ship_from_address]['phone']
  stamps.orders.order_details.ship_from.select("Manage Shipping Addresses").add.ship_from_address(parameter[:ship_from_address])
end

Then /^on Manage Shipping Address modal, add address (\w+)$/ do |address|
  parameter[:ship_from_address] = (address.include? 'random ship from zone 1 through 4')?(helper.rand_ship_from_zone_1_4):address
  stamps.orders.order_details.ship_from.select("Manage Shipping Addresses").add(parameter[:ship_from_address])
end

Then /^on Manage Shipping Address modal, set Manage Shipping Addresses to$/ do
  stamps.orders.order_details.ship_from.select("Manage Shipping Addresses").add table.hashes.first
end

Then /^on Manage Shipping Address modal, expect selection has (.*)$/ do |address|
  step "On Order Details form, blur out"
  #stamps.orders.order_details.ship_from.select("Manage Shipping Addresses").address_located?(test_data[:ship_from_address])).to be(true)
end