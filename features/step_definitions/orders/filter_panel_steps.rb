
Then /^[Ss]elect [Ff]ilter [Pp]anel tab (.*)$/ do |str|
  # if SdcEnv.new_framework
  expect(['Shipped', 'Canceled', 'On Hold', 'Awaiting Shipment']).to include(str)
  case str
    when /Shipped/
      SdcOrders.filter_panel.shipped.click
    when /Canceled/
      SdcOrders.filter_panel.canceled.click
    when /On Hold/
      SdcOrders.filter_panel.on_hold.click
    when /Awaiting Shipment/
      SdcOrders.filter_panel.awaiting_shipment.link.click
    else
      # ignore
  end
  step "expect selected filter is #{str}"
end

Then /^[Ee]xpect selected [Ff]ilter is (.*)$/ do |expectation|
  pending

  # if SdcEnv.new_framework
  #   #skip for now
  # else
  #   30.times { sleep(0.25); break if stamps.orders.filter_panel.selected_filter == expectation }
  #   expect(stamps.orders.filter_panel.selected_filter).to eql expectation
  # end
end

Then /^[Ee]xpect cached Order ID exist in the selected filter$/ do
  pending
  # 15.times do
  #   sleep(0.10)
  #   break if stamps.orders.orders_grid.grid_column(:order_id).row_num(TestData.hash[:order_id].values.last) > 0
  # end
  # expect(stamps.orders.orders_grid.grid_column(:order_id).row_num(TestData.hash[:order_id].values.last)).to be > 0
end

Then /^Filter Panel: Collapse Panel$/ do
  pending
  #stamps.orders.filter_panel.menu_item.collapse.click
end

Then /^Filter Panel: Expand Panel$/ do
  pending
  #stamps.orders.filter_panel.menu_item.expand.click
end

# todo-Rob In left Filter Panel, expect Shipped Tab Date Printed is today
Then /^[Ii]n left Filter Panel, expect Shipped Tab Date Printed is today$/ do
  pending
  # today = TestHelper.now_plus_mon_dd 0
  # stamps.orders.filter_panel.shipped.select.date_printed.sort_descending
  # actual_print_date = stamps.orders.filter_panel.shipped.select.date_printed.row 1
end

# todo-Rob is this needed?
Then /^[Ii]n left Filter Panel, expect Shipped Tab Ship Date is today$/ do
end

Then /^[Ii]n left Filter Panel, expect Shipped Tab Ship Date is today plus (\d+)$/ do |day|
end

Then /^[Ii]n left Filter Panel, expect order moved to Shipped$/ do
  pending
  #stamps.orders.filter_panel.shipped.select.order_date.sort_descending
  # expect(stamps.orders.orders_grid.grid_column(:order_id).row_num(TestData.hash[:order_id].values.last)).to be > 0
end

Then /^[Ii]n left Filter Panel, expect order moved to Canceled$/ do
  pending
  #stamps.orders.filter_panel.canceled.select.order_date.sort_descending
  # expect(stamps.orders.filter_panel.canceled.select.order_id.row_num(TestData.hash[:order_id].values.last)).to be > 0
end

Then /^[Ii]n left Filter Panel, expect order moved to Awaiting Shipment$/ do
  pending
  #stamps.orders.orders_grid.grid_column(:order_date).sort_descending
  # expect(stamps.orders.orders_grid.grid_column(:order_id).row_num(TestData.hash[:order_id].values.last)).to be > 0
end

Then /^[Ii]n left Filter Panel, expect Awaiting Shipment count increased by (\d+)$/ do |count|
  pending
  #expect(stamps.orders.filter_panel.awaiting_shipment.count).to eql TestData.hash[:awaiting_shipment_count].to_i + count.to_i
end

Then /^[Ii]n left Filter Panel, expect Awaiting Shipment count decreased by (\d+)$/ do |count|
  pending
  #expect(stamps.orders.filter_panel.awaiting_shipment.count).to eql TestData.hash[:awaiting_shipment_count].to_i - count.to_i
end

Then /^[Ii]n left Filter Panel, expect panel arrow is pointing to the (.*) direction$/ do |expectation|
  pending
  #expect(stamps.orders.filter_panel.get_arrow_direction).to eql expectation
end

Then /^[Ii]n left Filter Panel, expect system updates the grid to show only orders that match the (.*) filter$/ do |expectation|
  pending
  #expect(stamps.orders.filter_panel.is_order_grid_filtered(expectation)).to be(true)
end

Then /^[Ii]n left Filter Panel, expect system displays expanded filters panel$/ do
  pending
  #expect(stamps.orders.filter_panel.present?).to be(true), "Filter Panel does not present to the displays"
end

Then /^Filter Panel: Click on panel$/ do
  pending
  #stamps.orders.filter_panel.menu_item.collapse.click
end

Then /^[Ii]n left Filter Panel, expect Filters panel is close$/ do
  pending
  #actual = stamps.orders.filter_panel.search_orders.present?
  #expect(actual).to be(false)
end

Then /^[Ii]n left Filter Panel, expect system shows an arrow above the Order Status Filter Panel - name$/ do
  pending
  #stamps.orders.filter_panel.is_header_arrow_present
end

Then /^[Ii]n left Filter Panel, expect Panel is open$/ do
  pending
  #expect(stamps.orders.filter_panel.present?).to be(true)
end

Then /^[Ii]n left Filter Panel, expect panel is hidden$/ do
  pending
  #expect(stamps.orders.filter_panel.are_filter_links_present).to eql(false)
end

Then /^Filter Panel: Click panel name$/ do
  pending
  #stamps.orders.filter_panel.click_filter_panel_name
end

Then /^Filter Panel: Click on the closed Filters panel$/ do
  pending
  #stamps.orders.filter_panel.click_closed_filter_panel
end


Then /^[Ii]n left Filter Panel, expect printed Order ID is not in Awaiting Shipment tab$/ do
  pending
  #grid = stamps.orders.filter_panel.awaiting_shipment.select
  # row1_order_id = grid.order_id.row(1)
  # expect((TestData.hash[:order_id].values.last).include? row1_order_id).is(false)
end
