#domestic

Then /^Grid: Expect Ship Cost error to contain \"(.*)\"$/ do |expectation|
  logger.step "Grid: Expect Ship Cost error to contain #{expectation}"
  grid_order_id = stamps.orders.grid.order_id.row 1
  logger.step "Grid order id is #{grid_order_id}"
  ship_cost_error = stamps.orders.grid.ship_cost.data_error grid_order_id
  logger.step ship_cost_error
  ship_cost_error.should include expectation

  ship_cost_error = stamps.orders.grid.ship_cost.data_error "81453"
  logger.step ship_cost_error

  ship_cost_error = stamps.orders.grid.ship_cost.data_error "81408"
  logger.step ship_cost_error

  ship_cost_error = stamps.orders.grid.ship_cost.data_error "81407"
  logger.step ship_cost_error
end