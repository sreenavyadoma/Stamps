
Then /^Order Details: Expect Item Qty Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect Item Qty Placeholder to be #{expectation}"
  placeholder = @orders_line_item.qty.text_box.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  #quantity.should eql qty
end

Then /^Order Details: Expect Item ID# Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect Item ID# Placeholder to be #{expectation}"
  placeholder = @orders_line_item.id.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect Item Description Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect Item Description Placeholder to be #{expectation}"
  placeholder = @orders_line_item.description.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect Item Qty to be (.*)$/ do |expectation|
  log.info "Order Details: Expect Item Qty to be #{expectation}"
  quantity = @orders_line_item.qty.text_box.text
  log.info "Test #{(quantity == expectation)?"Passed":"Failed"}"
  quantity.should eql expectation
end

Then /^Order Details: Expect Item ID# to be (.*)$/ do |expectation|
  log.info "Order Details: Expect Item ID# to be #{expectation}"
  placeholder = @orders_line_item.id.text
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect Item Description to be (.*)$/ do |expectation|
  log.info "Order Details: Expect Item Description to be #{expectation}"
  placeholder = @orders_line_item.description.text
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect Ship-To Address Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect Ship-To Address Placeholder to be #{expectation}"
  placeholder = orders.details.ship_to.text_area.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect Ship-To Phone Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect Ship-To Phone Placeholder to be #{expectation}"
  placeholder = orders.details.ship_to.phone.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect Ship-To Email Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect Ship-To Email Placeholder to be #{expectation}"
  placeholder = orders.details.ship_to.email.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect Service Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect Service Placeholder to be #{expectation}"
  placeholder = orders.details.service.text_box.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect International Ship-To Name Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect Ship-To Email Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.name.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect International Ship-To Company Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.company.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect International Ship-To Address 1 Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.address_1.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect International Ship-To Address 2 Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.address_2.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect International Ship-To City Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.city.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect International Ship-To Province Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.province.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect International Ship-To Postal Code Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.postal_code.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect International Ship-To Phone Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.phone.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end

Then /^Order Details: Expect International Ship-To Email Placeholder to be (.*)$/ do |expectation|
  log.info "Order Details: Expect International Ship-To Company Placeholder to be #{expectation}"
  @international_ship_to = orders.details.ship_to.international if @international_ship_to.nil?
  placeholder = @international_ship_to.email.placeholder
  log.info "Test #{(placeholder == expectation)?"Passed":"Failed"}"
  placeholder.should eql expectation
end