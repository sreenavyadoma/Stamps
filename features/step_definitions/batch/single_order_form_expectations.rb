Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected_value|
  actual_value = batch.single_order.pounds_max_value
  log_expectation_eql "Maximum Pounds", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected_value|
  actual_value = batch.single_order.ounces_max_value
  log_expectation_eql "Maximum Pounds", expected_value, actual_value
  actual_value.should eql expected_value
end

Then /^Expect Service Cost to be greater than \$([0-9.]+)$/ do |expected_value|
  actual_value = batch.single_order.service_cost
  log_expectation "Single Order Form Rate", expected_value, actual_value, (actual_value.to_f >= expected_value.to_f)
  actual_value.to_f.should be >= expected_value.to_f
end

Then /^Expect inline Service Cost for ([a-zA-Z -\/]+) to be greater than \$([0-9.]+)$/ do |service, expected_value|
  actual_value = batch.single_order.service service
  log_expectation "#{service} Inline Rate", expected_value, actual_value, (actual_value.to_f >= expected_value.to_f)
  actual_value.to_f.should be >= expected_value.to_f
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  batch.single_order.partial_address.should be_exact_address_not_found
end

Then /^Expect Service Cost to be \$([0-9.]*)$/ do |expected_value|
  begin
    actual_value = batch.single_order.service_cost
    log_expectation_eql "Service Cost", expected_value, actual_value
    actual_value.should eql expected_value
  end unless expected_value == 0
end

Then /^Expect Tracking Cost to be \$([0-9.]*)$/ do |expected_value|
  begin
    actual_value = batch.single_order.tracking_cost
    log_expectation_eql "Tracking Cost", expected_value, actual_value
    actual_value.should eql expected_value
  end unless expected_value == 0
end

Then /^Verify Single Order Form Total Amount$/ do
  batch.single_order.total_amount_calculation.should be_correct
end

Then /^Expect Insurance Cost to be \$([0-9.]*)$/ do |expected_value|
  begin
    actual_value = batch.single_order.insurance_cost
    log_expectation_eql "Insurance Cost", expected_value, actual_value
    actual_value.should eql expected_value
  end unless expected_value == 0
end

Then /^Expect Tracking to be ([\w\s]*)$/ do |expected_value|
  begin
    actual_value = batch.single_order.tracking
    log_expectation_eql "Tracking Selected", expected_value, actual_value
    actual_value.should eql expected_value
  end unless expected_value == 0
end

Then /^Expect Total to be \$([0-9.]*)$/ do |expected_value|
  begin
    actual_value = batch.single_order.total
    log_expectation_eql "Total Cost", expected_value, actual_value
    actual_value.should eql expected_value
  end unless expected_value == 0
end


