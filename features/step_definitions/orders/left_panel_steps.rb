
Then /^Left Panel: Search saved Order ID$/ do
  logger.step "Left Panel: Search saved Order ID #{test_data[:order_id]}"
  test_data[:order_id].should be_truthy
  step "Left Panel: Search for #{test_data[:order_id]}"
end

Then /^Left Panel: Search saved Ship Name$/ do
  logger.step "Left Panel: Search saved Ship Name #{test_data[:name]}"
  test_data[:name].should be_truthy
  step "Left Panel: Search for #{test_data[:name]}"
end

Then /^Left Panel: Search saved Ship Company$/ do
  logger.step "Left Panel: Search saved Ship Company #{test_data[:company]}"
  test_data[:company].should be_truthy
  step "Left Panel: Search for #{test_data[:company]}"
end

Then /^Left Panel: Search saved Email$/ do
  logger.step "Left Panel: Search saved Email #{test_data[:email]}"
  test_data[:email].should be_truthy
  step "Left Panel: Search for #{test_data[:email]}"
end

Then /^Left Panel: Search for (.*)$/ do |str|
  test_data[:orders_search_str] = str
  logger.step "Left Panel: Search for #{test_data[:orders_search_str]}"
  stamps.orders.left_panel.search_orders test_data[:orders_search_str]
end

Then /^Left Panel: Search results count should be (\d*)$/ do |count|
  logger.step "Left Panel: Search results count should be #{count}"
  stamps.orders.left_panel.search_results.count.should eql count
end

Then /^Left Panel: Search results should be more than (\d*)$/ do |count|
  logger.step "Left Panel: Search results count should be #{count}"
  stamps.orders.left_panel.search_results.count.should be > count
end

Then /^Left Panel: Search Results should be present$/ do
  logger.step "Then Left Panel: Search Results should be present"
  stamps.orders.left_panel.search_results.present?.should be true
end

Then /^Left Panel: Search Results should not be present$/ do
  logger.step "Then Left Panel: Search Results should be present"
  stamps.orders.left_panel.search_results.present?.should be false
end

Then /^Left Panel: Remove search results$/ do
  logger.step "Then Left Panel: Remove search results"
  stamps.orders.left_panel.search_results.remove
end

Then /^Left Panel: Select Awaiting Shipment$/ do
  logger.step "Left Panel: Select Awaiting Shipment"
  stamps.orders.left_panel.awaiting_shipment
end

Then /^Left Panel: Select Shipped$/ do
  logger.step "Left Panel: Select Shipped"
  stamps.orders.left_panel.shipped
end

Then /^Left Panel: Select Cancelled$/ do
  logger.step "Left Panel: Select Cancelled"
  stamps.orders.left_panel.cancelled
end

Then /^Left Panel: Collapse Panel$/ do
  logger.step "Left Panel: Collapse Panel"
  stamps.orders.left_panel.menu_item.collapse.click
end

Then /^Left Panel: Expand Panel$/ do
  logger.step "Left Panel: Expand Panel"
  stamps.orders.left_panel.menu_item.expand.click
end

Then /^Left Panel: Expect Shipped Tab Date Printed is today$/ do
  today = ParameterHelper.now_plus_mon_dd 0
  stamps.orders.left_panel.shipped.date_printed.sort_descending
  actual_print_date = stamps.orders.left_panel.shipped.date_printed.row 1
  logger.step "#{(actual_print_date)}"
  logger.step "Shipped Tab Date Printed is today #{today}"
end

Then /^Left Panel: Expect Shipped Tab Ship Date is today$/ do

end

Then /^Left Panel: Expect Shipped Tab Ship Date is today plus (\d+)/ do |day|

end

Then /^Left Panel: Expect order moved to Shipped$/ do
  logger.step "Left Panel: Expect order moved to Shipped"
  stamps.orders.left_panel.shipped.order_date.sort_descending
  stamps.orders.grid.order_id.row_num(test_data[:order_id]).should be > 0
end

Then /^Left Panel: Expect order moved to Canceled$/ do
  logger.step "Left Panel: Expect order moved to Canceled"
  stamps.orders.left_panel.cancelled.order_date.sort_descending
  stamps.orders.left_panel.cancelled.order_id.row_num(test_data[:order_id]).should be > 0
end

Then /^Left Panel: Move order to Awaiting Shipment$/ do
  logger.step "Move order to Awaiting Shipmen"
  stamps.orders.grid.order_date.sort_descending
  stamps.orders.grid.checkbox.check_order test_data[:order_id]
  stamps.orders.grid.toolbar.move.to_awaiting_shipment.cancel
  stamps.orders.grid.toolbar.move.to_awaiting_shipment.move
end

Then /^Left Panel: Expect order moved to Awaiting Shipment$/ do
  logger.step "Left Panel: Expect order moved to Awaiting Shipment"
  stamps.orders.grid.order_date.sort_descending
  stamps.orders.grid.order_id.row_num(test_data[:order_id]).should be > 0
end

Then /^Left Panel: Expect Awaiting Shipment count is less by (\d+)$/ do |count|
  logger.step "Left Panel: Expect Awaiting Shipment count is less by #{count}"
  stamps.orders.left_panel.awaiting_shipment_count.should eql test_data[:awaiting_shipment_count].to_i - count.to_i
