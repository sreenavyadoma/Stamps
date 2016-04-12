Then /^Toolbar: Move to Shipped$/ do
  log.info "Toolbar: Move to Shipped"
  grid = orders.grid
  raise "Order ID #{@order_id} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @order_id) > 0
  grid.order_date.menu.sort_descending
  grid.checkbox.check_order_id @order_id
  grid.toolbar.move.to_shipped.cancel
  grid.toolbar.move.to_shipped.move
end

Then /^Filter: Expect order moved to Shipped$/ do
  log.info "Filter: Expect order moved to Shipped"
  grid = orders.filter.shipped
  grid.order_date.menu.sort_descending
  row = grid.order_id.row_num @order_id
  log.info "Test #{(row > 0)?"Passed":"Failed"}"
  row.should be > 0
end

Then /^Toolbar: Move to Canceled$/ do
  log.info "Toolbar: Move to Canceled"
  grid = orders.grid
  raise "Order ID #{@order_id} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @order_id) > 0
  grid.order_date.menu.sort_descending
  grid.checkbox.check_order_id @order_id
  grid.toolbar.move.to_canceled.cancel
  grid.toolbar.move.to_canceled.move
end

Then /^Filter: Expect order moved to Canceled$/ do
  log.info "Filter: Expect order moved to Canceled"
  grid = orders.filter.cancelled
  grid.order_date.menu.sort_descending
  row = grid.order_id.row_num @order_id
  log.info "Test #{(row > 0)?"Passed":"Failed"}"
  row.should be > 0
end

Then /^Filter: Move order to Awaiting Shipment$/ do
  log.info "Move order to Awaiting Shipmen"
  grid = orders.grid
  raise "Order ID #{@order_id} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @order_id) > 0
  grid.order_date.menu.sort_descending
  grid.checkbox.check_order_id @order_id
  grid.toolbar.move.to_awaiting_shipment.cancel
  grid.toolbar.move.to_awaiting_shipment.move
end

Then /^Filter: Expect order moved to Awaiting Shipment$/ do
  log.info "Filter: Expect order moved to Awaiting Shipment"
  grid = orders.filter.awaiting_shipment
  grid.order_date.menu.sort_descending
  row = grid.order_id.row_num @order_id
  log.info "Test #{(row > 0)?"Passed":"Failed"}"
  row.should be > 0
end

Then /^Grid: Expect Date Printed for this order to be today$/ do
  log.info "Grid: Expect Date Printed for this order to be today"
  grid = orders.filter.shipped
  grid.order_id.menu.sort_descending
  grid_print_date = grid.date_printed.data @order_id # Dec 3
  expectation_print_date = Date.today.strftime "%b %-d"

  log.info "Order ID:  #{@order_id} - Orders Grid Date Printed:  #{grid_print_date} - Today's date:  #{expectation_print_date}"
  log.info "Test #{(grid_print_date==expectation_print_date)?"Passed":"Failed"}"
  grid_print_date.should eql expectation_print_date
end

Then /^Grid: Expect Ship Date for this order to be today$/ do
  log.info "Grid: Expect Ship Date for this order to be today"
  step "Grid: Expect Ship Date for this order to be today plus 0"
end

Then /^Grid: Expect Ship Date for this order to be today plus (\d+)$/ do |day|
  log.info "Grid: Expect Ship Date for this order to be today plus #{day}"
  expectation_ship_date = test_helper.mmddyy_to_mondd @ship_date

  grid = orders.filter.shipped

  10.times{
    grid.order_id.menu.sort_descending
    grid_ship_date = grid.ship_date.data @order_id # Dec 3
    log.info "Order ID:  #{@order_id} - Print Modal Saved Ship Date: #{@ship_date} - Orders Grid Ship Date:  #{grid_ship_date}"

    break if grid_ship_date == expectation_ship_date
  }

  grid_ship_date = grid.ship_date.data @order_id
  log.info "Test #{(grid_ship_date==expectation_ship_date)?"Passed":"Failed"}"
  grid_ship_date.should eql expectation_ship_date
end

Then /^Grid: Uncheck New Order ID$/ do
  log.info "Grid: Uncheck New Order ID"
  orders.grid.checkbox.uncheck_order_id @order_id
end

Then /^Grid: Check New Order ID$/ do
  log.info "Grid: Check New Order ID"
  orders.grid.checkbox.check_order_id @order_id
end

Then /^Grid: Check Environment Order ID$/ do
  @order_id = (ENV['ORDER_ID'].nil?)?"":ENV['ORDER_ID']
  expectation = "ENV['ORDER_ID'] is not nil"
  expectation = "ENV['ORDER_ID'] is nil! This test needs a value for this variable." if @order_id.size == 0
  expectation.should eql "ENV['ORDER_ID'] is not nil"

  log.info "Grid: Check Order ID #{@order_id}"
  step "Grid: Check Order ID #{@order_id}"
