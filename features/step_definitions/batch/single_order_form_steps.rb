
When /^Set Recipient Complete Address to (.*)$/ do |address|
  log "Set Recipient Address to \"#{address}\""
  batch.single_order.address = log_param "Address", address
end

When /^Change Ship-To Address to (.*)$/ do |value|
  log "Change Ship-To Address to \"#{value}\""
  batch.single_order.address = log_param "Address", value
end

When /^Set Phone to (.*)$/ do |value|
  begin
    log "Set Phone to \"#{value}\""
    batch.single_order.phone = log_param "Phone", value
  end unless value.length == 0
end

When /^Set Email to (.*)$/ do |value|
  begin
    log "Set Email to \"#{value}\""
    batch.single_order.email = log_param "Email", value
  end unless value.length == 0
  #end_step step
end

When /^Click Ship To Less button$/ do
  log "Click Ship To Less button"
  log "Click Ship To Less button..."
  batch.single_order.less
  log "done."
  #end_step step
end

When /^Set Pounds to (\d+)$/ do |value|
  begin
    log "Set Pounds to \"#{value}\""
    batch.single_order.pounds = log_param "Pounds", value
  end unless value.length == 0
end

When /^Set Ounces to (\d*)$/ do |value|
  begin
    log "Set Ounces to \"#{value}\""
    batch.single_order.ounces = log_param"Ounces", value
  end unless value.length == 0
end

When /^Set Length to (\d*)$/ do |value|
  begin
    log "Set Length to \"#{value}\""
    batch.single_order.length = log_param "Length", value
  end unless value.length == 0
end

When /^Set Width to (\d+)$/ do |value|
  begin
    log "Set Width to \"#{value}\""
    batch.single_order.width = log_param"Width", value
  end unless value.length == 0
end

When /^Set Height to (\d+)$/ do |value|
  begin
    log "Set Height to \"#{value}\""
    batch.single_order.height = log_param "Height", value
  end unless value.length == 0
end

And /^Set Service to (.*)$/ do |value|
  log "Set Service to \"#{value}\""
  cost = batch.single_order.service log_param "Service", value
  log "Service:  #{value}, Cost:  #{cost}"
end

Then /^Set Tracking to ([\w ]*)$/ do |value|
  log "Set Tracking to \"#{value}\""
  log "Tracking:  #{value}, Cost:  #{batch.single_order.tracking = log_param("Tracking", value)}"
  #end_step step
end

And /^Set Insured Value to (\d*\.?\d*)$/ do |value|
  log "Set Insured Value to \"#{value}\""
  batch.single_order.insured_value = value
end

And /^Set Ship From to (\w+)$/ do |value|
  log "Set Ship From to \"#{value}\""
  batch.single_order.ship_from_default
end

And /^Set Receipient address to;$/ do |table|
  log "Set Receipient address to;\n#{table}"
  batch.single_order.recipient = log_hash_param table.hashes.first
end

When /^Set order details with;$/ do |table|
  log "\"#{table.hashes.first}\""
  log "Set order details with;"
  batch.single_order.edit_details log_hash_param table.hashes.first
end

Then /^List all grid values for row (.*)$/ do |row|
  log "List all grid values for row  \"#{row}\""
  batch.grid.list_all_fields row
end

When /^Set Receipient partial address to;$/ do |table|
  log "Set Recipient partial address to \"#{table.hashes.first}\""
  batch.single_order.partial_address.set table.hashes.first
end

Then /^Select row (\d{1,2}) from Exact Address Not Found module$/ do |row|
  batch.single_order.partial_address.row = row
end

Then /^Add new Ship-From address;$/ do |table|
  batch.single_order.manage_shipping_addresses.add_address(table.hashes.first).should be_successful
end

Then /^Set Ship From to Manage Shipping Addresses$/ do
  batch.single_order.manage_shipping_addresses.add_address(table.hashes.first).should be_successful
end

Then /^Delete all shipping addresses$/ do
  batch.single_order.manage_shipping_addresses.delete_all #.should be_all_deleted
end

Then /^Delete all shipping addresses and fail test if delete fails$/ do
  batch.single_order.manage_shipping_addresses.delete_all.should be_deleted
end

Then /^Edit Ship-From address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  batch.single_order.manage_shipping_addresses.edit_address(name, company, city,  new_address.hashes.first).should be_successful
end
