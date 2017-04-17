
Then /^Paging: Set Per Page drop-down to 100$/ do
  stamps.orders.orders_toolbar.per_page.x100
  expect(stamps.orders.orders_toolbar.per_page.text_box.text).to eql "100"
end

Then /^[Ii]n Orders Toolbar, set Per Page drop-down to 250$/ do
  stamps.orders.orders_toolbar.per_page.x250
  expect(stamps.orders.orders_toolbar.per_page.text_box.text).to eql "250"
end

Then /^[Ii]n Orders Toolbar, set Per Page drop-down to 500$/ do
  stamps.orders.orders_toolbar.per_page.x500
  expect(stamps.orders.orders_toolbar.per_page.text_box.text).to eql "500"
end

Then /^[Ii]n Orders Toolbar, expect number of orders on page is correct$/ do
  stamps.orders.filter_panel.awaiting_shipment.select
  sleep(0.35)
  stamps.orders.checkbox.check_all
  sleep(0.35)
  awaiting_shipment_total_count = filter.awaiting_shipment.count
  multi_order_count = stamps.orders.multi_order.order_count
  per_page_count = stamps.orders.orders_toolbar.per_page.text_box.text.to_i

  if awaiting_shipment_total_count < per_page_count
    max_order_count = awaiting_shipment_total_count
  else
    max_order_count = per_page_count
  end

  sleep(0.35)
  stamps.orders.checkbox.uncheck_all
  #config.logger.step "Test #{(max_order_count == multi_order_count)?"Passed":"Failed"}"
  expect(max_order_count).to eql multi_order_count
end

Then /^User is on the first page of orders$/ do
  expect(stamps.orders.orders_toolbar.page_count.text.to_i).to eql 1
end

Then /^User clicks first page pagination control$/ do
  stamps.orders.orders_toolbar.first_page.click
end

Then /^User clicks previous page pagination control$/ do
  stamps.orders.orders_toolbar.previous_page.click
end

Then /^User clicks next page pagination control$/ do
  stamps.orders.orders_toolbar.next_page.click
end

Then /^User clicks last page pagination control$/ do
  paging_toolbar = stamps.orders.toolbar
  stamps.orders.orders_toolbar.last_page.click
end

Then /^Pagination control to go to first page is (\w+)$/ do |first_pagination_enabled|
  enabled = stamps.orders.orders_toolbar.first_page.present?
  if first_pagination_enabled.downcase == "enabled"
    #config.logger.step "Pagination control to go to first page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    expect(enabled).to be(true)
  end
end

Then /^Pagination control to go to previous page is (\w+)$/ do |previous_pagination_enabled|
  enabled = stamps.orders.orders_toolbar.previous_page.present?
  if previous_pagination_enabled.downcase == "enabled"
    #config.logger.step "Pagination control to go to previous page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    expect(enabled).to be(true)
  end
end

Then /^Pagination control to go to page number is (\w+$)$/ do |page_number_enabled|
  enabled = stamps.orders.orders_toolbar.page_number.present?
  if page_number_enabled.downcase == "enabled"
    #config.logger.step "Pagination control to go to page number is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    expect(enabled).to be(true)
  end
end

Then /^Pagination control to go to next page is (\w+)$/ do |next_pagination_enabled|
  #config.logger.step "Pagination control to go to next page is #{next_pagination_enabled}"
  enabled = stamps.orders.orders_toolbar.next_page.present?
  if next_pagination_enabled.downcase == "enabled"
    #config.logger.step "Pagination control to go to next page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    expect(enabled).to be(true)
  end
end

Then /^Pagination control to go to last page is (\w+)$/ do |last_pagination_enabled|
  #config.logger.step "Pagination control to go to last page is #{last_pagination_enabled}"
  enabled = stamps.orders.orders_toolbar.last_page.present?
  if last_pagination_enabled.downcase == "enabled"
    #config.logger.step "Pagination control to go to last page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    expect(enabled).to be(true)
  end
