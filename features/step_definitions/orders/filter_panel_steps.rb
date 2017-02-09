
Then /^(?:I|i)n left Filter Panel, select Awaiting Shipment$/ do
  test_data[:awaiting_shipment_count] = stamps.orders.filter_panel.awaiting_shipment.count
  stamps.orders.filter_panel.awaiting_shipment.select
end

Then /^(?:I|i)n left Filter Panel, select Shipped$/ do
  stamps.orders.filter_panel.shipped.select
end

Then /^(?:I|i)n left Filter Panel, select Canceled$/ do
  stamps.orders.filter_panel.canceled.select
end

Then /^(?:I|i)n left Filter Panel, select On Hold$/ do
  stamps.orders.filter_panel.on_hold.select
end

Then /^(?:I|i)n left Filter Panel, expect selected filter is Awaiting Shipment$/ do
  step "In left Filter Panel, expect selected filter to be Awaiting Shipment"
end

Then /^(?:I|i)n left Filter Panel, expect selected filter is Shipped$/ do
  step "In left Filter Panel, expect selected filter to be Shipped"
end

Then /^(?:I|i)n left Filter Panel, expect selected filter is Canceled$/ do
  step "In left Filter Panel, expect selected filter to be Canceled"
end

Then /^(?:I|i)n left Filter Panel, expect selected filter is On Hold$/ do
  step "In left Filter Panel, expect selected filter to be On Hold"
end

Then /^(?:I|i)n left Filter Panel, expect selected filter to be (.*)$/ do |expectation|
  30.times { sleep(0.25); break if stamps.orders.filter_panel.selected_filter == expectation }
  expect(stamps.orders.filter_panel.selected_filter).to eql expectation
end

Then /^(?:I|i)n left Filter Panel, expect saved Order ID is in Awaiting Shipment$/ do
  step "in left Filter Panel, expect saved Order ID exist in Awaiting Shipment"
end

Then /^(?:I|i)n left Filter Panel, expect saved Order ID is in Shipped$/ do
  step "in left Filter Panel, expect saved Order ID exist in Shipped"
end

Then /^(?:I|i)n left Filter Panel, expect saved Order ID is in Canceled$/ do
  step "in left Filter Panel, expect saved Order ID exist in Canceled"
end

Then /^(?:I|i)n left Filter Panel, expect saved Order ID is in On Hold$/ do
  step "in left Filter Panel, expect saved Order ID exist in On Hold"
end

Then /^(?:I|i)n left Filter Panel, expect saved Order ID exist in (.*)$/ do |filter|
  50.times do
    step "in left Filter Panel, select #{filter}"
    sleep(0.25);
    break if stamps.orders.orders_grid.column.order_id.row_num(test_data[:order_id]) > 0
  end
  expect(stamps.orders.orders_grid.column.order_id.row_num(test_data[:order_id])).to be > 0
end

Then /^Filter Panel: Search saved Order ID$/ do
  step "Filter Panel: Search for #{test_data[:order_id]}"
end

Then /^Filter Panel: Search saved Ship Name$/ do
  step "Filter Panel: Search for #{test_data[:name]}"
end

Then /^Filter Panel: Search saved Ship Company$/ do
  step "Filter Panel: Search for #{test_data[:company]}"
end

Then /^Filter Panel: Search saved Email$/ do
  step "Filter Panel: Search for #{test_data[:email]}"
end

Then /^Filter Panel: Search for (.*)$/ do |str|
  expect(str).to be_truthy
  test_data[:orders_search_str] = str
  stamps.orders.filter_panel.search_orders test_data[:orders_search_str]
end

Then /^Filter Panel: Search results count should be (\d*)$/ do |count|
  expect(stamps.orders.filter_panel.search_results.count).to eql count
end

Then /^Filter Panel: Search results should be more than (\d*)$/ do |count|
  expect(stamps.orders.filter_panel.search_results.count).to be > count
end

Then /^Filter Panel: Search Results should be present$/ do
  expect(stamps.orders.filter_panel.search_results.present?).to be true
end

Then /^Filter Panel: Search Results should not be present$/ do
  expect(stamps.orders.filter_panel.search_results.present?).to be false
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

Then /^(?:I|i)n left Filter Panel, expect Shipped Tab Date Printed is today$/ do
  today = ParameterHelper.now_plus_mon_dd 0
  stamps.orders.filter_panel.shipped.select.date_printed.sort_descending
  actual_print_date = stamps.orders.filter_panel.shipped.select.date_printed.row 1
end

Then /^(?:I|i)n left Filter Panel, expect Shipped Tab Ship Date is today$/ do

end

