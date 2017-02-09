
Then /^(?:I|i)n Orders Grid, Sort service in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.service.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort service in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.service.sort_descending
  expect(sort_order).to eql "DESC"
end
Then /^(?:I|i)n Orders Grid, Sort Order ID in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.order_id.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Order ID in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.order_id.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Store: Sort in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.store.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Store: Sort in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.store.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Age in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.age.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Age in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.age.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Order Date in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.order_date.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Order Date in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.order_date.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Recipient in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.recipient.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Recipient in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.recipient.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Company in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.company.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Company in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.company.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Address in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.address.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Address in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.address.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort City in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.city.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort City in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.city.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort State in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.state.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort State in Descending Order$/ do
  #logger.step ""
  sort_order = stamps.orders.orders_grid.column.state.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Zip in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.zip.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Zip in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.zip.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Country in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.country.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Country in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.country.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Phone in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.phone.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Phone in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.phone.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Email in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.email.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Email in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.email.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Qty in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.qty.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Qty in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.qty.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Item SKU in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.item_sku.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Item SKU in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.item_sku.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Item Name in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.item_name.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Item Name in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.item_name.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Weight in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.weight.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Weight in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.weight.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Insured Value in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.insured_value.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Insured Value in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.insured_value.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Reference No.: Sort in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.reference_no.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Reference No.: Sort in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.reference_no.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Order Status in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.order_status.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Order Status in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.order_status.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Date Printed: Sort in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.date_printed.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Date Printed: Sort in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.date_printed.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Ship Date in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.ship_date.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Ship Date in Descending Order$/ do
  sort_order = stamps.orders.orders_grid.column.ship_date.sort_descending
  expect(sort_order).to eql "DESC"
end

Then /^(?:I|i)n Orders Grid, Sort Order Total in Ascending Order$/ do
  sort_order = stamps.orders.orders_grid.column.order_total.sort_ascending
  expect(sort_order).to eql "ASC"
end

Then /^(?:I|i)n Orders Grid, Sort Order Total in Descending Order$/   do
  sort_order = stamps.orders.orders_grid.column.order_total.sort_descending
  expect(sort_order).to eql "DESC"
end

