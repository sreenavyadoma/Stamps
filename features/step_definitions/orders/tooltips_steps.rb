
Then /^Toolbar: Expect Print Tooltip to include (.*)$/ do |expectation|
  logger.step "Toolbar: Expect Print Tooltip to include #{expectation}"
  actual = web_apps.orders.toolbar.print_btn.tooltip
  logger.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  actual.should include expectation
end

Then /^Toolbar: Expect Move Tooltip to include (.*)$/ do |expectation|
  logger.step "Toolbar: Expect Move Tooltip to include #{expectation}"
  actual = web_apps.orders.toolbar.move.tooltip
  logger.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  actual.should include expectation
end

Then /^Toolbar: Expect Add Tooltip to include (.*)$/ do |expectation|
  logger.step "Toolbar: Expect Add Tooltip to include #{expectation}"
  actual = web_apps.orders.toolbar.add.order_details.tooltip
  logger.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  actual.should include expectation
end

Then /^Details: Expect Toolbar Menu Tooltip is (.*)$/ do |expectation|
  logger.step "Details: Expect Toolbar Menu Tooltip is #{expectation}"
  actual = web_apps.orders.details.toolbar.menu.tooltip
  logger.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  actual.should include expectation
end

Then /^Filter: Menu Item collapse button tooltip should be (.*)$/ do |expectation|
  logger.step "Filter: Menu Item collapse button tooltip should be #{expectation}"
  actual = web_apps.orders.filter.menu_item.collapse.tooltip
  logger.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  actual.should include expectation
end

Then /^Filter: Menu Item expand button tooltip should be (.*)$/ do |expectation|
  logger.step "Filter: Menu Item expand button tooltip should be #{expectation}"
  actual = web_apps.orders.filter.menu_item.expand.tooltip
  logger.step "Test #{(actual.include? expectation)?"Passed":"Failed"}"
  actual.should include expectation
end

Then /^Tooltips: Expect Print Modal Print Media \"(.*)\" tooltip to include \"(.*)\"$/ do |expectation, data_qtip|
  logger.step "Tooltips: Expect Print Modal Print Media #{expectation} tooltip to include #{data_qtip}"
  tooltips = data_qtip.split "||"
  actual_tooltip = web_apps.orders.toolbar.print_btn.print_modal.printing_on.tooltip expectation
  tooltips.each do |tooltip|
    logger.step "Test #{(actual_tooltip.include? tooltip)?"Passed":"Failed"}"
    actual_tooltip.should include tooltip
  end
end

