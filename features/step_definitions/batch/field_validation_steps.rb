
Given /^Expect Order Details Form International Name data error tooltip to be \"(.+)\"$/ do |value|
  log.info "Expectation: Expect Order Details Form International Name data error tooltip to be #{value}"
  text_box = @international_ship_to.name
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log.info "Error message is #{browser_error_message}"
end

Given /^Expect Order Details Form International Company data error tooltip to be \"(.+)\"$/ do |value|
  log.info "Expectation: Expect Order Details Form International Company data error tooltip to be #{value}"
  text_box = @international_ship_to.company
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log.info "Error message is #{browser_error_message}"
end

Given /^Expect Order Details Form International Address 1 data error tooltip to be \"(.+)\"$/ do |value|
  log.info "Expectation: Expect Order Details Form International Address 1 data error tooltip to be #{value}"
  text_box = @international_ship_to.address_1
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log.info "Error message is #{browser_error_message}"
end

Given /^Expect Order Details Form International City data error tooltip to be \"(.+)\"$/ do |value|
  log.info "Expectation: Expect Order Details Form International City data error tooltip to be #{value}"
  text_box = @international_ship_to.city
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log.info "Error message is #{browser_error_message}"
end

Given /^Expect Order Details Form International Phone data error tooltip to be \"(.+)\"$/ do |value|
  log.info "Expectation: Expect Order Details Form International Phone data error tooltip to be #{value}"
  text_box = @international_ship_to.phone
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log.info "Error message is #{browser_error_message}"
end

Given /^Expect Order Details Form International Email data error tooltip to be \"(.+)\"$/ do |value|
  log.info "Expectation: Expect Order Details Form International Email data error tooltip to be #{value}"
  text_box = @international_ship_to.email
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log.info "Error message is #{browser_error_message}"
end

Given /^Expect Order Details Form Domestic Email data error tooltip to be \"(.+)\"$/ do |value|
  log.info "Expectation: Expect Order Details Form Domestic Email data error tooltip to be #{value}"
  text_box = @single_order_form.email
  browser_error_message = text_box.data_error_qtip
  browser_error_message.should include value
  log.info "Error message is #{browser_error_message}"
end

Given /^Expect Order Details Form Length data error tooltip to be \"(.+)\"$/ do |value|
  log.info "Expectation: Expect Order Details Form Length data error tooltip to be #{value}"
  text_box = @single_order_form.length
  browser_error_message = text_box.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log.info "Error message is #{browser_error_message}"
end

Given /^Expect Order Details Form Width data error tooltip to be \"(.+)\"$/ do |value|
  log.info "Expectation: Expect Order Details Form Width data error tooltip to be #{value}"
  width_text_box = @single_order_form.width
  browser_error_message = width_text_box.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log.info "Error message is #{browser_error_message}"
end

Given /^Expect Order Details Form Height data error tooltip to be \"(.+)\"$/ do |value|
  log.info "Expectation: Expect Order Details Form Height data error tooltip to be #{value}"
  height_text_box = @single_order_form.height
  browser_error_message = height_text_box.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log.info "Error message is #{browser_error_message}"
end

Given /^Expect Grid ship cost data error tooltip to be \"(.+)\"$/ do |value|
  log.info "Expectation: Expect Grid ship cost data error tooltip to be #{value}"
  grid_order_id = orders.grid.order_id.row 1
  grid_ship_cost = orders.grid.ship_cost.data grid_order_id
  browser_error_message = grid_ship_cost.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log.info "Error message is #{browser_error_message}"
end

Then /^Expect Grid Ship Cost error to contain \"(.*)\"$/ do |expectation|
  log.info "Expectation: Expect Grid Ship Cost error to contain #{expectation}"
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