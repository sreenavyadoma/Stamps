Then /^Expect system shows name of (.*) filter in closed panel$/ do |filter|
  actual = batch.filters_panel.get_closed_filter_name
  log_expectation_eql "Closed Filter Panel Name", filter, actual
  actual.should eql filter
end

Then /^Expect system changes the panel arrow so that it is pointing to the (.*) direction$/ do |direction|
  actual = batch.filters_panel.get_arrow_direction
  log_expectation_eql "Border arrow direction", direction, actual
  actual.should eql direction
end

Then /^Click on (.*) Filter$/ do |filter|
  log "Selecting #{filter} filter"
  batch.filters_panel.filter(filter)
end

Then /^Expect system selects (.*) Filter and deselects the previous filter$/ do |filter|
  log "Confirmed #{filter} filter is selected"
  actual = batch.filters_panel.get_selected_filter_text
  actual.should eql filter
end

Then /^Expect system updates the grid to show only orders that match the (.*) filter$/ do |filter|
  log "Checking order grid for #{filter} filtered orders"
  actual = batch.filters_panel.is_order_grid_filtered(filter)
  actual.should eql true
end

Then /^Expect system (.*) "Print" button in control ribbon$/ do |status|
  log "Confirmed system #{status} Print button"

  actual = batch.toolbar.is_browser_print_button_present
  if status == 'hides'
    actual.should eql false
  elsif status == 'displays'
    actual.should eql true
  end
end

Then /^Expect system displays expanded filters panel$/ do
  log "Confirmed system displays expanded filters panel"
  actual = batch.filters_panel.is_filter_panel_present
  actual.should eql true
end

Then /^Expect system displays "Awaiting Shipment" and "Shipped" filters in panel$/ do
  log "Confirmed system displays Awaiting Shipment and Shipped filters"
  actual = batch.filters_panel.are_filter_buttons_present
  actual.should eql true
end

Then /^Expect system selects the (.*) filter by default$/ do |filter|
  log "Confirmed system selects the #{filter} filter by default"
  actual = batch.filters_panel.get_selected_filter_text
  actual.should eql filter
end

Then /^Click on the Filters panel border arrow$/ do
  log "Click on the Filters panel border arrow"
  batch.filters_panel.click_border_arrow
end

Then /^Expect system closes Filters panel$/ do
  log "Confirming system closes filter panel"
  actual = batch.filters_panel.is_filter_panel_present
  actual.should eql false
end

Then /^Expect system shows an arrow above the Order Status filter name$/ do
  log "Confirming header arrow in filter panel"
  batch.filters_panel.is_header_arrow_present
end

Then /^Expect system opens the Filters panel$/ do
  log "Confirming system opens filter panel"
  actual = batch.filters_panel.is_filter_panel_present
  actual.should eql true
end

Then /^Expect system hides the header arrow and Order Status filter name$/ do
  actual = batch.filters_panel.are_filter_links_present
  actual.should eql false
end

Then /^Double click on the Filters panel border$/ do
  log "Double click filter panel border"
  batch.filters_panel.double_click_border
end

Then /^Click on the Filters panel name$/ do
  log "Click on the Filters panel name"
  batch.filters_panel.click_filter_panel_name
end

Then /^Click on the closed Filters panel$/ do
  log "Click on the closed Filters panel"
  batch.filters_panel.click_closed_filter_panel
end


# Steps below will be implemented later


Then /^Go to page (.*)$/ do |page|

end

Then /^Hover over Filters Panel for 3 seconds$/ do

end

Then /^Wait 3 seconds$/ do

end



