
When /^Edit row (\d+) on the order grid$/ do |row|
  log "Edit row \"#{row}\" on the order grid"
  batch.grid.check_row row
  #end_step step
end

When /^Uncheck row (\d+) on the order grid$/ do |row|
  log "Uncheck row \"#{row}\" on the order grid"
  batch.grid.uncheck_row row
  #end_step step
end

# | name | company    | street_address      | city          | state | zip   | country       | phone       |  email
Then /^Expect Ship-To address to be;$/ do |table|
  param_hash = table.hashes.first
  step "Expect order-grid Recipient to be #{param_hash[:name]}"
  step "Expect order-grid Company to be #{param_hash[:company]}"
  step "Expect order-grid Address to be #{param_hash[:domestic]}"
  step "Expect order-grid City to be #{param_hash[:city]}"
  step "Expect order-grid State to be #{param_hash[:state]}"
  step "Expect order-grid Zip to be #{param_hash[:zip]}"
  step "Expect order-grid Phone to be #{param_hash[:phone]}"
  step "Expect order-grid Email to be #{param_hash[:email]}"
end

Then /^Output all Grid values for row (\d+)$/ do |order_id|
  log batch.grid.ship_cost order_id
  log batch.grid.age order_id
  log batch.grid.order_id 1
  log batch.grid.order_date order_id
  log batch.grid.recipient order_id
  log batch.grid.company order_id
  log batch.grid.domestic order_id
  log batch.grid.city order_id
  log batch.grid.state order_id
  log batch.grid.zip order_id
  log batch.grid.country order_id
  log batch.grid.phone order_id
  log batch.grid.email order_id
  log batch.grid.qty order_id
  log batch.grid.item_sku order_id
  log batch.grid.item_name order_id
  log batch.grid.ship_from order_id
  log batch.grid.service order_id
  log batch.grid.weight order_id
  log batch.grid.insured_value order_id
  log batch.grid.reference_no order_id
  log batch.grid.cost_code order_id
  log batch.grid.order_status order_id
  log batch.grid.ship_date order_id
  log batch.grid.tracking order_id
  log batch.grid.order_total order_id
end

