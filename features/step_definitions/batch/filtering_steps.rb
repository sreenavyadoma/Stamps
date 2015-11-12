Then /^Expect printed Order ID does not exist in Awaiting Shipment tab$/ do
  log.info "Step: Expect printed Order ID does not exist in Awaiting Shipment tab"
  grid = batch.filter.awaiting_shipment
  log.info "First Order ID: #{@order_id} in Awaiting Shipment tab"
  row = 1
  row1_order_id = grid.order_id row
  log.info "Row #{row} Order ID: #{row1_order_id}"
  expect(@order_id.include? row1_order_id).to be false
end

Then /^Expect all printed Order IDs do not exist in Awaiting Shipment tab$/ do
  log.info "Step: Expect all printed Order IDs do not exist in Awaiting Shipment tab"
  grid = batch.filter.awaiting_shipment

  log.info "First Order ID: #{@order_id} in Awaiting Shipment tab"
  row = 1
  row1_order_id = grid.order_id row
  log.info "Row #{row} Order ID: #{row1_order_id}"
  expect(@order_id.include? row1_order_id).to be false

  log.info "Second Order ID: #{@order_id_2} in Awaiting Shipment tab"
  row = 2
  row2_order_id = grid.order_id row
  log.info "Row #{row} Order ID: #{row2_order_id}"
  expect(@order_id_2.include? row2_order_id).to be false

  log.info "Third Order ID: #{@order_id_3} in Awaiting Shipment tab"
  row = 3
  row3_order_id = grid.order_id row
  log.info "Row #{row} Order ID: #{row3_order_id}"
  expect(@order_id_3.include? row3_order_id).to be false

end

Then /^Expect printed Order ID exists in Shipped tab$/ do
  log.info "Step: Expect printed Order ID exists in Shipped tab"
  grid = batch.shipped
  log.info "Order ID: #{@order_id} Shipped tab"
  row = 1
  row1_order_id = grid.order_id row
  log.info "Row #{row} Order ID: #{row1_order_id}"
  @order_id.should include row1_order_id
end

Then /^Expect all printed Order IDs exist in Shipped tab$/ do
  log.info "Step: Expect all printed Order IDs exist in Shipped tab"
  grid = batch.shipped

  log.info "First Order ID: #{@order_id} Shipped tab"
  row = 3
  row3_order_id = grid.order_id row
  log.info "Row #{row} Order ID: #{row3_order_id}"
  @order_id.should include row3_order_id

  log.info "Second Order ID: #{@order_id_2} Shipped tab"
  row = 2
  row2_order_id = grid.order_id row
  log.info "Row #{row} Order ID: #{row2_order_id}"
  @order_id_2.should include row2_order_id

  log.info "Third Order ID: #{@order_id_3} Shipped tab"
  row = 1
  row1_order_id = grid.order_id row
  log.info "Row #{row} Order ID: #{row1_order_id}"
  @order_id_3.should include row1_order_id

end

