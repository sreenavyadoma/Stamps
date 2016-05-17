#domestic

Then /^Grid: Expect Ship Cost error to contain \"(.*)\"$/ do |expectation|
  log.info "Grid: Expect Ship Cost error to contain #{expectation}"
  grid_order_id = orders.grid.order_id.row 1
  log.info "Grid order id is #{grid_order_id}"
  ship_cost_error = orders.grid.ship_cost.data_error grid_order_id
  log.info ship_cost_error
  ship_cost_error.should include expectation

  ship_cost_error = orders.grid.ship_cost.data_error "81453"
  log.info ship_cost_error

  ship_cost_error = orders.grid.ship_cost.data_error "81408"
  log.info ship_cost_error

  ship_cost_error = orders.grid.ship_cost.data_error "81407"
  log.info ship_cost_error
end