Then /^Expect order-grid Age to be (.*)$/ do |expected|
  begin
    if @order_id.nil?
      @order_id = batch.grid.order_id 1
    end
    actual = batch.grid.age @order_id
    5.times { |counter|
      sleep(1)
      log_expectation_eql "#{counter}. Age", expected, actual
      break if actual.eql? expected
      actual = batch.grid.age @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Order Date to be (.*)$/ do |expected|
  begin
    if @order_id.nil?
      @order_id = batch.grid.order_id 1
    end
    actual = batch.grid.order_date @order_id
    5.times { |counter|
      sleep(1)
      log_expectation_eql "#{counter}. Order Date", expected, actual
      break if actual.eql? expected
      actual = batch.grid.order_date @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Recipient to be (.*)$/ do |expected|
  begin
    if @order_id.nil?
      @order_id = batch.grid.order_id 1
    end
    actual = batch.grid.recipient @order_id
    5.times { |counter|
      sleep(1)
      log_expectation_eql "#{counter}. Recipient Name", expected, actual
      break if actual.eql? expected
      actual = batch.grid.recipient @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Company to be (.*)$/ do |expected|
  begin
    actual = batch.grid.company @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Company Name", expected, actual
      break if actual.eql? expected
      actual = batch.grid.company @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Address to be ([\w\s-]+)$/ do |expected|
  begin
    actual = batch.grid.domestic @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Street Address", expected, actual
      break if actual.eql? expected
      actual = batch.grid.domestic @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid City to be ([\w\s]+)$/ do |expected|
  begin
    actual = batch.grid.city @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. City", expected, actual
      break if actual.eql? expected
      actual = batch.grid.city @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid State to be ([a-zA-Z]+)$/ do |expected|
  begin
    actual = batch.grid.state @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. State", expected, actual
      break if actual.eql? expected
      actual = batch.grid.state @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Zip to be ([\d -]+)$/ do |expected|
  begin
    actual = batch.grid.zip @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Zip", expected, actual
      break if actual.eql? expected
      actual = batch.grid.zip @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Country to be ([a-zA-Z]+)$/ do |expected|
  begin
    actual = batch.grid.country @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Country", expected, actual
      break if actual.eql? expected
      actual = batch.grid.country @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Email to be ([\S]+@[\S]+\.[a-z]{3})$/ do |expected|
  begin
    actual = batch.grid.email @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Email", expected, actual
      break if actual.eql? expected
      actual = batch.grid.email @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Phone to be ([\(]?[0-9]{3}[\)]?[\s]?[0-9]{3}[\s-]?[0-9]{4})$/ do |expected|
  begin
    actual = batch.grid.phone @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Phone", expected, actual
      break if actual.eql? expected
      actual = batch.grid.phone @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Pounds to be (\d+)$/ do |expected|
  begin
    actual = batch.grid.lbs @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Pounds", expected, actual
      break if actual.eql? expected
      actual = batch.grid.lbs @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Ounces to be (\d+)$/ do |expected|
  begin
    actual = batch.grid.oz @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Ounces", expected, actual
      break if actual.eql? expected
      actual = batch.grid.oz @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Weight to be (\d+) lbs. (\d+) oz.$/ do |pounds, ounces|
  expected = "#{pounds} lbs. #{ounces} oz."
  begin
    actual = batch.grid.weight @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Weight", expected, actual
      break if actual.eql? expected
      actual = batch.grid.weight @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Qty. to be (.+)$/ do |expected|
  begin
    actual = batch.grid.qty @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Qty.", expected, actual
      break if actual.eql? expected
      actual = batch.grid.qty @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Item SKU to be (.+)$/ do |expected|
  begin
    actual = batch.grid.item_sku @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Item SKU", expected, actual
      break if actual.eql? expected
      actual = batch.grid.item_sku @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Item Name to be (.+)$/ do |expected|
  begin
    actual = batch.grid.item_name @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Item Name", expected, actual
      break if actual.eql? expected
      actual = batch.grid.item_name @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Ship From to be (.+)$/ do |expected|
  begin
    actual = batch.grid.ship_from @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Ship From", expected, actual
      break if actual.eql? expected
      actual = batch.grid.ship_from @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Service to be (.+)$/ do |expected|
  begin
    actual = batch.grid.service @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Service", expected, actual
      break if actual.eql? expected
      actual = batch.grid.service @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Insured Value to be (.+)$/ do |expected|
  begin
    actual = batch.grid.insured_value @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Insured Value", expected, actual
      break if actual.eql? expected
      actual = batch.grid.insured_value @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Reference No. to be (.+)$/ do |expected|
  begin
    actual = batch.grid.reference_no @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Reference No.", expected, actual
      break if actual.eql? expected
      actual = batch.grid.reference_no @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Cost Code to be (.+)$/ do |expected|
  begin
    actual = batch.grid.cost_code @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Cost Code", expected, actual
      break if actual.eql? expected
      actual = batch.grid.cost_code @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Order Status to be (.+)$/ do |expected|
  begin
    actual = batch.grid.order_status @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Order Status", expected, actual
      break if actual.eql? expected
      actual = batch.grid.order_status @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Ship Date to be (.+)$/ do |expected|
  begin
    actual = batch.grid.ship_date @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Ship Date", expected, actual
      break if actual.eql? expected
      actual = batch.grid.ship_date @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Tracking # to be (.+)$/ do |expected|
  begin
    actual = batch.grid.tracking @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Tracking #", expected, actual
      break if actual.eql? expected
      actual = batch.grid.tracking @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect order-grid Order Total to be (.+)$/ do |expected|
  begin
    actual = batch.grid.order_total @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Order Total", expected, actual
      break if actual.eql? expected
      actual = batch.grid.order_total @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

# | insured_value  | pounds  | ounces | length  | width | height  |
Then /^Expect Order details to be;$/ do |table|
  expected_hash = table.hashes.first
  step "Expect order-grid Insured Value to be $#{expected_hash[:insured_value]}"
  step "Expect order-grid Weight to be #{expected_hash[:lbs]} lbs. #{expected_hash[:oz]} oz."
end

Then /^Expect order-grid Insured Value to be \$(\d*\.?\d*)$/ do |expected|
  begin
    actual = batch.grid.insured_value @order_id
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Insurance", expected, actual
      break if actual.eql? expected
      actual = batch.grid.insured_value @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect new Order ID created$/ do
  log "New Order ID created:  #{@order_id.to_i>0}"
  @order_id.to_i.should be > 0
end

Then /^Expect single-order form Order ID equals Grid order ID$/ do
  grid_order_id = batch.grid.order_id 1
  single_order_form_order_id = batch.single_order_form.order_id
  log "Grid Order ID: #{grid_order_id}.  single-order form Order ID:  #{single_order_form_order_id}.  Test #{(grid_order_id==single_order_form_order_id)?'Passed':'Failed'}"
  grid_order_id.should eql single_order_form_order_id
end


