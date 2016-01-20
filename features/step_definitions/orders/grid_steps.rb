Then /^Toolbar - Move to Shipped$/ do
  log.info "Toolbar - Move to Shipped"
  grid = orders.grid
  raise "Order ID #{@order_id} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @order_id) > 0
  grid.order_date.sort.descending
  grid.checkbox.check_order_id @order_id
  grid.toolbar.move.to_shipped.cancel
  grid.toolbar.move.to_shipped.move
end

Then /^Expect order moved to Shipped$/ do
  log.info "Expect order moved to Shipped"
  grid = orders.filter.shipped
  grid.order_date.sort.descending
  row = grid.order_id.row_num @order_id
  log.info "Test #{(row > 0)?"Passed":"Failed"}"
  row.should be > 0
end

Then /^Toolbar - Move to Canceled$/ do
  log.info "Toolbar - Move to Canceled"
  grid = orders.grid
  raise "Order ID #{@order_id} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @order_id) > 0
  grid.order_date.sort.descending
  grid.checkbox.check_order_id @order_id
  grid.toolbar.move.to_canceled.cancel
  grid.toolbar.move.to_canceled.move
end

Then /^Expect order moved to Canceled$/ do
  log.info "Expect order moved to Canceled"
  grid = orders.filter.shipped
  grid.order_date.sort.descending
  row = grid.order_id.row_num @order_id
  log.info "Test #{(row > 0)?"Passed":"Failed"}"
  row.should be > 0
end

Then /^Move order to Awaiting Shipment$/ do
  log.info "Move order to Awaiting Shipmen"
  grid = orders.grid
  raise "Order ID #{@order_id} does not exist in this tab and therefore cannot be moved." unless (grid.order_id.row_num @order_id) > 0
  grid.order_date.sort.descending
  grid.checkbox.check_order_id @order_id
  grid.toolbar.move.to_awaiting_shipment.cancel
  grid.toolbar.move.to_awaiting_shipment.move
end

Then /^Expect order moved to Awaiting Shipment$/ do
  log.info "Expect order moved to Awaiting Shipment"
  grid = orders.filter.shipped
  grid.order_date.sort.descending
  row = grid.order_id.row_num @order_id
  log.info "Test #{(row > 0)?"Passed":"Failed"}"
  row.should be > 0
end

Then /^Expect Grid Date Printed for this order to be today$/ do
  log.info "Expect Grid Date Printed for this order to be today"
  grid = orders.filter.shipped
  grid.order_id.sort.descending
  grid_print_date = grid.print_date.data @order_id # Dec 3
  expected_print_date = Date.today.strftime "%b %-d"

  log.info "Order ID:  #{@order_id} - Orders Grid Date Printed:  #{grid_print_date} - Today's date:  #{expected_print_date}"
  log.info "Test #{(grid_print_date==expected_print_date)?"Passed":"Failed"}"
  grid_print_date.should eql expected_print_date
end

Then /^Expect Grid Ship Date for this order to be today$/ do
  log.info "Expect Grid Ship Date for this order to be today"
  step "Expect Grid Ship Date for this order to be today plus 0"
end

Then /^Expect Grid Ship Date for this order to be today plus (\d+)$/ do |day|
  log.info "Expect Grid Ship Date for this order to be today plus #{day}"
  expected_ship_date = test_helper.mmddyy_to_mondd @ship_date

  grid = orders.filter.shipped

  10.times{
    grid.order_id.sort.descending
    grid_ship_date = grid.ship_date.data @order_id # Dec 3
    log.info "Order ID:  #{@order_id} - Print Modal Saved Ship Date: #{@ship_date} - Orders Grid Ship Date:  #{grid_ship_date}"

    break if grid_ship_date==expected_ship_date
  }

  grid_ship_date = grid.ship_date.data @order_id
  log.info "Test #{(grid_ship_date==expected_ship_date)?"Passed":"Failed"}"
  grid_ship_date.should eql expected_ship_date
end

Then /^Set Orders Grid New Order ID to uncheck$/ do
  log.info "Set Orders Grid New Order ID to uncheck"
  orders.grid.checkbox.uncheck_order_id @order_id
end

Then /^Set Orders Grid New Order ID to check$/ do
  log.info "Set Orders Grid New Order ID to check"
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

When /^Orders Grid - Check row (\d+)$/ do |row|
  log.info "Edit Orders Grid row #{row}"
  orders.grid.checkbox.check row
end

