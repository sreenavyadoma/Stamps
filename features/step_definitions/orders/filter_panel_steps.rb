
Then /^Filter: Select Awaiting Shipment$/ do
  logger.info "Filter: Select Awaiting Shipment"
  web_apps.orders.filter.awaiting_shipment
end

Then /^Filter: Select Shipped$/ do
  logger.info "Filter: Select Shipped"
  web_apps.orders.filter.shipped
end

Then /^Filter: Select Cancelled$/ do
  logger.info "Filter: Select Cancelled"
  web_apps.orders.filter.cancelled
end

Then /^Filter: Collapse Panel$/ do
  logger.info "Filter: Collapse Panel"
  web_apps.orders.filter.menu_item.collapse.click
end

Then /^Filter: Expand Panel$/ do
  logger.info "Filter: Expand Panel"
  web_apps.orders.filter.menu_item.expand.click
end

Then /^Filter: Expect Shipped Tab Date Printed to be today$/ do
  today = ParameterHelper.now_plus_mon_dd 0
  web_apps.orders.filter.shipped.date_printed.sort_descending
  actual_print_date = web_apps.orders.filter.shipped.date_printed.row 1
  logger.info "#{(actual_print_date)}"
  logger.info "Shipped Tab Date Printed to be today #{today}"
end

Then /^Filter: Expect Shipped Tab Ship Date to be today$/ do

end

Then /^Filter: Expect Shipped Tab Ship Date to be today plus (\d+)/ do |day|

end

Then /^Filter: Expect order moved to Shipped$/ do
  logger.info "Filter: Expect order moved to Shipped"
  grid = web_apps.orders.filter.shipped
  grid.order_date.sort_descending
  row = grid.order_id.row_num @order_id
  logger.info "Test #{(row > 0)?"Passed":"Failed"}"
  row.should be > 0
end

Then /^Filter: Expect order moved to Canceled$/ do
  logger.info "Filter: Expect order moved to Canceled"
  grid = web_apps.orders.filter.cancelled
  grid.order_date.sort_descending
  row = grid.order_id.row_num @order_id
  logger.info "Test #{(row > 0)?"Passed":"Failed"}"
  row.should be > 0
end

Then /^Filter: Move order to Awaiting Shipment$/ do
  logger.info "Move order to Awaiting Shipmen"
  grid = web_apps.orders.grid
  raise "Order ID #{@order_id} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @order_id) > 0
  grid.order_date.sort_descending
  grid.checkbox.check_order_id @order_id
  grid.toolbar.move.to_awaiting_shipment.cancel
  grid.toolbar.move.to_awaiting_shipment.move
end

Then /^Filter: Expect order moved to Awaiting Shipment$/ do
  logger.info "Filter: Expect order moved to Awaiting Shipment"
  grid = web_apps.orders.filter.awaiting_shipment
  grid.order_date.sort_descending
  row = grid.order_id.row_num @order_id
  logger.info "Test #{(row > 0)?"Passed":"Failed"}"
  row.should be > 0
end

Then /^Expect Awaiting Shipment count to be less by (\d+)$/ do |count|
  logger.info "Expect Awaiting Shipment count to be less by #{count}"
  awaiting_shipment_count = web_apps.orders.filter.awaiting_shipment_count
  logger.info "Test #{(awaiting_shipment_count = @awaiting_shipment_count.to_i - count.to_i)?'Passed':'Failed'}"
  awaiting_shipment_count.should eql @awaiting_shipment_count.to_i - count.to_i
end

Then /^Filter: Expect system shows name of (.*) Filter Panel - in closed panel$/ do |expectation|
  logger.info "Filter: Expect system shows name of #{expectation} Filter Panel - in closed panel"
  actual = web_apps.orders.filter.get_closed_filter_name
  logger.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql expectation
end

Then /^Filter: Expect panel arrow is pointing to the (.*) direction$/ do |expectation|
  logger.info "Filter: Expect panel arrow is pointing to the #{expectation} direction"
  actual = web_apps.orders.filter.get_arrow_direction
  logger.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql expectation
end

Then /^Filter: Expect system selects (.*) Filter Panel - and deselects the previous filter$/ do |filter|
  logger.info "Filter: Expect system selects #{filter} Filter Panel - and deselects the previous filter"
  actual = web_apps.orders.filter.get_selected_filter_text
  actual.should eql filter
end

Then /^Expect system updates the grid to show only orders that match the (.*) filter$/ do |expectation|
  logger.info "Expect system updates the grid to show only orders that match the #{expectation} filter"
  actual = web_apps.orders.filter.is_order_grid_filtered(expectation)
  logger.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Expect system displays expanded filters panel$/ do
  logger.info "Expect system displays expanded filters panel"
  actual = web_apps.orders.filter.is_filter_panel_present?
  logger.info "Test #{(actual==true)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Expect system displays "Awaiting Shipment" and "Shipped" filters in panel$/ do
  logger.info "Expect system displays Awaiting Shipment and Shipped filters in panel"
  actual = web_apps.orders.filter.is_filter_panel_present?
  logger.info "Test #{(actual==true)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Filter: Expect system selects the (.*) Filter Panel - by default$/ do |expectation|
  logger.info "Filter: Expect system selects the #{expectation} Filter Panel - by default"
  actual = web_apps.orders.filter.get_selected_filter_text
  logger.info "Test #{(actual==expectation)?'Passed':'Failed'}"
  actual.should eql expectation
