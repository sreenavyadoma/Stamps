
Then /^Filter: Select Awaiting Shipment$/ do
  log.info "Filter: Select Awaiting Shipment"
  orders.filter.awaiting_shipment
end

Then /^Filter: Select Shipped$/ do
  log.info "Filter: Select Shipped"
  orders.filter.shipped
end

Then /^Filter: Select Cancelled$/ do
  log.info "Filter: Select Cancelled"
  orders.filter.cancelled
end

Then /^Filter: Collapse Panel$/ do
  log.info "Filter: Collapse Panel"
  orders.filter.menu_item.collapse.click
end

Then /^Filter: Expand Panel$/ do
  log.info "Filter: Expand Panel"
  orders.filter.menu_item.expand.click
end

Then /^Filter: Expect Shipped Tab Date Printed to be today$/ do
  today = test_helper.now_plus_mon_dd 0
  orders.filter.shipped.date_printed.menu.sort_descending
  actual_print_date = orders.filter.shipped.date_printed.row 1
  log.info "#{(actual_print_date)}"
  log.info "Shipped Tab Date Printed to be today #{today}"
end

Then /^Filter: Expect Shipped Tab Ship Date to be today$/ do

end

Then /^Filter: Expect Shipped Tab Ship Date to be today plus (\d+)/ do |day|

end

Then /^Filter: Expect order moved to Shipped$/ do
  log.info "Filter: Expect order moved to Shipped"
  grid = orders.filter.shipped
  grid.order_date.menu.sort_descending
  row = grid.order_id.row_num @order_id
  log.info "Test #{(row > 0)?"Passed":"Failed"}"
  row.should be > 0
end

Then /^Filter: Expect order moved to Canceled$/ do
  log.info "Filter: Expect order moved to Canceled"
  grid = orders.filter.cancelled
  grid.order_date.menu.sort_descending
  row = grid.order_id.row_num @order_id
  log.info "Test #{(row > 0)?"Passed":"Failed"}"
  row.should be > 0
end

Then /^Filter: Move order to Awaiting Shipment$/ do
  log.info "Move order to Awaiting Shipmen"
  grid = orders.grid
  raise "Order ID #{@order_id} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @order_id) > 0
  grid.order_date.menu.sort_descending
  grid.checkbox.check_order_id @order_id
  grid.toolbar.move.to_awaiting_shipment.cancel
  grid.toolbar.move.to_awaiting_shipment.move
end

Then /^Filter: Expect order moved to Awaiting Shipment$/ do
  log.info "Filter: Expect order moved to Awaiting Shipment"
  grid = orders.filter.awaiting_shipment
  grid.order_date.menu.sort_descending
  row = grid.order_id.row_num @order_id
  log.info "Test #{(row > 0)?"Passed":"Failed"}"
  row.should be > 0
end

Then /^Expect Awaiting Shipment count to be less by (\d+)$/ do |count|
  log.info "Expect Awaiting Shipment count to be less by #{count}"
  awaiting_shipment_count = orders.filter.awaiting_shipment_count
  log.info "Test #{(awaiting_shipment_count = @awaiting_shipment_count.to_i - count.to_i)?'Passed':'Failed'}"
  awaiting_shipment_count.should eql @awaiting_shipment_count.to_i - count.to_i
end

Then /^Filter: Expect system shows name of (.*) Filter Panel - in closed panel$/ do |expectation|
  log.info "Filter: Expect system shows name of #{expectation} Filter Panel - in closed panel"
  actual = orders.filter.get_closed_filter_name
  log.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql expectation
end

Then /^Filter: Expect panel arrow is pointing to the (.*) direction$/ do |expectation|
  log.info "Filter: Expect panel arrow is pointing to the #{expectation} direction"
  actual = orders.filter.get_arrow_direction
  log.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql expectation
end

Then /^Filter: Expect system selects (.*) Filter Panel - and deselects the previous filter$/ do |filter|
  log.info "Filter: Expect system selects #{filter} Filter Panel - and deselects the previous filter"
  actual = orders.filter.get_selected_filter_text
  actual.should eql filter
end

Then /^Expect system updates the grid to show only orders that match the (.*) filter$/ do |expectation|
  log.info "Expect system updates the grid to show only orders that match the #{expectation} filter"
  actual = orders.filter.is_order_grid_filtered(expectation)
  log.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Expect system displays expanded filters panel$/ do
  log.info "Expect system displays expanded filters panel"
  actual = orders.filter.is_filter_panel_present
  log.info "Test #{(actual==true)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Expect system displays "Awaiting Shipment" and "Shipped" filters in panel$/ do
  log.info "Expect system displays Awaiting Shipment and Shipped filters in panel"
  actual = orders.filter.are_filter_buttons_present
  log.info "Test #{(actual==true)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Filter: Expect system selects the (.*) Filter Panel - by default$/ do |expectation|
  log.info "Filter: Expect system selects the #{expectation} Filter Panel - by default"
  actual = orders.filter.get_selected_filter_text
  log.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql expectation
end

Then /^Filter: Click on panel$/ do
  log.info "Filter: Click on panel"
  orders.filter.click_border_arrow
end

Then /^Filter: Expect Filters panel is close$/ do
  log.info "Filter: Expect Filters panel is close"
  actual = orders.filter.is_filter_panel_present
  actual.should eql false
end

Then /^Filter: Expect system shows an arrow above the Order Status Filter Panel - name$/ do
  log.info "Filter: Expect system shows an arrow above the Order Status Filter Panel - name"
  orders.filter.is_header_arrow_present
end

Then /^Filter: Expect Panel is open$/ do
  log.info "Filter: Expect Panel is open"
  actual = orders.filter.is_filter_panel_present
  log.info "Test #{(actual==true)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Filter: Expect panel is hidden$/ do
  log.info "Filter: Expect panel is hidden"
  actual = orders.filter.are_filter_links_present
  log.info "Test #{(actual==false)?'Passed':'Failed'}"
  actual.should eql false
end

Then /^Filter: Click panel name$/ do
  log.info "Filter: Click panel name"
  orders.filter.click_filter_panel_name
end

Then /^Filter: Click on the closed Filters panel$/ do
  log.info "Filter: Click on the closed Filters panel"
  orders.filter.click_closed_filter_panel
end


Then /^Expect printed Order ID is not in Awaiting Shipment tab$/ do
  log.info "Expect printed Order ID is not in Awaiting Shipment tab"
  grid = orders.filter.awaiting_shipment
  log.info "First Order ID: #{@order_id} in Awaiting Shipment tab"
  row = 1
  row1_order_id = grid.order_id.row row
  log.info "Row #{row} Order ID: #{row1_order_id}"
  expect(@order_id.include? row1_order_id).to be false
end

Then /^Expect all printed Order IDs not in Awaiting Shipment tab$/ do
  log.info "Expect all printed Order IDs not in Awaiting Shipment tab"
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
  log.info "Expect printed Order ID is in Shipped tab"
  grid = orders.filter.shipped
  grid.order_id.sort_descending
  sleep 1
  grid.order_id.sort_descending
  row1_order_id = grid.order_id.row 1
  log.info "Shipped - Row #{1} Order ID: #{row1_order_id}"
  log.info "Test #{(@order_id==row1_order_id)?'Passed':'Failed'}"
  @order_id.should eql row1_order_id
end

Then /^Expect all printed Order IDs are in Shipped tab$/ do
  log.info "Expect all printed Order IDs are in Shipped tab"
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



