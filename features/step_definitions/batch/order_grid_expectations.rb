
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
  actual = batch.grid.recipient(Batch.order_id)
  log_expectation_eql "Recipient Name", expected, actual
  actual.should eql expected
end

Then /^Expect Company Name to be (.*)$/ do |expected|
  #begin_step step =  "Expect Company Name to be \"#{expected}\""
  actual = batch.grid.company(Batch.order_id)
  log_expectation_eql "Company Name", expected, actual
  expect(actual).to eql expected
  #end_step step
end

Then /^Expect Street Address to be ([\w\s-]+)$/ do |expected|
  actual = batch.grid.street_address(Batch.order_id)
  log_expectation_eql "Street Address", expected, actual
  actual.should eql expected
end

Then /^Expect City to be ([\w\s]+)$/ do |expected|
  #begin_step step =  "Expect City to be \"#{expected}\""
  actual = batch.grid.city(Batch.order_id)
  log_expectation_eql "City", expected, actual
  actual.should eql expected
end

Then /^Expect State to be ([a-zA-Z]+)$/ do |expected|
  actual = batch.grid.state(Batch.order_id)
  log_expectation_eql "State", expected, actual
  actual.should eql expected
end

Then /^Expect Zip Code to be ([0-9]+)$/ do |expected|
  #begin_step step =  "Expect Zip Code to be \"#{expected}\""
  actual = batch.grid.zip(Batch.order_id)
  log_expectation_eql "Zip", expected, actual
  actual.should eql expected
end

Then /^Expect Email to be ([\S]+@[\S]+\.[a-z]{3})$/ do |expected|
  actual = batch.grid.email(Batch.order_id)
  log_expectation_eql "Email", expected, actual
  actual.should eql expected
end

Then /^Expect Phone to be ([\(]?[0-9]{3}[\)]?[\s]?[0-9]{3}[\s-]?[0-9]{4})$/ do |expected|
  actual = batch.grid.phone(Batch.order_id)
  log_expectation_eql "Phone", expected, actual
  actual.should eql expected
end

Then /^Expect Pounds to be (\d+)$/ do |expected|
  actual = batch.grid.pounds(Batch.order_id)
  log_expectation_eql "Pounds", expected, actual
  actual.should eql expected
end

Then /^Expect Ounces to be (\d+)$/ do |expected|
  actual = batch.grid.ounces(Batch.order_id)
  log_expectation_eql "Ounces", expected, actual
  actual.should eql expected
end

Then /^Expect Weight to be (\d+) lbs. (\d+) oz.$/ do |pounds, ounces|
  expected = "#{pounds} lbs. #{ounces} oz."
  actual = batch.grid.weight(Batch.order_id)
  log_expectation_eql "Weight", expected, actual
  actual.should eql expected
end

# | insured_value  | pounds  | ounces | length  | width | height  |
Then /^Expect Order details to be;$/ do |table|
  expected_hash = table.hashes.first
  step "Expect Insured Value to be #{expected_hash[:insured_value]}"
  step "Expect Weight to be #{expected_hash[:pounds]} lbs. #{expected_hash[:ounces]} oz."
end

Then /^Expect Insured Value to be (\d*\.?\d*)$/ do |expected|
  actual = batch.grid.insured_value(Batch.order_id)
  log_expectation_eql "Insurance", expected, actual
  actual.should eql expected
end

Then /^Expect new Order ID created$/ do
  log Batch.order_id.to_i
end

Then /^Expect Ship Cost to be \$([0-9.]*)$/ do |expected|
  actual = batch.grid.ship_cost(Batch.order_id)
  log_expectation_eql "Ship Cost", expected, actual
  actual.should eql expected
end

