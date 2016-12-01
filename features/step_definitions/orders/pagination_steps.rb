
Then /^Paging: Set Per Page drop-down to 100$/ do
  logger.step "Toolbar:  Set Per Page Count to 100"
  stamps.orders.grid.toolbar.per_page.x100
  stamps.orders.grid.toolbar.per_page.text_box.text.should eql "100"
end

Then /^Toolbar:  Set Per Page drop-down to 250$/ do
  logger.step "Toolbar:  Set Per Page Count to 250"
  stamps.orders.grid.toolbar.per_page.x250
  stamps.orders.grid.toolbar.per_page.text_box.text.should eql "250"
end

Then /^Toolbar:  Set Per Page drop-down to 500$/ do
  logger.step "Toolbar:  Set Per Page Count to 500"
  stamps.orders.grid.toolbar.per_page.x500
  stamps.orders.grid.toolbar.per_page.text_box.text.should eql "500"
end

Then /^Toolbar: Expect number of orders on page is correct$/ do
  logger.step "Toolbar: Expect number of orders on page is correct"
  stamps.orders.left_panel.awaiting_shipment
  sleep 1
  stamps.orders.checkbox.check_all
  sleep 1
  awaiting_shipment_total_count = filter.awaiting_shipment_count
  multi_order_count = stamps.orders.multi_order.order_count
  per_page_count = stamps.orders.grid.toolbar.per_page.text_box.text.to_i

  if awaiting_shipment_total_count < per_page_count
    max_order_count = awaiting_shipment_total_count
  else
    max_order_count = per_page_count
  end

  sleep 1
  stamps.orders.checkbox.uncheck_all
  logger.step "Test #{(max_order_count == multi_order_count)?"Passed":"Failed"}"
  max_order_count.should eql multi_order_count
end

Then /^User is on the first page of orders$/ do
  logger.step "User is on the first page of orders"
  stamps.orders.grid.toolbar.page_count.text.to_i.should eql 1
end

Then /^User clicks first page pagination control$/ do
  logger.step "User clicks first page pagination control"
  stamps.orders.grid.toolbar.first_page.click
end

Then /^User clicks previous page pagination control$/ do
  logger.step "User clicks previous page pagination control"
  stamps.orders.grid.toolbar.previous_page.click
end

Then /^User clicks next page pagination control$/ do
  logger.step "User clicks next page pagination control"
  stamps.orders.grid.toolbar.next_page.click
end

Then /^User clicks last page pagination control$/ do
  logger.step "User clicks last page pagination control"
  paging_toolbar = stamps.orders.grid.toolbar
  stamps.orders.grid.toolbar.last_page.click
end

Then /^Pagination control to go to first page is (\w+)$/ do |first_pagination_enabled|
  logger.step "Pagination control to go to first page is #{first_pagination_enabled}"
  enabled = stamps.orders.grid.toolbar.first_page.present?
  if first_pagination_enabled.downcase == "enabled"
    logger.step "Pagination control to go to first page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to previous page is (\w+)$/ do |previous_pagination_enabled|
  logger.step "Pagination control to go to previous page is #{previous_pagination_enabled}"
  enabled = stamps.orders.grid.toolbar.previous_page.present?
  if previous_pagination_enabled.downcase == "enabled"
    logger.step "Pagination control to go to previous page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to page number is (\w+$)/ do |page_number_enabled|
  logger.step "Pagination control to go to page number is #{page_number_enabled}"
  enabled = stamps.orders.grid.toolbar.page_number.present?
  if page_number_enabled.downcase == "enabled"
    logger.step "Pagination control to go to page number is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to next page is (\w+)$/ do |next_pagination_enabled|
  logger.step "Pagination control to go to next page is #{next_pagination_enabled}"
  enabled = stamps.orders.grid.toolbar.next_page.present?
  if next_pagination_enabled.downcase == "enabled"
    logger.step "Pagination control to go to next page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to last page is (\w+)$/ do |last_pagination_enabled|
  logger.step "Pagination control to go to last page is #{last_pagination_enabled}"
  enabled = stamps.orders.grid.toolbar.last_page.present?
  if last_pagination_enabled.downcase == "enabled"
    logger.step "Pagination control to go to last page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Expect page toolbar First Page is (\w+)$/  do |expectation|
  logger.step "Expect page toolbar First Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = stamps.orders.grid.toolbar.first_page.present?
      logger.step enabled
    when "disabled"
      disabled = stamps.orders.grid.toolbar.first_page_disabled
      logger.step disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Previous Page is (\w+)$/  do |expectation|
  logger.step "Expect page toolbar Previous Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = stamps.orders.grid.toolbar.previous_page.present?
      logger.step enabled
    when "disabled"
      disabled = stamps.orders.grid.toolbar.first_page_disabled
      logger.step disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Page Number is (\w+)$/  do |expectation|
  logger.step "Expect page toolbar Page Number is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = stamps.orders.grid.toolbar.page_number.present?
      logger.step enabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Next Page is (\w+)$/  do |expectation|
  logger.step "Expect page toolbar Next Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = stamps.orders.grid.toolbar.next_page.present?
      logger.step enabled
    when "disabled"
      disabled = stamps.orders.grid.toolbar.last_page_disabled
      logger.step disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Last Page is (\w+)$/  do |expectation|
  logger.step "Expect page toolbar Last Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = stamps.orders.grid.toolbar.last_page.present?
      logger.step enabled
    when "disabled"
      disabled = stamps.orders.grid.toolbar.last_page_disabled
      logger.step disabled
    else
      raise "Illegal argument exception"
  end
end

When /^Set Page Number to (\d*)$/ do |value|
  logger.step "Set Page Number to #{value}"
  begin
    logger.step "Set Page Number to \"#{value}\""
    page_one_order_id = stamps.orders.grid.order_id.row 1
    page_number = stamps.orders.grid.toolbar.page_number.text
    logger.step "Current page number #{page_number}"
    stamps.orders.grid.toolbar.page_number.set value
    sleep 1
    page_number_textbox = stamps.orders.grid.toolbar.page_number
    page_number = page_number_textbox.text
    text_box_field = page_number_textbox.element
    text_box_field.send_keys :return
    text_box_field.send_keys :return
    logger.step "New page number #{page_number}"
    page_two_order_id = stamps.orders.grid.order_id.row 1
    page_one_order_id.should_not eql page_two_order_id
  end unless value.length == 0
end

Then /^Paging: Expect Total Number of Pages is (\d+)$/ do |total_number_of_pages|
  logger.step "Paging: Expect Total Number of Pages is #{total_number_of_pages}"
  logger.step "Passed value is #{total_number_of_pages}"
  browser_total_number_of_pages = stamps.orders.grid.toolbar.total_number_of_pages.to_s
  logger.step "DD value is #{browser_total_number_of_pages}"
  test_result = browser_total_number_of_pages.include? total_number_of_pages
  logger.step "#{(test_result)?'Test Passed.':'Test Failed'}"
  test_result.should be true
  #expect(total_number_of_pages).should be eql expect(browser_total_number_of_pages)
end

Then /^Web Batch grid has more orders than value selected in 'number of orders per page' pagination control$/ do
  logger.step "Web Batch grid has more orders than value selected in 'number of orders per page' pagination control"
  #1 Count order grid items ordersgridpagingtoolbar
  page_count = stamps.orders.grid.toolbar.page_count.text
  expect(page_count.to_i > 1).is true
  total_grid_count = stamps.orders.grid.row_count
  #2 Get per page count

  #3 Compare
end

