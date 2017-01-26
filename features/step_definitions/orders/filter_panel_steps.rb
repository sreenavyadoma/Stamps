
Then /^In left filter panel, select Awaiting Shipment$/ do
  test_data[:awaiting_shipment_count] = stamps.orders.filter_panel.awaiting_shipment.count
  sleep(1)
  stamps.orders.filter_panel.awaiting_shipment.select
  sleep(1)
end

Then /^In left filter panel, select Shipped$/ do
  sleep(1)
  stamps.orders.filter_panel.shipped.select
  sleep(1)
end

Then /^In left filter panel, select Canceled$/ do
  sleep(1)
  stamps.orders.filter_panel.canceled.select
  sleep(1)
end

Then /^In left filter panel, select On Hold$/ do
  sleep(1)
  stamps.orders.filter_panel.on_hold.select
  sleep(1)
end

Then /^In left filter panel, expect selected filter is Awaiting Shipment$/ do
  step "In left filter panel, expect selected filter to be Awaiting Shipment"
end

Then /^In left filter panel, expect selected filter is Shipped$/ do
  step "In left filter panel, expect selected filter to be Shipped"
end

Then /^In left filter panel, expect selected filter is Canceled$/ do
  step "In left filter panel, expect selected filter to be Canceled"
end

Then /^In left filter panel, expect selected filter is On Hold$/ do
  step "In left filter panel, expect selected filter to be On Hold"
end

Then /^In left filter panel, expect selected filter to be (.*)$/ do |expectation|
  stamps.orders.filter_panel.selected_filter.should eql expectation
end

Then /^Filter Panel: Search saved Order ID$/ do
  test_data[:order_id].should be_truthy
  step "Filter Panel: Search for #{test_data[:order_id]}"
end

Then /^Filter Panel: Search saved Ship Name$/ do
  test_data[:name].should be_truthy
  step "Filter Panel: Search for #{test_data[:name]}"
end

Then /^Filter Panel: Search saved Ship Company$/ do
  test_data[:company].should be_truthy
  step "Filter Panel: Search for #{test_data[:company]}"
end

Then /^Filter Panel: Search saved Email$/ do
  test_data[:email].should be_truthy
  step "Filter Panel: Search for #{test_data[:email]}"
end

Then /^Filter Panel: Search for (.*)$/ do |str|
  test_data[:orders_search_str] = str
  stamps.orders.filter_panel.search_orders test_data[:orders_search_str]
end

Then /^Filter Panel: Search results count should be (\d*)$/ do |count|
  stamps.orders.filter_panel.search_results.count.should eql count
end

Then /^Filter Panel: Search results should be more than (\d*)$/ do |count|
  stamps.orders.filter_panel.search_results.count.should be > count
end

Then /^Filter Panel: Search Results should be present$/ do
  stamps.orders.filter_panel.search_results.present?.should be true
end

Then /^Filter Panel: Search Results should not be present$/ do
  stamps.orders.filter_panel.search_results.present?.should be false
end

Then /^Filter Panel: Remove search results$/ do
  stamps.orders.filter_panel.search_results.remove
end

Then /^Filter Panel: Collapse Panel$/ do
  stamps.orders.filter_panel.menu_item.collapse.click
end

Then /^Filter Panel: Expand Panel$/ do
  stamps.orders.filter_panel.menu_item.expand.click
end

Then /^In left filter panel, expect Shipped Tab Date Printed is today$/ do
  today = ParameterHelper.now_plus_mon_dd 0
  stamps.orders.filter_panel.shipped.select.date_printed.sort_descending
  actual_print_date = stamps.orders.filter_panel.shipped.select.date_printed.row 1
end

Then /^In left filter panel, expect Shipped Tab Ship Date is today$/ do

end

Then /^In left filter panel, expect Shipped Tab Ship Date is today plus (\d+)/ do |day|

end

