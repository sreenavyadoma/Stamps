

Then /^Tooltips: Expect Print Modal Print Media \"(.*)\" tooltip to include \"(.*)\"$/ do |expectation, data_qtip|
  log.info "Tooltips: Expect Print Modal Print Media #{expectation} tooltip to include #{data_qtip}"
  tooltips = data_qtip.split "||"
  actual_tooltip = orders.toolbar.print_modal.printing_on.tooltip expectation
  tooltips.each { |tooltip|
    log.info "Test #{(actual_tooltip.include? tooltip)?"Passed":"Failed"}"
    actual_tooltip.should include tooltip
  }
end

Then /^Tooltips: Expect Customs Form Tooltip Error for Total Weight to be (.+)$/ do |expectation|
  log.info "Step: Tooltips: Expect Customs Form Tooltip Error for Total Weight to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.total_weight.data_error
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Tooltips: Expect Customs Form Tooltip Error for Item Description to be (.*)$/ do |expectation|
  log.info "Step: Tooltips: Expect Customs Form Tooltip Error for Item Description to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).description.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Tooltips: Expect Customs Form Tooltip Error for Qty to be (.*)$/ do |expectation|
  log.info "Step: Tooltips: Expect Customs Form Tooltip Error for Qty to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).qty.text_box.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Tooltips: Expect Customs Form Tooltip Error for Unit Price to be (.*)$/ do |expectation|
  log.info "Step: Tooltips: Expect Customs Form Tooltip Error for Unit Price to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).unit_price.text_box.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Tooltips: Expect Customs Form Tooltip Error for Pounds to be (.*)$/ do |expectation|
  log.info "Step: Tooltips: Expect Customs Form Tooltip Error for Pounds to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).lbs.text_box.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end

Then /^Tooltips: Expect Customs Form Tooltip Error for Ounces to be (.*)$/ do |expectation|
  log.info "Step: Tooltips: Expect Customs Form Tooltip Error for Ounces to be #{expectation}"
  @customs_form = @order_details.customs_form if @customs_form.nil?
  data_error_qtip = @customs_form.item_grid.item(1).oz.text_box.data_error_qtip
  log.info "Test #{(data_error_qtip.include? expectation)?'Passed':'Failed'}"
  data_error_qtip.should include expectation
end
