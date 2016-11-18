
Then /^Filter: Select Awaiting Shipment$/ do
  logger.step "Filter: Select Awaiting Shipment"
  stamps.orders.filter.awaiting_shipment
end

Then /^Filter: Select Shipped$/ do
  logger.step "Filter: Select Shipped"
  stamps.orders.filter.shipped
end

Then /^Filter: Select Cancelled$/ do
  logger.step "Filter: Select Cancelled"
  stamps.orders.filter.cancelled
end

Then /^Filter: Collapse Panel$/ do
  logger.step "Filter: Collapse Panel"
  stamps.orders.filter.menu_item.collapse.click
end

Then /^Filter: Expand Panel$/ do
  logger.step "Filter: Expand Panel"
  stamps.orders.filter.menu_item.expand.click
end

Then /^Filter: Expect Shipped Tab Date Printed is today$/ do
  today = ParameterHelper.now_plus_mon_dd 0
  stamps.orders.filter.shipped.date_printed.sort_descending
  actual_print_date = stamps.orders.filter.shipped.date_printed.row 1
  logger.step "#{(actual_print_date)}"
  logger.step "Shipped Tab Date Printed is today #{today}"
end

Then /^Filter: Expect Shipped Tab Ship Date is today$/ do

end

Then /^Filter: Expect Shipped Tab Ship Date is today plus (\d+)/ do |day|

end

Then /^Filter: Expect order moved to Shipped$/ do
  logger.step "Filter: Expect order moved to Shipped"
  stamps.orders.filter.shipped.order_date.sort_descending
  stamps.orders.grid.order_id.row_num(test_data[:order_id]).should be > 0
end

Then /^Filter: Expect order moved to Canceled$/ do
  logger.step "Filter: Expect order moved to Canceled"
  stamps.orders.filter.cancelled.order_date.sort_descending
  stamps.orders.filter.cancelled.order_id.row_num(test_data[:order_id]).should be > 0
end

Then /^Filter: Move order to Awaiting Shipment$/ do
  logger.step "Move order to Awaiting Shipmen"
  stamps.orders.grid.order_date.sort_descending
  stamps.orders.grid.checkbox.check_order test_data[:order_id]
  stamps.orders.grid.toolbar.move.to_awaiting_shipment.cancel
  stamps.orders.grid.toolbar.move.to_awaiting_shipment.move
end

Then /^Filter: Expect order moved to Awaiting Shipment$/ do
  logger.step "Filter: Expect order moved to Awaiting Shipment"
  stamps.orders.grid.order_date.sort_descending
  stamps.orders.grid.order_id.row_num(test_data[:order_id]).should be > 0
end

Then /^Filter: Expect Awaiting Shipment count is less by (\d+)$/ do |count|
  logger.step "Filter: Expect Awaiting Shipment count is less by #{count}"
  stamps.orders.filter.awaiting_shipment_count.should eql test_data[:awaiting_shipment_count].to_i - count.to_i
end

Then /^Filter: Expect system shows name of (.*) Filter Panel - in closed panel$/ do |expectation|
  logger.step "Filter: Expect system shows name of #{expectation} Filter Panel - in closed panel"
  stamps.orders.filter.get_closed_filter_name.should eql expectation
end

Then /^Filter: Expect panel arrow is pointing to the (.*) direction$/ do |expectation|
  logger.step "Filter: Expect panel arrow is pointing to the #{expectation} direction"
  stamps.orders.filter.get_arrow_direction.should eql expectation
end

Then /^Filter: Expect system selects (.*) Filter Panel - and deselects the previous filter$/ do |filter|
  logger.step "Filter: Expect system selects #{filter} Filter Panel - and deselects the previous filter"
  actual = stamps.orders.filter.get_selected_filter_text
  actual.should eql filter
end