end

Then /^Grid: Check Order ID (.*)$/ do |order_id|
  log.info "Grid: Check Order ID #{order_id}"
  @order_id = order_id
  # Check if Order ID exists, fail test if it does not
  exists = orders.grid.order_id.exist? @order_id
  expectation = "exists"
  expectation = "does not exists" unless exists
  expectation.should eql "exists"
  log.info "Order ID #{@order_id} #{expectation}!"
  orders.grid.checkbox.check_order_id @order_id
end

Then /^Set Orders Grid Row (\d+) to uncheck$/ do |row|
  log.info "Set Orders Grid Row #{row} to uncheck"
  orders.grid.checkbox.uncheck row
end

Then /^Set Orders Grid Row (\d+) to check$/ do |row|
  log.info "Set Orders Grid Row #{row} to check"
  orders.grid.checkbox.check row
end

When /^Edit Orders Grid row (\d+)$/ do |row|
  log.info "Step: Edit row #{row} on the Orders Grid"
  orders.grid.checkbox.check row
end

When /^Grid: Check row (\d+)$/ do |row|
  log.info "Edit Orders Grid row #{row}"
  orders.grid.checkbox.check row
end

When /^Grid: Uncheck row (\d+)$/ do |row|
  log.info "Step: Uncheck row #{row} on the Orders Grid"
  orders.grid.checkbox.uncheck row
end

Then /^List all Grid column values for row (\d+)/ do |row|
  log.info "Step: List all Grid column values for row #{row}"
  order_id = orders.grid.order_id.row row
  step "List all Grid column values for Order ID #{order_id}"
end

Then /^List all Grid column values for Order ID (\w+)$/ do |order_id|
  log.info "Step: List all Grid column values for Order ID #{order_id}"
  @grid = orders.grid

  row2_order_id = @grid.order_id.row 2
  log.info @grid.checkbox.order_id_checked? row2_order_id


  @grid.checkbox.check 1
  log.info @grid.checkbox.checked? 1
  @grid.checkbox.check 2
  log.info @grid.checkbox.checked? 2
  @grid.checkbox.check 3
  log.info @grid.checkbox.checked? 3

  @grid.checkbox.uncheck 1
  log.info @grid.checkbox.checked? 1
  @grid.checkbox.uncheck 2
  log.info @grid.checkbox.checked? 2
  @grid.checkbox.uncheck 3
  log.info @grid.checkbox.checked? 3

  @grid.checkbox.check 2
  log.info @grid.checkbox.checked? 2
  @grid.checkbox.check 4
  log.info @grid.checkbox.checked? 4
  @grid.checkbox.check 6
  log.info @grid.checkbox.checked? 6

  checked_hash = @grid.checkbox.checked_rows

  @grid.checkbox.check_all
  @grid.checkbox.uncheck_all

  @grid.checkbox.check_all checked_hash

  log.info @grid.item_name.data order_id
  log.info @grid.ship_cost.data order_id
  log.info @grid.age.data order_id
  log.info @grid.order_date.data order_id
  log.info @grid.recipient.data order_id
  log.info @grid.company.data order_id
  log.info @grid.address.data order_id
  log.info @grid.city.data order_id
  log.info @grid.state.data order_id
  log.info @grid.zip.data order_id
  log.info @grid.country.data order_id
  log.info @grid.phone.data order_id
  log.info @grid.email.data order_id
  log.info @grid.qty.data order_id
  log.info @grid.item_sku.data order_id
  log.info @grid.ship_from.data order_id
  log.info @grid.service.data order_id
  log.info @grid.weight.data order_id
  log.info @grid.insured_value.data order_id
  log.info @grid.reference_no.data order_id
  log.info @grid.cost_code.data order_id
  log.info @grid.order_status.data order_id
  log.info @grid.ship_date.data order_id
  log.info @grid.tracking_no.data order_id
  log.info @grid.order_total.data order_id

end

Then /^Expect Ship-To address to be;$/ do |table|
  log.info "Step: Expect Ship-To address to be..."
  param_hash = table.hashes.first
  step "Grid: Expect Recipient to be #{param_hash[:name]}"
  step "Grid: Expect Company to be #{param_hash[:company]}"
  step "Grid: Expect Address to be #{param_hash[:address]}"
  step "Grid: Expect City to be #{param_hash[:city]}"
  step "Grid: Expect State to be #{param_hash[:state]}"
  step "Grid: Expect Zip to be #{param_hash[:zip]}"
  step "Grid: Expect Phone to be #{param_hash[:phone]}"
  step "Grid: Expect Email to be #{param_hash[:email]}"
end

