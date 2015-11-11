Then /^Sort Grid by Ship Cost in Ascending order$/ do
  log "Step: Sort Grid by Ship Cost in Ascending order"
  sorted = batch.filter.awaiting_shipment.ship_cost.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Ship Cost in Descending order$/ do
  log "Step: Sort Grid by Ship Cost in Descending order"
  sorted = batch.filter.awaiting_shipment.ship_cost.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Age in Ascending order$/ do
  log "Step: Sort Grid by Age in Ascending order"
  sorted = batch.filter.awaiting_shipment.age.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Age in Descending order$/ do
  log "Step: Sort Grid by Age in Descending order"
  sorted = batch.filter.awaiting_shipment.age.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Order ID in Ascending order$/ do
  log "Step: Sort Grid by Order ID in Ascending order"
  sorted = batch.filter.awaiting_shipment.order_id.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Order ID in Descending order$/ do
  log "Step: Sort Grid by Order ID in Descending order"
  sorted = batch.filter.awaiting_shipment.order_id.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Order Date in Ascending order$/ do
  log "Step: Sort Grid by Order Date in Ascending order"
  sorted = batch.filter.awaiting_shipment.order_date.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Order Date in Descending order$/ do
  log "Step: Sort Grid by Order Date in Descending order"
  sorted = batch.filter.awaiting_shipment.order_date.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Recipient in Ascending order$/ do
  log "Step: Sort Grid by Recipient in Ascending order"
  sorted = batch.filter.awaiting_shipment.recipient.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Recipient in Descending order$/ do
  log "Step: Sort Grid by Recipient in Descending order"
  sorted = batch.filter.awaiting_shipment.recipient.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Company in Ascending order$/ do
  log "Step: Sort Grid by Company in Ascending order"
  sorted = batch.filter.awaiting_shipment.company.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Company in Descending order$/ do
  log "Step: Sort Grid by Company in Descending order"
  sorted = batch.filter.awaiting_shipment.company.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Address in Ascending order$/ do
  log "Step: Sort Grid by Address in Ascending order"
  sorted = batch.filter.awaiting_shipment.address.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Address in Descending order$/ do
  log "Step: Sort Grid by Address in Descending order"
  sorted = batch.filter.awaiting_shipment.address.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by City in Ascending order$/ do
  log "Step: Sort Grid by City in Ascending order"
  sorted = batch.filter.awaiting_shipment.city.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by City in Descending order$/ do
  log "Step: Sort Grid by City in Descending order"
  sorted = batch.filter.awaiting_shipment.city.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by State in Ascending order$/ do
  log "Step: Sort Grid by State in Ascending order"
  sorted = batch.filter.awaiting_shipment.state.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by State in Descending order$/ do
  log "Step:  "
  sorted = batch.filter.awaiting_shipment.state.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Zip in Ascending order$/ do
  log "Step: Sort Grid by State in Descending orde"
  sorted = batch.filter.awaiting_shipment.zip.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Zip in Descending order$/ do
  log "Step: Sort Grid by Zip in Descending order"
  sorted = batch.filter.awaiting_shipment.zip.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Country in Ascending order$/ do
  log "Step: Sort Grid by Country in Ascending order"
  sorted = batch.filter.awaiting_shipment.country.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Country in Descending order$/ do
  log "Step: Sort Grid by Country in Descending order"
  sorted = batch.filter.awaiting_shipment.country.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Phone in Ascending order$/ do
  log "Step: Sort Grid by Phone in Ascending order"
  sorted = batch.filter.awaiting_shipment.phone.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Phone in Descending order$/ do
  log "Step: Sort Grid by Phone in Descending order"
  sorted = batch.filter.awaiting_shipment.phone.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Email in Ascending order$/ do
  log "Step: Sort Grid by Email in Ascending order"
  sorted = batch.filter.awaiting_shipment.email.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Email in Descending order$/ do
  log "Step: Sort Grid by Email in Descending order"
  sorted = batch.filter.awaiting_shipment.email.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Qty in Ascending order$/ do
  log "Step: Sort Grid by Qty in Ascending order"
  sorted = batch.filter.awaiting_shipment.qty.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Qty in Descending order$/ do
  log "Step: Sort Grid by Qty in Descending order"
  sorted = batch.filter.awaiting_shipment.qty.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Item SKU in Ascending order$/ do
  log "Step: Sort Grid by Item SKU in Ascending order"
  sorted = batch.filter.awaiting_shipment.item_sku.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Item SKU in Descending order$/ do
  log "Step: Sort Grid by Item SKU in Descending order"
  sorted = batch.filter.awaiting_shipment.item_sku.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Item Name in Ascending order$/ do
  log "Step: Sort Grid by Item Name in Ascending order"
  sorted = batch.filter.awaiting_shipment.item_name.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Item Name in Descending order$/ do
  log "Step: Sort Grid by Item Name in Descending order"
  sorted = batch.filter.awaiting_shipment.item_name.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Ship From in Ascending order$/ do
  log "Step: Sort Grid by Ship From in Ascending order"
  sorted = batch.filter.awaiting_shipment.ship_from.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Ship From in Descending order$/ do
  log "Step: Sort Grid by Ship From in Descending order"
  sorted = batch.filter.awaiting_shipment.ship_from.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Service in Ascending order$/ do
  log "Step: Sort Grid by Service in Ascending order"
  sorted = batch.filter.awaiting_shipment.service.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Service in Descending order$/ do
  log "Step: Sort Grid by Service in Descending order"
  sorted = batch.filter.awaiting_shipment.service.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Weight in Ascending order$/ do
  log "Step: Sort Grid by Weight in Ascending order"
  sorted = batch.filter.awaiting_shipment.weight.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Weight in Descending order$/ do
  log "Step: Sort Grid by Weight in Descending order"
  sorted = batch.filter.awaiting_shipment.weight.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Insured Value in Ascending order$/ do
  log "Step: Sort Grid by Insured Value in Ascending order"
  sorted = batch.filter.awaiting_shipment.insured_value.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Insured Value in Descending order$/ do
  log "Step: Sort Grid by Insured Value in Descending order"
  sorted = batch.filter.awaiting_shipment.insured_value.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Reference No. in Ascending order$/ do
  log "Step: Sort Grid by Reference No. in Ascending order"
  sorted = batch.filter.awaiting_shipment.reference_no.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Reference No. in Descending order$/ do
  log "Step: Sort Grid by Reference No. in Descending order"
  sorted = batch.filter.awaiting_shipment.reference_no.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Cost Code in Ascending order$/ do
  log "Step: Sort Grid by Cost Code in Ascending order"
  sorted = batch.filter.awaiting_shipment.cost_code.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Cost Code in Descending order$/ do
  log "Step: Sort Grid by Cost Code in Descending order"
  sorted = batch.filter.awaiting_shipment.cost_code.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Order Status in Ascending order$/ do
  log "Step: Sort Grid by Order Status in Ascending order"
  sorted = batch.filter.awaiting_shipment.order_status.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Order Status in Descending order$/ do
  log "Step: Sort Grid by Order Status in Descending order"
  sorted = batch.filter.awaiting_shipment.order_status.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Ship Date in Ascending order$/ do
  log "Step: Sort Grid by Ship Date in Ascending order"
  sorted = batch.filter.awaiting_shipment.ship_date.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Ship Date in Descending order$/ do
  log "Step: Sort Grid by Ship Date in Descending order"
  sorted = batch.filter.awaiting_shipment.ship_date.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Tracking No. in Ascending order$/ do
  log "Step: Sort Grid by Tracking No. in Ascending order"
  sorted = batch.filter.awaiting_shipment.tracking_no.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Tracking No. in Descending order$/ do
  log "Step: Sort Grid by Tracking No. in Descending order"
  sorted = batch.filter.awaiting_shipment.tracking_no.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Order Total in Ascending order$/ do
  log "Step: Sort Grid by Order Total in Ascending order"
  sorted = batch.filter.awaiting_shipment.order_total.sort_ascending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end

Then /^Sort Grid by Order Total in Descending order$/   do
  log "Step: Sort Grid by Order Total in Descending order"
  sorted = batch.filter.awaiting_shipment.order_total.sort_descending
  log "Sorting #{(sorted)?'Passed':'Failed'}"
  sorted.should be true
end
