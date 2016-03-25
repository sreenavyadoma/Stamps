
Then /^Filter: Select Awaiting Shipment$/ do
  log.info "Step:  Filter: Select Awaiting Shipment"
  orders.filter.awaiting_shipment
end

Then /^Filter: Select Shipped$/ do
  log.info "Step:  Filter: Select Shipped"
  orders.filter.shipped
end

Then /^Filter: Select Cancelled$/ do
  log.info "Step:  Filter: Select Cancelled"
  orders.filter.cancelled
end

Then /^Expect Awaiting Shipment count to be less by (\d+)$/ do |count|
  log.info "Step: Expect Awaiting Shipment count to be less by #{count}"
  awaiting_shipment_count = orders.filter.awaiting_shipment_count
  log.info "Test #{(awaiting_shipment_count = @awaiting_shipment_count.to_i - count.to_i)?'Passed':'Failed'}"
  awaiting_shipment_count.should eql @awaiting_shipment_count.to_i - count.to_i
end

Then /^Expect system shows name of (.*) Filter Panel - in closed panel$/ do |expectation|
  log.info "Step: Expect system shows name of #{expectation} Filter Panel - in closed panel"
  actual = orders.filter.get_closed_filter_name
  log.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql expectation
end

Then /^Expect system changes the panel arrow so that it is pointing to the (.*) direction$/ do |expectation|
  log.info "Step: Expect system changes the panel arrow so that it is pointing to the #{expectation} direction"
  actual = orders.filter.get_arrow_direction
  log.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql expectation
end

Then /^Expect system selects (.*) Filter Panel - and deselects the previous filter$/ do |filter|
  log.info "Step: Expect system selects #{filter} Filter Panel - and deselects the previous filter"
  actual = orders.filter.get_selected_filter_text
  actual.should eql filter
end

Then /^Expect system updates the grid to show only orders that match the (.*) filter$/ do |expectation|
  log.info "Step: Expect system updates the grid to show only orders that match the #{expectation} filter"
  actual = orders.filter.is_order_grid_filtered(expectation)
  log.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Expect system displays expanded filters panel$/ do
  log.info "Step: Expect system displays expanded filters panel"
  actual = orders.filter.is_filter_panel_present
  log.info "Test #{(actual==true)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Expect system displays "Awaiting Shipment" and "Shipped" filters in panel$/ do
  log.info "Step: Expect system displays Awaiting Shipment and Shipped filters in panel"
  actual = orders.filter.are_filter_buttons_present
  log.info "Test #{(actual==true)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Expect system selects the (.*) Filter Panel - by default$/ do |expectation|
  log.info "Step: Expect system selects the #{expectation} Filter Panel - by default"
  actual = orders.filter.get_selected_filter_text
  log.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql expectation
end

Then /^Click on the Filters panel border arrow$/ do
  log.info "Step: Click on the Filters panel border arrow"
  orders.filter.click_border_arrow
end

Then /^Expect system closes Filters panel$/ do
  log.info "Step: Expect system closes Filters panel"
  actual = orders.filter.is_filter_panel_present
  actual.should eql false
end

Then /^Expect system shows an arrow above the Order Status Filter Panel - name$/ do
  log.info "Step: Expect system shows an arrow above the Order Status Filter Panel - name"
  orders.filter.is_header_arrow_present
end

Then /^Expect system opens the Filters panel$/ do
  log.info "Step: Expect system opens the Filters panel"
  actual = orders.filter.is_filter_panel_present
  log.info "Test #{(actual==true)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Expect system hides the header arrow and Order Status Filter Panel - name$/ do
  log.info "Step: Expect system hides the header arrow and Order Status Filter Panel - name"
  actual = orders.filter.are_filter_links_present
  log.info "Test #{(actual==false)?'Passed':'Failed'}"
  actual.should eql false
end

Then /^Double click on the Filters panel border$/ do
  log.info "Step: Double click on the Filters panel border"
  orders.filter.double_click_border
end

Then /^Click on the Filters panel name$/ do
  log.info "Step: Click on the Filters panel name"
  orders.filter.click_filter_panel_name
end

Then /^Click on the closed Filters panel$/ do
  log.info "Step: Click on the closed Filters panel"
  orders.filter.click_closed_filter_panel
end


Then /^Expect printed Order ID is not in Awaiting Shipment tab$/ do
  log.info "Step: Expect printed Order ID is not in Awaiting Shipment tab"
  grid = orders.filter.awaiting_shipment
  log.info "First Order ID: #{@order_id} in Awaiting Shipment tab"
  row = 1
  row1_order_id = grid.order_id.row row
  log.info "Row #{row} Order ID: #{row1_order_id}"
  expect(@order_id.include? row1_order_id).to be false
end

Then /^Expect all printed Order IDs not in Awaiting Shipment tab$/ do
  log.info "Step: Expect all printed Order IDs not in Awaiting Shipment tab"
  grid = orders.filter.awaiting_shipment

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
  log.info "Step: Expect printed Order ID is in Shipped tab"
  grid = orders.filter.shipped
  grid.order_id.menu.sort_descending
  sleep 1
  grid.order_id.menu.sort_descending
  row1_order_id = grid.order_id.row 1
  log.info "Shipped - Row #{1} Order ID: #{row1_order_id}"
  log.info "Test #{(@order_id==row1_order_id)?'Passed':'Failed'}"
  @order_id.should eql row1_order_id
end

Then /^Expect all printed Order IDs are in Shipped tab$/ do
  log.info "Step: Expect all printed Order IDs are in Shipped tab"
  grid = orders.filter.shipped

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



