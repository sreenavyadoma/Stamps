#try 10 times before finally failing a test.
Given /^Expect Order Details International Name data error tooltip to be \"(.*)\"$/ do |value|
  log.info "Expectation: Expect Order Details International Name data error tooltip to be #{value}"
  @international_ship_to = orders.order_details.ship_to.international if @international_ship_to.nil?
  text_box = @international_ship_to.name
  20.times do
    text_box.send_keys :enter
    text_box.send_keys :tab
    text_box.safe_double_click
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    text_box.safe_double_click
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      @international_ship_to.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (value.size>10)?value[0..9]:value
    end unless data_error_tooltip.nil?
  end
  @international_ship_to.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? value)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include value
end

Given /^Expect Order Details International Company data error tooltip to be \"(.*)\"$/ do |value|
  log.info "Expectation: Expect Order Details International Company data error tooltip to be #{value}"
  @international_ship_to = orders.order_details.ship_to.international if @international_ship_to.nil?
  text_box = @international_ship_to.company

  20.times do
    text_box.send_keys :enter
    text_box.send_keys :tab
    text_box.safe_double_click
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    text_box.safe_double_click
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      @international_ship_to.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (value.size>10)?value[0..9]:value
    end unless data_error_tooltip.nil?
  end
  @international_ship_to.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? value)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include value
end

Given /^Expect Order Details International Address 1 data error tooltip to be \"(.*)\"$/ do |value|
  log.info "Expectation: Expect Order Details International Address 1 data error tooltip to be #{value}"
  @international_ship_to = orders.order_details.ship_to.international if @international_ship_to.nil?
  text_box = @international_ship_to.address_1

  20.times do
    text_box.send_keys :enter
    text_box.send_keys :tab
    text_box.safe_double_click
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    text_box.safe_double_click
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      @international_ship_to.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (value.size>10)?value[0..9]:value
    end unless data_error_tooltip.nil?
  end
  @international_ship_to.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? value)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include value
end

Given /^Expect Order Details International City data error tooltip to be \"(.*)\"$/ do |value|
  log.info "Expectation: Expect Order Details International City data error tooltip to be #{value}"
  @international_ship_to = orders.order_details.ship_to.international if @international_ship_to.nil?
  text_box = @international_ship_to.city

  20.times do
    text_box.send_keys :enter
    text_box.send_keys :tab
    text_box.safe_double_click
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      @international_ship_to.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (value.size>10)?value[0..9]:value
    end unless data_error_tooltip.nil?
  end
  @international_ship_to.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? value)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include value
end

Given /^Expect Order Details International Phone data error tooltip to be \"(.*)\"$/ do |value|
  log.info "Expectation: Expect Order Details International Phone data error tooltip to be #{value}"
  @international_ship_to = orders.order_details.ship_to.international if @international_ship_to.nil?
  text_box = @international_ship_to.phone

  20.times do
    text_box.send_keys :enter
    text_box.send_keys :tab
    text_box.safe_double_click
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    text_box.safe_double_click
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      @international_ship_to.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (value.size>10)?value[0..9]:value
    end unless data_error_tooltip.nil?
  end
  @international_ship_to.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? value)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include value
end

Given /^Expect Order Details International Email data error tooltip to be \"(.*)\"$/ do |value|
  log.info "Expectation: Expect Order Details International Email data error tooltip to be #{value}"
  @international_ship_to = orders.order_details.ship_to.international if @international_ship_to.nil?
  text_box = @international_ship_to.email

  20.times do
    text_box.send_keys :enter
    text_box.send_keys :tab
    text_box.safe_double_click
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    text_box.safe_double_click
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      @international_ship_to.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (value.size>10)?value[0..9]:value
    end unless data_error_tooltip.nil?
  end
  @international_ship_to.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? value)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include value
end

Given /^Expect Order Details Domestic Email data error tooltip to be \"(.*)\"$/ do |value|
  log.info "Expectation: Expect Order Details Domestic Email data error tooltip to be #{value}"
  @international_ship_to = orders.order_details.ship_to.international if @international_ship_to.nil?
  text_box = @single_order_form.email
  text_box.send_keys :tab
  text_box.send_keys :enter
  sleep 1
  error = text_box.data_error_qtip
  log.info "Test #{(error.include? value)?"Passed":"Failed"}"
  expect(error).to include value
end

Given /^Expect Order Details Length data error tooltip to be \"(.*)\"$/ do |value|
  log.info "Expectation: Expect Order Details Length data error tooltip to be #{value}"
  @international_ship_to = orders.order_details.ship_to.international if @international_ship_to.nil?
  text_box = @single_order_form.length
  text_box.send_keys :tab
  text_box.send_keys :enter
  sleep 1
  error = text_box.attribute_value "data-errorqtip"
  log.info "Test #{(error.include? value)?"Passed":"Failed"}"
  expect(error).to include value
end

Given /^Expect Order Details Width data error tooltip to be \"(.*)\"$/ do |value|
  log.info "Expectation: Expect Order Details Width data error tooltip to be #{value}"
  @international_ship_to = orders.order_details.ship_to.international if @international_ship_to.nil?
  width_text_box = @single_order_form.width
  text_box.send_keys :tab
  text_box.send_keys :enter
  sleep 1
  error = width_text_box.attribute_value "data-errorqtip"
  log.info "Test #{(error.include? value)?"Passed":"Failed"}"
  expect(error).to include value
end

Given /^Expect Order Details Height data error tooltip to be \"(.*)\"$/ do |value|
  log.info "Expectation: Expect Order Details Height data error tooltip to be #{value}"
  @international_ship_to = orders.order_details.ship_to.international if @international_ship_to.nil?
  height_text_box = @single_order_form.height
  text_box.send_keys :tab
  text_box.send_keys :enter
  sleep 1
  error = height_text_box.attribute_value "data-errorqtip"
  log.info "Test #{(error.include? value)?"Passed":"Failed"}"
  expect(error).to include value
end

Given /^Expect Grid ship cost data error tooltip to be \"(.*)\"$/ do |value|
  log.info "Expectation: Expect Grid ship cost data error tooltip to be #{value}"
  grid_order_id = orders.grid.order_id.row 1
  grid_ship_cost = orders.grid.ship_cost.data grid_order_id
  error = grid_ship_cost.attribute_value "data-errorqtip"
  log.info "Test #{(error.include? value)?"Passed":"Failed"}"
  expect(error).to include value
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