Then /^Tooltips: Expect Customs Form Tooltip Error for Total Weight is (.+)$/ do |expectation|
  logger.step "Tooltips: Expect Customs Form Tooltip Error for Total Weight is #{expectation}"
  web_apps.orders.details.customs.edit_form.should_not be_nil
  data_error_qtip = web_apps.orders.details.customs.edit_form.total_weight.data_error
  logger.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Customs: Expect Item Description Tooltip Error is (.*)$/ do |expectation|
  logger.step "Customs: Expect Item Description Tooltip Error is #{expectation}"
  web_apps.orders.details.customs.edit_form.should_not be_nil
  data_error_qtip = web_apps.orders.details.customs.edit_form.item_grid.item(1).description.data_error_qtip
  logger.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Customs: Expect Qty Tooltip Error is (.*)$/ do |expectation|
  logger.step "Customs: Expect Qty Tooltip Error is #{expectation}"
  web_apps.orders.details.customs.edit_form.should_not be_nil
  data_error_qtip = web_apps.orders.details.customs.edit_form.item_grid.item(1).qty.text_box.data_error_qtip
  logger.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Customs: Expect Unit Price Tooltip Error is (.*)$/ do |expectation|
  logger.step "Customs: Expect Unit Price Tooltip Error is #{expectation}"
  web_apps.orders.details.customs.edit_form.should_not be_nil
  data_error_qtip = web_apps.orders.details.customs.edit_form.item_grid.item(1).unit_price.text_box.data_error_qtip
  logger.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Customs: Expect Pounds Tooltip Error is (.*)$/ do |expectation|
  logger.step "Customs: Expect Pounds Tooltip Error is #{expectation}"
  web_apps.orders.details.customs.edit_form.should_not be_nil
  data_error_qtip = web_apps.orders.details.customs.edit_form.item_grid.item(1).lbs.text_box.data_error_qtip
  logger.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Customs: Expect Ounces Tooltip Error is (.*)$/ do |expectation|
  logger.step "Customs: Expect Ounces Tooltip Error is #{expectation}"
  web_apps.orders.details.customs.edit_form.should_not be_nil
  data_error_qtip = web_apps.orders.details.customs.edit_form.item_grid.item(1).oz.text_box.data_error_qtip
  logger.step "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Details: Expect Domestic Address data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect Domestic Address data error tooltip is #{expectation}"
  text_box = web_apps.orders.details.ship_to.address.text_area
  20.times do
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    text_box.scroll_into_view
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  data_error_tooltip = text_box.data_error_qtip
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect Domestic Email data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect Domestic Email data error tooltip is #{expectation}"
  text_box = web_apps.orders.details.ship_to.email
  20.times do
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    text_box.scroll_into_view
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  data_error_tooltip = text_box.data_error_qtip
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect Weight Lbs data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect Domestic  Weight lbs data error tooltip is #{expectation}"
  text_box = web_apps.orders.details.weight.lbs.text_box
  20.times do
    text_box.scroll_into_view
    text_box.set "1"
    web_apps.orders.details.blur_out
    text_box.set "0"
    web_apps.orders.details.blur_out
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end

  text_box.scroll_into_view
  sleep 2
  data_error_tooltip = text_box.data_error_qtip
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect Weight Oz data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect Weight Oz data error tooltip is #{expectation}"
  text_box = web_apps.orders.details.weight.oz.text_box
  20.times do
    text_box.scroll_into_view
    text_box.set "1"
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    text_box.safe_double_click
    text_box.set "0"
    text_box.scroll_into_view
    web_apps.orders.details.blur_out
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end

  text_box.scroll_into_view
  sleep 2
  data_error_tooltip = text_box.data_error_qtip
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect Service data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect Weight Oz data error tooltip is #{expectation}"
  text_box = web_apps.orders.details.service.text_box
  20.times do
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    text_box.scroll_into_view
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end

  text_box.scroll_into_view
  sleep 2
  data_error_tooltip = text_box.data_error_qtip
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect Dimensions Length data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect Dimensions Length data error tooltip is #{expectation}"
  text_box = web_apps.orders.details.dimensions.length.text_box

  20.times do
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    text_box.scroll_into_view
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      web_apps.orders.details.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  web_apps.orders.details.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect Dimensions Width data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect Dimensions Width data error tooltip is #{expectation}"
  width_text_box = web_apps.orders.details.dimensions.width.text_box

  20.times do
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    text_box.scroll_into_view
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      web_apps.orders.details.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  web_apps.orders.details.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect Dimensions Height data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect Dimensions Height data error tooltip is #{expectation}"
  height_text_box = web_apps.orders.details.dimensions.height.text_box

  20.times do
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    text_box.scroll_into_view
    text_box.safe_double_click
    web_apps.orders.details.blur_out
    sleep 1
    data_error_tooltip = text_box.data_error_qtip
    begin
      web_apps.orders.details.name.scroll_into_view
      sleep 1
      break if data_error_tooltip.include? (expectation.size>10)?expectation[0..9]:expectation
    end unless data_error_tooltip.nil?
  end
  web_apps.orders.details.name.scroll_into_view
  data_error_tooltip = text_box.data_error_qtip
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Grid: Expect ship cost data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Grid: Expect ship cost data error tooltip is #{expectation}"
  grid_order_id = web_apps.orders.grid.order_id.row 1
  grid_ship_cost = web_apps.orders.grid.ship_cost.data grid_order_id
  error = grid_ship_cost.attribute_expectation "data-errorqtip"
  logger.step "Test #{(error.include? expectation)?"Passed":"Failed"}"
  expect(error).to include expectation
end

Then /^Details: Expect International Name data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect International Name data error tooltip is #{expectation}"
  @international_ship_to.should_not be_nil
  text_box = @international_ship_to.name
  20.times do
    text_box.safe_double_click
    @international_ship_to.blur_out
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
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect International Company data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect International Company data error tooltip is #{expectation}"
  @international_ship_to.should_not be_nil
  text_box = @international_ship_to.company

  20.times do
    text_box.safe_double_click
    @international_ship_to.blur_out
    @international_ship_to.name.scroll_into_view
    text_box.safe_double_click
    @international_ship_to.blur_out
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
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect International Address 1 data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect International Address 1 data error tooltip is #{expectation}"
  @international_ship_to.should_not be_nil
  text_box = @international_ship_to.address_1

  20.times do
    text_box.safe_double_click
    @international_ship_to.blur_out
    @international_ship_to.name.scroll_into_view
    text_box.safe_double_click
    @international_ship_to.blur_out
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
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect International City data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect International City data error tooltip is #{expectation}"
  @international_ship_to.should_not be_nil
  text_box = @international_ship_to.city

  20.times do
    text_box.safe_double_click
    @international_ship_to.blur_out
    @international_ship_to.name.scroll_into_view
    @international_ship_to.blur_out
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
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect International Phone data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect International Phone data error tooltip is #{expectation}"
  @international_ship_to.should_not be_nil
  text_box = @international_ship_to.phone

  20.times do
    text_box.safe_double_click
    @international_ship_to.blur_out
    @international_ship_to.name.scroll_into_view
    text_box.safe_double_click
    @international_ship_to.blur_out
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
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end

Then /^Details: Expect International Email data error tooltip is \"(.*)\"$/ do |expectation|
  logger.step "Details: Expect International Email data error tooltip is #{expectation}"
  @international_ship_to.should_not be_nil
  text_box = @international_ship_to.email

  20.times do
    text_box.safe_double_click
    @international_ship_to.blur_out
    @international_ship_to.name.scroll_into_view
    text_box.safe_double_click
    @international_ship_to.blur_out
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
  logger.step "Test #{(data_error_tooltip.include? expectation)?"Passed":"Failed"}"
  expect(data_error_tooltip).to include expectation
end