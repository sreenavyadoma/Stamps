
Then /^Grid: Sort Service in Ascending Order$/ do
  sort_order = web_apps.orders.grid.service.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Service in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Service in Descending Order$/ do
  sort_order = web_apps.orders.grid.service.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Service in Descending Order"
  sort_order.should eql "DESC"
end
Then /^Grid: Sort Order ID in Ascending Order$/ do
  sort_order = web_apps.orders.grid.order_id.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Order ID in Descending Order$/ do
  sort_order = web_apps.orders.grid.order_id.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Store: Sort in Ascending Order$/ do
  sort_order = web_apps.orders.grid.store.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Store: Sort in Descending Order$/ do
  sort_order = web_apps.orders.grid.store.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Age in Ascending Order$/ do
  sort_order = web_apps.orders.grid.age.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Age in Descending Order$/ do
  sort_order = web_apps.orders.grid.age.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Order Date in Ascending Order$/ do
  sort_order = web_apps.orders.grid.order_date.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Order Date in Descending Order$/ do
  sort_order = web_apps.orders.grid.order_date.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Recipient in Ascending Order$/ do
  sort_order = web_apps.orders.grid.recipient.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Recipient in Descending Order$/ do
  sort_order = web_apps.orders.grid.recipient.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Company in Ascending Order$/ do
  sort_order = web_apps.orders.grid.company.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Company in Descending Order$/ do
  sort_order = web_apps.orders.grid.company.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Address in Ascending Order$/ do
  sort_order = web_apps.orders.grid.address.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Address in Descending Order$/ do
  sort_order = web_apps.orders.grid.address.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort City in Ascending Order$/ do
  sort_order = web_apps.orders.grid.city.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort City in Descending Order$/ do
  sort_order = web_apps.orders.grid.city.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort State in Ascending Order$/ do
  sort_order = web_apps.orders.grid.state.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort State in Descending Order$/ do
  logger.step ""
  sort_order = web_apps.orders.grid.state.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Zip in Ascending Order$/ do
  sort_order = web_apps.orders.grid.zip.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Zip in Descending Order$/ do
  sort_order = web_apps.orders.grid.zip.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Country in Ascending Order$/ do
  sort_order = web_apps.orders.grid.country.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Country in Descending Order$/ do
  sort_order = web_apps.orders.grid.country.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Phone in Ascending Order$/ do
  sort_order = web_apps.orders.grid.phone.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Phone in Descending Order$/ do
  sort_order = web_apps.orders.grid.phone.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Email in Ascending Order$/ do
  sort_order = web_apps.orders.grid.email.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Email in Descending Order$/ do
  sort_order = web_apps.orders.grid.email.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Qty in Ascending Order$/ do
  sort_order = web_apps.orders.grid.qty.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Qty in Descending Order$/ do
  sort_order = web_apps.orders.grid.qty.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Item SKU in Ascending Order$/ do
  sort_order = web_apps.orders.grid.item_sku.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Item SKU in Descending Order$/ do
  sort_order = web_apps.orders.grid.item_sku.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Item Name in Ascending Order$/ do
  sort_order = web_apps.orders.grid.item_name.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Item Name in Descending Order$/ do
  sort_order = web_apps.orders.grid.item_name.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Weight in Ascending Order$/ do
  sort_order = web_apps.orders.grid.weight.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Weight in Descending Order$/ do
  sort_order = web_apps.orders.grid.weight.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Insured Value in Ascending Order$/ do
  sort_order = web_apps.orders.grid.insured_value.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Insured Value in Descending Order$/ do
  sort_order = web_apps.orders.grid.insured_value.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Reference No.: Sort in Ascending Order$/ do
  sort_order = web_apps.orders.grid.reference_no.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Reference No.: Sort in Descending Order$/ do
  sort_order = web_apps.orders.grid.reference_no.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Order Status in Ascending Order$/ do
  sort_order = web_apps.orders.grid.order_status.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Order Status in Descending Order$/ do
  sort_order = web_apps.orders.grid.order_status.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Date Printed: Sort in Ascending Order$/ do
  sort_order = web_apps.orders.grid.date_printed.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Date Printed: Sort in Descending Order$/ do
  sort_order = web_apps.orders.grid.date_printed.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Ship Date in Ascending Order$/ do
  sort_order = web_apps.orders.grid.ship_date.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Ship Date in Descending Order$/ do
  sort_order = web_apps.orders.grid.ship_date.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

Then /^Grid: Sort Order Total in Ascending Order$/ do
  sort_order = web_apps.orders.grid.order_total.sort_ascending
  logger.step "Step #{(sort_order=="ASC")?'Passed':'Failed'} - Grid: Sort Order ID in Ascending Order"
  sort_order.should eql "ASC"
end

Then /^Grid: Sort Order Total in Descending Order$/   do
  sort_order = web_apps.orders.grid.order_total.sort_descending
  logger.step "Step #{(sort_order=="DESC")?'Passed':'Failed'} - Grid: Sort Order ID in Descending Order"
  sort_order.should eql "DESC"
end

