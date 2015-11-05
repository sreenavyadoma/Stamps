
Given /^Expect single-order form International Name data error tooltip to be \"(.+)\"$/ do |value|
  text_box = @international_ship_to.name
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect single-order form International Company data error tooltip to be \"(.+)\"$/ do |value|
  text_box = @international_ship_to.company
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect single-order form International Address 1 data error tooltip to be \"(.+)\"$/ do |value|
  text_box = @international_ship_to.address_1
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect single-order form International City data error tooltip to be \"(.+)\"$/ do |value|
  text_box = @international_ship_to.city
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect single-order form International Phone data error tooltip to be \"(.+)\"$/ do |value|
  text_box = @international_ship_to.phone
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect single-order form International Email data error tooltip to be \"(.+)\"$/ do |value|
  text_box = @international_ship_to.email
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect single-order form Domestic Email data error tooltip to be \"(.+)\"$/ do |value|
  text_box = @single_order_form.email
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect single-order form Length data error tooltip to be \"(.+)\"$/ do |value|
  text_box = @single_order_form.length
  browser_error_message = text_box.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect single-order form Width data error tooltip to be \"(.+)\"$/ do |value|
  width_text_box = @single_order_form.width
  browser_error_message = width_text_box.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect single-order form Height data error tooltip to be \"(.+)\"$/ do |value|
  height_text_box = @single_order_form.height
  browser_error_message = height_text_box.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect Grid ship cost data error tooltip to be \"(.+)\"$/ do |value|
  grid_order_id = batch.grid.order_id.row 1
  grid_ship_cost = batch.grid.ship_cost.data grid_order_id
  browser_error_message = grid_ship_cost.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Then /^Expect order-grid Ship Cost error to contain \"(.*)\"$/ do |expectation|
  # 81453
  # 81408
  # 81407

  #  Ray, pass the order id of the order you're expecting to have errors, it wlll give you the error string from the data-qtip property for that div.

  grid_order_id = batch.grid.order_id.row 1
  log "Grid order id is #{grid_order_id}"
  ship_cost_error = batch.grid.ship_cost.data_error grid_order_id
  log ship_cost_error
  ship_cost_error.should include expectation

  ship_cost_error = batch.grid.ship_cost.data_error "81453"
  log ship_cost_error

  ship_cost_error = batch.grid.ship_cost.data_error "81408"
  log ship_cost_error

  ship_cost_error = batch.grid.ship_cost.data_error "81407"
  log ship_cost_error
end