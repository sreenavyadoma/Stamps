Then /^Expect all printed Order IDs does not exist in Awaiting Shipment tab$/ do
  grid = batch.awaiting_shipment
  log "First Order ID: #{@order_id}"
  row = 1
  row1_order_id = grid.order_id row
  log "Row #{row} Order ID: #{row1_order_id}"
  expect(@order_id.include? row1_order_id).to be false
end

Then /^Expect all printed Order IDs exist in Awaiting Shipment tab$/ do
  grid = batch.shipped
  log "First Order ID: #{@order_id}"
  row = 1
  row1_order_id = grid.order_id row
  log "Row #{row} Order ID: #{row1_order_id}"
  @order_id.should include row1_order_id
end

