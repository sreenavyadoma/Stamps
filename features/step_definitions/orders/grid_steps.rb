
Then /^Grid: Check Order ID (.*)$/ do |order_id|
  logger.info "Grid: Check Order ID #{order_id}"
  @order_id = order_id
  # Check if Order ID exists, fail test if it does not
  exists = web_apps.orders.grid.order_id.exist? @order_id
  expectation = "exists"
  expectation = "does not exists" unless exists
  expectation.should eql "exists"
  logger.info "Order ID #{@order_id} #{expectation}!"
  web_apps.orders.grid.checkbox.check_order_id @order_id
end

Then /^Grid: Expect Store Name to be (.*)$/ do |expectation|
  logger.info "Grid: Expect Store Name to be #{expectation}"
  @store_name = (expectation.downcase.include? "random")?@store_name:expectation
  actual_value = web_apps.orders.grid.store.data @order_id
  logger.info "Test #{(actual_value==@store_name)?"Passed":"Failed"}"
  @store_name.should eql actual_value
end

Then /^Set Orders Grid Row (\d+) to uncheck$/ do |row|
  logger.info "Set Orders Grid Row #{row} to uncheck"
  web_apps.orders.grid.checkbox.uncheck row
end

Then /^Set Orders Grid Row (\d+) to check$/ do |row|
  logger.info "Set Orders Grid Row #{row} to check"
  web_apps.orders.grid.checkbox.check row
end

When /^Edit Orders Grid row (\d+)$/ do |row|
  logger.info "Edit row #{row} on the Orders Grid"
  web_apps.orders.grid.checkbox.check row
end

When /^Grid: Check row (\d+)$/ do |row|
  logger.info "Edit Orders Grid row #{row}"
  web_apps.orders.grid.checkbox.check row
end

When /^Grid: Uncheck row (\d+)$/ do |row|
  logger.info "Uncheck row #{row} on the Orders Grid"
  web_apps.orders.grid.checkbox.uncheck row
end

Then /^Grid: Uncheck New Order ID$/ do
  logger.info "Grid: Uncheck New Order ID"
  web_apps.orders.grid.checkbox.uncheck_order_id @order_id
end

Then /^Grid: Check New Order ID$/ do
  logger.info "Grid: Check New Order ID"
  web_apps.orders.grid.checkbox.check_order_id @order_id
end

Then /^Grid: Check Environment Order ID$/ do
  @order_id = (ENV['ORDER_ID'].nil?)?"":ENV['ORDER_ID']
  expectation = "ENV['ORDER_ID'] is not nil"
  expectation = "ENV['ORDER_ID'] is nil! This test needs a value for this variable." if @order_id.size == 0
  expectation.should eql "ENV['ORDER_ID'] is not nil"

  logger.info "Grid: Check Order ID #{@order_id}"
  step "Grid: Check Order ID #{@order_id}"
end

Then /^Grid: Expect Date Printed for this order to be today$/ do
  logger.info "Grid: Expect Date Printed for this order to be today"
  grid = web_apps.orders.filter.shipped
  grid.order_id.sort_descending
  grid_print_date = grid.date_printed.data @order_id # Dec 3
  expectation_print_date = Date.today.strftime "%b %-d"

  logger.info "Order ID:  #{@order_id} - Orders Grid Date Printed:  #{grid_print_date} - Today's date:  #{expectation_print_date}"
  logger.info "Test #{(grid_print_date==expectation_print_date)?"Passed":"Failed"}"
  grid_print_date.should eql expectation_print_date
end

Then /^Grid: Expect Ship Date for this order to be today$/ do
  logger.info "Grid: Expect Ship Date for this order to be today"
  step "Grid: Expect Ship Date for this order to be today plus 0"
end

Then /^Grid: Expect Ship Date for this order to be today plus (\d+)$/ do |day|
  logger.info "Grid: Expect Ship Date for this order to be today plus #{day}"
  expectation_ship_date = ParameterHelper.mmddyy_to_mondd @ship_date

  grid = web_apps.orders.filter.shipped

  10.times{
    grid.order_id.sort_descending
    grid_ship_date = grid.ship_date.data @order_id # Dec 3
    logger.info "Order ID:  #{@order_id} - Print Modal Saved Ship Date: #{@ship_date} - Orders Grid Ship Date:  #{grid_ship_date}"

    break if grid_ship_date == expectation_ship_date
  }

  grid_ship_date = grid.ship_date.data @order_id
  logger.info "Test #{(grid_ship_date==expectation_ship_date)?"Passed":"Failed"}"
  grid_ship_date.should eql expectation_ship_date
