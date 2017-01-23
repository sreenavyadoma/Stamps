
Then /^Filter Panel: Select Awaiting Shipment$/ do
  logger.step "Filter Panel: Select Awaiting Shipment"
  stamps.orders.filter_panel.awaiting_shipment.select
end

Then /^Filter Panel: Select Shipped$/ do
  logger.step "Filter Panel: Select Shipped"
  stamps.orders.filter_panel.shipped.select
end

Then /^Filter Panel: Select Canceled$/ do
  logger.step "Filter Panel: Select Canceled"
  stamps.orders.filter_panel.canceled.select
end

Then /^Filter Panel: Select On Hold$/ do
  logger.step "Filter Panel: Select Canceled"
  stamps.orders.filter_panel.on_hold.select
end

Then /^Filter Panel: Expect selected filter is Awaiting Shipment$/ do
  step "Filter Panel: Expect selected filter to be Awaiting Shipment"
end

Then /^Filter Panel: Expect selected filter is Shipped$/ do
  step "Filter Panel: Expect selected filter to be Shipped"
end

Then /^Filter Panel: Expect selected filter is Canceled$/ do
  step "Filter Panel: Expect selected filter to be Canceled"
end

Then /^Filter Panel: Expect selected filter is On Hold$/ do
  step "Filter Panel: Expect selected filter to be On Hold"
end

Then /^Filter Panel: Expect selected filter to be (.*)$/ do |expectation|
  logger.step "Filter Panel: Expect selected filter is #{expectation}"
  stamps.orders.filter_panel.selected_filter.should eql expectation
end

Then /^Filter Panel: Search saved Order ID$/ do
  logger.step "Filter Panel: Search saved Order ID #{test_data[:order_id]}"
  test_data[:order_id].should be_truthy
  step "Filter Panel: Search for #{test_data[:order_id]}"
end

Then /^Filter Panel: Search saved Ship Name$/ do
  logger.step "Filter Panel: Search saved Ship Name #{test_data[:name]}"
  test_data[:name].should be_truthy
  step "Filter Panel: Search for #{test_data[:name]}"
end

Then /^Filter Panel: Search saved Ship Company$/ do
  logger.step "Filter Panel: Search saved Ship Company #{test_data[:company]}"
  test_data[:company].should be_truthy
  step "Filter Panel: Search for #{test_data[:company]}"
end

Then /^Filter Panel: Search saved Email$/ do
  logger.step "Filter Panel: Search saved Email #{test_data[:email]}"
  test_data[:email].should be_truthy
  step "Filter Panel: Search for #{test_data[:email]}"
end

Then /^Filter Panel: Search for (.*)$/ do |str|
  test_data[:orders_search_str] = str
  logger.step "Filter Panel: Search for #{test_data[:orders_search_str]}"
  stamps.orders.filter_panel.search_orders test_data[:orders_search_str]
end

Then /^Filter Panel: Search results count should be (\d*)$/ do |count|
  logger.step "Filter Panel: Search results count should be #{count}"
  stamps.orders.filter_panel.search_results.count.should eql count
end

Then /^Filter Panel: Search results should be more than (\d*)$/ do |count|
  logger.step "Filter Panel: Search results count should be #{count}"
  stamps.orders.filter_panel.search_results.count.should be > count
end

Then /^Filter Panel: Search Results should be present$/ do
  logger.step "Then Filter Panel: Search Results should be present"
  stamps.orders.filter_panel.search_results.present?.should be true
end

Then /^Filter Panel: Search Results should not be present$/ do
  logger.step "Then Filter Panel: Search Results should be present"
  stamps.orders.filter_panel.search_results.present?.should be false
end

Then /^Filter Panel: Remove search results$/ do
  logger.step "Then Filter Panel: Remove search results"
  stamps.orders.filter_panel.search_results.remove
end

Then /^Filter Panel: Collapse Panel$/ do
  logger.step "Filter Panel: Collapse Panel"
  stamps.orders.filter_panel.menu_item.collapse.click
end

Then /^Filter Panel: Expand Panel$/ do
  logger.step "Filter Panel: Expand Panel"
  stamps.orders.filter_panel.menu_item.expand.click
end

Then /^Filter Panel: Expect Shipped Tab Date Printed is today$/ do
  today = ParameterHelper.now_plus_mon_dd 0
  stamps.orders.filter_panel.shipped.select.date_printed.sort_descending
  actual_print_date = stamps.orders.filter_panel.shipped.select.date_printed.row 1
  logger.step "#{(actual_print_date)}"
  logger.step "Shipped Tab Date Printed is today #{today}"
end

Then /^Filter Panel: Expect Shipped Tab Ship Date is today$/ do

end

Then /^Filter Panel: Expect Shipped Tab Ship Date is today plus (\d+)/ do |day|

end

Then /^Filter Panel: Expect order moved to Shipped$/ do
  logger.step "Filter Panel: Expect order moved to Shipped"
  stamps.orders.filter_panel.shipped.select.order_date.sort_descending
  stamps.orders.orders_grid.column.order_id.row_num(test_data[:order_id]).should be > 0
end

Then /^Filter Panel: Expect order moved to Canceled$/ do
  logger.step "Filter Panel: Expect order moved to Canceled"
  stamps.orders.filter_panel.canceled.select.order_date.sort_descending
  stamps.orders.filter_panel.canceled.select.order_id.row_num(test_data[:order_id]).should be > 0
