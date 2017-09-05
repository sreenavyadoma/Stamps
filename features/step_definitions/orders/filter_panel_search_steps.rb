
Then /^search filtered Orders for cached Order ID$/ do
  step "search Orders for #{test_param[:order_id][0]} expecting to find at least 1"
end

Then /search filtered Orders for cached Ship-To full name$/ do
  step "search Orders for #{test_param[:full_name]} expecting to find at least 1"
end

Then /^search filtered Orders for cached Ship-To Company name$/ do
  step "search Orders for #{test_param[:company]} expecting to find at least 1"
end

Then /^search filtered Orders for cached Ship-To email$/ do
  step "search Orders for #{test_param[:email]} expecting to find at least 1"
end

Then /^search Orders for (.*) expecting to find at least (\d+)$/ do |search_str, count|
  begin
    30.times do
      step "set Filter Panel Search textbox to #{search_str}"
      step "click Filter Panel Search button"
      sleep(2)
      break if stamps.orders.filter_panel.search_orders.search_results.count >= count.to_i
    end
    expect(stamps.orders.filter_panel.search_orders.search_results.present?).to be(true)
  end unless search_str.nil? || search_str.size == 0

end

Then /^set Filter Panel Search textbox to (.*)$/ do |str|
  test_param[:filter_panel_search_str] = str
  stamps.orders.filter_panel.search_orders.textbox.set(test_param[:filter_panel_search_str])
end

Then /^click Filter Panel Search button$/ do
  stamps.orders.filter_panel.search_orders.search_button.click
end

Then /^expect Filter Panel search result count is (\d+)$/ do |count|
  expect(stamps.orders.filter_panel.search_orders.search_results.count).to eql count.to_i
end

Then /^expect Filter Panel search result count is greater than (\d+)$/ do |count|
  expect(stamps.orders.filter_panel.search_results.count).to be > count.to_i
end




Then /^Filter Panel: Search Results should be present$/ do
  sleep 1
  expect(stamps.orders.filter_panel.search_results.present?).to be(true)
end

Then /^Filter Panel: Search Results should not be present$/ do
  sleep 1
  expect(stamps.orders.filter_panel.search_results.present?).not_to be(true)
end

Then /^Filter Panel: Remove search results$/ do
  stamps.orders.filter_panel.search_results.remove
  sleep(0.5)
  stamps.orders.filter_panel.search_results.wait_while_present(3)
end