end

Then /^List all Grid column values for row (\d+)/ do |row|
  logger.info "List all Grid column values for row #{row}"
  order_id = web_apps.orders.grid.order_id.row row
  step "List all Grid column values for Order ID #{order_id}"
end

Then /^List all Grid column values for Order ID (\w+)$/ do |order_id|
  logger.info "List all Grid column values for Order ID #{order_id}"
  @grid = web_apps.orders.grid

  row2_order_id = @grid.order_id.row 2
  logger.info @grid.checkbox.order_id_checked? row2_order_id

  @grid.checkbox.check 1
  logger.info @grid.checkbox.checked? 1
  @grid.checkbox.check 2
  logger.info @grid.checkbox.checked? 2
  @grid.checkbox.check 3
  logger.info @grid.checkbox.checked? 3

  @grid.checkbox.uncheck 1
  logger.info @grid.checkbox.checked? 1
  @grid.checkbox.uncheck 2
  logger.info @grid.checkbox.checked? 2
  @grid.checkbox.uncheck 3
  logger.info @grid.checkbox.checked? 3

  @grid.checkbox.check 2
  logger.info @grid.checkbox.checked? 2
  @grid.checkbox.check 4
  logger.info @grid.checkbox.checked? 4
  @grid.checkbox.check 6
  logger.info @grid.checkbox.checked? 6

  checked_hash = @grid.checkbox.checked_rows

  @grid.checkbox.check_all
  @grid.checkbox.uncheck_all

  @grid.checkbox.check_all checked_hash

  logger.info @grid.item_name.data order_id
  logger.info @grid.ship_cost.data order_id
  logger.info @grid.age.data order_id
  logger.info @grid.order_date.data order_id
  logger.info @grid.recipient.data order_id
  logger.info @grid.company.data order_id
  logger.info @grid.address.data order_id
  logger.info @grid.city.data order_id
  logger.info @grid.state.data order_id
  logger.info @grid.zip.data order_id
  logger.info @grid.country.data order_id
  logger.info @grid.phone.data order_id
  logger.info @grid.email.data order_id
  logger.info @grid.qty.data order_id
  logger.info @grid.item_sku.data order_id
  logger.info @grid.ship_from.data order_id
  logger.info @grid.service.data order_id
  logger.info @grid.weight.data order_id
  logger.info @grid.insured_value.data order_id
  logger.info @grid.reference_no.data order_id
  logger.info @grid.cost_code.data order_id
  logger.info @grid.order_status.data order_id
  logger.info @grid.ship_date.data order_id
  logger.info @grid.tracking_no.data order_id
  logger.info @grid.order_total.data order_id

end

Then /^Expect Ship-To address to be;$/ do |table|
  logger.info "Expect Ship-To address to be..."
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
  logger.info "Grid: Expect Age to be #{expectation}"
  begin
    if @order_id.nil?
      @order_id = web_apps.orders.grid.order_id.row 1
    end
    actual = web_apps.orders.grid.age.data @order_id
    5.times do
      break if actual.eql? expectation
      actual = web_apps.orders.grid.age.data @order_id
     end
    actual = web_apps.orders.grid.age.data @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Order Date to be (.*)$/ do |expectation|
  logger.info "Grid: Expect Order Date to be #{expectation}"
  begin
    if @order_id.nil?
      @order_id = web_apps.orders.grid.order_id.row 1
    end
    5.times do
      actual = web_apps.orders.grid.order_date.data @order_id
      break if actual.eql? expectation
     end
    actual = web_apps.orders.grid.order_date.data @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Recipient to be (.*)$/ do |expectation|
  logger.info "Grid: Expect Recipient to be #{expectation}"
  begin
    if @order_id.nil?
      @order_id = web_apps.orders.grid.order_id.row 1
    end
    10.times do
      actual = web_apps.orders.grid.recipient.data @order_id
      break if actual.eql? expectation
     end
    actual = web_apps.orders.grid.recipient.data @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Company to be (.*)$/ do |expectation|
  logger.info "Grid: Expect Company to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.company.data @order_id
      break if actual.eql? expectation
     end
    actual = web_apps.orders.grid.company.data @order_id
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Address to be ([\w\s-]+)$/ do |expectation|
  logger.info "Grid: Expect Address to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.address.data @order_id
      break if actual.eql? expectation
     end
    actual = web_apps.orders.grid.address.data @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect City to be ([\w\s]+)$/ do |expectation|
  logger.info "Grid: Expect City to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.city.data @order_id
      break if actual.eql? expectation
     end
    actual = web_apps.orders.grid.city.data @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect State to be ([a-zA-Z]+)$/ do |expectation|
  logger.info "Grid: Expect State to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.state.data @order_id
      break if actual.eql? expectation
     end
    actual = web_apps.orders.grid.state.data @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Zip to be ([\d -]+)$/ do |expectation|
  logger.info "Grid: Expect Zip to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.zip.data @order_id
      break if actual.eql? expectation
     end
    actual = web_apps.orders.grid.zip.data @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should include expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Country to be ([a-zA-Z]+)$/ do |expectation|
  logger.info "Grid: Expect Country to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.country.data @order_id
      break if actual.eql? expectation
     end
    actual = web_apps.orders.grid.country.data @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Column (\w+) appears to left of (\w+)$/ do |left_column, right_column|
  logger.info "Grid: Expect Column #{left_column} appears to left of #{right_column}"
  is_next_to = web_apps.orders.grid.column.is_next_to? left_column, right_column
  expectation = "true"
  expectation =  "false" unless is_next_to
  logger.info "Test #{(expectation=="true")?"Passed":"Failed"}"
  expectation.should eql "true"
