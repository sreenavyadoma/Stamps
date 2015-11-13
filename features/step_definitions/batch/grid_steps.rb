When /^Edit row (\d+) on the order grid$/ do |row|
  log.info "Step: Edit row #{row} on the order grid"
  batch.grid.checkbox.check row
  #end_step step
end

When /^Uncheck row (\d+) on the order grid$/ do |row|
  log.info "Step: Uncheck row #{row} on the order grid"
  batch.grid.checkbox.uncheck row
  #end_step step
end

Then /^Expect Ship-To address to be;$/ do |table|
  log.info "Expectation: Expect Ship-To address to be..."
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

Then /^List all Grid column values for row (\d+)/ do |row|
  log.info "Step: List all Grid column values for row #{row}"
  order_id = batch.grid.order_id.row row
  step "List all Grid column values for Order ID #{order_id}"
end

Then /^List all Grid column values for Order ID (\w+)$/ do |order_id|
  log.info "Step: List all Grid column values for Order ID #{order_id}"
  @grid = batch.grid

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

Then /^Expect Grid Age to be (.*)$/ do |expected|
  log.info "Expectation: Expect Grid Age to be #{expected}"
  begin
    if @order_id.nil?
      @order_id = batch.grid.order_id.row 1
    end
    actual = batch.grid.age @order_id
    5.times { |counter|
      sleep(1)
      #log_expectation_eql "#{counter}. Age", expected, actual
      break if actual.eql? expected
      actual = batch.grid.age @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Order Date to be (.*)$/ do |expected|
  log.info "Expectation: Expect Grid Order Date to be #{expected}"
  begin
    if @order_id.nil?
      @order_id = batch.grid.order_id.row 1
    end
    actual = batch.grid.order_date @order_id
    5.times { |counter|
      sleep(1)
      #log_expectation_eql "#{counter}. Order Date", expected, actual
      break if actual.eql? expected
      actual = batch.grid.order_date @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Recipient to be (.*)$/ do |expected|
  log.info "Expectation: Expect Grid Recipient to be #{expected}"
  begin
    if @order_id.nil?
      @order_id = batch.grid.order_id.row 1
    end
    actual = batch.grid.recipient.data @order_id
    5.times { |counter|
      sleep(1)
      #log_expectation_eql "#{counter}. Recipient Name", expected, actual
      break if actual.eql? expected
      actual = batch.grid.recipient.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Company to be (.*)$/ do |expected|
  log.info "Expectation: Expect Grid Company to be #{expected}"
  begin
    actual = batch.grid.company.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Company Name", expected, actual
      break if actual.eql? expected
      actual = batch.grid.company.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Address to be ([\w\s-]+)$/ do |expected|
  log.info "Expectation: Expect Grid Address to be #{expected}"
  begin
    actual = batch.grid.address.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Street Address", expected, actual
      break if actual.eql? expected
      actual = batch.grid.address.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Expectation City to be ([\w\s]+)$/ do |expected|
  log.info "Expectation: Expect Grid City to be #{expected}"
  begin
    actual = batch.grid.city.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. City", expected, actual
      break if actual.eql? expected
      actual = batch.grid.city.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid State to be ([a-zA-Z]+)$/ do |expected|
  log.info "Expectation: Expect Grid State to be #{expected}"
  begin
    actual = batch.grid.state.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. State", expected, actual
      break if actual.eql? expected
      actual = batch.grid.state.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Zip to be ([\d -]+)$/ do |expected|
  log.info "Expectation: Expect Grid Zip to be #{expected}"
  begin
    actual = batch.grid.zip.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Zip", expected, actual
      break if actual.eql? expected
      actual = batch.grid.zip.data @order_id
    }
    actual.should include expected
  end unless expected.length == 0
end

Then /^Expect Grid Country to be ([a-zA-Z]+)$/ do |expected|
  log.info "Expectation: Expect Grid Country to be #{expected}"
  begin
    actual = batch.grid.country.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Country", expected, actual
      break if actual.eql? expected
      actual = batch.grid.country.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Email to be ([\S]+@[\S]+\.[a-z]{3})$/ do |expected|
  log.info "Expectation: Expect Grid Email to be #{expected}"
  begin
    actual = batch.grid.country.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Email", expected, actual
      break if actual.eql? expected
      actual = batch.grid.country.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Phone to be ([\(]?[0-9]{3}[\)]?[\s]?[0-9]{3}[\s-]?[0-9]{4})$/ do |expected|
  log.info "Expectation: Expect Grid Phone to be #{expected}"
  begin
    actual = batch.grid.phone.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Phone", expected, actual
      break if actual.eql? expected
      actual = batch.grid.phone.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Pounds to be (\d+)$/ do |expected|
  log.info "Expectation: Expect Grid Pounds to be #{expected}"
  begin
    actual = batch.grid.weight.lbs @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Pounds", expected, actual
      break if actual.eql? expected
      actual = batch.grid.weight.lbs @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Ounces to be (\d+)$/ do |expected|
  log.info "Expectation: Expect Grid Ounces to be #{expected}"
  begin
    actual = batch.grid.weight.oz @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Ounces", expected, actual
      break if actual.eql? expected
      actual = batch.grid.weight.oz @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Weight to be (\d+) lbs. (\d+) oz.$/ do |pounds, ounces|
  expected_result = "#{pounds} lbs. #{ounces} oz."
  log.info "Expectation: Expect Grid Weight to be #{expected_result}"
  begin
    actual = batch.grid.weight.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Weight", expected, actual
      break if actual.eql? expected_result
      actual = batch.grid.weight.data @order_id
    }
    actual.should eql expected_result
  end unless expected_result.length == 0
end

Then /^Expect Grid Qty. to be (.+)$/ do |expected|
  log.info "Expectation: Expect Grid Qty. to be #{expected}"
  begin
    actual = batch.grid.qty.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Qty.", expected, actual
      break if actual.eql? expected
      actual = batch.grid.qty.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Item SKU to be (.+)$/ do |expected|
  log.info "Expectation: Expect Grid SKU to be #{expected}"
  begin
    actual = batch.grid.item_sku.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Item SKU", expected, actual
      break if actual.eql? expected
      actual = batch.grid.item_sku.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Item Name to be (.+)$/ do |expected|
  log.info "Expectation: Expect Grid Name to be #{expected}"
  begin
    actual = batch.grid.item_name.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Item Name", expected, actual
      break if actual.eql? expected
      actual = batch.grid.item_name.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Ship From to be (.+)$/ do |expected|
  log.info "Expectation: Expect Grid Ship to be #{expected}"
  begin
    actual = batch.grid.ship_from.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Ship From", expected, actual
      break if actual.eql? expected
      actual = batch.grid.ship_from.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Service to be (.+)$/ do |expected|
  log.info "Expectation: Expect Grid Service to be #{expected}"
  begin
    actual = batch.grid.service.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Service", expected, actual
      break if actual.eql? expected
      actual = batch.grid.service.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Insured Value to be (.+)$/ do |expected|
  log.info "Expectation: Expect Grid Insured Value to be #{expected}"
  begin
    actual = batch.grid.insured_value.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Insured Value", expected, actual
      break if actual.eql? expected
      actual = batch.grid.insured_value.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Reference No. to be (.+)$/ do |expected|

  log.info "Expectation: Expect Grid Reference No. to be #{expected}"
  begin
    actual = batch.grid.reference_no.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Reference No.", expected, actual
      break if actual.eql? expected
      actual = batch.grid.reference_no.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Cost Code to be (.+)$/ do |expected|
  log.info "Expectation: Expect Grid Cost Code to be #{expected}"
  begin
    actual = batch.grid.cost_code.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Cost Code", expected, actual
      break if actual.eql? expected
      actual = batch.grid.cost_code.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Order Status to be (.+)$/ do |expected|
  log.info "Expectation: Expect Grid Order Status to be #{expected}"
  begin
    actual = batch.grid.cost_code.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Order Status", expected, actual
      break if actual.eql? expected
      actual = batch.grid.cost_code.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Ship Date to be (.+)$/ do |expected|
  log.info "Expectation: Expect Grid Ship Date to be #{expected}"
  begin
    actual = batch.grid.cost_code.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Ship Date", expected, actual
      break if actual.eql? expected
      actual = batch.grid.cost_code.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Tracking # to be (.+)$/ do |expected|
  log.info "Expectation: Expect Grid Tracking # to be #{expected}"
  begin
    actual = batch.grid.tracking_no.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Tracking #", expected, actual
      break if actual.eql? expected
      actual = batch.grid.tracking_no.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Grid Order Total to be (.+)$/ do |expected|
  log.info "Expectation: Expect Grid Order Total to be #{expected}"
  begin
    actual = batch.grid.order_total.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Order Total", expected, actual
      break if actual.eql? expected
      actual = batch.grid.order_total.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Order details to be;$/ do |table|
  log.info "Expectation: Expect Order details to be..."
  expected_hash = table.hashes.first
  step "Expect Grid Insured Value to be $#{expected_hash[:insured_value]}"
  step "Expect Grid Weight to be #{expected_hash[:lbs]} lbs. #{expected_hash[:oz]} oz."
end

Then /^Expect Grid Insured Value to be \$(\d*\.?\d*)$/ do |expected|
  log.info "Expectation: Expect Grid Insured Value to be #{expected}"
  begin
    actual = batch.grid.insured_value.data @order_id
    10.times { |counter|
      sleep(2)
      #log_expectation_eql "#{counter}. Insurance", expected, actual
      break if actual.eql? expected
      actual = batch.grid.insured_value.data @order_id
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect new Order ID created$/ do
  log.info "Expectation: Expect new Order ID created"
  log.info "New Order ID created:  #{@order_id.to_i>0}"
  @order_id.to_i.should be > 0
end

Then /^Expect Order Details Form Order ID equals Grid order ID$/ do
  log.info "Expectation: Expect Order Details Form Order ID equals Grid order ID"
  grid_order_id = batch.grid.order_id.row 1
  single_order_form_order_id = batch.order_details.order_id
  log.info "Grid Order ID: #{grid_order_id}.  Order Details Form Order ID:  #{single_order_form_order_id}.  Test #{(grid_order_id==single_order_form_order_id) ? 'Passed' : 'Failed'}"
  grid_order_id.should eql single_order_form_order_id
end
