Then /^Orders Grid: Sort by Store in Ascending order$/ do
  sorted = orders.grid.store.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Store in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Store in Descending order$/ do
  sorted = orders.grid.store.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Store in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Age in Ascending order$/ do
  sorted = orders.grid.age.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Age in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Age in Descending order$/ do
  sorted = orders.grid.age.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Age in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Order ID in Ascending order$/ do
  sorted = orders.grid.order_id.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Order ID in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Order ID in Descending order$/ do
  sorted = orders.grid.order_id.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Order ID in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Order Date in Ascending order$/ do
  sorted = orders.grid.order_date.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Order Date in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Order Date in Descending order$/ do
  sorted = orders.grid.order_date.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Order Date in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Recipient in Ascending order$/ do
  sorted = orders.grid.recipient.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Recipient in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Recipient in Descending order$/ do
  sorted = orders.grid.recipient.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Recipient in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Company in Ascending order$/ do
  sorted = orders.grid.company.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Company in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Company in Descending order$/ do
  sorted = orders.grid.company.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Company in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Address in Ascending order$/ do
  sorted = orders.grid.address.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Address in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Address in Descending order$/ do
  sorted = orders.grid.address.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Address in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by City in Ascending order$/ do
  sorted = orders.grid.city.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by City in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by City in Descending order$/ do
  sorted = orders.grid.city.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by City in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by State in Ascending order$/ do
  sorted = orders.grid.state.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by State in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by State in Descending order$/ do
  log.info "Step:  "
  sorted = orders.grid.state.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by State in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Zip in Ascending order$/ do
  sorted = orders.grid.zip.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by State in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Zip in Descending order$/ do
  sorted = orders.grid.zip.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Zip in Descending orde"
  sorted.should be true
end

Then /^Orders Grid: Sort by Country in Ascending order$/ do
  sorted = orders.grid.country.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Country in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Country in Descending order$/ do
  sorted = orders.grid.country.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Country in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Phone in Ascending order$/ do
  sorted = orders.grid.phone.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Phone in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Phone in Descending order$/ do
  sorted = orders.grid.phone.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Phone in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Email in Ascending order$/ do
  sorted = orders.grid.email.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Email in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Email in Descending order$/ do
  sorted = orders.grid.email.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Email in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Qty in Ascending order$/ do
  sorted = orders.grid.qty.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Qty in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Qty in Descending order$/ do
  sorted = orders.grid.qty.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Qty in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Item SKU in Ascending order$/ do
  sorted = orders.grid.item_sku.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Item SKU in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Item SKU in Descending order$/ do
  sorted = orders.grid.item_sku.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Item SKU in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Item Name in Ascending order$/ do
  sorted = orders.grid.item_name.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Item Name in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Item Name in Descending order$/ do
  sorted = orders.grid.item_name.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Item Name in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Weight in Ascending order$/ do
  sorted = orders.grid.weight.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Weight in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Weight in Descending order$/ do
  sorted = orders.grid.weight.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Weight in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Insured Value in Ascending order$/ do
  sorted = orders.grid.insured_value.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Insured Value in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Insured Value in Descending order$/ do
  sorted = orders.grid.insured_value.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Insured Value in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Reference No. in Ascending order$/ do
  sorted = orders.grid.reference_no.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Reference No. in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Reference No. in Descending order$/ do
  sorted = orders.grid.reference_no.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Reference No. in Descending order"
  sorted.should be true
end



Then /^Orders Grid: Sort by Order Status in Ascending order$/ do
  sorted = orders.grid.order_status.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Order Status in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Order Status in Descending order$/ do
  sorted = orders.grid.order_status.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Order Status in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Date Printed in Ascending order$/ do
  sorted = orders.grid.print_date.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Date Printed in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Date Printed in Descending order$/ do
  sorted = orders.grid.print_date.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Date Printed in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Ship Date in Ascending order$/ do
  sorted = orders.grid.ship_date.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Ship Date in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Ship Date in Descending order$/ do
  sorted = orders.grid.ship_date.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Ship Date in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Order Total in Ascending order$/ do
  sorted = orders.grid.order_total.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Order Total in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Order Total in Descending order$/   do
  sorted = orders.grid.order_total.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Order Total in Descending order"
  sorted.should be true
end


=begin
Then /^Orders Grid: Sort by Ship Cost in Ascending order$/ do
  sorted = orders.grid.ship_cost.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Ship Cost in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Ship Cost in Descending order$/ do
  sorted = orders.grid.ship_cost.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Ship Cost in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Ship From in Ascending order$/ do
  sorted = orders.grid.ship_from.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Ship From in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Ship From in Descending order$/ do
  sorted = orders.grid.ship_from.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Ship From in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Service in Ascending order$/ do
  sorted = orders.grid.service.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Service in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Service in Descending order$/ do
  sorted = orders.grid.service.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Service in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Tracking No. in Ascending order$/ do
  sorted = orders.grid.tracking_no.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Tracking No. in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Tracking No. in Descending order$/ do
  sorted = orders.grid.tracking_no.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Tracking No. in Descending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Cost Code in Ascending order$/ do
  sorted = orders.grid.cost_code.sort.ascending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Cost Code in Ascending order"
  sorted.should be true
end

Then /^Orders Grid: Sort by Cost Code in Descending order$/ do
  sorted = orders.grid.cost_code.sort.descending
  log.info "Step #{(sorted)?'Passed':'Failed'} - Orders Grid: Sort by Cost Code in Descending order"
  sorted.should be true
end

=end