end

Then /^[Ee]xpect page toolbar First Page is (\w+)$/  do |expectation|
  #config.logger.step "Expect page toolbar First Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = stamps.orders.orders_toolbar.first_page.present?
      config.logger.step enabled
    when "disabled"
      disabled = stamps.orders.orders_toolbar.first_page_disabled
      config.logger.step disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^[Ee]xpect page toolbar Previous Page is (\w+)$/  do |expectation|
  #config.logger.step "Expect page toolbar Previous Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = stamps.orders.orders_toolbar.previous_page.present?
      config.logger.step enabled
    when "disabled"
      disabled = stamps.orders.orders_toolbar.first_page_disabled
      config.logger.step disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^[Ee]xpect page toolbar Page Number is (\w+)$/  do |expectation|
  #config.logger.step "Expect page toolbar Page Number is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = stamps.orders.orders_toolbar.page_number.present?
      config.logger.step enabled
    else
      raise "Illegal argument exception"
  end
end

Then /^[Ee]xpect page toolbar Next Page is (\w+)$/  do |expectation|
  #config.logger.step "Expect page toolbar Next Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = stamps.orders.orders_toolbar.next_page.present?
      config.logger.step enabled
    when "disabled"
      disabled = stamps.orders.orders_toolbar.last_page_disabled
      config.logger.step disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^[Ee]xpect page toolbar Last Page is (\w+)$/  do |expectation|
  #config.logger.step "Expect page toolbar Last Page is #{expectation}"
  case expectation.downcase
    when "enabled"
      enabled = stamps.orders.orders_toolbar.last_page.present?
      config.logger.step enabled
    when "disabled"
      disabled = stamps.orders.orders_toolbar.last_page_disabled
      config.logger.step disabled
    else
      raise "Illegal argument exception"
  end
end

When /^[Ss]et Page Number to (\d*)$/ do |value|
  #config.logger.step "Set Page Number to #{value}"
  begin
    #config.logger.step "Set Page Number to \"#{value}\""
    page_one_order_id = stamps.orders.orders_grid.column.order_id.row 1
    page_number = stamps.orders.orders_toolbar.page_number.text
    #config.logger.step "Current page number #{page_number}"
    stamps.orders.orders_toolbar.page_number.set(value)
    sleep(0.35)
    page_number_textbox = stamps.orders.orders_toolbar.page_number
    page_number = page_number_textbox.text
    text_box_field = page_number_textbox.element
    text_box_field.send_keys :return
    text_box_field.send_keys :return
    #config.logger.step "New page number #{page_number}"
    page_two_order_id = stamps.orders.orders_grid.column.order_id.row 1
    page_one_order_id.should_not eql page_two_order_id
  end unless value.length == 0
end

Then /^Paging: Expect Total Number of Pages is (\d+)$/ do |total_number_of_pages|
  #config.logger.step "Paging: Expect Total Number of Pages is #{total_number_of_pages}"
  #config.logger.step "Passed value is #{total_number_of_pages}"
  browser_total_number_of_pages = stamps.orders.orders_toolbar.total_number_of_pages.to_s
  #config.logger.step "DD value is #{browser_total_number_of_pages}"
  test_result = browser_total_number_of_pages.include? total_number_of_pages
  #config.logger.step "#{(test_result)?'Test Passed.':'Test Failed'}"
  expect(test_result).to be(true)
  #expect(total_number_of_pages)).to be eql expect(browser_total_number_of_pages)
end

Then /^Web Batch grid has more orders than value selected in 'number of orders per page' pagination control$/ do
  #config.logger.step "Web Batch grid has more orders than value selected in 'number of orders per page' pagination control"
  #1 Count order grid items ordersgridpagingtoolbar
  page_count = stamps.orders.orders_toolbar.page_count.text
  expect(page_count.to_i > 1).is true
  total_grid_count = stamps.orders.orders_grid.row_count
  #2 Get per page count

  #3 Compare
end

