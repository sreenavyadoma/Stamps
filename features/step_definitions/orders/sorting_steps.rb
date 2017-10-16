
Then /^[Ii]n Orders Grid, Sort service in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:service).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort service in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:service).sort_descending).to eql "DESC"
end
Then /^[Ii]n Orders Grid, Sort Order ID in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:order_id).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Order ID in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:order_id).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Store: Sort in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:store).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Store: Sort in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:store).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Age in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:age).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Age in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:age).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Order Date in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:order_date).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Order Date in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:order_date).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Recipient in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:recipient).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Recipient in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:recipient).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Company in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:company).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Company in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:company).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Address in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:address).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Address in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:address).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort City in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:city).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort City in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:city).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort State in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:state).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort State in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:state).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Zip in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:zip).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Zip in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:zip).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Country in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:country).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Country in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:country).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Phone in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:phone).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Phone in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:phone).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Email in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:email).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Email in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:email).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Qty in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:qty).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Qty in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:qty).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Item SKU in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:item_sku).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Item SKU in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:item_sku).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Item Name in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:item_name).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Item Name in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:item_name).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Weight in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:weight).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Weight in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:weight).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Insured Value in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:insured_value).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Insured Value in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:insured_value).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Reference No.: Sort in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:reference_no).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Reference No.: Sort in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:reference_no).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Order Status in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:order_status).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Order Status in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:order_status).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Date Printed: Sort in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:date_printed).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Date Printed: Sort in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:date_printed).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Ship Date in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:ship_date).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Ship Date in Descending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:ship_date).sort_descending).to eql "DESC"
end

Then /^[Ii]n Orders Grid, Sort Order Total in Ascending Order$/ do
  expect(stamps.orders.orders_grid.grid_column(:order_total).sort_ascending).to eql "ASC"
end

Then /^[Ii]n Orders Grid, Sort Order Total in Descending Order$/   do
  expect(stamps.orders.orders_grid.grid_column(:order_total).sort_descending).to eql "DESC"
end