end

Then /^Left Panel: Expect system shows name of (.*) Filter Panel - in closed panel$/ do |expectation|
  logger.step "Left Panel: Expect system shows name of #{expectation} Filter Panel - in closed panel"
  stamps.orders.left_panel.get_closed_filter_name.should eql expectation
end

Then /^Left Panel: Expect panel arrow is pointing to the (.*) direction$/ do |expectation|
  logger.step "Left Panel: Expect panel arrow is pointing to the #{expectation} direction"
  stamps.orders.left_panel.get_arrow_direction.should eql expectation
end

Then /^Left Panel: Expect system selects (.*) Filter Panel - and deselects the previous filter$/ do |filter|
  logger.step "Left Panel: Expect system selects #{filter} Filter Panel - and deselects the previous filter"
  actual = stamps.orders.left_panel.get_selected_filter_text
  actual.should eql filter
end

Then /^Left Panel: Expect system updates the grid to show only orders that match the (.*) filter$/ do |expectation|
  logger.step "Left Panel: Expect system updates the grid to show only orders that match the #{expectation} filter"
  stamps.orders.left_panel.is_order_grid_filtered(expectation).should be true
end

Then /^Left Panel: Expect system displays expanded filters panel$/ do
  logger.step "Left Panel: Expect system displays expanded filters panel"
  stamps.orders.left_panel.is_filter_panel_present?.should be true
end

Then /^Left Panel: Expect system displays "Awaiting Shipment" and "Shipped" filters in panel$/ do
  logger.step "Expect system displays Awaiting Shipment and Shipped filters in panel"
  stamps.orders.left_panel.is_filter_panel_present?.should be true
end

Then /^Left Panel: Expect system selects the (.*) Filter Panel - by default$/ do |expectation|
  logger.step "Left Panel: Expect system selects the #{expectation} Filter Panel - by default"
  stamps.orders.left_panel.get_selected_filter_text.should eql expectation
end

Then /^Left Panel: Click on panel$/ do
  logger.step "Left Panel: Click on panel"
  stamps.orders.left_panel.click_border_arrow
end

Then /^Left Panel: Expect Filters panel is close$/ do
  logger.step "Left Panel: Expect Filters panel is close"
  actual = stamps.orders.left_panel.is_filter_panel_present?
  actual.should eql false
end

Then /^Left Panel: Expect system shows an arrow above the Order Status Filter Panel - name$/ do
  logger.step "Left Panel: Expect system shows an arrow above the Order Status Filter Panel - name"
  stamps.orders.left_panel.is_header_arrow_present
end

Then /^Left Panel: Expect Panel is open$/ do
  logger.step "Left Panel: Expect Panel is open"
  stamps.orders.left_panel.is_filter_panel_present?.should be true
end

Then /^Left Panel: Expect panel is hidden$/ do
  logger.step "Left Panel: Expect panel is hidden"
  stamps.orders.left_panel.are_filter_links_present.should eql false
end

Then /^Left Panel: Click panel name$/ do
  logger.step "Left Panel: Click panel name"
  stamps.orders.left_panel.click_filter_panel_name
end

Then /^Left Panel: Click on the closed Filters panel$/ do
  logger.step "Left Panel: Click on the closed Filters panel"
  stamps.orders.left_panel.click_closed_filter_panel
end


Then /^Left Panel: Expect printed Order ID is not in Awaiting Shipment tab$/ do
  logger.step "Left Panel: Expect printed Order ID is not in Awaiting Shipment tab"
  grid = stamps.orders.left_panel.awaiting_shipment
  logger.step "First Order ID: #{test_data[:order_id]} in Awaiting Shipment tab"
  row = 1
  row1_order_id = grid.order_id.row row
  logger.step "Row #{row} Order ID: #{row1_order_id}"
  expect(test_data[:order_id].include? row1_order_id).is false
end

Then /^Left Panel: Expect all printed Order IDs not in Awaiting Shipment tab$/ do
  logger.step "Left Panel: Expect all printed Order IDs not in Awaiting Shipment tab"
  test_data[:order_id].should_not include stamps.orders.left_panel.awaiting_shipment.order_id.row(1)
  test_data[:order_id].should_not include stamps.orders.left_panel.awaiting_shipment.order_id.row(2)
  test_data[:order_id].should_not include stamps.orders.left_panel.awaiting_shipment.order_id.row(3)
end

Then /^Left Panel: Expect printed Order ID is in Shipped tab$/ do
  logger.step "Left Panel: Expect printed Order ID is in Shipped tab"
  stamps.orders.left_panel.shipped.order_id.sort_descending
  stamps.orders.left_panel.shipped.order_id.sort_descending
  stamps.orders.left_panel.shipped.order_id.row(1).should eql test_data[:order_id]
end

Then /^Left Panel: Expect all printed Order IDs are in Shipped tab$/ do
  logger.step "Left Panel: Expect all printed Order IDs are in Shipped tab"
  test_data[:order_id].should include grid.order_id.row(3)
  test_data[:order_id_2].should include grid.order_id.row(2)
  test_data[:order_id_3].should include grid.order_id.row(1)
end



