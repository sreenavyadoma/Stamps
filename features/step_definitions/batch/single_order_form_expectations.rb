Then /^Expect Pounds tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  actual = batch.single_order.pounds_max_value
  log_expectation_eql "Maximum Pounds", expected, actual
  actual.should eql expected
end

Then /^Expect Ounces tooltip to display - The maximum value for this field is ([0-9.]+)$/ do |expected|
  actual = batch.single_order.ounces_max_value
  log_expectation_eql "Maximum Pounds", expected, actual
  actual.should eql expected
end

Then /^Expect Service Cost to be greater than \$([0-9.]+)$/ do |expected|
  actual = batch.single_order.service_cost
  log_expectation "Single Order Form Rate", expected, actual, (actual.to_f >= expected.to_f)
  actual.to_f.should be >= expected.to_f
end

Then /^Expect inline Service Cost for ([a-zA-Z -\/]+) to be greater than \$([0-9.]+)$/ do |service, expected|
  actual = batch.single_order.service service
  log_expectation "#{service} Inline Rate", expected, actual, (actual.to_f >= expected.to_f)
  actual.to_f.should be >= expected.to_f
end

Then /^Expect "Exact Address Not Found" module to appear/ do
  batch.single_order.partial_address.should be_exact_address_not_found
end

Then /^Expect Service Cost to be \$(.*)$/ do |expected|
  begin
    actual = batch.single_order.service_cost
    log_expectation_eql "Service Cost", expected, actual
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Tracking Cost to be \$(.*)$/ do |expected|
  begin
    actual = batch.single_order.tracking_cost
    log_expectation_eql "Tracking Cost", expected, actual
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Verify Single Order Form Total Amount$/ do
  batch.single_order.total_amount_calculation.should be_correct
end

Then /^Expect Insurance Cost to be \$([0-9.]*)$/ do |expected|
  begin
    actual = batch.single_order.insurance_cost
    log_expectation_eql "Insurance Cost", expected, actual
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Tracking to be ([\w\s]*)$/ do |expected|
  begin
    actual = batch.single_order.tracking
    log_expectation_eql "Tracking Selected", expected, actual
    actual.should eql expected
  end unless expected.length == 0
end

Then /^Expect Total to be \$(.*)$/ do |expected|
  begin
    actual = batch.single_order.total
    log_expectation_eql "Total Cost", expected, actual
    actual.should eql expected
  end unless expected.length == 0
end