end

Then /^Filter: Click on panel$/ do
  logger.info "Filter: Click on panel"
  web_apps.orders.filter.click_border_arrow
end

Then /^Filter: Expect Filters panel is close$/ do
  logger.info "Filter: Expect Filters panel is close"
  actual = web_apps.orders.filter.is_filter_panel_present?
  actual.should eql false
end

Then /^Filter: Expect system shows an arrow above the Order Status Filter Panel - name$/ do
  logger.info "Filter: Expect system shows an arrow above the Order Status Filter Panel - name"
  web_apps.orders.filter.is_header_arrow_present
end

Then /^Filter: Expect Panel is open$/ do
  logger.info "Filter: Expect Panel is open"
  actual = web_apps.orders.filter.is_filter_panel_present?
  logger.info "Test #{(actual==true)?'Passed':'Failed'}"
  actual.should eql true
end

Then /^Filter: Expect panel is hidden$/ do
  logger.info "Filter: Expect panel is hidden"
  actual = web_apps.orders.filter.are_filter_links_present
  logger.info "Test #{(actual==false)?'Passed':'Failed'}"
  actual.should eql false
end

Then /^Filter: Click panel name$/ do
  logger.info "Filter: Click panel name"
  web_apps.orders.filter.click_filter_panel_name
end

Then /^Filter: Click on the closed Filters panel$/ do
  logger.info "Filter: Click on the closed Filters panel"
  web_apps.orders.filter.click_closed_filter_panel
end


Then /^Expect printed Order ID is not in Awaiting Shipment tab$/ do
  logger.info "Expect printed Order ID is not in Awaiting Shipment tab"
  grid = web_apps.orders.filter.awaiting_shipment
  logger.info "First Order ID: #{@order_id} in Awaiting Shipment tab"
  row = 1
  row1_order_id = grid.order_id.row row
  logger.info "Row #{row} Order ID: #{row1_order_id}"
  expect(@order_id.include? row1_order_id).to be false
end

Then /^Expect all printed Order IDs not in Awaiting Shipment tab$/ do
  logger.info "Expect all printed Order IDs not in Awaiting Shipment tab"
  grid = web_apps.orders.filter.awaiting_shipment

  logger.info "First Order ID: #{@order_id} in Awaiting Shipment tab"
  row = 1
  row1_order_id = grid.order_id.row row
  logger.info "Row #{row} Order ID: #{row1_order_id}"
  expect(@order_id.include? row1_order_id).to be false

  logger.info "Second Order ID: #{@order_id_2} in Awaiting Shipment tab"
  row = 2
  row2_order_id = grid.order_id.row row
  logger.info "Row #{row} Order ID: #{row2_order_id}"
  expect(@order_id_2.include? row2_order_id).to be false

  logger.info "Third Order ID: #{@order_id_3} in Awaiting Shipment tab"
  row = 3
  row3_order_id = grid.order_id.row row
  logger.info "Row #{row} Order ID: #{row3_order_id}"
  expect(@order_id_3.include? row3_order_id).to be false

end

Then /^Expect printed Order ID is in Shipped tab$/ do
  logger.info "Expect printed Order ID is in Shipped tab"
  grid = web_apps.orders.filter.shipped
  grid.order_id.sort_descending
  sleep 1
  grid.order_id.sort_descending
  row1_order_id = grid.order_id.row 1
  logger.info "Shipped - Row #{1} Order ID: #{row1_order_id}"
  logger.info "Test #{(@order_id==row1_order_id)?'Passed':'Failed'}"
  @order_id.should eql row1_order_id
end

Then /^Expect all printed Order IDs are in Shipped tab$/ do
  logger.info "Expect all printed Order IDs are in Shipped tab"
  grid = web_apps.orders.filter.shipped

  logger.info "First Order ID: #{@order_id} Shipped tab"
  row = 3
  row3_order_id = grid.order_id.row row
  logger.info "Row #{row} Order ID: #{row3_order_id}"
  @order_id.should include row3_order_id

  logger.info "Second Order ID: #{@order_id_2} Shipped tab"
  row = 2
  row2_order_id = grid.order_id.row row
  logger.info "Row #{row} Order ID: #{row2_order_id}"
  @order_id_2.should include row2_order_id

  logger.info "Third Order ID: #{@order_id_3} Shipped tab"
  row = 1
  row1_order_id = grid.order_id.row row
  logger.info "Row #{row} Order ID: #{row1_order_id}"
  @order_id_3.should include row1_order_id

end



