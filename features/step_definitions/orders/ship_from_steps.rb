
Then /^Details: Delete Ship-From address (\w+)$/ do |address|
  logger.step "Details: Delete Ship-From address #{address}"
  # not implemented
end

Then /^Ship-From: Delete all addresses$/ do
  logger.step "Ship-From: Delete all addresses"
  web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").delete_all.close_window
end

Then /^Ship-From: Delete Row (\d+) from Manage Shipping Addresses Modal/ do |row|
  logger.step "Ship-From: Delete Row #{row} from Manage Shipping Addresses Modal"
  web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").delete_row(row)
end

Then /^Ship-From: Edit address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  logger.step "Ship-From: Edit address for name = \"#{name}\", company = \"#{company}\" and city = \"#{city}\" to #{new_address}"
  ship_address_modal = web_apps.orders.details.ship_from.select "Manage Shipping Addresses..."
  ship_address_modal.edit_address name, company, city,  new_address.hashes.first
end

Then /^Ship-From: Add address$/ do |ship_from|
  logger.step "Ship-From: Add address #{ship_from}"
  add_form = web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").add.shipping_address ship_from.hashes.first
end

Then /^Ship-From: Add address (\w+)$/ do |address|
  ship_from = (address.include?'random ship from zone 1 through 4')?(ParameterHelper.rand_ship_from_zone_1_4):address
  logger.step "Ship-From: Add address #{(address.include?'random')?ship_from:(address)}"
  @ship_from_address = web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").add(ship_from)
  logger.step "Random address added: #{@ship_from_address}"
end

Then /^Ship-From: Set Manage Shipping Addresses to$/ do
  logger.step "Ship-From: Set Manage Shipping Addresses to"
  web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").add table.hashes.first
end

Then /^Ship-From: Expect selection has (.*)$/ do |address|
  logger.step "Expect #{address} Ship-From address was added"
  step "Details: Blur out"
  web_apps.orders.details.ship_from.select("Manage Shipping Addresses...").address_located?(@ship_from_address).should be true
end