Then /^Filter: Expect system updates the grid to show only orders that match the (.*) filter$/ do |expectation|
  logger.step "Filter: Expect system updates the grid to show only orders that match the #{expectation} filter"
  stamps.orders.filter.is_order_grid_filtered(expectation).should be true
end

Then /^Filter: Expect system displays expanded filters panel$/ do
  logger.step "Filter: Expect system displays expanded filters panel"
  stamps.orders.filter.is_filter_panel_present?.should be true
end

Then /^Filter: Expect system displays "Awaiting Shipment" and "Shipped" filters in panel$/ do
  logger.step "Expect system displays Awaiting Shipment and Shipped filters in panel"
  stamps.orders.filter.is_filter_panel_present?.should be true
end

Then /^Filter: Expect system selects the (.*) Filter Panel - by default$/ do |expectation|
  logger.step "Filter: Expect system selects the #{expectation} Filter Panel - by default"
  stamps.orders.filter.get_selected_filter_text.should eql expectation
end

Then /^Filter: Click on panel$/ do
  logger.step "Filter: Click on panel"
  stamps.orders.filter.click_border_arrow
end

Then /^Filter: Expect Filters panel is close$/ do
  logger.step "Filter: Expect Filters panel is close"
  actual = stamps.orders.filter.is_filter_panel_present?
  actual.should eql false
end

Then /^Filter: Expect system shows an arrow above the Order Status Filter Panel - name$/ do
  logger.step "Filter: Expect system shows an arrow above the Order Status Filter Panel - name"
  stamps.orders.filter.is_header_arrow_present
end

Then /^Filter: Expect Panel is open$/ do
  logger.step "Filter: Expect Panel is open"
  stamps.orders.filter.is_filter_panel_present?.should be true
end

Then /^Filter: Expect panel is hidden$/ do
  logger.step "Filter: Expect panel is hidden"
  stamps.orders.filter.are_filter_links_present.should eql false
end

Then /^Filter: Click panel name$/ do
  logger.step "Filter: Click panel name"
  stamps.orders.filter.click_filter_panel_name
end

Then /^Filter: Click on the closed Filters panel$/ do
  logger.step "Filter: Click on the closed Filters panel"
  stamps.orders.filter.click_closed_filter_panel
end


Then /^Filter: Expect printed Order ID is not in Awaiting Shipment tab$/ do
  logger.step "Filter: Expect printed Order ID is not in Awaiting Shipment tab"
  grid = stamps.orders.filter.awaiting_shipment
  logger.step "First Order ID: #{test_data[:order_id]} in Awaiting Shipment tab"
  row = 1
  row1_order_id = grid.order_id.row row
  logger.step "Row #{row} Order ID: #{row1_order_id}"
  expect(test_data[:order_id].include? row1_order_id).is false
end

Then /^Filter: Expect all printed Order IDs not in Awaiting Shipment tab$/ do
  logger.step "Filter: Expect all printed Order IDs not in Awaiting Shipment tab"
  test_data[:order_id].should_not include stamps.orders.filter.awaiting_shipment.order_id.row(1)
  test_data[:order_id].should_not include stamps.orders.filter.awaiting_shipment.order_id.row(2)
  test_data[:order_id].should_not include stamps.orders.filter.awaiting_shipment.order_id.row(3)
end

Then /^Filter: Expect printed Order ID is in Shipped tab$/ do
  logger.step "Filter: Expect printed Order ID is in Shipped tab"
  stamps.orders.filter.shipped.order_id.sort_descending
  stamps.orders.filter.shipped.order_id.sort_descending
  stamps.orders.filter.shipped.order_id.row(1).should eql test_data[:order_id]
end

Then /^Filter: Expect all printed Order IDs are in Shipped tab$/ do
  logger.step "Filter: Expect all printed Order IDs are in Shipped tab"
  test_data[:order_id].should include grid.order_id.row(3)
  test_data[:order_id_2].should include grid.order_id.row(2)
  test_data[:order_id_3].should include grid.order_id.row(1)
end



