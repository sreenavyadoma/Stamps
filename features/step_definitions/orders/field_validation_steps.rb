#domestic

Then /^Expect Order Details Domestic Address data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details Domestic Address data error tooltip to be #{expectation}"
  text_box = orders.details.ship_to.address.text_area
  20.times do
    text_box.safe_double_click
    orders.details.click_form
    text_box.scroll_into_view
    text_box.safe_double_click
    orders.details.click_form
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Order Details Domestic Email data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details Domestic Email data error tooltip to be #{expectation}"
  text_box = orders.details.ship_to.email
  20.times do
    text_box.safe_double_click
    orders.details.click_form
    text_box.scroll_into_view
    text_box.safe_double_click
    orders.details.click_form
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Order Details Weight Lbs data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details Domestic  Weight lbs data error tooltip to be #{expectation}"
  text_box = orders.details.weight.lbs.text_box
  20.times do
    orders.details.click_form
    text_box.scroll_into_view
    orders.details.click_form
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Order Details Weight Oz data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details Weight Oz data error tooltip to be #{expectation}"
  text_box = orders.details.weight.oz.text_box
  20.times do
    text_box.safe_double_click
    orders.details.click_form
    text_box.scroll_into_view
    text_box.safe_double_click
    orders.details.click_form
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Order Details Service data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details Weight Oz data error tooltip to be #{expectation}"
  text_box = orders.details.service.text_box
  20.times do
    text_box.safe_double_click
    orders.details.click_form
    text_box.scroll_into_view
    text_box.safe_double_click
    orders.details.click_form
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Order Details Dimensions Length data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details Dimensions Length data error tooltip to be #{expectation}"
  text_box = orders.details.dimensions.length.text_box

  20.times do
    text_box.safe_double_click
    orders.details.click_form
    text_box.scroll_into_view
    text_box.safe_double_click
    orders.details.click_form
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      orders.details.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  orders.details.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Order Details Dimensions Width data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details Dimensions Width data error tooltip to be #{expectation}"
  width_text_box = orders.details.dimensions.width.text_box

  20.times do
    text_box.safe_double_click
    orders.details.click_form
    text_box.scroll_into_view
    text_box.safe_double_click
    orders.details.click_form
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      orders.details.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  orders.details.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Order Details Dimensions Height data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details Dimensions Height data error tooltip to be #{expectation}"
  height_text_box = orders.details.dimensions.height.text_box

  20.times do
    text_box.safe_double_click
    orders.details.click_form
    text_box.scroll_into_view
    text_box.safe_double_click
    orders.details.click_form
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      orders.details.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  orders.details.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Grid ship cost data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Grid ship cost data error tooltip to be #{expectation}"
  grid_order_id = orders.grid.order_id.row 1
  grid_ship_cost = orders.grid.ship_cost.data grid_order_id
  error = grid_ship_cost.attribute_expectation "data-errorqtip"
  log.info "Test #{(error.include? expectation)?"Passed":"Failed"}"
  expect(error).to include expectation
end

Then /^Expect Grid Ship Cost error to contain \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Grid Ship Cost error to contain #{expectation}"
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

Then /^Expect Order Details International Name data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details International Name data error tooltip to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  text_box = @international_ship_to.name
  20.times do
    text_box.safe_double_click
    @international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    text_box.safe_double_click
    #@international_ship_to.click_form
    @international_ship_to.name.scroll_into_view
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      @international_ship_to.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  @international_ship_to.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Order Details International Company data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details International Company data error tooltip to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  text_box = @international_ship_to.company

  20.times do
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
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  @international_ship_to.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Order Details International Address 1 data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details International Address 1 data error tooltip to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  text_box = @international_ship_to.address_1

  20.times do
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
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  @international_ship_to.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Order Details International City data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details International City data error tooltip to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  text_box = @international_ship_to.city

  20.times do
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
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  @international_ship_to.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Order Details International Phone data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details International Phone data error tooltip to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  text_box = @international_ship_to.phone

  20.times do
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
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  @international_ship_to.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Expect Order Details International Email data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Expect Order Details International Email data error tooltip to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  text_box = @international_ship_to.email

  20.times do
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
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  @international_ship_to.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end