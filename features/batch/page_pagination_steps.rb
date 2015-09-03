#Pagination Controls are enabled

Then /^Web Batch grid has more orders than value selected in 'number of orders per page' pagination control$/ do
  #1 Count order grid items ordersgridpagingtoolbar
  page_count = batch.grid.paging_toolbar.page_count.text
  expect(page_count.to_i > 1).to be true
  total_grid_count = batch.grid.total_grid_count
  #2 Get per page count

  #3 Compare
end

Then /^Set paging toolbar per page count to (\d+)$/ do |page_count|
  log "Order Grid contains #{batch.grid.total_grid_count} orders"
  batch.grid.paging_toolbar.per_page_dd.select page_count
  log "Order Grid contains #{batch.grid.total_grid_count} orders"
end

Then /^User is on the first page of orders$/ do
  log "Page Count = Page #{batch.grid.total_grid_count} orders"
  page_count = batch.grid.paging_toolbar.page_count.text
  log "Page Count = Page #{page_count}"
  expect(page_count.to_i = 1).to be true
end

Then /^User is not on the first page of orders$/ do

end

Then /^User clicks first page pagination control$/ do
  paging_toolbar = batch.grid.paging_toolbar
  paging_toolbar.first_page.click
end

Then /^User clicks previous page pagination control$/ do
  paging_toolbar = batch.grid.paging_toolbar
  paging_toolbar.previous_page.click
end

Then /^User clicks next page pagination control$/ do
  paging_toolbar = batch.grid.paging_toolbar
  paging_toolbar.next_page.click
end

Then /^User clicks last page pagination control$/ do
  paging_toolbar = batch.grid.paging_toolbar
  paging_toolbar.last_page.click
end

Then /^Expect page toolbar pagination count to be correct$/ do

end

Then /^Pagination control to go to first page is (\w+)$/ do |first_pagination_enabled|
  enabled = batch.grid.paging_toolbar.first_page.present?
  if first_pagination_enabled.downcase == "enabled"
    log "Pagination control to go to first page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to previous page is (\w+)$/ do |previous_pagination_enabled|
  enabled = batch.grid.paging_toolbar.previous_page.present?
  if previous_pagination_enabled.downcase == "enabled"
    log "Pagination control to go to previous page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to page number is (\w+$)/ do |page_number_enabled|
  enabled = batch.grid.paging_toolbar.page_number.present?
  if page_number_enabled.downcase == "enabled"
    log "Pagination control to go to page number is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to next page is (\w+)$/ do |next_pagination_enabled|
  enabled = batch.grid.paging_toolbar.next_page.present?
  if next_pagination_enabled.downcase == "enabled"
    log "Pagination control to go to next page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Pagination control to go to last page is (\w+)$/ do |last_pagination_enabled|
  enabled = batch.grid.paging_toolbar.last_page.present?
  if last_pagination_enabled.downcase == "enabled"
    log "Pagination control to go to last page is enabled.  Test #{(enabled)?'Passed':'Failed'}"
    enabled.should be true
  end
end

Then /^Expect page toolbar First Page is (\w+)$/  do |expectation|
  case expectation.downcase
    when "enabled"
      enabled = batch.grid.paging_toolbar.first_page.present?
      log enabled
    when "disabled"
      disabled = batch.grid.paging_toolbar.first_page_disabled
      log disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Previous Page is (\w+)$/  do |expectation|
  case expectation.downcase
    when "enabled"
      enabled = batch.grid.paging_toolbar.previous_page.present?
      log enabled
    when "disabled"
      disabled = batch.grid.paging_toolbar.first_page_disabled
      log disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Page Number is (\w+)$/  do |expectation|
  case expectation.downcase
    when "enabled"
      enabled = batch.grid.paging_toolbar.page_number.present?
      log enabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Next Page is (\w+)$/  do |expectation|
  case expectation.downcase
    when "enabled"
      enabled = batch.grid.paging_toolbar.next_page.present?
      log enabled
    when "disabled"
      disabled = batch.grid.paging_toolbar.last_page_disabled
      log disabled
    else
      raise "Illegal argument exception"
  end
end

Then /^Expect page toolbar Last Page is (\w+)$/  do |expectation|
  case expectation.downcase
    when "enabled"
      enabled = batch.grid.paging_toolbar.last_page.present?
      log enabled
    when "disabled"
      disabled = batch.grid.paging_toolbar.last_page_disabled
      log disabled
    else
      raise "Illegal argument exception"
  end
end

When /^Set Page Number to (\d*)$/ do |value|
  begin
    log "Set Page Number to \"#{value}\""
    page_one_order_id = batch.grid.order_id 1
    page_number = batch.grid.paging_toolbar.page_number.text
    log "Current page number #{page_number}"
    batch.grid.paging_toolbar.page_number.set value
    sleep 1
    page_number_textbox = batch.grid.paging_toolbar.page_number
    page_number = page_number_textbox.text
    text_box_field = page_number_textbox.field
    text_box_field.send_keys :return
    text_box_field.send_keys :return
    log "New page number #{page_number}"
    page_two_order_id = batch.grid.order_id 1
    page_one_order_id.should_not eql page_two_order_id
  end unless value.length == 0
end


#Pagination Controls are disabled

Then /^pagination control to go to first page is disabled$/ do

end

Then /^pagination control to go to previous page is disabled$/ do

end

Then /^pagination control to go to specific page is disabled$/ do

end

Then /^pagination control to go to next page is disabled$/ do

end

Then /^pagination control to go to last page is disabled$/ do

end