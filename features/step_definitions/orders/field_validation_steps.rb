#domestic

Then /^In Orders Grid, expect Ship Cost error to contain \"(.*)\"$/ do |expectation|
  logger.step "In Orders Grid, expect Ship Cost error to contain #{expectation}"
  grid_order_id = stamps.orders.orders_grid.column.order_id.row 1
  logger.step "Grid order id is #{grid_order_id}"
  ship_cost_error = stamps.orders.orders_grid.column.ship_cost.data_error grid_order_id
  logger.step ship_cost_error
  ship_cost_error.should include expectation

  ship_cost_error = stamps.orders.orders_grid.column.ship_cost.data_error "81453"
  logger.step ship_cost_error

  ship_cost_error = stamps.orders.orders_grid.column.ship_cost.data_error "81408"
  logger.step ship_cost_error

  ship_cost_error = stamps.orders.orders_grid.column.ship_cost.data_error "81407"
  logger.step ship_cost_error
end