Then /^Filter Awaiting Shipment Orders$/ do
  log.info "Filter Awaiting Shipment Orders"
  batch.filter.awaiting_shipment
end

Then /^Filter Shipped Orders$/ do
  log.info "Filter Shipped Orders"
  batch.filter.shipped
end

Then /^Filter Cancelled Orders$/ do
  log.info "Filter Cancelled Orders"
  batch.filter.cancelled
end


Then /^Expect Awaiting Shipment count to be less by (\d+)$/ do |count|
  log.info "Expect Awaiting Shipment count to be less by #{count}"
  batch.filter.awaiting_shipment_count
end

Then /^Expect system shows name of (.*) filter in closed panel$/ do |expectation|
  log.info "Expectation: Expect system shows name of #{expectation} filter in closed panel"
  actual = batch.filter.get_closed_filter_name
  log.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql expectation
end

Then /^Expect system changes the panel arrow so that it is pointing to the (.*) direction$/ do |expectation|
  log.info "Expectation: Expect system changes the panel arrow so that it is pointing to the #{expectation} direction"
  actual = batch.filter.get_arrow_direction
  log.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql expectation
end

Then /^Expect system selects (.*) Filter and deselects the previous filter$/ do |filter|
  log.info "Expectation: Expect system selects #{filter} Filter and deselects the previous filter"
  actual = batch.filter.get_selected_filter_text
  actual.should eql filter
end

Then /^Expect system updates the grid to show only orders that match the (.*) filter$/ do |expectation|
  log.info "Expectation: Expect system updates the grid to show only orders that match the #{expectation} filter"
  actual = batch.filter.is_order_grid_filtered(expectation)
  log.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Expect system (.*) "Print" button in control ribbon$/ do |status|
  log.info "Expectation: Expect system #{status} Print button in control ribbon"

  actual = batch.toolbar.is_browser_print_button_present
  if status == 'hides'
    actual.should eql false
  elsif status == 'displays'
    actual.should eql true
  end
end

Then /^Expect system displays expanded filters panel$/ do
  log.info "Expectation: Expect system displays expanded filters panel"
  actual = batch.filter.is_filter_panel_present
  log.info "Test #{(actual==true)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Expect system displays "Awaiting Shipment" and "Shipped" filters in panel$/ do
  log.info "Expectation: Expect system displays Awaiting Shipment and Shipped filters in panel"
  actual = batch.filter.are_filter_buttons_present
  log.info "Test #{(actual==true)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Expect system selects the (.*) filter by default$/ do |expectation|
  log.info "Expectation: Expect system selects the #{expectation} filter by default"
  actual = batch.filter.get_selected_filter_text
  log.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql expectation
end

Then /^Click on the Filters panel border arrow$/ do
  log.info "Step: Click on the Filters panel border arrow"
  batch.filter.click_border_arrow
end

Then /^Expect system closes Filters panel$/ do
  log.info "Expectation: Expect system closes Filters panel"
  actual = batch.filter.is_filter_panel_present
  actual.should eql false
end

Then /^Expect system shows an arrow above the Order Status filter name$/ do
  log.info "Expectation: Expect system shows an arrow above the Order Status filter name"
  batch.filter.is_header_arrow_present
end

Then /^Expect system opens the Filters panel$/ do
  log.info "Expectation: Expect system opens the Filters panel"
  actual = batch.filter.is_filter_panel_present
  log.info "Test #{(actual==true)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Expect system hides the header arrow and Order Status filter name$/ do
  log.info "Expectation: Expect system hides the header arrow and Order Status filter name"
  actual = batch.filter.are_filter_links_present
  log.info "Test #{(actual==false)?'Passed':'Failed'}"
  actual.should eql false
end

Then /^Double click on the Filters panel border$/ do
  log.info "Step: Double click on the Filters panel border"
  batch.filter.double_click_border
end

Then /^Click on the Filters panel name$/ do
  log.info "Step: Click on the Filters panel name"
  batch.filter.click_filter_panel_name
end

Then /^Click on the closed Filters panel$/ do
  log.info "Step: Click on the closed Filters panel"
  batch.filter.click_closed_filter_panel
end


Then /^Expect printed Order ID is not in Awaiting Shipment tab$/ do
  log.info "Expectation: Expect printed Order ID is not in Awaiting Shipment tab"
  grid = batch.filter.awaiting_shipment
  log.info "First Order ID: #{@order_id} in Awaiting Shipment tab"
  row = 1
  row1_order_id = grid.order_id.row row
  log.info "Row #{row} Order ID: #{row1_order_id}"
  expect(@order_id.include? row1_order_id).to be false
end

Then /^Expect all printed Order IDs do not exist in Awaiting Shipment tab$/ do
  log.info "Expectation: Expect all printed Order IDs do not exist in Awaiting Shipment tab"
  grid = batch.filter.awaiting_shipment

  log.info "First Order ID: #{@order_id} in Awaiting Shipment tab"
  row = 1
  row1_order_id = grid.order_id.row row
  log.info "Row #{row} Order ID: #{row1_order_id}"
  expect(@order_id.include? row1_order_id).to be false

  log.info "Second Order ID: #{@order_id_2} in Awaiting Shipment tab"
  row = 2
  row2_order_id = grid.order_id.row row
  log.info "Row #{row} Order ID: #{row2_order_id}"
  expect(@order_id_2.include? row2_order_id).to be false

  log.info "Third Order ID: #{@order_id_3} in Awaiting Shipment tab"
  row = 3
  row3_order_id = grid.order_id.row row
  log.info "Row #{row} Order ID: #{row3_order_id}"
  expect(@order_id_3.include? row3_order_id).to be false

end

Then /^Expect printed Order ID is in Shipped tab$/ do
  log.info "Expectation: Expect printed Order ID is in Shipped tab"
  grid = batch.filter.shipped
  row1_order_id = grid.order_id.row 1
  log.info "Shipped - Row #{1} Order ID: #{row1_order_id}"
  @order_id.should eql row1_order_id
end

Then /^Expect all printed Order IDs are in Shipped tab$/ do
  log.info "Expectation: Expect all printed Order IDs are in Shipped tab"
  grid = batch.filter.shipped

  log.info "First Order ID: #{@order_id} Shipped tab"
  row = 3
  row3_order_id = grid.order_id.row row
  log.info "Row #{row} Order ID: #{row3_order_id}"
  @order_id.should include row3_order_id

  log.info "Second Order ID: #{@order_id_2} Shipped tab"
  row = 2
  row2_order_id = grid.order_id.row row
  log.info "Row #{row} Order ID: #{row2_order_id}"
  @order_id_2.should include row2_order_id

  log.info "Third Order ID: #{@order_id_3} Shipped tab"
  row = 1
  row1_order_id = grid.order_id.row row
  log.info "Row #{row} Order ID: #{row1_order_id}"
  @order_id_3.should include row1_order_id

end