When /^UnOrders Grid - Check row (\d+)$/ do |row|
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
  step "Expect Grid Recipient to be #{param_hash[:name]}"
  step "Expect Grid Company to be #{param_hash[:company]}"
  step "Expect Grid Address to be #{param_hash[:address]}"
  step "Expect Grid City to be #{param_hash[:city]}"
  step "Expect Grid State to be #{param_hash[:state]}"
  step "Expect Grid Zip to be #{param_hash[:zip]}"
  step "Expect Grid Phone to be #{param_hash[:phone]}"
  step "Expect Grid Email to be #{param_hash[:email]}"
end

Then /^Expect Grid Store row (\d+) to be (.*)$/ do |row, expected|
  log.info "Step: Expect Grid Store row #{row} to be #{expected}"
  begin
    10.times {
      actual = orders.grid.store.row row.to_i
      break if actual.eql? expected
    }
    actual = orders.grid.store.row row.to_i
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Store to be (.*)$/ do |expected|
  log.info "Step: Expect Grid Store to be #{expected}"
  begin
    10.times {
      actual = orders.grid.store.data @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.store.data @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Age to be (.*)$/ do |expected|
  log.info "Step: Expect Grid Age to be #{expected}"
  begin
    if @order_id.nil?
      @order_id = orders.grid.order_id.row 1
    end
    actual = orders.grid.age.data @order_id
    5.times {
      break if actual.eql? expected
      actual = orders.grid.age.data @order_id
    }
    actual = orders.grid.age.data @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Order Date to be (.*)$/ do |expected|
  log.info "Step: Expect Grid Order Date to be #{expected}"
  begin
    if @order_id.nil?
      @order_id = orders.grid.order_id.row 1
    end
    5.times {
      actual = orders.grid.order_date.data @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.order_date.data @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Recipient to be (.*)$/ do |expected|
  log.info "Step: Expect Grid Recipient to be #{expected}"
  begin
    if @order_id.nil?
      @order_id = orders.grid.order_id.row 1
    end
    5.times {
      actual = orders.grid.recipient.data @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.recipient.data @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Company to be (.*)$/ do |expected|
  log.info "Step: Expect Grid Company to be #{expected}"
  begin
    10.times {
      actual = orders.grid.company.data @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.company.data @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Address to be ([\w\s-]+)$/ do |expected|
  log.info "Step: Expect Grid Address to be #{expected}"
  begin
    10.times {
      actual = orders.grid.address.data @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.address.data @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid City to be ([\w\s]+)$/ do |expected|
  log.info "Step: Expect Grid City to be #{expected}"
  begin
    10.times {
      actual = orders.grid.city.data @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.city.data @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid State to be ([a-zA-Z]+)$/ do |expected|
  log.info "Step: Expect Grid State to be #{expected}"
  begin
    10.times {
      actual = orders.grid.state.data @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.state.data @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Zip to be ([\d -]+)$/ do |expected|
  log.info "Step: Expect Grid Zip to be #{expected}"
  begin
    10.times {
      actual = orders.grid.zip.data @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.zip.data @order_id
    actual.should include expected
  end unless expected.length == 0
end

Then /^Expect Grid Country to be ([a-zA-Z]+)$/ do |expected|
  log.info "Step: Expect Grid Country to be #{expected}"
  begin
    10.times {
      actual = orders.grid.country.data @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.country.data @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Email to be ([\S]+@[\S]+\.[a-z]{3})$/ do |expected|
  log.info "Step: Expect Grid Email to be #{expected}"
  begin
    10.times {
      actual = orders.grid.country.data @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.country.data @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Phone to be ([\(]?[0-9]{3}[\)]?[\s]?[0-9]{3}[\s-]?[0-9]{4})$/ do |expected|
  log.info "Step: Expect Grid Phone to be #{expected}"
  begin
    10.times {
      actual = orders.grid.phone.data @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.phone.data @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Pounds to be (\d+)$/ do |expected|
  log.info "Step: Expect Grid Pounds to be #{expected}"
  begin
    10.times {
      actual = orders.grid.weight.lbs @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.weight.lbs @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Ounces to be (\d+)$/ do |expected|
  log.info "Step: Expect Grid Ounces to be #{expected}"
  begin
    10.times {
      actual = orders.grid.weight.oz @order_id
      break if actual.eql? expected
    }
    actual = orders.grid.weight.oz @order_id
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Weight to be (\d+) lbs. (\d+) oz.$/ do |pounds, ounces|
  expected_result = "#{pounds} lbs. #{ounces} oz."
  log.info "Step: Expect Grid Weight to be #{expected_result}"
  begin
    10.times {
      actual = orders.grid.weight.data @order_id
      break if actual.eql? expected_result
    }
    actual = orders.grid.weight.data @order_id
    actual.should eql expected_result
  end unless expected_result.length == 0
end

Then /^Expect Grid Qty. to be (.+)$/ do |expected|
  log.info "Step: Expect Grid Qty. to be #{expected}"
  begin
    actual = orders.grid.qty.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Qty.", expected, actual
      break if actual.eql? expected
      actual = orders.grid.qty.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Item SKU to be (.+)$/ do |expected|
  log.info "Step: Expect Grid SKU to be #{expected}"
  begin
    actual = orders.grid.item_sku.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Item SKU", expected, actual
      break if actual.eql? expected
      actual = orders.grid.item_sku.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Item Name to be (.+)$/ do |expected|
  log.info "Step: Expect Grid Name to be #{expected}"
  begin
    actual = orders.grid.item_name.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Item Name", expected, actual
      break if actual.eql? expected
      actual = orders.grid.item_name.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Ship From to be (.+)$/ do |expected|
  log.info "Step: Expect Grid Ship to be #{expected}"
  begin
    actual = orders.grid.ship_from.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Ship From", expected, actual
      break if actual.eql? expected
      actual = orders.grid.ship_from.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Service to be (.+)$/ do |expected|
  log.info "Step: Expect Grid Service to be #{expected}"
  begin
    actual = orders.grid.service.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Service", expected, actual
      break if actual.eql? expected
      actual = orders.grid.service.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Insured Value to be (.+)$/ do |expected|
  log.info "Step: Expect Grid Insured Value to be #{expected}"
  begin
    actual = orders.grid.insured_value.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Insured Value", expected, actual
      break if actual.eql? expected
      actual = orders.grid.insured_value.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Reference No. to be (.+)$/ do |expected|

  log.info "Step: Expect Grid Reference No. to be #{expected}"
  begin
    actual = orders.grid.reference_no.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Reference No.", expected, actual
      break if actual.eql? expected
      actual = orders.grid.reference_no.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Cost Code to be (.+)$/ do |expected|
  log.info "Step: Expect Grid Cost Code to be #{expected}"
  begin
    actual = orders.grid.cost_code.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Cost Code", expected, actual
      break if actual.eql? expected
      actual = orders.grid.cost_code.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Order Status to be (.+)$/ do |expected|
  log.info "Step: Expect Grid Order Status to be #{expected}"
  begin
    actual = orders.grid.cost_code.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Order Status", expected, actual
      break if actual.eql? expected
      actual = orders.grid.cost_code.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Tracking Number is populated$/ do
  log.info "Expect Grid Tracking Number is populated"
  sleep 2
  actual = orders.grid.tracking_no.data @order_id
  20.times {
    log.info "Tracking number is #{actual}"
    break if actual.length > 3
    sleep 1
    actual = orders.grid.tracking_no.data @order_id
  }
  log.info "Test #{(actual.length > 3)?"Passed":"Failed"}"
  actual.length.should be > 3
end

Then /^Expect Order Status to be \"([\w ]*)\"$/ do |expected_value|
  log.info "Step: Expect Order Status to be #{expected_value}"
  actual = orders.grid.order_status.data @order_id
  log.info "Expect Order Status to be #{expected_value}.  Actual Value:  #{actual}.  Test #{(actual==expected_value)?'Passed':"Failed"}"
  actual.should eql expected_value
end

Then /^Expect Grid Order Total to be (.+)$/ do |expected|
  log.info "Step: Expect Grid Order Total to be #{expected}"
  begin
    actual = orders.grid.order_total.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Order Total", expected, actual
      break if actual.eql? expected
      actual = orders.grid.order_total.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Order details to be;$/ do |table|
  log.info "Step: Expect Order details to be..."
  expected_hash = table.hashes.first
  step "Expect Grid Insured Value to be $#{expected_hash[:insured_value]}"
  step "Expect Grid Weight to be #{expected_hash[:lbs]} lbs. #{expected_hash[:oz]} oz."
end

Then /^Expect Grid Insured Value to be \$(\d*\.?\d*)$/ do |expected|
  log.info "Step: Expect Grid Insured Value to be #{expected}"
  begin
    actual = test_helper.remove_dollar_sign orders.grid.insured_value.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Insurance", expected, actual
      break if actual.eql? expected
      actual = orders.grid.insured_value.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect new Order ID created$/ do
  log.info "Step: Expect new Order ID created"
  log.info "New Order ID created:  #{@order_id.to_i>0}"
  @order_id.to_i.should be > 0
end

Then /^Expect Order Details Order ID equals Grid order ID$/ do
  log.info "Step: Expect Order Details Order ID equals Grid order ID"
  grid_order_id = orders.grid.order_id.row 1
  single_order_form_order_id = orders.details.order_id
  log.info "Grid Order ID: #{grid_order_id}.  Order Details Form Order ID:  #{single_order_form_order_id}.  Test #{(grid_order_id==single_order_form_order_id) ? 'Passed' : 'Failed'}"
  grid_order_id.should eql single_order_form_order_id
end