Then /^Grid: Expect Age to be (.*)$/ do |expectation|
  log.info "Step: Grid: Expect Age to be #{expectation}"
  begin
    if @order_id.nil?
      @order_id = orders.grid.order_id.row 1
    end
    actual = orders.grid.age.data @order_id
    5.times do
      break if actual.eql? expectation
      actual = orders.grid.age.data @order_id
     end
    actual = orders.grid.age.data @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Order Date to be (.*)$/ do |expectation|
  log.info "Step: Grid: Expect Order Date to be #{expectation}"
  begin
    if @order_id.nil?
      @order_id = orders.grid.order_id.row 1
    end
    5.times do
      actual = orders.grid.order_date.data @order_id
      break if actual.eql? expectation
     end
    actual = orders.grid.order_date.data @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Recipient to be (.*)$/ do |expectation|
  log.info "Step: Grid: Expect Recipient to be #{expectation}"
  begin
    if @order_id.nil?
      @order_id = orders.grid.order_id.row 1
    end
    5.times do
      actual = orders.grid.recipient.data @order_id
      break if actual.eql? expectation
     end
    actual = orders.grid.recipient.data @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Company to be (.*)$/ do |expectation|
  log.info "Step: Grid: Expect Company to be #{expectation}"
  begin
    10.times do
      actual = orders.grid.company.data @order_id
      break if actual.eql? expectation
     end
    actual = orders.grid.company.data @order_id
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Address to be ([\w\s-]+)$/ do |expectation|
  log.info "Step: Grid: Expect Address to be #{expectation}"
  begin
    10.times do
      actual = orders.grid.address.data @order_id
      break if actual.eql? expectation
     end
    actual = orders.grid.address.data @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect City to be ([\w\s]+)$/ do |expectation|
  log.info "Step: Grid: Expect City to be #{expectation}"
  begin
    10.times do
      actual = orders.grid.city.data @order_id
      break if actual.eql? expectation
     end
    actual = orders.grid.city.data @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect State to be ([a-zA-Z]+)$/ do |expectation|
  log.info "Step: Grid: Expect State to be #{expectation}"
  begin
    10.times do
      actual = orders.grid.state.data @order_id
      break if actual.eql? expectation
     end
    actual = orders.grid.state.data @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Zip to be ([\d -]+)$/ do |expectation|
  log.info "Step: Grid: Expect Zip to be #{expectation}"
  begin
    10.times do
      actual = orders.grid.zip.data @order_id
      break if actual.eql? expectation
     end
    actual = orders.grid.zip.data @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should include expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Country to be ([a-zA-Z]+)$/ do |expectation|
  log.info "Step: Grid: Expect Country to be #{expectation}"
  begin
    10.times do
      actual = orders.grid.country.data @order_id
      break if actual.eql? expectation
     end
    actual = orders.grid.country.data @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Column (\w+) appears to left of (\w+)$/ do |left_column, right_column|
  log.info "Grid: Expect Column #{left_column} appears to left of #{right_column}"
  is_next_to = orders.grid.column.is_next_to? left_column, right_column
  expectation = "true"
  expectation =  "false" unless is_next_to
  log.info "Test #{(expectation=="true")?"Passed":"Failed"}"
  expectation.should eql "true"
end

Then /^Grid: Expect Email to be ([\S]+@[\S]+\.[a-z]{3})$/ do |expectation|
  log.info "Step: Grid: Expect Email to be #{expectation}"
  begin
    10.times do
      actual = orders.grid.country.data @order_id
      break if actual.eql? expectation
     end
    actual = orders.grid.country.data @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Phone to be ([\(]?[0-9]{3}[\)]?[\s]?[0-9]{3}[\s-]?[0-9]{4})$/ do |expectation|
  log.info "Step: Grid: Expect Phone to be #{expectation}"
  begin
    10.times do
      actual = orders.grid.phone.data @order_id
      break if actual.eql? expectation
     end
    actual = orders.grid.phone.data @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Pounds to be (\d+)$/ do |expectation|
  log.info "Step: Grid: Expect Pounds to be #{expectation}"
  begin
    10.times do
      actual = orders.grid.weight.lbs @order_id
      break if actual.eql? expectation
     end
    actual = orders.grid.weight.lbs @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Ounces to be (\d+)$/ do |expectation|
  log.info "Step: Grid: Expect Ounces to be #{expectation}"
  begin
    10.times do
      actual = orders.grid.weight.oz @order_id
      break if actual.eql? expectation
     end
    actual = orders.grid.weight.oz @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Weight to be (\d+) lbs. (\d+) oz.$/ do |pounds, ounces|
  expectation_result = "#{pounds} lbs. #{ounces} oz."
  log.info "Step: Grid: Expect Weight to be #{expectation_result}"
  begin
    10.times do
      actual = orders.grid.weight.data @order_id
      break if actual.eql? expectation_result
     end
    actual = orders.grid.weight.data @order_id
    log.info "Test #{(actual==expectation_result)?"Passed":"Failed"}"
    actual.should eql expectation_result
  end unless expectation_result.length == 0