end

Then /^Filter Panel: Expect order moved to Awaiting Shipment$/ do
  logger.step "Filter Panel: Expect order moved to Awaiting Shipment"
  stamps.orders.orders_grid.column.order_date.sort_descending
  stamps.orders.orders_grid.column.order_id.row_num(test_data[:order_id]).should be > 0
end

Then /^Filter Panel: Expect Awaiting Shipment count increased by (\d+)$/ do |count|
  logger.step "Filter Panel: Expect Awaiting Shipment count increased by #{count}"
  stamps.orders.filter_panel.awaiting_shipment.count.should eql test_data[:awaiting_shipment_count].to_i + count.to_i
end

Then /^Filter Panel: Expect Awaiting Shipment count decreased by (\d+)$/ do |count|
  logger.step "Filter Panel: Expect Awaiting Shipment count decreased by #{count}"
  stamps.orders.filter_panel.awaiting_shipment.count.should eql test_data[:awaiting_shipment_count].to_i - count.to_i
end

Then /^Filter Panel: Expect panel arrow is pointing to the (.*) direction$/ do |expectation|
  logger.step "Filter Panel: Expect panel arrow is pointing to the #{expectation} direction"
  stamps.orders.filter_panel.get_arrow_direction.should eql expectation
end

Then /^Filter Panel: Expect system updates the grid to show only orders that match the (.*) filter$/ do |expectation|
  logger.step "Filter Panel: Expect system updates the grid to show only orders that match the #{expectation} filter"
  stamps.orders.filter_panel.is_order_grid_filtered(expectation).should be true
end

Then /^Filter Panel: Expect system displays expanded filters panel$/ do
  logger.step "Filter Panel: Expect system displays expanded filters panel"
  stamps.orders.filter_panel.is_filter_panel_present?.should be true
end

Then /^Filter Panel: Click on panel$/ do
  logger.step "Filter Panel: Click on panel"
  stamps.orders.filter_panel.click_border_arrow
end

Then /^Filter Panel: Expect Filters panel is close$/ do
  logger.step "Filter Panel: Expect Filters panel is close"
  actual = stamps.orders.filter_panel.is_filter_panel_present?
  actual.should eql false
end

Then /^Filter Panel: Expect system shows an arrow above the Order Status Filter Panel - name$/ do
  logger.step "Filter Panel: Expect system shows an arrow above the Order Status Filter Panel - name"
  stamps.orders.filter_panel.is_header_arrow_present
end

Then /^Filter Panel: Expect Panel is open$/ do
  logger.step "Filter Panel: Expect Panel is open"
  stamps.orders.filter_panel.is_filter_panel_present?.should be true
end

Then /^Filter Panel: Expect panel is hidden$/ do
  logger.step "Filter Panel: Expect panel is hidden"
  stamps.orders.filter_panel.are_filter_links_present.should eql false
end

Then /^Filter Panel: Click panel name$/ do
  logger.step "Filter Panel: Click panel name"
  stamps.orders.filter_panel.click_filter_panel_name
end

Then /^Filter Panel: Click on the closed Filters panel$/ do
  logger.step "Filter Panel: Click on the closed Filters panel"
  stamps.orders.filter_panel.click_closed_filter_panel
end


Then /^Filter Panel: Expect printed Order ID is not in Awaiting Shipment tab$/ do
  logger.step "Filter Panel: Expect printed Order ID is not in Awaiting Shipment tab"
  grid = stamps.orders.filter_panel.awaiting_shipment.select
  logger.step "First Order ID: #{test_data[:order_id]} in Awaiting Shipment tab"
  row = 1
  row1_order_id = grid.order_id.row row
  logger.step "Row #{row} Order ID: #{row1_order_id}"
  expect(test_data[:order_id].include? row1_order_id).is false
end

Then /^Filter Panel: Expect all printed Order IDs not in Awaiting Shipment tab$/ do
  logger.step "Filter Panel: Expect all printed Order IDs not in Awaiting Shipment tab"
  test_data[:order_id].should_not include stamps.orders.filter_panel.awaiting_shipment.select.order_id.row(1)
  test_data[:order_id].should_not include stamps.orders.filter_panel.awaiting_shipment.select.order_id.row(2)
  test_data[:order_id].should_not include stamps.orders.filter_panel.awaiting_shipment.select.order_id.row(3)
end

Then /^Filter Panel: Expect printed Order ID is in Shipped tab$/ do
  logger.step "Filter Panel: Expect printed Order ID is in Shipped tab"
  stamps.orders.filter_panel.shipped.select.order_id.sort_descending
  stamps.orders.filter_panel.shipped.select.order_id.sort_descending
  stamps.orders.filter_panel.shipped.select.order_id.row(1).should eql test_data[:order_id]
end

Then /^Filter Panel: Expect all printed Order IDs are in Shipped tab$/ do
  logger.step "Filter Panel: Expect all printed Order IDs are in Shipped tab"
  test_data[:order_id].should include grid.order_id.row(3)
  test_data[:order_id_2].should include grid.order_id.row(2)
  test_data[:order_id_3].should include grid.order_id.row(1)
end



