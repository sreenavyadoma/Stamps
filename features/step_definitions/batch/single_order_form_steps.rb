
When /^Set Ship-To address to (.*)$/ do |address|
  log "Set Ship-To address to \"#{address}\""
  batch.single_order_form.address = log_param "Address", address
end

When /^Change Ship-To Address to (.*)$/ do |value|
  log "Change Ship-To Address to \"#{value}\""
  batch.single_order_form.address = log_param "Address", value
end

When /^Set Phone to (.*)$/ do |value|
  begin
    log "Set Phone to \"#{value}\""
    batch.single_order_form.phone = log_param "Phone", value
  end unless value.length == 0
end

When /^Set Email to (.*)$/ do |value|
  begin
    log "Set Email to \"#{value}\""
    batch.single_order_form.email = log_param "Email", value
  end unless value.length == 0
  #end_step step
end

When /^Click Ship To Less button$/ do
  log "Click Ship To Less button..."
  batch.single_order_form.less
  log "done."
  #end_step step
end

When /^Set Pounds to (\d*)$/ do |value|
  begin
    log "Set Pounds to \"#{value}\""
    batch.single_order_form.pounds = log_param "Pounds", value
  end unless value.length == 0
end

When /^Set Ounces to (\d*)$/ do |value|
  begin
    log "Set Ounces to \"#{value}\""
    batch.single_order_form.ounces = log_param"Ounces", value
  end unless value.length == 0
end

When /^Set Length to (\d*)$/ do |value|
  begin
    log "Set Length to \"#{value}\""
    batch.single_order_form.length = log_param "Length", value
  end unless value.length == 0
end

When /^Set Width to (\d*)$/ do |value|
  begin
    log "Set Width to \"#{value}\""
    batch.single_order_form.width = log_param "Width", value
  end unless value.length == 0
end

When /^Set Height to (\d*)$/ do |value|
  begin
    log "Set Height to \"#{value}\""
    batch.single_order_form.height = log_param "Height", value
  end unless value.length == 0
end

And /^Set Service to (.*)$/ do |value|
  batch.single_order_form.service log_param "Service", value
end

Then /^Set Tracking to ([\w ]*)$/ do |value|
  begin
    batch.single_order_form.tracking = log_param "Tracking", value
  end unless value.length == 0
end

And /^Set Insured Value to \$([\d*\.?\d*]*)$/ do |value|
  batch.single_order_form.insured_value = value
end

And /^Set Ship From to (\w+)$/ do |value|
  batch.single_order_form.ship_from_default
end

And /^Set Ship-To address to;$/ do |table|
  batch.single_order_form.recipient = log_hash_param table.hashes.first
end

When /^Set order details with;$/ do |table|
  log "Set order details with;"
  batch.single_order_form.edit_details log_hash_param table.hashes.first
end

Then /^List all grid values for row (.*)$/ do |row|
  log "List all grid values for row  \"#{row}\""
  batch.grid.list_all_fields row
end

When /^Set Receipient partial address to;$/ do |table|
  batch.single_order_form.partial_address.set table.hashes.first
end

Then /^Select row (\d{1,2}) from Exact Address Not Found module$/ do |row|
  batch.single_order_form.partial_address.row = row
end

Then /^Add new Ship-From address;$/ do |table|
  batch.single_order_form.manage_shipping_addresses.add_address(table.hashes.first).should be_successful
end

Then /^Set Ship From to Manage Shipping Addresses$/ do
  batch.single_order_form.manage_shipping_addresses.add_address(table.hashes.first).should be_successful
end

Then /^Delete all shipping addresses$/ do
  batch.single_order_form.manage_shipping_addresses.delete_all #.should be_all_deleted
end

Then /^Delete Row (\d+)$/ do |row|
  batch.single_order_form.manage_shipping_addresses.delete_row row
end

Then /^Delete all shipping addresses and fail test if delete fails$/ do
  batch.single_order_form.manage_shipping_addresses.delete_all.should be_deleted
end

Then /^Edit Ship-From address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  batch.single_order_form.manage_shipping_addresses.edit_address(name, company, city,  new_address.hashes.first).should be_successful
end
