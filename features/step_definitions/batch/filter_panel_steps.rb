Then /^Expect system shows name of (.*) filter in closed panel$/ do |filter|
  log.info "Step: Expect system shows name of #{filter} filter in closed panel"
  actual = batch.filters_panel.get_closed_filter_name
  log_expectation_eql "Closed Filter Panel Name", filter, actual
  actual.should eql filter
end

Then /^Expect system changes the panel arrow so that it is pointing to the (.*) direction$/ do |direction|
  log.info "Step: Expect system changes the panel arrow so that it is pointing to the #{direction} direction"
  actual = batch.filters_panel.get_arrow_direction
  log_expectation_eql "Border arrow direction", direction, actual
  actual.should eql direction
end

Then /^Click on (.*) Filter$/ do |filter|
  log.info "Step: Click on #{filter} Filter"
  batch.filters_panel.filter(filter)
end

Then /^Expect system selects (.*) Filter and deselects the previous filter$/ do |filter|
  log.info "Step: Expect system selects #{filter} Filter and deselects the previous filter"
  actual = batch.filters_panel.get_selected_filter_text
  actual.should eql filter
end

Then /^Expect system updates the grid to show only orders that match the (.*) filter$/ do |filter|
  log.info "Step: Expect system updates the grid to show only orders that match the #{filter} filter"
  actual = batch.filters_panel.is_order_grid_filtered(filter)
  actual.should eql true
end

Then /^Expect system (.*) "Print" button in control ribbon$/ do |status|
  log.info "Step: Expect system #{status} Print button in control ribbon"

  actual = batch.toolbar.is_browser_print_button_present
  if status == 'hides'
    actual.should eql false
  elsif status == 'displays'
    actual.should eql true
  end
end

Then /^Expect system displays expanded filters panel$/ do
  log.info "Step: Expect system displays expanded filters panel"
  actual = batch.filters_panel.is_filter_panel_present
  actual.should eql true
end

Then /^Expect system displays "Awaiting Shipment" and "Shipped" filters in panel$/ do
  log.info "Step: Expect system displays Awaiting Shipment and Shipped filters in panel"
  actual = batch.filters_panel.are_filter_buttons_present
  actual.should eql true
end

Then /^Expect system selects the (.*) filter by default$/ do |filter|
  log.info "Step: Expect system selects the #{filter} filter by default"
  actual = batch.filters_panel.get_selected_filter_text
  actual.should eql filter
end

Then /^Click on the Filters panel border arrow$/ do
  log.info "Step: Click on the Filters panel border arrow"
  batch.filters_panel.click_border_arrow
end

Then /^Expect system closes Filters panel$/ do
  log.info "Step: Expect system closes Filters panel"
  actual = batch.filters_panel.is_filter_panel_present
  actual.should eql false
end

Then /^Expect system shows an arrow above the Order Status filter name$/ do
  log.info "Step: Expect system shows an arrow above the Order Status filter name"
  batch.filters_panel.is_header_arrow_present
end

Then /^Expect system opens the Filters panel$/ do
  log.info "Step: Expect system opens the Filters panel"
  actual = batch.filters_panel.is_filter_panel_present
  actual.should eql true
end

Then /^Expect system hides the header arrow and Order Status filter name$/ do
  log.info "Step: Expect system hides the header arrow and Order Status filter name"
  actual = batch.filters_panel.are_filter_links_present
  actual.should eql false
end

Then /^Double click on the Filters panel border$/ do
  log.info "Step: Double click on the Filters panel border"
  batch.filters_panel.double_click_border
end

Then /^Click on the Filters panel name$/ do
  log.info "Step: Click on the Filters panel name"
  batch.filters_panel.click_filter_panel_name
end

Then /^Click on the closed Filters panel$/ do
  log.info "Step: Click on the closed Filters panel"
  batch.filters_panel.click_closed_filter_panel
end




