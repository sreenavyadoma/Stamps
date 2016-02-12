
Then /^Orders Grid: Order ID: Columns Menu: Check Reference No$/ do
  log.info "Step Orders Grid: Order ID: Columns Menu: Check Reference No."
  orders.grid.order_id.menu.columns.reference_no.check
end

Then /^Orders Grid: Order ID: Columns Menu: Check Cost Code$/ do
  log.info "Step Orders Grid: Order ID: Columns Menu: Check Cost Code"
  orders.grid.order_id.menu.columns.cost_code.check
end

Then /^Orders Grid: Order ID: Sort Ascending$/ do
  sorted = orders.grid.order_id.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Order ID: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Order ID: Sort Descending$/ do
  sorted = orders.grid.order_id.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Order ID: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Store: Sort Ascending$/ do
  sorted = orders.grid.store.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Store: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Store: Sort Descending$/ do
  sorted = orders.grid.store.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Store: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Age: Sort Ascending$/ do
  sorted = orders.grid.age.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Age: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Age: Sort Descending$/ do
  sorted = orders.grid.age.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Age: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid:  Order ID: Column: Check Reference Number$/ do
  orders.grid.order_id.columns.reference_no.check
end

Then /^Orders Grid:  Order ID: Column: Check Cost Code$/ do
  orders.grid.order_id.columns.cost_code.check
end

Then /^Orders Grid: Order Date: Sort Ascending$/ do
  sorted = orders.grid.order_date.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Order Date: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Order Date: Sort Descending$/ do
  sorted = orders.grid.order_date.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Order Date: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Recipient: Sort Ascending$/ do
  sorted = orders.grid.recipient.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Recipient: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Recipient: Sort Descending$/ do
  sorted = orders.grid.recipient.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Recipient: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Company: Sort Ascending$/ do
  sorted = orders.grid.company.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Company: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Company: Sort Descending$/ do
  sorted = orders.grid.company.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Company: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Address: Sort Ascending$/ do
  sorted = orders.grid.address.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Address: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Address: Sort Descending$/ do
  sorted = orders.grid.address.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Address: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: City: Sort Ascending$/ do
  sorted = orders.grid.city.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: City: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: City: Sort Descending$/ do
  sorted = orders.grid.city.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: City: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: State: Sort Ascending$/ do
  sorted = orders.grid.state.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: State: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: State: Sort Descending$/ do
  log.info "Step:  "
  sorted = orders.grid.state.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: State: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Zip: Sort Ascending$/ do
  sorted = orders.grid.zip.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: State: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Zip: Sort Descending$/ do
  sorted = orders.grid.zip.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Zip: Sort Descending orde"
  sorted.should be true
end

Then /^Orders Grid: Country: Sort Ascending$/ do
  sorted = orders.grid.country.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Country: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Country: Sort Descending$/ do
  sorted = orders.grid.country.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Country: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Phone: Sort Ascending$/ do
  sorted = orders.grid.phone.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Phone: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Phone: Sort Descending$/ do
  sorted = orders.grid.phone.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Phone: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Email: Sort Ascending$/ do
  sorted = orders.grid.email.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Email: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Email: Sort Descending$/ do
  sorted = orders.grid.email.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Email: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Qty: Sort Ascending$/ do
  sorted = orders.grid.qty.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Qty: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Qty: Sort Descending$/ do
  sorted = orders.grid.qty.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Qty: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Item SKU: Sort Ascending$/ do
  sorted = orders.grid.item_sku.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Item SKU: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Item SKU: Sort Descending$/ do
  sorted = orders.grid.item_sku.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Item SKU: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Item Name: Sort Ascending$/ do
  sorted = orders.grid.item_name.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Item Name: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Item Name: Sort Descending$/ do
  sorted = orders.grid.item_name.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Item Name: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Weight: Sort Ascending$/ do
  sorted = orders.grid.weight.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Weight: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Weight: Sort Descending$/ do
  sorted = orders.grid.weight.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Weight: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Insured Value: Sort Ascending$/ do
  sorted = orders.grid.insured_value.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Insured Value: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Insured Value: Sort Descending$/ do
  sorted = orders.grid.insured_value.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Insured Value: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Reference No.: Sort Ascending$/ do
  sorted = orders.grid.reference_no.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Reference No.: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Reference No.: Sort Descending$/ do
  sorted = orders.grid.reference_no.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Reference No.: Sort Descending"
  sorted.should be true
end



Then /^Orders Grid: Order Status: Sort Ascending$/ do
  sorted = orders.grid.order_status.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Order Status: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Order Status: Sort Descending$/ do
  sorted = orders.grid.order_status.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Order Status: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Date Printed: Sort Ascending$/ do
  sorted = orders.grid.print_date.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Date Printed: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Date Printed: Sort Descending$/ do
  sorted = orders.grid.print_date.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Date Printed: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Ship Date: Sort Ascending$/ do
  sorted = orders.grid.ship_date.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Ship Date: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Ship Date: Sort Descending$/ do
  sorted = orders.grid.ship_date.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Ship Date: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Order Total: Sort Ascending$/ do
  sorted = orders.grid.order_total.menu.sort_ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Order Total: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Order Total: Sort Descending$/   do
  sorted = orders.grid.order_total.menu.sort_descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Order Total: Sort Descending"
  sorted.should be true
end


=begin
Then /^Orders Grid: Ship Cost: Sort Ascending$/ do
  sorted = orders.grid.ship_cost.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Ship Cost: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Ship Cost: Sort Descending$/ do
  sorted = orders.grid.ship_cost.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Ship Cost: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Ship From: Sort Ascending$/ do
  sorted = orders.grid.ship_from.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Ship From: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Ship From: Sort Descending$/ do
  sorted = orders.grid.ship_from.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Ship From: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Service: Sort Ascending$/ do
  sorted = orders.grid.service.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Service: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Service: Sort Descending$/ do
  sorted = orders.grid.service.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Service: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Tracking No.: Sort Ascending$/ do
  sorted = orders.grid.tracking_no.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Tracking No.: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Tracking No.: Sort Descending$/ do
  sorted = orders.grid.tracking_no.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Tracking No.: Sort Descending"
  sorted.should be true
end

Then /^Orders Grid: Cost Code: Sort Ascending$/ do
  sorted = orders.grid.cost_code.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Cost Code: Sort Ascending"
  sorted.should be true
end

Then /^Orders Grid: Cost Code: Sort Descending$/ do
  sorted = orders.grid.cost_code.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Cost Code: Sort Descending"
  sorted.should be true
end

=end