Then /^In left filter panel, expect order moved to Shipped$/ do
  stamps.orders.filter_panel.shipped.select.order_date.sort_descending
  stamps.orders.orders_grid.column.order_id.row_num(test_data[:order_id]).should be > 0
end

Then /^In left filter panel, expect order moved to Canceled$/ do
  stamps.orders.filter_panel.canceled.select.order_date.sort_descending
  stamps.orders.filter_panel.canceled.select.order_id.row_num(test_data[:order_id]).should be > 0
end

Then /^In left filter panel, expect order moved to Awaiting Shipment$/ do
  stamps.orders.orders_grid.column.order_date.sort_descending
  stamps.orders.orders_grid.column.order_id.row_num(test_data[:order_id]).should be > 0
end

Then /^In left filter panel, expect Awaiting Shipment count increased by (\d+)$/ do |count|
  stamps.orders.filter_panel.awaiting_shipment.count.should eql test_data[:awaiting_shipment_count].to_i + count.to_i
end

Then /^In left filter panel, expect Awaiting Shipment count decreased by (\d+)$/ do |count|
  stamps.orders.filter_panel.awaiting_shipment.count.should eql test_data[:awaiting_shipment_count].to_i - count.to_i
end

Then /^In left filter panel, expect panel arrow is pointing to the (.*) direction$/ do |expectation|
  stamps.orders.filter_panel.get_arrow_direction.should eql expectation
end

Then /^In left filter panel, expect system updates the grid to show only orders that match the (.*) filter$/ do |expectation|
  stamps.orders.filter_panel.is_order_grid_filtered(expectation).should be true
end

Then /^In left filter panel, expect system displays expanded filters panel$/ do
  stamps.orders.filter_panel.is_filter_panel_present?.should be true
end

Then /^Filter Panel: Click on panel$/ do
  stamps.orders.filter_panel.click_border_arrow
end

Then /^In left filter panel, expect Filters panel is close$/ do
  actual = stamps.orders.filter_panel.is_filter_panel_present?
  actual.should eql false
end

Then /^In left filter panel, expect system shows an arrow above the Order Status Filter Panel - name$/ do
  stamps.orders.filter_panel.is_header_arrow_present
end

Then /^In left filter panel, expect Panel is open$/ do
  stamps.orders.filter_panel.is_filter_panel_present?.should be true
end

Then /^In left filter panel, expect panel is hidden$/ do
  stamps.orders.filter_panel.are_filter_links_present.should eql false
end

Then /^Filter Panel: Click panel name$/ do
  stamps.orders.filter_panel.click_filter_panel_name
end

Then /^Filter Panel: Click on the closed Filters panel$/ do
  stamps.orders.filter_panel.click_closed_filter_panel
end


Then /^In left filter panel, expect printed Order ID is not in Awaiting Shipment tab$/ do
  grid = stamps.orders.filter_panel.awaiting_shipment.select
  row1_order_id = grid.order_id.row(1)
  expect(test_data[:order_id].include? row1_order_id).is false
end

Then /^In left filter panel, expect all printed Order IDs not in Awaiting Shipment tab$/ do
  test_data[:order_id].should_not include stamps.orders.filter_panel.awaiting_shipment.select.order_id.row(1)
  test_data[:order_id].should_not include stamps.orders.filter_panel.awaiting_shipment.select.order_id.row(2)
  test_data[:order_id].should_not include stamps.orders.filter_panel.awaiting_shipment.select.order_id.row(3)
end

Then /^In left filter panel, expect printed Order ID is in Shipped tab$/ do
  stamps.orders.filter_panel.shipped.select.order_id.sort_descending
  stamps.orders.filter_panel.shipped.select.order_id.sort_descending
  stamps.orders.filter_panel.shipped.select.order_id.row(1).should eql test_data[:order_id]
end

Then /^In left filter panel, expect all printed Order IDs are in Shipped tab$/ do
  test_data[:order_id].should include grid.order_id.row(3)
  test_data[:order_id_2].should include grid.order_id.row(2)
  test_data[:order_id_3].should include grid.order_id.row(1)
end



