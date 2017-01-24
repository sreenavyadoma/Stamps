#domestic

Then /^In Orders Grid, expect Ship Cost error to contain \"(.*)\"$/ do |expectation|
  grid_order_id = stamps.orders.orders_grid.column.order_id.row 1
  ship_cost_error = stamps.orders.orders_grid.column.ship_cost.data_error grid_order_id
  ship_cost_error.should include expectation
  ship_cost_error = stamps.orders.orders_grid.column.ship_cost.data_error "81453"
  ship_cost_error = stamps.orders.orders_grid.column.ship_cost.data_error "81408"
  ship_cost_error = stamps.orders.orders_grid.column.ship_cost.data_error "81407"
end