
Given /^Expect Single Order Form Phone data error tooltip to be \"(.+)\"$/ do |value|
  phone_text_box = @international_ship_to.phone
  browser_error_message = phone_text_box.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect Single Order Form Email data error tooltip to be \"(.+)\"$/ do |value|
  email_text_box = @single_order_form.email
  browser_error_message = email_text_box.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect Single Order Form Length data error tooltip to be \"(.+)\"$/ do |value|
  length_text_box = @single_order_form.length
  browser_error_message = length_text_box.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect Single Order Form Width data error tooltip to be \"(.+)\"$/ do |value|
  width_text_box = @single_order_form.width
  browser_error_message = width_text_box.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end

Given /^Expect Single Order Form Height data error tooltip to be \"(.+)\"$/ do |value|
  height_text_box = @single_order_form.height
  browser_error_message = height_text_box.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end


Given /^Expect Grid ship cost data error tooltip to be \"(.+)\"$/ do |value|
  grid_order_id = batch.grid.order_id 1
  grid_ship_cost = batch.grid.ship_cost grid_order_id
  browser_error_message = grid_ship_cost.attribute_value "data-errorqtip"
  browser_error_message.should include value
  log "Error message is #{browser_error_message}"
end