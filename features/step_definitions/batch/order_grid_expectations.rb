
# | name | company    | street_address      | city          | state | zip   | country       | phone       |  email
Then /^Expect Ship-To address to be;$/ do |table|
  expected_values = table.hashes.first
  step "Expect Recipient Name to be #{expected_values[:name]}"
  step "Expect Company Name to be #{expected_values[:company]}"
  step "Expect Street Address to be #{expected_values[:street_address]}"
  step "Expect City to be #{expected_values[:city]}"
  step "Expect State to be #{expected_values[:state]}"
  step "Expect Zip Code to be #{expected_values[:zip]}"
  step "Expect Phone to be #{expected_values[:phone]}"
  step "Expect Email to be #{expected_values[:email]}"
end

Then /^Expect Recipient Name to be (.*)$/ do |expected_value|
  actual_value = batch.grid.recipient(Batch.order_id)
  log_expectation_eql "Recipient Name", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect Company Name to be (.*)$/ do |expected_value|
  #begin_step step =  "Expect Company Name to be \"#{expected_value}\""
  actual_value = batch.grid.company(Batch.order_id)
  log_expectation_eql "Company Name", expected_value, actual_value
  expect(actual_value).to eql expected_value
  #end_step step
end

Then /^Expect Street Address to be ([\w\s-]+)$/ do |expected_value|
  actual_value = batch.grid.street_address(Batch.order_id)
  log_expectation_eql "Street Address", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect City to be ([\w\s]+)$/ do |expected_value|
  #begin_step step =  "Expect City to be \"#{expected_value}\""
  actual_value = batch.grid.city(Batch.order_id)
  log_expectation_eql "City", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect State to be ([a-zA-Z]+)$/ do |expected_value|
  actual_value = batch.grid.state(Batch.order_id)
  log_expectation_eql "State", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect Zip Code to be ([0-9]+)$/ do |expected_value|
  #begin_step step =  "Expect Zip Code to be \"#{expected_value}\""
  actual_value = batch.grid.zip(Batch.order_id)
  log_expectation_eql "Zip", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect Email to be ([\S]+@[\S]+\.[a-z]{3})$/ do |expected_value|
  actual_value = batch.grid.email(Batch.order_id)
  log_expectation_eql "Email", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect Phone to be ([\(]?[0-9]{3}[\)]?[\s]?[0-9]{3}[\s-]?[0-9]{4})$/ do |expected_value|
  actual_value = batch.grid.phone(Batch.order_id)
  log_expectation_eql "Phone", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect Pounds to be (\d+)$/ do |expected_value|
  actual_value = batch.grid.pounds(Batch.order_id)
  log_expectation_eql "Pounds", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect Ounces to be (\d+)$/ do |expected_value|
  actual_value = batch.grid.ounces(Batch.order_id)
  log_expectation_eql "Ounces", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect Weight to be (\d+) lbs. (\d+) oz.$/ do |pounds, ounces|
  expected_value = "#{pounds} lbs. #{ounces} oz."
  actual_value = batch.grid.weight(Batch.order_id)
  log_expectation_eql "Weight", expected_value, actual_value
  actual_value.should eql expected_value
end

# | insured_value  | pounds  | ounces | length  | width | height  |
Then /^Expect Order details to be;$/ do |table|
  expected_value_hash = table.hashes.first
  step "Expect Insured Value to be #{expected_value_hash[:insured_value]}"
  step "Expect Weight to be #{expected_value_hash[:pounds]} lbs. #{expected_value_hash[:ounces]} oz."
end

Then /^Expect Insured Value to be (\d*\.?\d*)$/ do |expected_value|
  actual_value = batch.grid.insured_value(Batch.order_id)
  log_expectation_eql "Insurance", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect new Order ID created$/ do
  log Batch.order_id.to_i
end

Then /^Expect Ship Cost to be \$([0-9.]+)$/ do |expected_value|
  actual_value = batch.grid.ship_cost(Batch.order_id)
  log_expectation_eql "Ship Cost", expected_value, actual_value
  actual_value.should eql expected_value
end