Then /^(?:I|i)n left Filter Panel, expect Shipped Tab Ship Date is today plus (\d+)/ do |day|

end

Then /^(?:I|i)n left Filter Panel, expect order moved to Shipped$/ do
  stamps.orders.filter_panel.shipped.select.order_date.sort_descending
  expect(stamps.orders.orders_grid.column.order_id.row_num(test_data[:order_id])).to be > 0
end

Then /^(?:I|i)n left Filter Panel, expect order moved to Canceled$/ do
  stamps.orders.filter_panel.canceled.select.order_date.sort_descending
  expect(stamps.orders.filter_panel.canceled.select.order_id.row_num(test_data[:order_id])).to be > 0
end

Then /^(?:I|i)n left Filter Panel, expect order moved to Awaiting Shipment$/ do
  stamps.orders.orders_grid.column.order_date.sort_descending
  expect(stamps.orders.orders_grid.column.order_id.row_num(test_data[:order_id])).to be > 0
end

Then /^(?:I|i)n left Filter Panel, expect Awaiting Shipment count increased by (\d+)$/ do |count|
  expect(stamps.orders.filter_panel.awaiting_shipment.count).to eql test_data[:awaiting_shipment_count].to_i + count.to_i
end

Then /^(?:I|i)n left Filter Panel, expect Awaiting Shipment count decreased by (\d+)$/ do |count|
  expect(stamps.orders.filter_panel.awaiting_shipment.count).to eql test_data[:awaiting_shipment_count].to_i - count.to_i
end

Then /^(?:I|i)n left Filter Panel, expect panel arrow is pointing to the (.*) direction$/ do |expectation|
  expect(stamps.orders.filter_panel.get_arrow_direction).to eql expectation
end

Then /^(?:I|i)n left Filter Panel, expect system updates the grid to show only orders that match the (.*) filter$/ do |expectation|
  expect(stamps.orders.filter_panel.is_order_grid_filtered(expectation)).to be true
end

Then /^(?:I|i)n left Filter Panel, expect system displays expanded filters panel$/ do
  expect(stamps.orders.filter_panel.is_filter_panel_present?).to be true
end

Then /^Filter Panel: Click on panel$/ do
  stamps.orders.filter_panel.click_border_arrow
end

Then /^(?:I|i)n left Filter Panel, expect Filters panel is close$/ do
  actual = stamps.orders.filter_panel.is_filter_panel_present?
  expect(actual).to eql false
end

Then /^(?:I|i)n left Filter Panel, expect system shows an arrow above the Order Status Filter Panel - name$/ do
  stamps.orders.filter_panel.is_header_arrow_present
end

Then /^(?:I|i)n left Filter Panel, expect Panel is open$/ do
  expect(stamps.orders.filter_panel.is_filter_panel_present?).to be true
end

Then /^(?:I|i)n left Filter Panel, expect panel is hidden$/ do
  expect(stamps.orders.filter_panel.are_filter_links_present).to eql false
end

Then /^Filter Panel: Click panel name$/ do
  stamps.orders.filter_panel.click_filter_panel_name
end

Then /^Filter Panel: Click on the closed Filters panel$/ do
  stamps.orders.filter_panel.click_closed_filter_panel
end


Then /^(?:I|i)n left Filter Panel, expect printed Order ID is not in Awaiting Shipment tab$/ do
  grid = stamps.orders.filter_panel.awaiting_shipment.select
  row1_order_id = grid.order_id.row(1)
  expect(test_data[:order_id].include? row1_order_id).is false
end

Then /^(?:I|i)n left Filter Panel, expect all printed Order IDs not in Awaiting Shipment tab$/ do
  test_data[:order_id].should_not include stamps.orders.filter_panel.awaiting_shipment.select.order_id.row(1)
  test_data[:order_id].should_not include stamps.orders.filter_panel.awaiting_shipment.select.order_id.row(2)
  test_data[:order_id].should_not include stamps.orders.filter_panel.awaiting_shipment.select.order_id.row(3)
end

Then /^(?:I|i)n left Filter Panel, expect printed Order ID is in Shipped tab$/ do
  stamps.orders.filter_panel.shipped.select.order_id.sort_descending
  stamps.orders.filter_panel.shipped.select.order_id.sort_descending
  expect(stamps.orders.filter_panel.shipped.select.order_id.row(1)).to eql test_data[:order_id]
end

Then /^(?:I|i)n left Filter Panel, expect all printed Order IDs are in Shipped tab$/ do
  expect(test_data[:order_id]).to include grid.order_id.row(3)
  expect(test_data[:order_id_2]).to include grid.order_id.row(2)
  expect(test_data[:order_id_3]).to include grid.order_id.row(1)
end



