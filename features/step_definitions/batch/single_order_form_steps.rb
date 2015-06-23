
When /^Set Recipient Complete Address to ([\w ,-.]+)$/ do |address|
  log_step "Set Recipient Address to \"#{address}\""
  batch.single_order.address = log_param "Address", address
end

When /^Change Ship-To Address to ([\w ,-.]+)$/ do |address|
  log_step "Change Ship-To Address to \"#{address}\""
  batch.single_order.address = log_param "Address", address
end

When /^Set Phone to ([\(]?[0-9]{3}[\)]?[\s]?[0-9]{3}[\s-]?[0-9]{4})$/ do |phone| #[0-9() -]+
  log_step "Set Phone to \"#{phone}\""
  batch.single_order.phone = log_param "Phone", phone
end

When /^Set Email to ([\S]+@[\S]+\.[a-z]{3})$/ do |email|
  log_step "Set Email to \"#{email}\""
  batch.single_order.email = log_param "Email", email
  #end_step step
end

When /^Click Ship To Less button$/ do
  log_step "Click Ship To Less button"
  log "Click Ship To Less button..."
  batch.single_order.less
  log "done."
  #end_step step
end

When /^Set Pounds to (\d+)$/ do |pounds|
  log_step "Set Pounds to \"#{pounds}\""
  batch.single_order.pounds = log_param "Pounds", pounds
  #end_step step
end

When /^Set Ounces to (\d+)$/ do |ounces|
  log_step "Set Ounces to \"#{ounces}\""
  batch.single_order.ounces = log_param "Ounces", ounces
  #end_step step
end

When /^Set Length to (\d+)$/ do |length|
  log_step "Set Length to \"#{length}\""
  batch.single_order.length = log_param "Length", length
  #end_step step
end

When /^Set Width to (\d+)$/ do |width|
  log_step "Set Width to \"#{width}\""
  batch.single_order.width = log_param "Width", width
  #end_step step
end

When /^Set Height to (\d*\.?\d*)$/ do |height|
  log_step "Set Height to \"#{height}\""
  batch.single_order.height = log_param "Height", height
  #end_step step
end

And /^Set Service to ([a-zA-Z -\/]+)$/ do |service|
  log_step "Set Service to \"#{service}\""
  cost = batch.single_order.service log_param "Service", service
  log "Service:  #{service}, Cost:  #{cost}"
  #end_step step
end

And /^Set Insured Value to (\d*\.?\d*)$/ do |insured_value|
  log_step "Set Insured Value to \"#{insured_value}\""
  batch.single_order.insured_value = insured_value
  #end_step step
end

And /^Set Ship From to (\w+)$/ do |selection|
  log_step "Set Ship From to \"#{selection}\""
  batch.single_order.ship_from_default
  #end_step step
end

And /^Set Receipient address to;$/ do |table|
  log_step "Set Receipient address to;\n#{table}"
  batch.single_order.recipient = log_hash_param table.hashes.first
  #end_step step
end

When /^Set order details with;$/ do |table|
  log_step "\"#{table}\""
  log "Set order details with;"
  batch.single_order.edit_details log_hash_param table.hashes.first
  #end_step step
end

Then /^List all grid values for row (.*)$/ do |row|
  log_step "List all grid values for row  \"#{row}\""
  batch.grid.list_all_fields row
  #end_step step
end

When /^Set Receipient partial address to;$/ do |table|
  log_step "Set Recipient partial address to \"#{table}\""
  batch.single_order.partial_address.set table.hashes.first
end

Then /^Select row (\d{1,2}) from Exact Address Not Found module$/ do |row|
  batch.single_order.partial_address.row = 4
end

Then /^Add new Ship-From address;$/ do |table|
  manage_shipping_adddress = batch.single_order.manage_shipping_adddress
  manage_shipping_adddress.add_address(table.hashes.first).should be_successful
end

Then /^Delete all shipping addresses$/ do
  manage_shipping_adddress = batch.single_order.manage_shipping_adddress
  manage_shipping_adddress.delete_all_address #.should be_successful
end

Then /^Change Shipping Info for address having name = \"(.*)\", company = \"(.*)\" and city = \"(.*)\" to;$/ do |name, company, city, new_address_table|
  new_address_details = new_address_table.hashes.first
  manage_shipping_adddress = batch.single_order.manage_shipping_adddress
  manage_shipping_adddress.edit_address(name, company, city, new_address_details).should be_successful
end