end

Then /^Grid: Expect Email to be ([\S]+@[\S]+\.[a-z]{3})$/ do |expectation|
  logger.info "Grid: Expect Email to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.country.data @order_id
      break if actual.eql? expectation
     end
    actual = web_apps.orders.grid.country.data @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Phone to be ([\(]?[0-9]{3}[\)]?[\s]?[0-9]{3}[\s-]?[0-9]{4})$/ do |expectation|
  logger.info "Grid: Expect Phone to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.phone.data @order_id
      break if actual.eql? expectation
     end
    actual = web_apps.orders.grid.phone.data @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Pounds to be (\d+)$/ do |expectation|
  logger.info "Grid: Expect Pounds to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.weight.lbs @order_id
      break if actual.eql? expectation
     end
    actual = web_apps.orders.grid.weight.lbs @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Ounces to be (\d+)$/ do |expectation|
  logger.info "Grid: Expect Ounces to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.weight.oz @order_id
      break if actual.eql? expectation
     end
    actual = web_apps.orders.grid.weight.oz @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Weight to be (\d+) lbs. (\d+) oz.$/ do |pounds, ounces|
  expectation_result = "#{pounds} lbs. #{ounces} oz."
  logger.info "Grid: Expect Weight to be #{expectation_result}"
  begin
    10.times do
      actual = web_apps.orders.grid.weight.data @order_id
      break if actual.eql? expectation_result
     end
    actual = web_apps.orders.grid.weight.data @order_id
    logger.info "Test #{(actual==expectation_result)?"Passed":"Failed"}"
    actual.should eql expectation_result
  end unless expectation_result.length == 0
end

Then /^Grid: Expect Weight\(lbs\) to be (.*)$/ do |expectation|
  logger.info "Grid: Expect Weight(lbs) to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.weight.lbs @order_id
      break if actual.eql? expectation
    end
    actual = web_apps.orders.grid.weight.lbs @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Weight\(oz\) to be (.*)$/ do |expectation|
  logger.info "Grid: Expect Weight(oz) to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.weight.oz @order_id
      break if actual.eql? expectation
    end
    actual = web_apps.orders.grid.weight.oz @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Qty. to be (.+)$/ do |expectation|
  logger.info "Grid: Expect Qty. to be #{expectation}"
  begin
    actual = web_apps.orders.grid.qty.data @order_id
    10.times do
      sleep 1
      break if actual.eql? expectation
      actual = web_apps.orders.grid.qty.data @order_id
     end
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Item SKU to be (.+)$/ do |expectation|
  logger.info "Grid: Expect SKU to be #{expectation}"
  begin
    actual = web_apps.orders.grid.item_sku.data @order_id
    10.times do 
      sleep 1
      break if actual.eql? expectation
      actual = web_apps.orders.grid.item_sku.data @order_id
     end
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Item Name to be (.+)$/ do |expectation|
  logger.info "Grid: Expect Name to be #{expectation}"
  begin
    actual = web_apps.orders.grid.item_name.data @order_id
    10.times do 
      sleep 1
      break if actual.eql? expectation
      actual = web_apps.orders.grid.item_name.data @order_id
     end
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Ship From to be (.+)$/ do |expectation|
  logger.info "Grid: Expect Ship to be #{expectation}"
  begin
    actual = web_apps.orders.grid.ship_from.data @order_id
    10.times do
      sleep 1
      break if actual.eql? expectation
      actual = web_apps.orders.grid.ship_from.data @order_id
     end
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Service to be (.+)$/ do |expectation|
  logger.info "Grid: Expect Service to be #{expectation}"
  actual = web_apps.orders.grid.service.data @order_id
  10.times do
    sleep 1
    break if actual.eql? expectation
    actual = web_apps.orders.grid.service.data @order_id
  end
  logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
  actual.should eql expectation
