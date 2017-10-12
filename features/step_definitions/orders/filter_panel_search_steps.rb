
Then /^[Ss]earch filtered Orders for cached Order ID$/ do
  step "search Orders for #{test_param[:order_id][1]} expecting to find at least 1"
end

Then /^[Ss]earch filtered Orders for cached Ship-To full name$/ do
  step "search Orders for #{test_param[:full_name]} expecting to find at least 1"
end

Then /^[Ss]earch filtered Orders for cached Ship-To Company name$/ do
  step "search Orders for #{test_param[:company]} expecting to find at least 1"
end

Then /^[Ss]earch filtered Orders for cached Ship-To email$/ do
  step "search Orders for #{test_param[:email]} expecting to find at least 1"
end

Then /^[Ss]earch Orders for (.*) expecting to find at least (\d+)$/ do |search_str, count|
  step "set Filter Panel Search textbox to #{search_str}"
  begin
    15.times do
      sleep(1)
      step "click Filter Panel Search button"
      sleep(1)
      break if stamps.orders.filter_panel.search_orders.search_results.count >= count.to_i
    end
    expect(stamps.orders.filter_panel.search_orders.search_results).to be_present, "Couldn't find #{search_str} in Orders Grid"
  end unless search_str.nil? || search_str.size == 0

end

Then /^[Ss]et Filter Panel Search textbox to (.*)$/ do |str|
  test_param[:filter_panel_search_str] = str
  stamps.orders.filter_panel.search_orders.textbox.set(test_param[:filter_panel_search_str])
end

Then /^[Cc]lick Filter Panel Search button$/ do
  stamps.orders.filter_panel.search_orders.search_button.click
end

Then /^[Ee]xpect Filter Panel search result count is (\d+)$/ do |count|
  expect(stamps.orders.filter_panel.search_orders.search_results.count).to eql count.to_i
end

Then /^[Ee]xpect Filter Panel search result count is greater than (\d+)$/ do |count|
  expect(stamps.orders.filter_panel.search_results.count).to be > count.to_i
end

Then /^[Ee]xpect Filter Panel search results tab is present$/ do
  sleep 1
  expect(stamps.orders.filter_panel.search_results).to be_present
end

Then /^[Ee]xpect Filter Panel search results tab is not present$/ do
  sleep 1
  expect(stamps.orders.filter_panel.search_results.present?).not_to be(true)
end

Then /^[Rr]emove Filter Panel search results tab$/ do
  stamps.orders.filter_panel.search_results.remove
  sleep(0.5)
  stamps.orders.filter_panel.search_results.wait_while_present(3)
end