end

Then /^Grid: Expect Qty. to be (.+)$/ do |expectation|
  log.info "Step: Grid: Expect Qty. to be #{expectation}"
  begin
    actual = orders.grid.qty.data @order_id
    10.times do
      sleep 1
      break if actual.eql? expectation
      actual = orders.grid.qty.data @order_id
     end
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Item SKU to be (.+)$/ do |expectation|
  log.info "Step: Grid: Expect SKU to be #{expectation}"
  begin
    actual = orders.grid.item_sku.data @order_id
    10.times do 
      sleep 1
      break if actual.eql? expectation
      actual = orders.grid.item_sku.data @order_id
     end
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Item Name to be (.+)$/ do |expectation|
  log.info "Step: Grid: Expect Name to be #{expectation}"
  begin
    actual = orders.grid.item_name.data @order_id
    10.times do 
      sleep 1
      break if actual.eql? expectation
      actual = orders.grid.item_name.data @order_id
     end
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Ship From to be (.+)$/ do |expectation|
  log.info "Step: Grid: Expect Ship to be #{expectation}"
  begin
    actual = orders.grid.ship_from.data @order_id
    10.times do |counter|
      sleep 1
      break if actual.eql? expectation
      actual = orders.grid.ship_from.data @order_id
     end
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Service to be (.+)$/ do |expectation|
  log.info "Step: Grid: Expect Service to be #{expectation}"
  actual = orders.grid.service.data @order_id
  10.times do
    sleep 1
    break if actual.eql? expectation
    actual = orders.grid.service.data @order_id
  end
  log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Insured Value to be \$(.+)$/ do |expectation|
  log.info "Step: Grid: Expect Insured Value to be #{expectation}"
  begin
    actual = orders.grid.insured_value.data @order_id
    10.times do
      sleep 1
      break if actual.eql? expectation
      actual = orders.grid.insured_value.data @order_id
     end
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Reference No. to be (.+)$/ do |expectation|

  log.info "Step: Grid: Expect Reference No. to be #{expectation}"
  begin
    actual = orders.grid.reference_no.data @order_id
    10.times do
      sleep 1
      break if actual.eql? expectation
      actual = orders.grid.reference_no.data @order_id
     end
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Cost Code to be (.+)$/ do |expectation|
  log.info "Step: Grid: Expect Cost Code to be #{expectation}"
  begin
    actual = orders.grid.cost_code.data @order_id
    10.times do
      sleep 1
      break if actual.eql? expectation
      actual = orders.grid.cost_code.data @order_id
     end
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Order Status to be (.+)$/ do |expectation|
  log.info "Step: Grid: Expect Order Status to be #{expectation}"
  begin
    10.times do
      actual = orders.grid.order_status.data @order_id
      sleep 1
      break if actual == expectation
    end

    actual = orders.grid.order_status.data @order_id
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Tracking Number is populated$/ do
  log.info "Grid: Expect Tracking Number is populated"
  sleep 2
  actual = orders.grid.tracking_no.data @order_id
  20.times do
    log.info "Tracking number is #{actual}"
    break if actual.length > 3
    sleep 1
    actual = orders.grid.tracking_no.data @order_id
  end
  log.info "Test #{(actual.length > 3)?"Passed":"Failed"}"
  actual.length.should be > 3
end

Then /^Grid: Expect Order Total to be (.+)$/ do |expectation|
  log.info "Step: Grid: Expect Order Total to be #{expectation}"
  begin
    actual = orders.grid.order_total.data @order_id
    10.times do
      sleep 1
      break if actual.eql? expectation
      actual = orders.grid.order_total.data @order_id
     end
    log.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Expect Order details to be;$/ do |table|
  log.info "Step: Expect Order details to be..."
  expectation_hash = table.hashes.first
  step "Grid: Expect Insured Value to be $#{expectation_hash[:insured_value]}"
  step "Grid: Expect Weight to be #{expectation_hash[:lbs]} lbs. #{expectation_hash[:oz]} oz."
end

Then /^Expect new Order ID created$/ do
  log.info "Step: Expect new Order ID created"
  log.info "New Order ID created:  #{@order_id.to_i>0}"
  @order_id.to_i.should be > 0
end

Then /^Details: Expect Order ID equals Grid order ID$/ do
  log.info "Step: Details: Expect Order ID equals Grid order ID"
  grid_order_id = orders.grid.order_id.row 1
  single_order_form_order_id = orders.details.order_id
  log.info "Grid Order ID: #{grid_order_id}.  Order Details Form Order ID:  #{single_order_form_order_id}.  Test #{(grid_order_id==single_order_form_order_id) ? 'Passed' : 'Failed'}"
  grid_order_id.should eql single_order_form_order_id
end