end

Then /^Grid: Expect Insured Value to be \$(.+)$/ do |expectation|
  logger.info "Grid: Expect Insured Value to be #{expectation}"
  begin
    actual = web_apps.orders.grid.insured_value.data @order_id
    10.times do
      sleep 1
      break if actual.eql? expectation
      actual = web_apps.orders.grid.insured_value.data @order_id
     end
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Reference No. to be (.+)$/ do |expectation|

  logger.info "Grid: Expect Reference No. to be #{expectation}"
  begin
    actual = web_apps.orders.grid.reference_no.data @order_id
    10.times do
      sleep 1
      break if actual.eql? expectation
      actual = web_apps.orders.grid.reference_no.data @order_id
     end
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Cost Code to be (.+)$/ do |expectation|
  logger.info "Grid: Expect Cost Code to be #{expectation}"
  begin
    actual = web_apps.orders.grid.cost_code.data @order_id
    10.times do
      sleep 1
      break if actual.eql? expectation
      actual = web_apps.orders.grid.cost_code.data @order_id
     end
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Order Status to be (.+)$/ do |expectation|
  logger.info "Grid: Expect Order Status to be #{expectation}"
  begin
    10.times do
      actual = web_apps.orders.grid.order_status.data @order_id
      sleep 1
      break if actual == expectation
    end

    actual = web_apps.orders.grid.order_status.data @order_id
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Grid: Expect Tracking Number is populated$/ do
  logger.info "Grid: Expect Tracking Number is populated"
  sleep 2
  actual = web_apps.orders.grid.tracking_no.data @order_id
  20.times do
    logger.info "Tracking number is #{actual}"
    break if actual.length > 3
    sleep 1
    actual = web_apps.orders.grid.tracking_no.data @order_id
  end
  logger.info "Test #{(actual.length > 3)?"Passed":"Failed"}"
  actual.length.should be > 3
end

Then /^Grid: Expect Order Total to be (.+)$/ do |expectation|
  logger.info "Grid: Expect Order Total to be #{expectation}"
  begin
    actual = web_apps.orders.grid.order_total.data @order_id
    10.times do
      sleep 1
      break if actual.eql? expectation
      actual = web_apps.orders.grid.order_total.data @order_id
     end
    logger.info "Test #{(actual==expectation)?"Passed":"Failed"}"
    actual.should eql expectation
  end unless expectation.length == 0
end

Then /^Expect Order details to be;$/ do |table|
  logger.info "Expect Order details to be..."
  expectation_hash = table.hashes.first
  step "Grid: Expect Insured Value to be $#{expectation_hash[:insured_value]}"
  step "Grid: Expect Weight to be #{expectation_hash[:lbs]} lbs. #{expectation_hash[:oz]} oz."
end

Then /^Expect new Order ID created$/ do
  logger.info "Expect new Order ID created"
  logger.info "New Order ID created:  #{@order_id.to_i>0}"
  @order_id.to_i.should be > 0
end

Then /^Details: Expect Order ID equals Grid order ID$/ do
  logger.info "Details: Expect Order ID equals Grid order ID"
  grid_order_id = web_apps.orders.grid.order_id.row 1
  single_order_form_order_id = web_apps.orders.details.order_id
  logger.info "Grid Order ID: #{grid_order_id}.  Order Details Form Order ID:  #{single_order_form_order_id}.  Test #{(grid_order_id==single_order_form_order_id) ? 'Passed' : 'Failed'}"
  grid_order_id.should eql single_order_form_order_id
end
