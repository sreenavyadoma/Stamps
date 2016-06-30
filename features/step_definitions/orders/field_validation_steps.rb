#domestic

Then /^Grid: Expect Ship Cost error to contain \"(.*)\"$/ do |expectation|
  logger.info "Grid: Expect Ship Cost error to contain #{expectation}"
  grid_order_id = orders.grid.order_id.row 1
  logger.info "Grid order id is #{grid_order_id}"
  ship_cost_error = orders.grid.ship_cost.data_error grid_order_id
  logger.info ship_cost_error
  ship_cost_error.should include expectation

  ship_cost_error = orders.grid.ship_cost.data_error "81453"
  logger.info ship_cost_error

  ship_cost_error = orders.grid.ship_cost.data_error "81408"
  logger.info ship_cost_error

  ship_cost_error = orders.grid.ship_cost.data_error "81407"
  logger.info ship_cost_error
end