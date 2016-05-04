
Then /^Filter: Menu Item tooltip should be (.*)$/ do |expectation|
  actual = orders.filter.menu_item.tooltip
end

Then /^Tooltips: Expect Print Modal Print Media \"(.*)\" tooltip to include \"(.*)\"$/ do |expectation, data_qtip|
  log.info "Tooltips: Expect Print Modal Print Media #{expectation} tooltip to include #{data_qtip}"
  tooltips = data_qtip.split "||"
  actual_tooltip = orders.toolbar.print_modal.printing_on.tooltip expectation
  tooltips.each { |tooltip|
    log.info "Test #{(actual_tooltip.include? tooltip)?"Passed":"Failed"}"
    actual_tooltip.should include tooltip
  }
end

Then /^Tooltips: Expect Customs Form Tooltip Error for Total Weight to be (.+)$/ do |expectation|
  log.info "Step: Tooltips: Expect Customs Form Tooltip Error for Total Weight to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.total_weight.data_error
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Customs: Expect Item Description Tooltip Error to be (.*)$/ do |expectation|
  log.info "Step: Customs: Expect Item Description Tooltip Error to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).description.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Customs: Expect Qty Tooltip Error to be (.*)$/ do |expectation|
  log.info "Step: Customs: Expect Qty Tooltip Error to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).qty.text_box.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Customs: Expect Unit Price Tooltip Error to be (.*)$/ do |expectation|
  log.info "Step: Customs: Expect Unit Price Tooltip Error to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).unit_price.text_box.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Customs: Expect Pounds Tooltip Error to be (.*)$/ do |expectation|
  log.info "Step: Customs: Expect Pounds Tooltip Error to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).lbs.text_box.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Customs: Expect Ounces Tooltip Error to be (.*)$/ do |expectation|
  log.info "Step: Customs: Expect Ounces Tooltip Error to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).oz.text_box.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Details: Expect Domestic Address data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect Domestic Address data error tooltip to be #{expectation}"
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

Then /^Details: Expect Domestic Email data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect Domestic Email data error tooltip to be #{expectation}"
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

Then /^Details: Expect Weight Lbs data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect Domestic  Weight lbs data error tooltip to be #{expectation}"
  text_box = orders.details.weight.lbs.text_box
  20.times do
    text_box.scroll_into_view
    text_box.set "1"
    orders.details.click_form
    text_box.set "0"
    orders.details.click_form
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end

  text_box.scroll_into_view
  sleep 2
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect Weight Oz data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect Weight Oz data error tooltip to be #{expectation}"
  text_box = orders.details.weight.oz.text_box
  20.times do
    text_box.scroll_into_view
    text_box.set "1"
    text_box.safe_double_click
    orders.details.click_form
    text_box.safe_double_click
    text_box.set "0"
    text_box.scroll_into_view
    orders.details.click_form
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end

  text_box.scroll_into_view
  sleep 2
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect Service data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect Weight Oz data error tooltip to be #{expectation}"
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

  text_box.scroll_into_view
  sleep 2
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect Dimensions Length data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect Dimensions Length data error tooltip to be #{expectation}"
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

Then /^Details: Expect Dimensions Width data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect Dimensions Width data error tooltip to be #{expectation}"
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

Then /^Details: Expect Dimensions Height data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect Dimensions Height data error tooltip to be #{expectation}"
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

Then /^Grid: Expect ship cost data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Grid: Expect ship cost data error tooltip to be #{expectation}"
  grid_order_id = orders.grid.order_id.row 1
  grid_ship_cost = orders.grid.ship_cost.data grid_order_id
  error = grid_ship_cost.attribute_expectation "data-errorqtip"
  log.info "Test #{(error.include? expectation)?"Passed":"Failed"}"
  expect(error).to include expectation
end

Then /^Details: Expect International Name data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect International Name data error tooltip to be #{expectation}"
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
  sleep 2
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect International Company data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect International Company data error tooltip to be #{expectation}"
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

Then /^Details: Expect International Address 1 data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect International Address 1 data error tooltip to be #{expectation}"
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

Then /^Details: Expect International City data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect International City data error tooltip to be #{expectation}"
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

Then /^Details: Expect International Phone data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect International Phone data error tooltip to be #{expectation}"
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
  sleep 2
  data_error_tooltip = text_box.data_error_qtip
  log.info "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect International Email data error tooltip to be \"(.*)\"$/ do |expectation|
  log.info "Step: Details: Expect International Email data error tooltip to be #{expectation}"
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