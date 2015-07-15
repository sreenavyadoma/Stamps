
# | name | company    | street_address      | city          | state | zip   | country       | phone       |  email
Then /^Expect Ship-To address to be;$/ do |table|
  param_hash = table.hashes.first
  step "Expect Recipient Name to be #{param_hash[:name]}"
  step "Expect Company Name to be #{param_hash[:company]}"
  step "Expect Street Address to be #{param_hash[:street_address]}"
  step "Expect City to be #{param_hash[:city]}"
  step "Expect State to be #{param_hash[:state]}"
  step "Expect Zip Code to be #{param_hash[:zip]}"
  step "Expect Phone to be #{param_hash[:phone]}"
  step "Expect Email to be #{param_hash[:email]}"
end

Then /^Expect Recipient Name to be (.*)$/ do |expected|
  begin
    actual = batch.grid.recipient(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Recipient Name", expected, actual
      break if actual.eql? expected
      actual = batch.grid.recipient(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end


Then /^Expect Company Name to be (.*)$/ do |expected|
  begin
    actual = batch.grid.company(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Company Name", expected, actual
      break if actual.eql? expected
      actual = batch.grid.company(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Street Address to be ([\w\s-]+)$/ do |expected|
  begin
    actual = batch.grid.street_address(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Street Address", expected, actual
      break if actual.eql? expected
      actual = batch.grid.street_address(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect City to be ([\w\s]+)$/ do |expected|
  begin
    actual = batch.grid.city(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. City", expected, actual
      break if actual.eql? expected
      actual = batch.grid.city(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect State to be ([a-zA-Z]+)$/ do |expected|
  begin
    actual = batch.grid.state(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. State", expected, actual
      break if actual.eql? expected
      actual = batch.grid.state(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Zip Code to be (\d+)$/ do |expected|
  begin
    actual = batch.grid.zip(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Zip", expected, actual
      break if actual.eql? expected
      actual = batch.grid.zip(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Email to be ([\S]+@[\S]+\.[a-z]{3})$/ do |expected|
  begin
    actual = batch.grid.email(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Email", expected, actual
      break if actual.eql? expected
      actual = batch.grid.email(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Phone to be ([\(]?[0-9]{3}[\)]?[\s]?[0-9]{3}[\s-]?[0-9]{4})$/ do |expected|
  begin
    actual = batch.grid.phone(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Phone", expected, actual
      break if actual.eql? expected
      actual = batch.grid.phone(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Pounds to be (\d+)$/ do |expected|
  begin
    actual = batch.grid.pounds(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Pounds", expected, actual
      break if actual.eql? expected
      actual = batch.grid.pounds(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Ounces to be (\d+)$/ do |expected|
  begin
    actual = batch.grid.ounces(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Ounces", expected, actual
      break if actual.eql? expected
      actual = batch.grid.ounces(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Weight to be (\d+) lbs. (\d+) oz.$/ do |pounds, ounces|
  expected = "#{pounds} lbs. #{ounces} oz."
  begin
    actual = batch.grid.weight(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Weight", expected, actual
      break if actual.eql? expected
      actual = batch.grid.weight(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

# | insured_value  | pounds  | ounces | length  | width | height  |
Then /^Expect Order details to be;$/ do |table|
  expected_hash = table.hashes.first
  step "Expect Insured Value to be $#{expected_hash[:insured_value]}"
  step "Expect Weight to be #{expected_hash[:pounds]} lbs. #{expected_hash[:ounces]} oz."
end

Then /^Expect Insured Value to be \$(\d*\.?\d*)$/ do |expected|
  begin
    actual = batch.grid.insured_value(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Insurance", expected, actual
      break if actual.eql? expected
      actual = batch.grid.insured_value(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect new Order ID created$/ do
  log Batch.order_id.to_i
end

Then /^Expect Ship Cost to be \$([0-9.]*)$/ do |expected|
  begin
    actual = batch.grid.ship_cost(Batch.order_id)
    10.times { |counter|
      sleep(2)
      log_expectation_eql "#{counter}. Ship Cost", expected, actual
      break if actual.eql? expected
      actual = batch.grid.ship_cost(Batch.order_id)
    }
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect \$([0-9.]*) is deducted from customer balance if printing is successful$/ do |expected|
  log_param "Old Balance", @old_balance
  @new_balance = batch.navigation_bar.balance
  stat = @old_balance == @new_balance + expected.to_f
  log stat
  @old_balance.should == @new_balance + expected.to_f
end

Then /^Expect Grid Ship Cost is deducted from customer balance if printing is successful$/ do

end
