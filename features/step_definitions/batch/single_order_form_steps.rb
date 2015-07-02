
When /^Set Recipient Complete Address to ([\w ,-.]+)$/ do |address|
  log "Set Recipient Address to \"#{address}\""
  batch.single_order.address = log_param "Address", address
end

When /^Change Ship-To Address to ([\w ,-.]+)$/ do |address|
  log "Change Ship-To Address to \"#{address}\""
  batch.single_order.address = log_param "Address", address
end

When /^Set Phone to ([\(]?[0-9]{3}[\)]?[\s]?[0-9]{3}[\s-]?[0-9]{4})$/ do |phone| #[0-9() -]+
  log "Set Phone to \"#{phone}\""
  batch.single_order.phone = log_param "Phone", phone
end

When /^Set Email to ([\S]+@[\S]+\.[a-z]{3})$/ do |email|
  log "Set Email to \"#{email}\""
  batch.single_order.email = log_param "Email", email
  #end_step step
end

When /^Click Ship To Less button$/ do
  log "Click Ship To Less button"
  log "Click Ship To Less button..."
  batch.single_order.less
  log "done."
  #end_step step
end

When /^Set Pounds to (\d+)$/ do |pounds|
  log "Set Pounds to \"#{pounds}\""
  batch.single_order.pounds = log_param "Pounds", pounds
  #end_step step
end

When /^Set Ounces to (\d+)$/ do |ounces|
  log "Set Ounces to \"#{ounces}\""
  batch.single_order.ounces = log_param "Ounces", ounces
  #end_step step
end

When /^Set Length to (\d+)$/ do |length|
  log "Set Length to \"#{length}\""
  batch.single_order.length = log_param "Length", length
  #end_step step
end

When /^Set Width to (\d+)$/ do |width|
  log "Set Width to \"#{width}\""
  batch.single_order.width = log_param "Width", width
  #end_step step
end

When /^Set Height to (\d*\.?\d*)$/ do |height|
  log "Set Height to \"#{height}\""
  batch.single_order.height = log_param "Height", height
  #end_step step
end

And /^Set Service to ([a-zA-Z -\/]+)$/ do |service|
  log "Set Service to \"#{service}\""
  cost = batch.single_order.service log_param "Service", service
  log "Service:  #{service}, Cost:  #{cost}"
  #end_step step
end

And /^Set Insured Value to (\d*\.?\d*)$/ do |insured_value|
  log "Set Insured Value to \"#{insured_value}\""
  batch.single_order.insured_value = insured_value
  #end_step step
end

And /^Set Ship From to (\w+)$/ do |selection|
  log "Set Ship From to \"#{selection}\""
  batch.single_order.ship_from_default
  #end_step step
end

And /^Set Receipient address to;$/ do |table|
  log "Set Receipient address to;\n#{table}"
  batch.single_order.recipient = log_hash_param table.hashes.first
  #end_step step
end

When /^Set order details with;$/ do |table|
  log "\"#{table.hashes.first}\""
  log "Set order details with;"
  batch.single_order.edit_details log_hash_param table.hashes.first
  #end_step step
end

Then /^List all grid values for row (.*)$/ do |row|
  log "List all grid values for row  \"#{row}\""
  batch.grid.list_all_fields row
  #end_step step
end

When /^Set Receipient partial address to;$/ do |table|
  log "Set Recipient partial address to \"#{table.hashes.first}\""
  batch.single_order.partial_address.set table.hashes.first
end

Then /^Select row (\d{1,2}) from Exact Address Not Found module$/ do |row|
  batch.single_order.partial_address.row = row
end

Then /^Add new Ship-From address;$/ do |table|
  batch.single_order.manage_shipping_addresses.add_address(table.hashes.first)#.should be_added
end

Then /^Set Ship From to Manage Shipping Addresses$/ do
  batch.single_order.manage_shipping_addresses.add_address(table.hashes.first).should be_added
end

Then /^Delete all shipping addresses$/ do
  batch.single_order.manage_shipping_addresses.delete_all #.should be_all_deleted
end

Then /^Delete all shipping addresses and fail test if delete fails$/ do
  batch.single_order.manage_shipping_addresses.delete_all.should be_deleted
end

Then /^Edit Ship-From address for name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address|
  batch.single_order.manage_shipping_addresses.edit_address(name, company, city,  new_address.hashes.first).should be_edited
end
