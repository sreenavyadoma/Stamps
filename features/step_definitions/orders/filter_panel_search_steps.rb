
Then /^[Ss]earch filtered Orders for cached Order ID$/ do
  step "search orders for #{TestData.hash[:order_id].values.last} expecting to find at least 1"
end

Then /^[Ss]earch filtered Orders for cached Ship-To full name$/ do
  step "search orders for #{TestData.hash[:full_name]} expecting to find at least 1"
end

Then /^[Ss]earch filtered Orders for cached Ship-To Company name$/ do
  step "search orders for #{TestData.hash[:company]} expecting to find at least 1"
end

Then /^[Ss]earch filtered Orders for cached Ship-To email$/ do
  step "search orders for #{TestData.hash[:email]} expecting to find at least 1"
end

Then /^select orders filter awaiting shippment tab$/ do
  step 'wait for js to stop'
  SdcOrders.filter_panel.awaiting_shipment.link.click
end

Then /^select orders filter shipped tab$/ do
  step 'wait for js to stop'
  SdcOrders.filter_panel.shipped.click
end

Then /^select orders filter canceled tab$/ do
  step 'wait for js to stop'
  SdcOrders.filter_panel.canceled.click
end

Then /^select orders filter on hold tab$/ do
  step 'wait for js to stop'
  SdcOrders.filter_panel.on_hold.click
end

Then /^expect orders filter awaiting shippment tab is present$/ do
  expect(SdcOrders.filter_panel.awaiting_shipment.link).to be_present, "Order Filter Awaiting Shipment is not present!"
end

Then /^expect orders filter shipped tab is present$/ do
  expect(SdcOrders.filter_panel.shipped).to be_present, "Order Filter Shipped is not present!"
end

Then /^expect orders filter canceled tab is present$/ do
  expect(SdcOrders.filter_panel.canceled).to be_present, "Order Filter Canceled is not present!"
end

Then /^expect orders filter on hold tab is present$/ do
  expect(SdcOrders.filter_panel.on_hold).to be_present, "Order Filter On Hold is not present!"
end

Then /^expect orders filter collapse is present$/ do
  expect(SdcOrders.filter_panel.collapse).to be_present, "Order Filter On Hold is not present!"
end

Then /^expect orders filter expand is present$/ do
  expect(SdcOrders.filter_panel.expand).to be_present, "Order Filter On Hold is not present!"
end

Then /^search orders for (.*) expecting to find at least (\d+)$/ do |str, count|
  step "set Filter Panel Search textbox to #{str}"
  if SdcEnv.new_framework
    step "click Filter Panel Search button"
    SdcOrders.loading_orders.wait_while_present(timeout: 10)
    expect(SdcOrders.filter_panel.search_results.count.text_value.to_i).to be >= count.to_i
  else
    begin
      15.times do
        sleep(1)
        step "click Filter Panel Search button"
        sleep(1)
        break if stamps.orders.filter_panel.search_orders.search_results.count >= count.to_i
      end
      expect(stamps.orders.filter_panel.search_orders.search_results).to be_present, "Couldn't find #{str} in Orders Grid"
    end unless str.nil?||str.size==0
  end
end

Then /^[Ss]et Filter Panel Search textbox to (.*)$/ do |str|
  TestData.hash[:filter_panel_search_str]=str
  if SdcEnv.new_framework
    SdcOrders.filter_panel.search_orders.set(TestData.hash[:filter_panel_search_str])
  else
    stamps.orders.filter_panel.search_orders.textbox.set(TestData.hash[:filter_panel_search_str])
  end
end

Then /^[Cc]lick Filter Panel Search [Bb]utton$/ do
  if SdcEnv.new_framework
    SdcOrders.filter_panel.search.safe_wait_while_present(timeout: 2)
    SdcOrders.filter_panel.search.click
  else
    stamps.orders.filter_panel.search_orders.search_button.click
  end
end

Then /^[Ee]xpect Filter Panel search result count is (\d+)$/ do |count|
  if SdcEnv.new_framework
    expect(SdcOrders.filter_panel.search_results.count.text_value.to_i).to eql(count.to_i)
  else
    expect(stamps.orders.filter_panel.search_orders.search_results.count).to eql count.to_i
  end
end

Then /^[Ee]xpect Filter Panel search result count is greater than (\d+)$/ do |count|
  if SdcEnv.new_framework
    expect(SdcOrders.filter_panel.search_results.count.text_value.to_i).to be >= count.to_i
  else
    expect(stamps.orders.filter_panel.search_results.count).to be > count.to_i
  end
end

Then /^expect filter panel search results tab is present$/ do
  expect(SdcOrders.filter_panel.search_results.label).to be_present, "Search results tab is not present!"
end

Then /^expect filter panel search results tab is not present$/ do
  expect(SdcOrders.filter_panel.search_results.label).not_to be_present, "Orders search results tab is not removed!"
end

Then /^remove filter panel search results tab$/ do
  SdcOrders.filter_panel.search_results.x_btn.click
  SdcOrders.loading_orders.wait_while_present(timeout: 10)
  step 'wait for js to stop'
  step 'expect filter panel search results tab is not present'
end

Then /^collapse orders filter panel$/ do
  step 'expect orders filter collapse is present'
  SdcOrders.filter_panel.collapse.click
  step 'expect orders filter expand is present'
end

Then /^expand orders filter panel$/ do
  step 'expect orders filter expand is present'
  SdcOrders.filter_panel.expand.click
  step 'expect orders filter collapse is present'
end